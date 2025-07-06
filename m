Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B21C1F0D;
	Sun,  6 Jul 2025 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794151; cv=fail; b=BIwh5zWBN80yZxtntQRZ8ooLLijCX93dSeZW7ATjibQOUr8XCswa4vU2zMPhm9m1koi9UH4plpDmg7l7C31AG/EG8J3BuY91wMQkk46+zCy6eq7Rkf2wb+p0Rcz/UExF73RtXnDl1hm+MeRcRVrl+Luzih/f8nfEXIVvaHUkdYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794151; c=relaxed/simple;
	bh=vdDwOQCvBsm8JIZtLxG/MFabPZsOSY8j465D9CneXP8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NMlETfpjAsn1y6tfpSPN06wdAn4m/e9kytTc0wGrMpVOQ9g2fI4OEOIE89GDTGwDYRoEpHunaduP+hFNZLivSz8l3Vk3W9icOohttdlduxSfADDkj0/O1FoUmvOoOMeR4ONybMj1AIQRKvkBReK1I/OLMDo6EUQNWci9j4D3paQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=piVG6pBj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E5oXTGDI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="piVG6pBj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E5oXTGDI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666Nww6002373;
	Sun, 6 Jul 2025 09:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xE1tsDDqdJwfWldJpUBT8Slj1ATp+vFhjxi+CxJaHdc=; b=
	piVG6pBjZ47cP3Z+e/SfWAH4ENIqdvzmsGdPqUiLvhOlZXcw6ipzsQhWVQqZRKnt
	A84nNynb7NV8S+/o8Tf9hm5vJ+WawOn1UB/3Rh86/ydw3R7c7qBTe+AhWYqjRJr/
	4vtfSXGDw+V1nbLbHRrUz5CC1ClojRPhX8OHxshz32iiKxuykgI+iqYUGoDIqBBu
	DXds8eKs0h/60jIZhjjudcsCtc49z9wMFpHb2v1yniHVJ6SLyJbcwOqDDtR/ggQc
	h1FDSgOjVs8QAXDwYHV8robOaxch3Hn/3ZjrYLVJWjtzu9noSrXI962dCg18d0pN
	4H0UYGe8qrg8O+xHMLsdyQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47pvkxs368-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 09:28:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5665lsog014319;
	Sun, 6 Jul 2025 09:28:34 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg80yxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 09:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlS+fwNIOMFKNkoR47gfQ85/qpKQhgN4dN+jikUOpMX/Xr20tEamrPbpjPIEjk58IUL7yejsFLKLKuVEkc7gjfQyJ2/axvXXw2gco20U4Nkuc8rDBa7aH3VlsleMhpdui449uG9ARfX6ezT4J5p/jGmEOil6cVDYCTOnUZuwk3HO6diXRih99IAmYbI6cxf4fJChJattZ+ffH71s+Il9irHtHaf+7rL5G/v4Pz+AP0VzeeC1a7s118lBRshQgLpmQYsUNKTEY2f+AL+4k6NZPoXhqQ74tA03c2HAQKXV6o8GLlZ550wx9uZY3tyLFsh56XimWZ5nPDpDRZpRRQimPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE1tsDDqdJwfWldJpUBT8Slj1ATp+vFhjxi+CxJaHdc=;
 b=AxorahxGcvlthjNOIwhs5CKkVnjwkS85Kszd06qL0+BT5vVbhgSZix8HjIFtxixjW3EpCrdqCI71Oo5ZEvnV7dy7LiW2VECxUrZp1BpEu35ZPXd0fbbPEcLgMP8nCkMqyyGMDHBM8N/7k8iBI80Ms7JAh1Jbnum88SaOfbIMZhpm2gLErbWOEuSqTcmRNOQBuFf6dPbyzad9d8pm8b7Uni37m89VRd1xXl3dQeV88jFGKSyQS8qk1PUZahygQBbrzy73M3Okcp2woN3xXZgmDxUAFeqknqVhOy5FmQxaCf58qPk9VqTCPt8rJz0zC98Nd2ZTvsy7nVnkOOoWWCdqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE1tsDDqdJwfWldJpUBT8Slj1ATp+vFhjxi+CxJaHdc=;
 b=E5oXTGDIIKetX/heNWltkq7a2jKMk0/Lz2X8BE36grFM4+250cEYZ/QVp0Hxrdi5FjNjBfO1jRrGTqPLLLk0U71fUOKASU25MXu9IB6USkhc18CZUCCNPE12zYD8cVIzmi9xr2xWDnFfJhMuqtTbdOajHNl4hiw2CnkJ2uXzDCQ=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by MN6PR10MB7465.namprd10.prod.outlook.com (2603:10b6:208:47a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Sun, 6 Jul
 2025 09:28:31 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8901.024; Sun, 6 Jul 2025
 09:28:31 +0000
Message-ID: <0fafcb83-0b58-4dbd-8c13-7bdec1c78abc@oracle.com>
Date: Sun, 6 Jul 2025 14:58:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] platform/x86: firmware_attributes_class: Add high
 level API for the attributes interface
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Joshua Grisham <josh@joshuagrisham.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-2-60b6d51d93eb@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250705-fw-attrs-api-v5-2-60b6d51d93eb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::18) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|MN6PR10MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: de97ad7a-5a5c-47de-4b76-08ddbc6f788d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0Vuc3VMcllZZzBnVzhmWCt4QjNxVm9QUDU1em5lRGR0YU03eUxXN01WV3dB?=
 =?utf-8?B?QWovUG9pRzVLWi9NYmpTMU9zWUMrTFExcHBraGdDSEYvSDZyVFA0aG9KbnFV?=
 =?utf-8?B?djc4NzU0L203bGx2ait4c3MrWWVxelBKVzhUdENocHhSYkNtUnMvTER0TXpY?=
 =?utf-8?B?N0dxYVFCWXJ3di9DNFUvNlc3Q2pGMXRNaWFFeFk0L1did1IwNkJNaHdJNG1p?=
 =?utf-8?B?Y0cxZEZDUlRSM2gwOFdObmZuSlJyYUlXYURwTExtQ2NZaUxpUHo5SzgwaElo?=
 =?utf-8?B?aVVKV3NCYUhacW9obVNla2hXZm8rMVZXRUs1ZEIzMTBqN3R5aW1JWnJkSTRS?=
 =?utf-8?B?OC92ejZ4Qmk2M0doVHFtSk5XamZiUG9RQnNwL3NjbHI5SmVhdW9pemt5R1FU?=
 =?utf-8?B?TnpMa09aaDhCcnJQOXJGY0RuY3pzbWlXWEhMQUJTeHZrWndmVm16dVNTOHRU?=
 =?utf-8?B?TTkwK1RaQVBnNEhpS2hES1M3c1g2N1lOUkU2N3UxZGsybGErT2xIU2JMbWVn?=
 =?utf-8?B?a1E4eGN0ckxkc3I5SHdYcFlobWE4REFSbmdOUG8zSzVMZkprYUtjc21aWkhl?=
 =?utf-8?B?b01VR0YxQnlHTElJWUw0UXROU1hLbTk2akFRMnl1QmRQK3N2VndDcTgvNGZC?=
 =?utf-8?B?RGJRbk1HVEdaRzBFOG9MQS9TMm1JWVlFbmtOODFGeDJPVGtXcTM2QjNNK0wv?=
 =?utf-8?B?cXNFUXVsRU8vOEp4WXF5d1FqZWlvdDBJSFg4ek5xdmM1bTczUkhJZ25yZzdk?=
 =?utf-8?B?V0psYTdSbVIzeTZhT0VCM2pHSjBBQnd1NWtwSzFxeTlwMFRLMFpuSGduRCts?=
 =?utf-8?B?Q0c5OWhVcnpLWFZmUHh4VW45MmEwMzhKVEg0UDkyRnBOR1liTjlKcWtRbXYz?=
 =?utf-8?B?NitLVWlrTmZCNkp2NUZHY1UzRFFTUE1Da0RwaWUxMFpMbk92Q1R6ZkZZMWlL?=
 =?utf-8?B?ZVhZblpRR2tRcU15ZDVzVGhUcU9lZHZPVGlzMW1EYXorSmNQY2dvQVIvKzNC?=
 =?utf-8?B?K3N5ZVFXQVpGRHlyMnFmWUNIWTU1RzJnbEptUnJlSnAveStkMUZEdzBnN2hZ?=
 =?utf-8?B?aFhMYjIwUlZoSlJ2c1pndVlHeTBUdGxkL1pod0dMMXoyVEhRcnVhTXVuWHZJ?=
 =?utf-8?B?MFFEU2s3TjlDU3JvcDNMcGtWNWdNODUyWWdxRE00TFBYck5xbmMwQmtoTXMx?=
 =?utf-8?B?WjZYQnRjbDBxL2RCVk0zSEl0bGgzbmZxQ3BGZGZtQkM0N0lad0JWYzVBOW1p?=
 =?utf-8?B?KytGV1VxSmRlWUJicnNxYlN4UllwUHUxMTJFZGJXMVlqbWwrdXB0SWhQeHNW?=
 =?utf-8?B?aWRLWDJrT2orTjZiNGhldjJucXpLeHdvRjdtaWJ6QTlmWDRDVVBIM1hrK3NE?=
 =?utf-8?B?bEMyOWtuUEUralBzUUdvZ3BRcnVudDE5OFRQQ1pBRzRBWE54NGRjWmxKeTlx?=
 =?utf-8?B?c1BmTDUyeU1OZ0dCWnNRRmt3SEVNMXB4V0NWTjVoaWo5UlVJLzNjVHBZLy9q?=
 =?utf-8?B?TThoY3lJNTFaZkNPZ0pwSXZmbnQreEZDL2h0Nno5dlk5ZHZkZ0JOaU1tdDhx?=
 =?utf-8?B?akxjMGVobGQxRjVQa1FyWmswNkNhL3Nzcnc1dzNGMCthQS9mWStraFZ6cGR4?=
 =?utf-8?B?bHZZaWNnTlJVd1BEV2xMbitHZDVFWXd6bWw3dEZJRXpQSWZuWHZvSXgvYlNF?=
 =?utf-8?B?c1JqenNmTFcwMlgwVC8rSXJNeDhMQ1RtZUprc3dKRm8vZnNYWXVtYVFkVjdE?=
 =?utf-8?B?dGY1aFhlcXJWT0VFZFhQME1XckRWQWdXVjdRRWFkb1RnMnI5SlBON3NkY21w?=
 =?utf-8?B?Uk1WdnNvQmZOT0lLWi92UVZ3QWNJdjZ4MEpoZFpPWlhsQzVlR2pJK1B1RTFz?=
 =?utf-8?B?WkxHTmZUQnVGT3VQUEFCRGpnczN2N1BjMkduK3dEU1Z5Mm84aWZnTlROSHQ0?=
 =?utf-8?Q?cHM1DdcWHwk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEg4QjFUYWczd1pyVTBibHdUQ3ltcC9KbElXZUhIZlRJMEZSdnFRZldyNlJo?=
 =?utf-8?B?YTh1SUthR0lrQUc3RENGTHcvcFY1dlAwQWZpcG1ua0lrTlc2c21WaXF4YUty?=
 =?utf-8?B?N09MYWlGcWZsRERjVHJBam5iK2JqQStDSWVaSUpKUUp1OUVZOVAwTUVtZlZR?=
 =?utf-8?B?MDNHWE1rNmxZTkpjWWVuVE5yNDBSNnJ6QjFLS04rY2gyL1VxYUVVRTZqYVEr?=
 =?utf-8?B?SnVZMTk4MU12NGpYd1BJbmd3TlQyczBWUVZkL0hKUkxCei9ObHowK0ZVc2Ro?=
 =?utf-8?B?bUc3cUQ3Q2IvRGZ5NS9jVGdUNkFUQ1QrdlhpbGJ4UTRHL0FFdzlIZzVkWTB3?=
 =?utf-8?B?MU1ibHdSK1hOdlUzS2YwamF2VG85WWU3NTgyYjZEZEpRYWp1VTEycTZVaXRy?=
 =?utf-8?B?S0VPcEdSeENnU2FMcXVkOU1ueVMxY0ZoYUdiUnJnLzl3K0ZWOU5kNnJ0TGkw?=
 =?utf-8?B?V0Q2VW94SjQzYTVjUURTWDY5dEFMenFoSjdTQ0pHNGgzM210ZXdMb0RmRzli?=
 =?utf-8?B?UDlQdnpyZW5ka0JTNGtNb1Bid21ma3ZteXd4Q1Z1TEZqb0c1WEpqTkFwL1dQ?=
 =?utf-8?B?M2FlQ1VHV0FPMDkxZ3hmbWhjbzV0TDE3U1dXcjJoaFBkdUtOcXFDOEU2Vmt3?=
 =?utf-8?B?dlc2cy9BdEM4Q0lROURKV3pxR2pvRi9KUHZZQWkvdHNlNmdCampLbHd1Tjdu?=
 =?utf-8?B?eHFNMzVtcVlzWG9HdTA2M2dydXM3cWthdmROVVNiVEIrSzhXbzVtVlVVdVZr?=
 =?utf-8?B?TFh5YlNzUDhxamg1VXg1V3A5L25jQm1zK2dYSnphWVVBNm5MMDdZK0FoK29E?=
 =?utf-8?B?ekpqeWwvRktUTW1VMVE0Vlk3UExQMFBXSW5KYklTSTBrWkZBczlkV1NuQ3Vo?=
 =?utf-8?B?bWd0eFBndmd0MkQ1WUhZNU0vNEF3S0xDTllZWC9nekRjOUNNVmNKTTBOM1hC?=
 =?utf-8?B?dVdCSWtOV2Vmd1NVcHBkT2NqRlZMUTU5ZlhJbGtHOE9yTmFRZStvNURBK3dO?=
 =?utf-8?B?OGtkNUcvNUNMeEp4R3NqaEdYL1JiY0hjQjZKK3J5Z295V2hGc0k5MVFCeUJn?=
 =?utf-8?B?TE9rTUw3L3FFQTlwWTdTZGhpcXkzY3FWQmF3eXZ1YUZzSklFMmR4dHJWTWhO?=
 =?utf-8?B?ZHFOVkZWTlVGck4yd1NvRGVQSnFrY2VTbDdhejNKREFpVTN1ejU4VkhYUGEw?=
 =?utf-8?B?TkV6Q21xVkc5QVhEL1ZpR3EvalpHbVFXd1lrcitmSlo2T3FpaFBlMHRwNTNU?=
 =?utf-8?B?OWhaNnJBM2I4bHg2dGFzczF4NkdjdVdqMFY5MGJFZWROTzJKcDRzT2VRd0Fu?=
 =?utf-8?B?cWFmUDJ2U3ZwWGRMalBwYWtWUHRUWU9hWm5jSmZaUWo1UUszMXR4d0tFUWha?=
 =?utf-8?B?U29kNDFLRjVNZ1dkTmEyYWp2MW9KVGlocHhoRld1YVF3QUNtWm5CZENlMDhv?=
 =?utf-8?B?WEV1VzgzZy80SXJDYWY3YVRnNGs5MnNGQmovSlY1WmVkMU5Rc2NNcE0zam42?=
 =?utf-8?B?dXFyb2g5Z1IxaDc2Qk5KdVl6NUlIa3IzRjV6K000eWFqQzdXSVh3T3NPdy9N?=
 =?utf-8?B?eE9uTFFVdWdzTWFHSGN5YmdmcDlrdUpDb253MHBkbVV4Q2IzQlp4UzRqWHNO?=
 =?utf-8?B?Z3pqRVh4ZkRTYzlWK2xEMTNBK09pc2RyMVhqY01hVTczSTFYd0RCRWVZVURU?=
 =?utf-8?B?RzR3dy80SWJpMTUwVFBrRGNEZzdMMGJOZDFjWXVzbmNhMzdGdWhSazl4bElK?=
 =?utf-8?B?R2FjdWp6eXByaHVPazlMR3hmNXJwWTVOYWNUTjdodzZycTdDV051SkFzd1hj?=
 =?utf-8?B?OUNCbERZRnU3QmpOQkRPMlVEdDZTem9zOVdhY0JVMktRcFZzcXhIMXRhaVBG?=
 =?utf-8?B?cEwrZU5wQndPb3ZkZmJ1QlRpM0s3TDFaa1l4NHk0N013bHB2TFB6TUVXekZV?=
 =?utf-8?B?UktaZVpuQ1YxYjJkMEpKQlIzalc3NHlQNVNPS2NHUnRyNXhrekNjUS9pUm81?=
 =?utf-8?B?ckpaQkF6WWpYMytmSWYyTDgrdXpaUERsQ0JQSHkrbHFEV2RVMjg2VE1RRGVy?=
 =?utf-8?B?VFM2SHljb0tkZ0xTNmpRWFprK2UzSXIrRHE2SDNnTzBQVkZhQkF4bEUwWExh?=
 =?utf-8?B?Ukk1Uk5TKzRvMnNWSDFHMHF6ZWd3ditHSERrQ1FIb1FzSGNneHp4RVVRcCs2?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3zl3U+B7kxNX2n3yRZkcV5G4bPsIjw57QcjAN9c5hLneImb/hHVZlFW1au0LzkKF3NnpiQm3Uyi+t1mA4RAc+qhuHxl7kv1dwOnBjg+AP0eEF+EcPddQeXm/oSYoSKJUxoQOVavRi7H2kdbfsBs6RgWXEuSbav7zQ6ZADQNx1Nw6onFrw2NLyvwjwgO845J7JKqI3o0WYLYN/v7FMzlCl/vaYlyeR1aqu0t5zYSTkwdu5cpcfUZLYhgmjfDsYasTMbKbW//XfJjfah/usPIM/xX5Ul9PV0A1pI6t6S8qxk8ZYB6i07hEY29Z2spmvy3KgDY4jPZxY14ULvtbto5dgeSUBGtTC3lwjt/FuZOMYyl8n0JJvVoeFzKX7ZiG34J1PKa9A5fsE4g2dQr/oSvDR+VenpCBDzXnNfBR+YAm/CTUiEsLzo9SabuxaExCSOK8aGTWuUJEMC7iXPCRKUP15v+nwFT6lF4aJwR4smjS1gm359MNmAVBLmUawce8RyS+473feIgs+iQ0LNMwFT5ScoRNiDtSJx5q4A8fQ182e9FZ5zlnHE3Jqip+Ctzwc5VDfqPsNaPWDH2HfJCHI+DARISmMh1Z3Add6BruzZPMW4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de97ad7a-5a5c-47de-4b76-08ddbc6f788d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 09:28:31.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B/eKeg+QHJW7UCgfDwXM/Lg9Ki3Gtrg9PO6JZs3jKWqcllX6EYZ0iyYEeJUJxh1wPwCzFe97j8qhbHNMS0nPnSEHyvNHxyEcFIqkiVSebs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7465
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507060058
X-Proofpoint-GUID: rzcEViowPVfU0uqf_xdZTx78Ea5pneL7
X-Authority-Analysis: v=2.4 cv=a5Uw9VSF c=1 sm=1 tr=0 ts=686a41c3 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=TqArMaC8qUdHopt_85wA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13565
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA1OCBTYWx0ZWRfX/1u2wFtWV60N YJyD+f26/N9ldnabH4eYDMLl3tPZ/te0JnHABUVHqV0I/ippUADDPSoEyYGMSP07CPd0RAOCNV7 YUUIsnGC10qs26yELfWHuSIwGECGZhRGkPGic5N+oRhAucfKvOLGd4GjfnMMOyYDnxJ1N3CnzL/
 XulX0hXWX1PmzvvszITTIUIP/SxW5NZHCWpUlhdLvAi142CyfjYGbXQHGadwMHNtAJXuF2Hwh73 UvhveVMOcG0+HdlgZX85d/xKWc5DpNC68r2agwMFfTZorivZMo8MrsUwPbL7decM1rQLQ6uENd/ 5JIm45rziX0jLass91RGb12W9PWEL7mkLz7Q1bQQOHOFF2ms95iUaQoV9SVCN6dJfB2ovYofN15
 pUHo4ejoD3pBT/Zk6YBfEXE26hN9vq8ov2RLTZhS/UdpM4l6xHA1hglZaxGHw75NiH8njH8u
X-Proofpoint-ORIG-GUID: rzcEViowPVfU0uqf_xdZTx78Ea5pneL7



On 7/5/2025 9:03 AM, Kurt Borja wrote:
> Add high level API to aid in the creation of attribute groups attached
> to the `attrs_kobj` (per ABI specification).
> 
> This new API lets users configure each group, either statically or
> dynamically through a (per type) data struct and then create this group
> through the generic fwat_create_group() macro.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/firmware_attributes_class.c | 532 +++++++++++++++++++++++
>   drivers/platform/x86/firmware_attributes_class.h | 335 ++++++++++++++
>   2 files changed, 867 insertions(+)
> 
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> index 290364202cce64bb0e9046e0b2bbb8d85e2cbc6f..96473b3b1a2a87cf21a6e2a9a14d72ae322c94ae 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -10,13 +10,67 @@
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> +#include <linux/string_choices.h>
>   #include "firmware_attributes_class.h"
>   
> +#define FWAT_TYPE_NONE				-1
> +
> +#define to_fwat_bool_data(_c) \
> +	container_of_const(_c, struct fwat_bool_data, group)
> +#define to_fwat_enum_data(_c) \
> +	container_of_const(_c, struct fwat_enum_data, group)
> +#define to_fwat_int_data(_c) \
> +	container_of_const(_c, struct fwat_int_data, group)
> +#define to_fwat_str_data(_c) \
> +	container_of_const(_c, struct fwat_str_data, group)
> +
> +struct fwat_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct kobject *kobj, struct fwat_attribute *attr,
> +			char *buf);
> +	ssize_t (*store)(struct kobject *kobj, struct fwat_attribute *attr,
> +			 const char *buf, size_t count);
> +	int type;
> +};
> +
> +#define to_fwat_attribute(_a) \
> +	container_of_const(_a, struct fwat_attribute, attr)
> +
> +#define __FWAT_ATTR(_name, _mode, _show, _store, _type) \
> +	{								\
> +		.attr = { .name = __stringify(_name), .mode = _mode },	\
> +		.show = _show, .store = _store, .type = _type,		\
> +	}
> +
> +#define FWAT_ATTR_RO(_prefix, _name, _show, _type) \
> +	static struct fwat_attribute fwat_##_prefix##_##_name##_attr = \
> +		__FWAT_ATTR(_name, 0444, _show, NULL, _type)
> +
> +#define FWAT_ATTR_RW(_prefix, _name, _show, _store, _type) \
> +	static struct fwat_attribute fwat_##_prefix##_##_name##_attr = \
> +		__FWAT_ATTR(_name, 0644, _show, _store, _type)
> +
> +struct fwat_group {
> +	const struct fwat_group_data *data;
> +	struct device *dev;
> +	struct kobject kobj;
> +};
> +
> +#define kobj_to_fwat_group(_k) \
> +	container_of_const(_k, struct fwat_group, kobj)
> +
>   const struct class firmware_attributes_class = {
>   	.name = "firmware-attributes",
>   };
>   EXPORT_SYMBOL_GPL(firmware_attributes_class);
>   
> +static const char * const fwat_type_labels[] = {
> +	[fwat_group_boolean]			= "boolean",
> +	[fwat_group_enumeration]		= "enumeration",
> +	[fwat_group_integer]			= "integer",
> +	[fwat_group_string]			= "string",
> +};
> +
>   static void fwat_device_release(struct device *dev)
>   {
>   	struct fwat_device *fadev = to_fwat_device(dev);
> @@ -24,6 +78,483 @@ static void fwat_device_release(struct device *dev)
>   	kfree(fadev);
>   }
>   
> +static ssize_t
> +type_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", fwat_type_labels[attr->type]);
> +}
> +
> +static ssize_t
> +display_name_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const char *disp_name = group->data->display_name;
> +
> +	if (!disp_name)
> +		return -EOPNOTSUPP;
> +
> +	return sysfs_emit(buf, "%s\n", disp_name);
> +}
> +
> +static ssize_t
> +display_name_language_code_show(struct kobject *kobj, struct fwat_attribute *attr,
> +				char *buf)
> +{
> +	struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const char *lang_code = group->data->language_code;
> +
> +	if (!lang_code)
> +		return -EOPNOTSUPP;
> +
> +	return sysfs_emit(buf, "%s\n", lang_code);
> +}
> +
> +static ssize_t
> +bool_group_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_bool_data *data = to_fwat_bool_data(group->data);
> +	bool val;
> +	int ret;
> +
> +	/* show_override does not affect current_value */
> +	if (data->group.show_override && attr->type != fwat_bool_current_value)
> +		return data->group.show_override(group->dev, attr->type, buf);
> +
> +	switch (attr->type) {
> +	case fwat_bool_current_value:
> +		ret = data->read(group->dev, data->group.id, &val);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case fwat_bool_default_value:
> +		val = data->default_val;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", str_yes_no(val));
> +}
> +
> +static ssize_t
> +bool_group_store(struct kobject *kobj, struct fwat_attribute *attr, const char *buf,
> +		 size_t count)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_bool_data *data = to_fwat_bool_data(group->data);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = data->write(group->dev, data->group.id, val);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t
> +enum_group_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_enum_data *data = to_fwat_enum_data(group->data);
> +	int val_idx, sz = 0;
> +	int ret;
> +
> +	/* show_override does not affect current_value */
> +	if (data->group.show_override && attr->type != fwat_enum_current_value)
> +		return data->group.show_override(group->dev, attr->type, buf);
> +
> +	switch (attr->type) {
> +	case fwat_enum_current_value:
> +		ret = data->read(group->dev, data->group.id, &val_idx);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case fwat_enum_default_value:
> +		val_idx = data->default_idx;
> +		break;
> +	case fwat_enum_possible_values:
> +		sz += sysfs_emit_at(buf, sz, "%s", data->possible_vals[0]);
> +		for (unsigned int i = 1; data->possible_vals[i]; i++)
> +			sz += sysfs_emit_at(buf, sz, ";%s", data->possible_vals[i]);
> +		sz += sysfs_emit_at(buf, sz, "\n");
> +		return sz;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", data->possible_vals[val_idx]);
> +}
> +
> +static ssize_t
> +enum_group_store(struct kobject *kobj, struct fwat_attribute *attr, const char *buf,
> +		 size_t count)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_enum_data *data = to_fwat_enum_data(group->data);
> +	int val_idx;
> +	int ret;
> +
> +	val_idx = __sysfs_match_string(data->possible_vals, -1, buf);
> +	if (val_idx < 0)
> +		return val_idx;
> +
> +	ret = data->write(group->dev, data->group.id, val_idx);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t
> +int_group_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_int_data *data = to_fwat_int_data(group->data);
> +	long val;
> +	int ret;
> +
> +	/* show_override does not affect current_value */
> +	if (data->group.show_override && attr->type != fwat_int_current_value)
> +		return data->group.show_override(group->dev, attr->type, buf);
> +
> +	switch (attr->type) {
> +	case fwat_int_current_value:
> +		ret = data->read(group->dev, data->group.id, &val);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case fwat_int_default_value:
> +		val = data->default_val;
> +		break;
> +	case fwat_int_min_value:
> +		val = data->min_val;
> +		break;
> +	case fwat_int_max_value:
> +		val = data->max_val;
> +		break;
> +	case fwat_int_scalar_increment:
> +		val = data->increment;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return sysfs_emit(buf, "%ld\n", val);
> +}
> +
> +static ssize_t
> +int_group_store(struct kobject *kobj, struct fwat_attribute *attr, const char *buf,
> +		size_t count)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_int_data *data = to_fwat_int_data(group->data);
> +	long val;
> +	int ret;
> +
> +	ret = kstrtol(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = data->write(group->dev, data->group.id, val);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t
> +str_group_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_str_data *data = to_fwat_str_data(group->data);
> +	const char *val;
> +	long len;
> +	int ret;
> +
> +	/* show_override does not affect current_value */
> +	if (data->group.show_override && attr->type != fwat_bool_current_value)

fwat_bool_current_value ? or str

> +		return data->group.show_override(group->dev, attr->type, buf);
> +
> +	switch (attr->type) {
> +	case fwat_str_current_value:
> +		ret = data->read(group->dev, data->group.id, &val);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case fwat_str_default_value:
> +		val = data->default_val;
> +		break;
> +	case fwat_str_min_length:
> +		len = data->min_len;
> +		return sysfs_emit(buf, "%ld\n", len);
> +	case fwat_str_max_length:
> +		len = data->max_len;
> +		return sysfs_emit(buf, "%ld\n", len);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", val);
> +}
> +
> +static ssize_t
> +str_group_store(struct kobject *kobj, struct fwat_attribute *attr, const char *buf,
> +		size_t count)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_str_data *data = to_fwat_str_data(group->data);
> +	int ret;
> +
> +	ret = data->write(group->dev, data->group.id, buf);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +FWAT_ATTR_RO(all, display_name, display_name_show, FWAT_TYPE_NONE);
> +FWAT_ATTR_RO(all, display_name_language_code, display_name_language_code_show, FWAT_TYPE_NONE);
> +
> +FWAT_ATTR_RO(bool, type, type_show, fwat_group_boolean);
> +FWAT_ATTR_RW(bool, current_value, bool_group_show, bool_group_store, fwat_bool_current_value);
> +FWAT_ATTR_RO(bool, default_value, bool_group_show, fwat_bool_default_value);
> +
> +FWAT_ATTR_RO(enum, type, type_show, fwat_group_enumeration);
> +FWAT_ATTR_RW(enum, current_value, enum_group_show, enum_group_store, fwat_enum_current_value);
> +FWAT_ATTR_RO(enum, default_value, enum_group_show, fwat_enum_default_value);
> +FWAT_ATTR_RO(enum, possible_values, enum_group_show, fwat_enum_possible_values);
> +
> +FWAT_ATTR_RO(int, type, type_show, fwat_group_integer);
> +FWAT_ATTR_RW(int, current_value, int_group_show, int_group_store, fwat_int_current_value);
> +FWAT_ATTR_RO(int, default_value, int_group_show, fwat_int_default_value);
> +FWAT_ATTR_RO(int, min_value, int_group_show, fwat_int_min_value);
> +FWAT_ATTR_RO(int, max_value, int_group_show, fwat_int_max_value);
> +FWAT_ATTR_RO(int, scalar_increment, int_group_show, fwat_int_scalar_increment);
> +
> +FWAT_ATTR_RO(str, type, type_show, fwat_group_string);
> +FWAT_ATTR_RW(str, current_value, str_group_show, str_group_store, fwat_int_current_value);

wrong enum fwat_int_current_value -> fwat_str_current_value

> +FWAT_ATTR_RO(str, default_value, str_group_show, fwat_str_default_value);
> +FWAT_ATTR_RO(str, min_length, str_group_show, fwat_str_min_length);
> +FWAT_ATTR_RO(str, max_length, str_group_show, fwat_str_max_length);
> +
> +static struct attribute *fwat_bool_attrs[] = {
> +	&fwat_bool_type_attr.attr,
> +	&fwat_all_display_name_attr.attr,
> +	&fwat_all_display_name_language_code_attr.attr,
> +	&fwat_bool_current_value_attr.attr,
> +	&fwat_bool_default_value_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *fwat_enum_attrs[] = {
> +	&fwat_enum_type_attr.attr,
> +	&fwat_all_display_name_attr.attr,
> +	&fwat_all_display_name_language_code_attr.attr,
> +	&fwat_enum_current_value_attr.attr,
> +	&fwat_enum_default_value_attr.attr,
> +	&fwat_enum_possible_values_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *fwat_int_attrs[] = {
> +	&fwat_int_type_attr.attr,
> +	&fwat_all_display_name_attr.attr,
> +	&fwat_all_display_name_language_code_attr.attr,
> +	&fwat_int_current_value_attr.attr,
> +	&fwat_int_default_value_attr.attr,
> +	&fwat_int_min_value_attr.attr,
> +	&fwat_int_max_value_attr.attr,
> +	&fwat_int_scalar_increment_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *fwat_str_attrs[] = {
> +	&fwat_str_type_attr.attr,
> +	&fwat_all_display_name_attr.attr,
> +	&fwat_all_display_name_language_code_attr.attr,
> +	&fwat_str_current_value_attr.attr,
> +	&fwat_str_default_value_attr.attr,
> +	&fwat_str_min_length_attr.attr,
> +	&fwat_str_max_length_attr.attr,
> +	NULL
> +};
> +
> +static umode_t fwat_attr_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	struct fwat_attribute *fwat_attr = to_fwat_attribute(attr);
> +	struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_group_data *data = group->data;
> +
> +	/* The `type` attribute is always first */
> +	if (n == 0)
> +		return attr->mode;
> +
> +	if (attr == &fwat_all_display_name_attr.attr)
> +		return data->display_name ? attr->mode : 0;
> +
> +	if (attr == &fwat_all_display_name_language_code_attr.attr)
> +		return data->language_code ? attr->mode : 0;
> +
> +	/* The `current_value` attribute always has type == 0 */
> +	if (!fwat_attr->type)
> +		return data->mode;
> +
> +	return test_bit(fwat_attr->type, &data->fattrs) ? attr->mode : 0;
> +}
> +
> +static umode_t fwat_group_visible(struct kobject *kobj)
> +{
> +	return true;
> +}
> +
> +DEFINE_SYSFS_GROUP_VISIBLE(fwat);
> +
> +static const struct attribute_group fwat_bool_group = {
> +	.attrs = fwat_bool_attrs,
> +	.is_visible = SYSFS_GROUP_VISIBLE(fwat),
> +};
> +__ATTRIBUTE_GROUPS(fwat_bool);
> +
> +static const struct attribute_group fwat_enum_group = {
> +	.attrs = fwat_enum_attrs,
> +	.is_visible = SYSFS_GROUP_VISIBLE(fwat),
> +};
> +__ATTRIBUTE_GROUPS(fwat_enum);
> +
> +static const struct attribute_group fwat_int_group = {
> +	.attrs = fwat_int_attrs,
> +	.is_visible = SYSFS_GROUP_VISIBLE(fwat),
> +};
> +__ATTRIBUTE_GROUPS(fwat_int);
> +
> +static const struct attribute_group fwat_str_group = {
> +	.attrs = fwat_str_attrs,
> +	.is_visible = SYSFS_GROUP_VISIBLE(fwat),
> +};
> +__ATTRIBUTE_GROUPS(fwat_str);
> +
> +static ssize_t
> +fwat_attr_sysfs_show(struct kobject *kobj, struct attribute *attr, char *buf)
> +{
> +	struct fwat_attribute *fwat_attr = to_fwat_attribute(attr);
> +
> +	if (!fwat_attr->show)
> +		return -EOPNOTSUPP;
> +
> +	return fwat_attr->show(kobj, fwat_attr, buf);
> +}
> +
> +static ssize_t
> +fwat_attr_sysfs_store(struct kobject *kobj, struct attribute *attr, const char *buf,
> +		      size_t count)
> +{
> +	struct fwat_attribute *fwat_attr = to_fwat_attribute(attr);
> +
> +	if (!fwat_attr->show)
> +		return -EOPNOTSUPP;

check for fwat_attr->store ?

> +
> +	return fwat_attr->store(kobj, fwat_attr, buf, count);
> +}
> +
> +static void fwat_group_release(struct kobject *kobj)
> +{
> +	struct fwat_group *group = kobj_to_fwat_group(kobj);
> +
> +	kfree(group);
> +}
> +
> +static const struct sysfs_ops fwat_attr_sysfs_ops = {
> +	.show = fwat_attr_sysfs_show,
> +	.store = fwat_attr_sysfs_store,
> +};
> +
> +static const struct kobj_type fwat_boolean_ktype = {
> +	.sysfs_ops = &fwat_attr_sysfs_ops,
> +	.release = fwat_group_release,
> +	.default_groups = fwat_bool_groups,
> +};
> +
> +static const struct kobj_type fwat_enumeration_ktype = {
> +	.sysfs_ops = &fwat_attr_sysfs_ops,
> +	.release = fwat_group_release,
> +	.default_groups = fwat_enum_groups,
> +};
> +
> +static const struct kobj_type fwat_integer_ktype = {
> +	.sysfs_ops = &fwat_attr_sysfs_ops,
> +	.release = fwat_group_release,
> +	.default_groups = fwat_int_groups,
> +};
> +
> +static const struct kobj_type fwat_string_ktype = {
> +	.sysfs_ops = &fwat_attr_sysfs_ops,
> +	.release = fwat_group_release,
> +	.default_groups = fwat_str_groups,
> +};
> +
> +static int __fwat_create_group(struct fwat_device *fadev, const struct kobj_type *ktype,
> +			       const struct fwat_group_data *data)
> +{
> +	struct fwat_group *group;
> +	int ret;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return -ENOMEM;
> +
> +	group->dev = &fadev->dev;
> +	group->data = data;
> +
> +	group->kobj.kset = fadev->attrs_kset;
> +	ret = kobject_init_and_add(&group->kobj, ktype, NULL, "%s", data->name);
> +	if (ret) {
> +		kobject_put(&group->kobj);
> +		return ret;
> +	}
> +
> +	kobject_uevent(&group->kobj, KOBJ_ADD);
> +
> +	return 0;
> +}
> +
> +static void fwat_remove_auto_groups(struct fwat_device *fadev)
> +{
> +	struct kobject *pos, *n;
> +
> +	list_for_each_entry_safe(pos, n, &fadev->attrs_kset->list, entry)
> +		kobject_put(pos);
> +}
> +
> +int fwat_create_bool_group(struct fwat_device *fadev, const struct fwat_bool_data *data)
> +{
> +	return __fwat_create_group(fadev, &fwat_boolean_ktype, &data->group);
> +}
> +EXPORT_SYMBOL_GPL(fwat_create_bool_group);
> +
> +int fwat_create_enum_group(struct fwat_device *fadev, const struct fwat_enum_data *data)
> +{
> +	return __fwat_create_group(fadev, &fwat_enumeration_ktype, &data->group);
> +}
> +EXPORT_SYMBOL_GPL(fwat_create_enum_group);
> +
> +int fwat_create_int_group(struct fwat_device *fadev, const struct fwat_int_data *data)
> +{
> +	return __fwat_create_group(fadev, &fwat_integer_ktype, &data->group);
> +}
> +EXPORT_SYMBOL_GPL(fwat_create_int_group);
> +
> +int fwat_create_str_group(struct fwat_device *fadev, const struct fwat_str_data *data)
> +{
> +	return __fwat_create_group(fadev, &fwat_string_ktype, &data->group);
> +}
> +EXPORT_SYMBOL_GPL(fwat_create_str_group);
> +
>   /**
>    * fwat_device_register - Create and register a firmware-attributes class
>    *			  device
> @@ -89,6 +620,7 @@ void fwat_device_unregister(struct fwat_device *fadev)
>   	if (!fadev)
>   		return;
>   
> +	fwat_remove_auto_groups(fadev);
>   	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
>   	kset_unregister(fadev->attrs_kset);
>   	device_unregister(&fadev->dev);
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> index 048fd0904f767357ef856e687ec4cf3260016ec6..e8868ce05b595eda94a98975428391b9f9341e3d 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -10,6 +10,7 @@
>   #include <linux/device/class.h>
>   #include <linux/kobject.h>
>   #include <linux/sysfs.h>
> +#include <linux/list.h>
>   
>   extern const struct class firmware_attributes_class;
>   
> @@ -27,6 +28,340 @@ struct fwat_device {
>   
>   #define to_fwat_device(_d)	container_of_const(_d, struct fwat_device, dev)
>   
> +enum fwat_group_type {
> +	fwat_group_boolean,
> +	fwat_group_enumeration,
> +	fwat_group_integer,
> +	fwat_group_string,
> +};
> +
> +enum fwat_bool_attrs {
> +	fwat_bool_current_value,
> +	fwat_bool_default_value,
> +	fwat_bool_attrs_last
> +};
> +
> +#define FWAT_BOOL_CURRENT_VALUE			BIT(fwat_bool_current_value)
> +#define FWAT_BOOL_DEFAULT_VALUE			BIT(fwat_bool_default_value)
> +#define FWAT_BOOL_ALL_ATTRS			GENMASK(fwat_bool_attrs_last, 0)
> +
> +enum fwat_enum_attrs {
> +	fwat_enum_current_value,
> +	fwat_enum_default_value,
> +	fwat_enum_possible_values,
> +	fwat_enum_attrs_last
> +};
> +
> +#define FWAT_ENUM_CURRENT_VALUE			BIT(fwat_enum_current_value)
> +#define FWAT_ENUM_DEFAULT_VALUE			BIT(fwat_enum_default_value)
> +#define FWAT_ENUM_POSSIBLE_VALUES		BIT(fwat_enum_possible_values)
> +#define FWAT_ENUM_ALL_ATTRS			GENMASK(fwat_enum_attrs_last, 0)
> +
> +enum fwat_int_attrs {
> +	fwat_int_current_value,
> +	fwat_int_default_value,
> +	fwat_int_min_value,
> +	fwat_int_max_value,
> +	fwat_int_scalar_increment,
> +	fwat_int_attrs_last
> +};
> +
> +#define FWAT_INT_CURRENT_VALUE			BIT(fwat_int_current_value)
> +#define FWAT_INT_DEFAULT_VALUE			BIT(fwat_int_default_value)
> +#define FWAT_INT_MIN_VALUE			BIT(fwat_int_min_value)
> +#define FWAT_INT_MAX_VALUE			BIT(fwat_int_max_value)
> +#define FWAT_INT_SCALAR_INCREMENT		BIT(fwat_int_scalar_increment)
> +#define FWAT_INT_ALL_ATTRS			GENMASK(fwat_int_attrs_last, 0)
> +
> +enum fwat_str_attrs {
> +	fwat_str_current_value,
> +	fwat_str_default_value,
> +	fwat_str_min_length,
> +	fwat_str_max_length,
> +	fwat_str_attrs_last
> +};
> +
> +#define FWAT_STR_CURRENT_VALUE			BIT(fwat_str_current_value)
> +#define FWAT_STR_DEFAULT_VALUE			BIT(fwat_str_default_value)
> +#define FWAT_STR_MIN_LENGTH			BIT(fwat_str_min_length)
> +#define FWAT_STR_MAX_LENGTH			BIT(fwat_str_max_length)
> +#define FWAT_STR_ALL_ATTRS			GENMASK(fwat_str_attrs_last, 0)
> +
> +static_assert(fwat_bool_current_value == 0);
> +static_assert(fwat_enum_current_value == 0);
> +static_assert(fwat_int_current_value == 0);
> +static_assert(fwat_str_current_value == 0);
> +
> +/**
> + * struct fwat_group_data - Data struct common between group types
> + * @id: Group ID defined by the user.
> + * @name: Name of the group.
> + * @display_name: Name showed in the display_name attribute. (Optional)
> + * @language_code: Language code showed in the display_name_language_code
> + *                 attribute. (Optional)
> + * @mode: Mode for the current_value attribute. All other attributes will have
> + *        0444 permissions.
> + * @fattrs: Bitmap of selected attributes for this group type.
> + * @show_override: Custom show method for attributes in this group, except for
> + *		   the current_value attribute, for which the a `read` callback
> + *		   will still be used. (Optional)
> + *
> + * NOTE: This struct is not meant to be defined directly. It is supposed to be
> + * embedded and defined as part of fwat_[type]_data structs.
> + */
> +struct fwat_group_data {
> +	long id;
> +	umode_t mode;
> +	const char *name;
> +	const char *display_name;
> +	const char *language_code;
> +	unsigned long fattrs;
> +	ssize_t (*show_override)(struct device *dev, int type, char *buf);
> +};
> +
> +/**
> + * struct fwat_bool_data - Data struct for the boolean group type
> + * @read: Read callback for the current_value attribute.
> + * @write: Write callback for the current_value attribute.
> + * @default_val: Default value.
> + * @group: Group data.
> + */
> +struct fwat_bool_data {
> +	int (*read)(struct device *dev, long id, bool *val);
> +	int (*write)(struct device *dev, long id, bool val);
> +	bool default_val;
> +	struct fwat_group_data group;
> +};
> +
> +/**
> + * struct fwat_enum_data - Data struct for the enumeration group type
> + * @read: Read callback for the current_value attribute.
> + * @write: Write callback for the current_value attribute.
> + * @default_idx: Index of the default value in the @possible_vals array.
> + * @possible_vals: Array of possible value strings for this group type.
> + * @group: Group data.
> + *
> + * NOTE: The `val_idx` argument in the @write callback is guaranteed to be a
> + *       valid (within bounds) index. However, the user is in charge of writing
> + *       valid indexes to the `*val_idx` argument of the @read callback.
> + *       Failing to do so may result in an OOB access.
> + */
> +struct fwat_enum_data {
> +	int (*read)(struct device *dev, long id, int *val_idx);
> +	int (*write)(struct device *dev, long id, int val_idx);
> +	int default_idx;
> +	const char * const *possible_vals;
> +	struct fwat_group_data group;
> +};
> +
> +/**
> + * struct fwat_int_data - Data struct for the integer group type
> + * @read: Read callback for the current_value attribute.
> + * @write: Write callback for the current_value attribute.
> + * @default_val: Default value.
> + * @min_val: Minimum value.
> + * @max_val: Maximum value.
> + * @increment: Scalar increment for this value.
> + * @group: Group data.
> + *
> + * NOTE: The @min_val, @max_val, @increment constraints are merely informative.
> + *       These values are not enforced in any of the callbacks.
> + */
> +struct fwat_int_data {
> +	int (*read)(struct device *dev, long id, long *val);
> +	int (*write)(struct device *dev, long id, long val);
> +	long default_val;
> +	long min_val;
> +	long max_val;
> +	long increment;
> +	struct fwat_group_data group;
> +};
> +
> +/**
> + * struct fwat_str_data - Data struct for the string group type
> + * @read: Read callback for the current_value attribute.
> + * @write: Write callback for the current_value attribute.
> + * @default_val: Default value.
> + * @min_len: Minimum string length.
> + * @max_len: Maximum string length.
> + * @group: Group data.
> + *
> + * NOTE: The @min_len, @max_len constraints are merely informative. These
> + *       values are not enforced in any of the callbacks.
> + */
> +struct fwat_str_data {
> +	int (*read)(struct device *dev, long id, const char **buf);
> +	int (*write)(struct device *dev, long id, const char *buf);
> +	const char *default_val;
> +	long min_len;
> +	long max_len;
> +	struct fwat_group_data group;
> +};
> +
> +#define __FWAT_GROUP(_name, _disp_name, _mode, _fattrs) \
> +	{ .name = __stringify(_name), .display_name = _disp_name, .mode = _mode, .fattrs = _fattrs }
> +
> +/**
> + * DEFINE_FWAT_BOOL_GROUP - Convenience macro to quickly define an static

an static -> a static (all place)

> + *                          struct fwat_bool_data instance
> + * @_name: Name of the group.
> + * @_disp_name: Name showed in the display_name attribute. (Optional)

showed -> shown (all place)

> + * @_def_val: Default value.
> + * @_mode: Mode for the current_value attribute. All other attributes will have
> + *         0444 permissions.
> + * @_fattrs: Bitmap of selected attributes for this group type.
> + *
> + * `read` and `write` callbacks are required to be already defined as
> + * `_name##_read` and `_name##_write` respectively.
> + */
> +#define DEFINE_FWAT_BOOL_GROUP(_name, _disp_name, _def_val, _mode, _fattrs) \
> +	static const struct fwat_bool_data _name##_group_data = {	\
> +		.read = _name##_read,					\
> +		.write = _name##_write,					\
> +		.default_val = _def_val,				\
> +		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
> +	}
> +
> +/**
> + * DEFINE_FWAT_ENUM_GROUP - Convenience macro to quickly define an static
> + *                          struct fwat_enum_data instance
> + * @_name: Name of the group.
> + * @_disp_name: Name showed in the display_name attribute. (Optional)
> + * @_def_idx: Index of the default value in the @_poss_vals array.
> + * @_poss_vals: Array of possible value strings for this group type.
> + * @_mode: Mode for the current_value attribute. All other attributes will have
> + *         0444 permissions.
> + * @_fattrs: Bitmap of selected attributes for this group type.
> + *
> + * `read` and `write` callbacks are required to be already defined as
> + * `_name##_read` and `_name##_write` respectively.
> + *
> + * NOTE: The `val_idx` argument in the `write` callback is guaranteed to be a
> + *       valid (within bounds) index. However, the user is in charge of writing
> + *       valid indexes to the `*val_idx` argument of the `read` callback.
> + *       Failing to do so may result in an OOB access.
> + */
> +#define DEFINE_FWAT_ENUM_GROUP(_name, _disp_name, _poss_vals, _def_idx, _mode, _fattrs) \
> +	static const struct fwat_enum_data _name##_group_data = {	\
> +		.read = _name##_read,					\
> +		.write = _name##_write,					\
> +		.default_idx = _def_idx,				\
> +		.possible_vals = _poss_vals,				\
> +		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
> +	}
> +
> +/**
> + * DEFINE_FWAT_INT_GROUP - Convenience macro to quickly define an static
> + *                         struct fwat_int_data instance
> + * @_name: Name of the group.
> + * @_disp_name: Name showed in the display_name attribute. (Optional)
> + * @_def_val: Default value.
> + * @_min: Minimum value.
> + * @_max: Maximum value.
> + * @_inc: Scalar increment for this value.
> + * @_mode: Mode for the current_value attribute. All other attributes will have
> + *         0444 permissions.
> + * @_fattrs: Bitmap of selected attributes for this group type.
> + *
> + * `read` and `write` callbacks are required to be already defined as
> + * `_name##_read` and `_name##_write` respectively.
> + *
> + * NOTE: The @_min, @_max, @_inc constraints are merely informative. These
> + *       values are not enforced in any of the callbacks.
> + */
> +#define DEFINE_FWAT_INT_GROUP(_name, _disp_name, _def_val, _min, _max, _inc, _mode, _fattrs) \
> +	static const struct fwat_int_data _name##_group_data = {	\
> +		.read = _name##_read,					\
> +		.write = _name##_write,					\
> +		.default_val = _def_val,				\
> +		.min_val = _min,					\
> +		.max_val = _max,					\
> +		.increment = _inc,					\
> +		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
> +	}
> +
> +/**
> + * DEFINE_FWAT_STR_GROUP - Convenience macro to quickly define an static
> + *                         struct fwat_str_data instance
> + * @_name: Name of the group.
> + * @_disp_name: Name showed in the display_name attribute. (Optional)
> + * @_def_val: Default value.
> + * @_min: Minimum string length.
> + * @_max: Maximum string length.
> + * @_mode: Mode for the current_value attribute. All other attributes will have
> + *         0444 permissions.
> + * @_fattrs: Bitmap of selected attributes for this group type.
> + *
> + * `read` and `write` callbacks are required to be already defined as
> + * `_name##_read` and `_name##_write` respectively.
> + *
> + * NOTE: The @_min, @_max constraints are merely informative. These values are
> + *       not enforced in any of the callbacks.
> + */
> +#define DEFINE_FWAT_STR_GROUP(_name, _disp_name, _def_val, _min, _max, _mode, _fattrs) \
> +	static const struct fwat_str_data _name##_group_data = {	\
> +		.read = _name##_read,					\
> +		.write = _name##_write,					\
> +		.default_val = _def_val,				\
> +		.min_len = _min,					\
> +		.max_len = _max,					\
> +		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
> +	}
> +
> +int fwat_create_bool_group(struct fwat_device *fadev,
> +			   const struct fwat_bool_data *data);
> +int fwat_create_enum_group(struct fwat_device *fadev,
> +			   const struct fwat_enum_data *data);
> +int fwat_create_int_group(struct fwat_device *fadev,
> +			  const struct fwat_int_data *data);
> +int fwat_create_str_group(struct fwat_device *fadev,
> +			  const struct fwat_str_data *data);
> +
> +/**
> + * fwat_create_group - Convenience generic macro to create a group
> + * @_dev: fwat_device
> + * @_data: One of fwat_{bool,enum,int,str}_data instance
> + *
> + * This macro (and associated functions) creates a sysfs group under the
> + * 'attributes' directory, which is located in the class device root directory.
> + *
> + * See Documentation/ABI/testing/sysfs-class-firmware-attributes for details.
> + *
> + * The @_data associated with this group may be created either statically,
> + * through DEFINE_FWAT_*_GROUP macros or dynamically, in which case the user
> + * would have allocate and fill the struct manually. The dynamic approach should
> + * be preferred when group constraints and/or visibility is decided dynamically.
> + *
> + * Example:
> + *
> + * static int stat_read(...){...};
> + * static int stat_write(...){...};
> + *
> + * DEFINE_FWAT_(BOOL|ENUM|INT|STR)_GROUP(stat, ...);
> + *
> + * static int create_groups(struct fwat_device *fadev)
> + * {
> + *	struct fwat_enum_data *dyn_group_data;
> + *
> + *	dyn_group_data = kzalloc(...);
> + *	// Fill the data
> + *	...
> + *	fwat_create_group(fadev, &stat_group_data);
> + *	fwat_create_group(fadev, &dyn_group_data);
> + *	fwat_create_group(...);
> + *	...
> + * }
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +#define fwat_create_group(_dev, _data) \
> +	_Generic((_data),							\
> +		 const struct fwat_bool_data * : fwat_create_bool_group,	\
> +		 const struct fwat_enum_data * : fwat_create_enum_group,	\
> +		 const struct fwat_int_data * : fwat_create_int_group,		\
> +		 const struct fwat_str_data * : fwat_create_str_group)		\
> +		(_dev, _data)
> +
>   struct fwat_device * __must_check
>   fwat_device_register(struct device *parent, const char *name, void *drvdata,
>   		     const struct attribute_group **groups);
> 

Thanks
Alok


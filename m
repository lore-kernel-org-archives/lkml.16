Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECCD21B9DE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298511; cv=fail; b=cpekOQISnIV0MbOhZ44IaaRlCauEjPx0NptEXJHk263fzYUkgNOv+XpQjx5eKM46tZVnMKFpbrkzVFhs0ZQyWDwa4BR4pTPTmsB+OE+EOeM1M0QRQpBu9i91xAfhCkBxgW4/VKCOEsY7Yqis22e8cUwzNoLlZsPNk3i8VV27AQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298511; c=relaxed/simple;
	bh=ht0O5Iu3n5XM5sMmOIeDdLhwf+lQ9rIkkOEmof0gJ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qcmqi90HV04uX93w/5mQooZQBRXcUuyy03akHrOlaIy+3rGG83OwLYcF7mZhNh57/9ZUueNLiOy+CFb98Lj5t0F8GS/99QSLbMdWMu05x9sIMVs08zLnfeL0rPWquU3q71o/m4J0Dt+fq4h3hHS0ovRnqOpggbHdP7WFLURQcY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fSz5w2ul; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d8J0WSVO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fSz5w2ul";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d8J0WSVO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55772xb9017219;
	Sat, 7 Jun 2025 12:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2ZfCgFzuPsoSMKXri78JTpC5z4fhshPNPJXBBScIbGo=; b=
	fSz5w2ul82RNgWmZhQfgk1TdqIybSNMGrRIbQ1MVUnYJE7IisllUWwjqUDrZT4uk
	jW4THfhWlDPueAyLBbO6LgotwphU7dSvjNmVydADBYvBVXLgw2pEMAMwefxmfMmH
	s2GVONzd9TkeJSd9UcSYFBuA8tZ7HzZO7q/m8C4ulq7hM41yn+xKLXQd7guserHR
	hzJ1Gy5u59LUbaNnQeUkO442GjTijJTM532PyUJ4ztL4bUzg5Dq2GIvjpAv3OHCJ
	XDEdvrmQMKQxoJnzuJDLqFJoGBKBxrqqTKaQi7PTaYLQzRGaoM6ockslWhhfmebY
	p8Z2Wh0UVBWf87Zx1p+HXw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf08we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:14:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576jq44007375;
	Sat, 7 Jun 2025 12:14:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5rmfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0XxSZQkwQhUt2be+JjFentEbHJfuqBTxFz1B8PB2VPyOegJYSBa69S9YDXbMmjdbsuY1xYz5o7TV0JjICZaNBCM7OR1Oblhhf1mFmTEBkMSqshnKb3hk/ITvXC3C9O2kbUo+U6QCP4A5jjOUBnjrAhPc/rVzH3mts2OBIoUV1TqY+v//fwpv1ZF9sUv8OBiMTxui7ECLKGf+JRWLlN8h4Hj7FkrjO9oGFr6FXaELF/MDIuAuC6xWTZZSNXhBY2RIMhqL3rbiZSoHXAyyyzwdU8ZVVdpM14+4ysHaonhIlvHiyKTTtEZsfKsSYkYx1ssUv/qo9L89KaToby0hbQJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZfCgFzuPsoSMKXri78JTpC5z4fhshPNPJXBBScIbGo=;
 b=a4DBhCN8GtZtdp/RDw3LutftpN8RBhCDb7N8l22X6Grpu2Ep7V2ztuBjiy6NYHlQE0HIXmpe3pCeoJgIjnCARz5lYuSLv5CZGR48UkzbYdTlrSuobiCLyc06eFBNO7+ENua2txnv99Zr8MdBvr0k303nA9wALp8FMT9ZPZUZQLVrAYyyu1XECh6fSujSGTevXNq6GjAnHXSpcW88IlPfmRxGG4MBMN0rMLQKpC8wja2gLqNwAfULDn+xHnkRB1pr7fJIIZ+rqUXgYiT1Jn0fYeBB84piP2mNQt7+pB7Ci6UQ+H8zc+G2x6Eq5/9yoeP0O28rV8AtOmOmzeUEDQWaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZfCgFzuPsoSMKXri78JTpC5z4fhshPNPJXBBScIbGo=;
 b=d8J0WSVOcx8tq4S21VJ3/Jw4QdXyD55JvEvs3JJlYJ1eFxWv0K0OP5AAceLDjxDUK4xCZi8IUPaEsGJSeIXv6ARyT4A7KLuToViuq6T4VNQyNdCTvPEIE7RoSfBYIgZOmU1jTeqOC7tgSNfwIZ4OTA2egc7ytIXnKbIHLTUzmhw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sat, 7 Jun
 2025 12:14:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 12:14:43 +0000
Date: Sat, 7 Jun 2025 13:14:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
Message-ID: <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac62809-1460-403b-47d1-08dda5bce2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjZPYjQzNzJhRzJQWUh1L2NQL0RzK3FhSzI5aXIrQmQ5N2FlSzBNUnZWa3hD?=
 =?utf-8?B?UlBTbkRLSnlXWjA5aUs4UzFkU00zV2w4REppUkFGSzE2TDRkdmxxWlJ2RVpX?=
 =?utf-8?B?b0hpOTVSOGNVVVBsOFlJeWVOdEFsaGlRblRFcXl3aE9PWjhMMGZOV0dMMEtY?=
 =?utf-8?B?TXBnNnZpa0xUcUdjaElUdU9xclAyK1d3ZHM0T1psSzRHaUltTG9jRVB2cWZJ?=
 =?utf-8?B?T1NiMnh1ZkQvazJDSFhSVHMzeXJqNHROTkhRL3g5bWdIeW5KODhCdDBicW5I?=
 =?utf-8?B?M0cxcHlWbVJTUmkrRTFwa1JSWWhYOUp5dHBNQnVlN3o4a2g4Q3RVTTZ1dTFl?=
 =?utf-8?B?ZGd6LzBoZkF4b2d1cklpYmVpQ0dNZGhpMzlKRU5UZnlmclgrU2ppN3hWUjFn?=
 =?utf-8?B?RHdXVXE3VXplOTcxS1BRcHA0WGpEbWhobTM0U3ByZXMyL21xaklqNllUVUo5?=
 =?utf-8?B?cGlVRUFENC9UcEFBNnI4K0FMVW9RblZLYmFiMk94YW81R3VVc0pmRTNiWndC?=
 =?utf-8?B?L0JHQ0pDYVZJMFNVSGZMUFRaZWdBMzNPbzhzdGtWbmt1K004M2c2M3NPWE84?=
 =?utf-8?B?MkxjNkJ0VDRFMjZrM2pVK1hadXhBRUhRc0dIQlVxK2c4bUw2MCtUL3g2Y3Fh?=
 =?utf-8?B?YnBVUHJJd2lNRytVZXRNcjZMaXRnOFhJVmFINi9DOTYvVXVldExGZGtOZk5w?=
 =?utf-8?B?b0pobzJVd2x4VEp1ZXI3N3p4RTloV2xjOGFCTUdDQjRiZ1ZNbHlrTStKSHZX?=
 =?utf-8?B?N1EvQzVoRTd5cUp6bFdnOVZhMmhBWjFRZkVMSCttYmFPOXptVDN0RDlVQUFL?=
 =?utf-8?B?aW9aSW5uQjF1QW9qUzNwTnB3UjlNd2g2S04reGlES1JDbldQelZ1R0tldUFw?=
 =?utf-8?B?YUZMVjBLdUI3emp3WDJlTyt0ZExqc0tZL0Rvbi9wSmI0d2ROZTlDdmgzQkFP?=
 =?utf-8?B?YXdOT1pOMUtCV1Z3KzEvZGZrZmphZWxBREszQktzYy9VNE5VbngraW00YnZC?=
 =?utf-8?B?UkJpQlNtOTczU1VFWjFiMVBYYVN1QVMzRCtxZCtIZU9scnVHMU5RY1ZubDA1?=
 =?utf-8?B?cFFKeXlwMFI0RnhmVTFTNXVYbjQxb0F5VkZjemZ5NnRjWC9lRzRWZXNUczFZ?=
 =?utf-8?B?SG1MOEExUjl4ZlZYWnRrY2pRYUNIalVtVFM0cVJ2ZXhVUURFTFZLbU43b05R?=
 =?utf-8?B?cGRueUJ3Mk5NWWp1ejhTcWx1U0xEUUlsQUt3dUxlQWRxWUdld0FmS0lWbXNj?=
 =?utf-8?B?c2RYUTVSUW5PeGE2RmdxS2VhRmFITHUzbnJYTisxbjVkUk1sakZNQ3d6MUJP?=
 =?utf-8?B?blExdkJLaWZ1L2FReTJUWXlaanZmYmVpQWNZS3JXdkxVMTQxYlZnSGFnMjBH?=
 =?utf-8?B?cXBUQTdKMTFFOFdrSWNZMHNEaDR3VTh4WG1OSm1XVk9hS01SWTRxR0ltOEgy?=
 =?utf-8?B?clhCRXpiUlpTQjExM1NMUDJqTFlTVWJPVnl4aWxMV0NCTmsrbDFOZFZhSEVM?=
 =?utf-8?B?ME9NaWR5ZE8zcDhwT0pKcXl4WkROVzRKZTd1TGhWVm1sUFAyRVdFZTlOdTdF?=
 =?utf-8?B?aUlSR09weEhRdFN3THh0Y1NZbitDRTNXNFpkSFcvUjFoNXB6MGMyZ3RyVUxO?=
 =?utf-8?B?VUw5eHJZRkZZQkR4UEVlc0dxbkRzNVlpbWZxL3RCSEFTajh1YnlnSzBPbzcx?=
 =?utf-8?B?aGljSGdtSFFTYU9QTElIRUR0U2VXenlTbjlXcjBJd0ZtenVqd3RzbVprYS9R?=
 =?utf-8?B?aVRUY1BRYmxLRFBPNUhLS3dRZmcybDBoZWFseXZpKzNQdm52OFdzUFJQR092?=
 =?utf-8?B?MHhEdjBpRy9BczYvN1ZjT2RBYXo4NUtoWllKMXlrQXIvUjZ3M1U5bmVTMXBQ?=
 =?utf-8?B?bjJ1b1pDbHZpcURGbk5oZ0x6SnJKVDFSdDM4RHBKdjAwMkY3QnJPUTFzTWZu?=
 =?utf-8?Q?KldKTpRH4N0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHVSZW5zTVFpcGFIYzFQYnh5dFlOREtOeUd5bGp5SW0rUjZ5dG5ZeEZLemdT?=
 =?utf-8?B?N1A5OXZyMFprZ3pRT3NUaHZjUUR2Y29sQkNnVU9vSHVBTHMxWWJ5Z1pQR2Vr?=
 =?utf-8?B?eVZuR3JyTFRKUmZtOXhrTXI0NnhvRDdHdWp0bjBWUGszcERPK28vTWZvMk5K?=
 =?utf-8?B?Tk5MZGhkRWhtL1RNYmlRTDNtaVVteG5tOGZTSkhYVGNtdGxhTGJvZk9FRGVJ?=
 =?utf-8?B?QkpVQlV5aXFMdWM4TnJEUnZPL1hyTHgrK3ZySmx4cTBjTG1nWXNISjF5T1hv?=
 =?utf-8?B?bitGbm5TNC9aV1dRdUtaZzR3dXVyLy9qNWIwd1ZiUFZaaG1QSVhpc1B0YjA2?=
 =?utf-8?B?MDdka1d1Q3hsYXk1U3ltdTFYdkxaakZDaTdQSWZSWVQ5QmFKQ2laVkNLWVZI?=
 =?utf-8?B?a2Y4SXNRakk5SjFpazkzMzJENFN5UEFCdTFEVHhObkNDQWpodWVnL3AvenRs?=
 =?utf-8?B?QTRKY2ZudmtlSjJwWGhIUnlZQWo3bCtiSVJ3eXBRdUpxWDUxdlFVOVJQY3JN?=
 =?utf-8?B?T3FPbEUyUjd1K2czUFZBWDJVdFZzTEZMbVJ5WnVFWE84SUYrNmhOQWtLN2hV?=
 =?utf-8?B?M1JVdVNadWlNZ250NXBDN2pBOE5IZWgzeTJudjBDeElsV2dBcHJNT3AvQlNu?=
 =?utf-8?B?OVVtd1NUVWVYRm9BYk5jVlZ6Ty8vV3E0a1RHVVZTbVd6OGY4UlNTaTZRSXVv?=
 =?utf-8?B?ZDVDQkxxeFk3SkN5Z2dIMnlmWlRmQVRVak1tSXQwZXVLclFSZ1FLVi8zcmFT?=
 =?utf-8?B?Zyt4QkhSMUtLYlF4UkNTcTBHR1pWL2JoVTFEb29pZFUxQmQ5NmlnVVdzT3By?=
 =?utf-8?B?eGJSbHNVV1IxcGtxUmtjR1M0NzV4RUplTmhaY1crM1JsMWd4ZjRRNGcrYlNv?=
 =?utf-8?B?VUJWWHptWVl5eE02NlhYcmNieTltSVFBN2EwWmx1UDJWZGZFZHg0Y0pmNHNh?=
 =?utf-8?B?TEJDMFYvN0cxaUVHNDVEbWRheGxjdmp2VjRTd1pzd2owS2p6MVdqQnlXOVVR?=
 =?utf-8?B?RjlraEc1czFxbll4Tjh1b2JuYkJvTnFOWGNtMzdlRFNZbyt1cSszVE5temlE?=
 =?utf-8?B?aTBPanQ3bkJqZHQycVd1eWJVQWo5VzdTVmlhK1VqU0dsN2IwMGR6SGpHMHl3?=
 =?utf-8?B?a3h3d0hsa2dJRU8rcU5wYzhJTXFVZk5sUGlqSWlZRE84RHd1eHI1VzliVlMw?=
 =?utf-8?B?TXVjaVBVazUwUGtxNTFHdVlXLzczL3RUQytBRlY1RGQzcmx3QnE1YWVSUFZS?=
 =?utf-8?B?VXBmdjJHL1NKZU5pYy9hMHdIZCtOUXJ5NHdtcUxpbExPeFg0R0JOb3RlbjUv?=
 =?utf-8?B?cjVDNUZYSUlheE13b3AzY2diUlQvcXhaM0F0K3BzR01vZDZKYjJpNjFoUGR1?=
 =?utf-8?B?bEg0RjVRRG9lNFlFMDE1RXJuVFFFQVlxMlJ2dHdleHZXMlFHL1F3MHBrcTQy?=
 =?utf-8?B?K3gvamFnb0c2VTR6Qml4dDZXRlFJTWlQelFlS0VlQlk3Y2hUSk42WXp2UHJQ?=
 =?utf-8?B?TFY4eXVnZ3ZGZGFEbjd3RkZkMHU1anczdUx6NGdDMDFURThha3A5ZC90NVEw?=
 =?utf-8?B?ZDcyQTJFdkVzZzMwcjBZZ1VzVXg4WWppUnFJOSszcWsxc3hSN3V5RDB0aWJZ?=
 =?utf-8?B?RmdycE9VUHdXOXc5ZnRlR1MyOHJ1NGdnSzFkdWtBQ3ZIb0RzdzVBb0dmaTJw?=
 =?utf-8?B?ZU1HZFlmN0E0NGh2US85a0VEczFHbCtEcVVGZVBrOHBYeTlnenJweXhJUG1W?=
 =?utf-8?B?dnFCN0hZc0w2OVcvZ2J2MzdQY3JNKzVPM3FQTVR6Yi95bTlKeURvNkhKcDBI?=
 =?utf-8?B?ZWlYbW5qU1VON2krd2hnOE9COVBOUWc1NjRselJabTd2TlYvVWh6VkhDeWxP?=
 =?utf-8?B?WFZqeE9paXY5Yll5bjdOSzhRYzBlZnQwNWRCTys4aDlGRExXRnJ6SVo0cDFH?=
 =?utf-8?B?aGhweUx5MFFDNVhuZ28xc21mMDV1UDNXd3hJZmhqeTMrNjhSYUhFMXdxTzNF?=
 =?utf-8?B?T0hjVWVpakJUL1lWWVBCRGZEdzBHa29vZW05WktDbGN3ZS82czB1ZlVIbmhS?=
 =?utf-8?B?aGxiNFRsSVpvZnR6Uk5CeEJWRS9vZDh6S0hRbFhzaHlBZ1hFTDlqL0JSY2FR?=
 =?utf-8?B?a0pyQVFkS2VUV2pUMWczMGpLbVNvQ2tWcUpvU0F5dlFtZFl1RmE5eFFPQnh2?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LnXIi6Ekgfp8kRzkh73bz2JzYetU2Bq46o7ryTaww7xN0nNwK7pVVL0ij/Kd3GVweRlqL+owvY+IzFOFlqcFTEXznSBd0O2jciTuSX+DAbOS+jsF+xgZ/a8BkKAV/Sa3quKiE6EIEHPGk83VTmmuWTufAfWU2+OqRtjdJbyBZue8Mkkrrz8m+zIwy+urthEXZHky3hUpQzaCiKcQIPb6feG6adzqaqf2oZLFU6aK4niSDoZdNLZMpDcWXulwjN2u6xoHQo5+ZPwVg/iyROaTOAy8j2V6IQRe8YIGIGch8SwCGNO962crj89q8tGR7rar0rpxwdDPpPKWQxNxJ93zVtF3j1WbdkwF3v11VfDH2H3bVBqRJanKHJPFgxLRohDuVozaDoGlkQD7fovk6FAEpIgk7QPacWUDOQYa7fsdLg2wQsmBlzEXqVuyMRHXK0+uqv5Z3mz/cbiVWpWQR5UpAqgtGGUZgl9Km9+fVEQa8TVcTjnFQ9FhIO/VuCxWQSnf3XJDcJGT54RwuwQbqaUzA/PKARf81fWgCgA+N61NInj8hs2r1Xdd5nkWXzhXmk5hO7yg1sbVaJIcyTdttwz3dWPz/z+pNOqibZ3FLWVOBoc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac62809-1460-403b-47d1-08dda5bce2a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 12:14:43.1964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TM5nffM5pbJJxIhcGZLPDRU4OOS/ZutNd3yhmHs8C5Mmu3PxVv3luyroEQvUfq7gpaE4JUfxd5qgvW2ggmV5s/One20AEs5zSiKdbR3yf1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070087
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=68442d37 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=h08ATKPx_57Ha0vpD2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: GjcNfmF4z68DDHDWmXmZJl9sWlRKwcSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA4NyBTYWx0ZWRfX8SSWU2wukONp Ll5HfrhX8J4FQ0UW6AA+pgOLdDgpksbSgAU6zGnxxi6iMTdTmxQwuyzJjnFmbOfDZ0eTRplNqPV NPnGJBg3ZzMo/ofiTF6EdK4y66+4LtoUXFJ6blv0V0XhMCyqmFMXoKj+Sbd0Z0Oj8eDUTvfUkX1
 IQtQH+A4WDEjeczC/aPHmp12gmxQS3ZQuGoxkR7CCIF77kuR7KyLl7bxKFnaoxSH4SB+uRMouNB +TTGuKLWc0N4KI/PTyuk16AqIN3I1grAcRhhFQ45M/d7RxcxggDsQqsO8X2+tivlKCgqIobZQAY /7aI8BvDFODWByKlBizMxiQyzTvXKrscmbpLAxT94Zt/b64TFJRXrLcEcB9Vu4n/Ed6lkRaJJxG
 dx4TwYnaQX1p/NkUcvpd/GUAL+iz3xTmDU6Nmv3AWF6b/E2z5CN0w5PDhi8Tp/MudaQFsYT3
X-Proofpoint-ORIG-GUID: GjcNfmF4z68DDHDWmXmZJl9sWlRKwcSS

On Thu, Jun 05, 2025 at 04:00:59PM +0800, Baolin Wang wrote:
> The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
> means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
> will still attempt to collapse into a shmem THP. This violates the rule we have
> agreed upon: never means never.

Ugh that we have separate shmem logic. And split between huge_memory.c and
shmem.c too :)) Again, not your fault, just a general moan about existing
stuff :P

>
> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".

Hm I'm not sure if this is enforced is it? I may have missed something here
however.

>
> Then the current strategy is:
>
> For shmem, if none of always, madvise, within_size, and inherit have enabled
> PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.

Again, is this just MADV_COLLAPSE? Surely this is a general change?

We should be clear that we are not explicitly limiting ourselves to
MADV_COLLAPSE here.

You shoudl clearly indicate that the MADV_COLLAPSE case DOESN'T set
TVA_ENFORCE_SYSFS and that's the key difference here.

>
> For tmpfs, if the mount option is set with the 'huge=never' parameter, then
> MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/huge_memory.c | 2 +-
>  mm/shmem.c       | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d3e66136e41a..a8cfa37cae72 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  	 * own flags.
>  	 */
>  	if (!in_pf && shmem_file(vma->vm_file))
> -		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
> +		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
>  						   vma, vma->vm_pgoff, 0,
>  						   !enforce_sysfs);

Did you mean to do &&?

Also, is this achieving what you want to achieve? Is it necessary? The
changes in patch 1/2 enforce the global settings and before this code in
__thp_vma_allowable_orders():

unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
					 unsigned long vm_flags,
					 unsigned long tva_flags,
					 unsigned long orders)
{
	... (no early exits) ...

	orders &= supported_orders;
	if (!orders)
		return 0;

	...
}

So if orders == 0 due to the changes in thp_vma_allowable_orders(), which
is the only caller of __thp_vma_allowable_orders() then we _always_ exit
early here before we get to this shmem_allowable_huge_orders() code.

>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 4b42419ce6b2..9af45d4e27e6 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -625,7 +625,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>  		return 0;
>  	if (shmem_huge == SHMEM_HUGE_DENY)
>  		return 0;
> -	if (shmem_huge_force || shmem_huge == SHMEM_HUGE_FORCE)
> +	if (shmem_huge == SHMEM_HUGE_FORCE)
>  		return maybe_pmd_order;
>
>  	/*
> @@ -660,7 +660,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>
>  		fallthrough;
>  	case SHMEM_HUGE_ADVISE:
> -		if (vm_flags & VM_HUGEPAGE)
> +		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>  			return maybe_pmd_order;
>  		fallthrough;
>  	default:
> @@ -1790,7 +1790,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>  	/* Allow mTHP that will be fully within i_size. */
>  	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
>
> -	if (vm_flags & VM_HUGEPAGE)
> +	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>  		mask |= READ_ONCE(huge_shmem_orders_madvise);

I'm also not sure these are necessary:

The only path that can set shmem_huge_force is __thp_vma_allowable_orders()
-> shmem_allowable_huge_orders() -> shmem_huge_global_enabled() and then
only if !(tva_flags & TVA_ENFORCE_SYSFS) and as stated above we already
cover off this case by early exiting __thp_vma_allowable_orders() if orders
== 0 as established in patch 1/2.



>
>  	if (global_orders > 0)
> --
> 2.43.5
>

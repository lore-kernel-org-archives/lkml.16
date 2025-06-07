Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B1B139D0A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749281199; cv=fail; b=MU1lozKwmn0Ce35aVH+olZz9h6nPf7Ok3vVlAF9i9arRc+Jzf/3HDptdt6ONAJGDlcaJAnzN/CO4XaBIAs9x+xejX0f81WclReAGmgGZh6LDcmFgzvvO2wsDv+TC4/uvxoLiYPVls9azll+ReJzT7NIJajnvIKCPF6tV1mhtEvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749281199; c=relaxed/simple;
	bh=xLjbtqUoU+1gFamuhQzY7GWAStUq+lkADavYaq0pFe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QAY9O+llZCM00ViBgMTBqoXM2urMmjTTWCaUBv2BE9EfQvU1FCuKhfNr/mqbfxQfDZ0lr3GnaXBhx1HBfyvSUGw6VlObn2Vx3vE0MbXZ+Z7lmbSKzndc4nlZLIHkJq6l3ylNHnadJEW7QV5svu07p6CBccx/xIMl0Y65wRfMfkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jhOv/oqU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HoXtwQeR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jhOv/oqU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HoXtwQeR"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575fo5g025589;
	Sat, 7 Jun 2025 07:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xLjbtqUoU+1gFamuhQzY7GWAStUq+lkADavYaq0pFe4=; b=
	jhOv/oqU+6myiMW56JWP9vHHjNCLMIXRNeVWOB0+J2sl/pwObw83cXDKqLtJeZmk
	Rsl8nwHfVFwelp5sT/4xsLx9eA4lamA6jrwxu70MKe0G94fuJx+BeSv+KI+ou3h2
	hqay5GNQjJ0tAz6pwQIfLhf/qzQ6+zXY6HuI04NRRm4UErEA98aowo83gwlJxN5t
	j0HB2IypBXO0yEWsc3xS9MTflxN2SmJ1EBt1jfTqAq7dEsQr/McsTtzoaka1ggpI
	NuCVLxayPWJGcMIT24Fgg4oazHWuQldeZ8kvBn8OhqAJVBRxDNJHReL7IcPv91Oo
	Tt1x9OZfN4NA/Et8XFx7EA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v03dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 07:26:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576aAHX020433;
	Sat, 7 Jun 2025 07:26:07 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc51sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 07:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPBHBKY9+LfLD16vM4soBDCh0WhaEPGO4NCLrW4E09SvfAoRW4RU4/5Yw+WeNPCHtafAy+QtasS+5t7TPoDOkLT/qodTLDeLblXXJMimR5/860N+f/lLdtIUXra5gLy9In4xp/VS4io1hvLR2BnT+6slt6pdy7allRPDAAj7svELhDVcrK01d0Nz45wmg16sko4la69L6vGN7uRiTTOG6VumsOxZKJioj7vk86ppMxHPh/KwoNoxFqzkd4ZS1BbtagubzR7ELDYjKLxO/GCoRDFDTSNe7EYpe9RXw/EbtFP5dGCnZmFZXlEqu2Zf+GF7oPxe7JOEKlfaowX2vIKIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLjbtqUoU+1gFamuhQzY7GWAStUq+lkADavYaq0pFe4=;
 b=CCkEiBpLoES1/n2cr8ydyETfRFpKdyBv2o9vCjh2zIZbzu3FyrJfK+vDMELO/o7k9z5WZGIvdGkopHRHPrfyHUE2XRjskuM/TTCbXZkfUZtt9f++TakAYWIMWx8MQ9CKDgyhuxf0XS5ga/hdmxNnHVyCv90MStSVyZ1TwwjW8Iea3lcJe0m+sl/gc4h10BLDLv1nGwU/MKazjI/Ars7jz6sgMeRlFhcYbxLrz0wpRa1K540lEFqEX6N5YDPr36LUVJTSic+LX1jBuaA7S3/ryGxN0PeTAjvcoCRSDpozfMvIsaUQ9Mp5l1+ktPBXCRHcTofHNHsjtbtHg2hKeX3STg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLjbtqUoU+1gFamuhQzY7GWAStUq+lkADavYaq0pFe4=;
 b=HoXtwQeRmatqwpVTmQnNcvNvQiEZCbMOoRs9Iu6D+ImLu6CglHEDZ0hPx6MI7fzY1uGhZPzUKEufHGYyrQBS3ny3eUWkN2UNdGUTbRIYl1KvKXsPIUnG2bB4m9pmaRwB0ijDDlNBZz0YsyNeWA/nPnPG+tcmfqrqQv2Rt2iiHsE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB5967.namprd10.prod.outlook.com (2603:10b6:8:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 07:26:04 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 07:26:03 +0000
Date: Sat, 7 Jun 2025 08:26:01 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <69846ab3-de03-48bc-acd7-60e8a458c263@lucifer.local>
References: <20250607004623.8896-1-21cnbao@gmail.com>
 <5fc1de4d-7c2d-4f5f-9fb2-65bef5b6931b@lucifer.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fc1de4d-7c2d-4f5f-9fb2-65bef5b6931b@lucifer.local>
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: eb382d1a-94e8-48b3-a2a0-08dda5948f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YktqUWZvcFFnY2dLdEpMUVoxdGJrV0RmQVNuckhySGtiY0d4MCtBcVNMQnpt?=
 =?utf-8?B?dFFmbDhzKzVRTktDbUVFeUJsOE1LeG80SzNTMnpzdmJxNDJlU2FCTjQzTkJ2?=
 =?utf-8?B?dCtkRzhhYzZYSUN3T2c2clNpVUFGVmJJZnU0YXNTOTVNbS9uUllwa2RSc210?=
 =?utf-8?B?OUhINUxwQ3JPMjZTSktzVVFKcXBTN0pSSW16M0VJTXNndjdobzRibkpGamRQ?=
 =?utf-8?B?Ums5emdBRHhwWFVzQUZkTFBkcnFsZGkzRVNmRGNOelVlWUk4MVAzdzNZZ0Yz?=
 =?utf-8?B?c3RyUmU4T21RZmZEZ01kOU5zMGwwd20yZ0RJMjJZKzVnZjIzYzdOUVJXR0RB?=
 =?utf-8?B?ZS9PSUNyZGJCNHdyZ0hWM1NtalFEdEh1L2hGalpUSlNFZXFGREVWdVNvSVZF?=
 =?utf-8?B?ZEg0bzlvdmcxQ2phcWlBVFg4MitPNk1DSlo4aVgzbHRGd3JGR0lvNklzR1Zn?=
 =?utf-8?B?UE1NR05nL3BsU29yMG5Hak5QYkVKczFZaUZNUXhTRTR0VE5GaVhhMUZCdUFO?=
 =?utf-8?B?N29MNHhyTVpYMURhYkNWbUt5V0lLTnhXRWRaM2xINGREZlczVndwSzhyM1ZR?=
 =?utf-8?B?NS8yZWd0bDRGR0Q5WTgvS3l4VmwvNDE0V205anJ4NmlTRUZNKzNJYlZqNTJt?=
 =?utf-8?B?dTZHb2ZQNllwcTNrNG1tNzNDMzVmdzh5STJQdVllbUtwUm8rOXdmT2RjeHpy?=
 =?utf-8?B?dW9mVi9TZVo5RjZYNnZDSXJXNlRaS0tPc3Rla2tPZ1I5ejVJNm8xcVlrVWFs?=
 =?utf-8?B?djdEZXJmK1dXa0NHVVVwbFZMQjRKeWZwSWxPM0dla1FwcVNEYUMzbERKWDgv?=
 =?utf-8?B?Y1lMVjZYYjN0aVdObFRveWs1ZzBtaFhJOXhmcHFBSHRZTXhXVEpyNzFXeWpU?=
 =?utf-8?B?ZWVORFp4cHYvM3Q2ZVFUZjFIZ01qczdvemNzUytXVlJPV3k2dWVPQVFPZW9E?=
 =?utf-8?B?dWpocU9SSzV2aXdtd3dEZ3h1OGhsd1lmaXJSSUdoek43UFVmYTdBUnNSRGFk?=
 =?utf-8?B?ejFteDBYbndId1NsZmZLRXVYSUNjaEg2MVpMRnlLdlo2VkpIWmRQYmZkU1Jr?=
 =?utf-8?B?Ymo4LzVjaVVJdk5FZmYwZzZSR2NYYWhiTElUODJDQjEyM29kZXBFbVJLU2xC?=
 =?utf-8?B?QzNUZzBMYnhrM2MyYTllQnY5Nm9SY2FLTmRWMHZvOVdlbnFzeFJzdWs5Slln?=
 =?utf-8?B?K1Y5aktqWFAwOWFxTFY0blZvYWp6eXZ5Y1R2U0RtVXgrY1RnWTYydHluVXRv?=
 =?utf-8?B?ZElRNHZYWnQ0c01NK0NNTytlUC8vZ3FHT004K2tNVWVBc1QxMm1IVWl1MWlZ?=
 =?utf-8?B?WFJhM0NlbHZZd21jeGNsQXJQc1cyWXNwdkpmaEpDMVhxaGRSTmw1VkZUNXJS?=
 =?utf-8?B?U3QzRUQrOFQ1K1N4aEJ6Y1dRek5MWU5zWGtBMzRFL1M2YTJHTlptK0xldkFm?=
 =?utf-8?B?eFZHZ1FTQy9BZGdCN1c0L2NWeWpUbDNibnFpSUFFM0Q0aTZveXR6MitCbkZ1?=
 =?utf-8?B?a2haVXdUUFQxWUl6V1pIMjZiRGg5R3lKYUxrcFo2RDdLbDFTNDgydFJGZnUv?=
 =?utf-8?B?eC9aRlp5YTZXbWo5TXVlL2ovMWJ1cHBZOE5WbTZHUTlkM3ZNSU02RDlrZzZo?=
 =?utf-8?B?dkljK2tnOGV0amFYVkwyb29KazBpNC9sYTlmUElpY1k2blUzQnJRR1FFWHU4?=
 =?utf-8?B?QWxpMWhtTjhzVGZQeXBuLzBNT2JTcW45QWsvVWVndmFxRXJoUy8wVWtPT3M3?=
 =?utf-8?B?L2ZmZzJaT1BwWU8yOVJ5M0l2UXp5OHpUOUZOc3ZuUWt3K3o0d2pJdzQ3bCt4?=
 =?utf-8?B?NVY0a3R4Vm15QlpFcVJLa2hYaHFNODlHVjI4RVAyWWFySjVkbEVQbEUwc2Ro?=
 =?utf-8?Q?GfrOyhj63y1W7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVNIaVVGL3RZdTRmM2dUREhhMHJYZ2tiT1p3OTdJL0xiMTFxUzRTditERVlL?=
 =?utf-8?B?bWszYkVGMTRCd3FxcG11VlpqcWFXaVI2ZWdETXVaaW43VFozRjhrcGpJY0oy?=
 =?utf-8?B?VlFDSENCTmk5RVpzc1ZCWXZGbGpjK0l4dmx1ZzROSGVkbEpCa1g4a0M2Rmh0?=
 =?utf-8?B?TXByczRjZFJJZVZrRGNnMW16bmFHUFl6c3Z5Q0lOVmQyc0g4bDB1MTFIL1JZ?=
 =?utf-8?B?VnFGazl5d1AzclNhY3lDc2NPdUkvVDJoSUpaUUVtMjZrUUlYNm50MytVb2Nn?=
 =?utf-8?B?WjNFMjZNLzlMckpDT2pyTFFqWEJ6amhCamVuQVBWY1RZZ1NQSVNjMmVwdmw0?=
 =?utf-8?B?d3N6ZFNFZHlzaThVbEY1ODcwVjdneVJpaHdyRFpUZ1gwekpyRGZ1OGdBNXB5?=
 =?utf-8?B?TnpQeHN4OGZ3TDlsZjVPUEZMYUwwTmMwenA2K0g4bXhidjZjbGFJZnhCQkFl?=
 =?utf-8?B?bnlUYlBYS3d4elkyS2xZT1hRSlAwS3ljdDlobU10SFhUU0EvWnZLeVRoMmJ6?=
 =?utf-8?B?WERuOVl4MGhXcFYrT0Y5Y0dzSXJlU0J0Mjk2Y2V5anlaU215YXZvbXRIYjJU?=
 =?utf-8?B?Wk9jdHhWQ1JyTXJWNlh1QlNDMDllT2F4SEtNUDZtNmIyMzRnMncyMnV6S3Fo?=
 =?utf-8?B?REFSaFFRMkF3RzdwbXFrRGN5bXRnNk5xR0l6dzcyUEdkWHRacUE2b0dFa1RZ?=
 =?utf-8?B?Qzh2V1lSRlhJSXgvajhzUnFsTWpqQ05nTXNjR0hneld1Q3l3WmMwNU15c1ZX?=
 =?utf-8?B?azc5dFZBamZSdEUrZjlSUHFERHFhbkNndlN3dGtYNEw5aVoxNENmMHh2RC9i?=
 =?utf-8?B?YUd6SHdUcXpKV20vUE5iTEVkVEN5OXRnWlA5Nyt4cmVXWEoyMER4MTJkT2M0?=
 =?utf-8?B?NVozYkdiVklnY2VwZW9QRDAxSy9kQVdsRUpKZVJFODFoaThLSUtqQk80S2Jz?=
 =?utf-8?B?TGcvUk5uSnhEcUg5MDVpTDhGeFZNWjJHYytnWmVSZWhaNis5ZmpOSDNjelFp?=
 =?utf-8?B?QnNTbE1UMENtMm41MG00U1BoWmZBRlpwTi9keDhpa2EvbmV2K3BKNkV4ckd1?=
 =?utf-8?B?QjVNL0R0cFQvUG4yT1Y2RWlNdVl0b2ZhaWVXUlkzQXMveDFoZk1FVzd0LzVm?=
 =?utf-8?B?Mjh2UmpnUkM3MU5xcEdxaUt2TXNkTkJrZ05DV1VNZ1haQVZzdjhMMWozY1pJ?=
 =?utf-8?B?Q0dHU3c4K2dPUjNHZjFFbmt4RUkwblBKam4yUXZDZVBUUzZhQVVCYjMzbFpB?=
 =?utf-8?B?Z3B3M3AzdGg0MnQvQlVsbHZaMG9QRncxMmdyV0F3eU9tNjFtQlUwUnM0dzhG?=
 =?utf-8?B?Qk5wWnJTVFV5K2R4T0pDcEFmeVdjMXlGS1RhSUFDT2JRY2FLVlFQK0thRmx3?=
 =?utf-8?B?ZTRyQkUrU2xYQUVIK0tQaHBjNjFTemxBdDhzeVdIeW5ONFVGZ01kUXltQmFS?=
 =?utf-8?B?QmxhdG5GNUxlL0lJdTk1NTF2Tjl3MGtUcDY0R2ZaSmlkQ3crb1dTdytubGYx?=
 =?utf-8?B?T1hmSGFPM2graHlvTlVWVnRuVi9UNG1aOHhDS1liWFZkOHNHUTdqZlRXZkkv?=
 =?utf-8?B?Q0dhczhQOFRwT2lDeUpSR1hUN2lCamt0cE40NGJWY0F0bk1qaDlJUGYrRzJW?=
 =?utf-8?B?RG85RkVkTmlFd1ZVYVB3bjRVVkpHRU4ycWNlNkNmdFlFNi9oNmNiT0YzRURC?=
 =?utf-8?B?RlN2WEhnZm00Z0RYYzVNQ1RpaCtaREdRSmh6Q1puWmFiRTBQcDNxZ2RHckNX?=
 =?utf-8?B?S0kxa3ZyQlFSbklFQzBHc3NGaTVEZmQ1ODhDcURpaVlzRVR4cUhaN0Nicktz?=
 =?utf-8?B?Vkk4bDFKd2ZxSGpSZ0pKb2Rmdm5aVERyK0tHUzlPbTF2NGtYV3B0dE0wTWxy?=
 =?utf-8?B?SzJPcGxSdy9sTHNrVnpRM3Q5RzhuK2RLODZ1UXJJaG0xY2ZDMGFoMjZiU2ht?=
 =?utf-8?B?ZitNaTd3QVlUaGg1ZHllVitTNitYMFgvWTRQSHVPbnJ5VEgrcjBzVjVhSlBp?=
 =?utf-8?B?RWhlWSt1NUd6d2tmd2R2NGY3SEE5MTRIcmlQa0Ntb0JkakE1MS9qaEF6WVYz?=
 =?utf-8?B?RDhZOEVpWDA1WHhteXlyMDcySm9INWorbWZIV1B0cGZ0V0R6YU5ZWUNBTmYy?=
 =?utf-8?B?K2tjVldaeEFIbXh3eGJLclFueVprS1J4Y25KdkNreEZhZ0QwdVY0OWZEK2lO?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vlg5axMz+NreQcrLxb1SC40+V/kLJKhYUFC5w7tlMWsTXrpsgQRNz01U4C6/w34kyonwwSLd3oOQ70kbUw3IWUuiYpsQPB9pKLpGmCIHQWxf5amDDiHYWhTPsWTbl+7tpbN+CyIPSOHEYtyWXUYxnf1L+VXGyW4ORZjJojaaSOsHl42eo+8INv+srUPyZ6hUa5JXE7k/zhwiIYLKnec4DJyFradow12taZZWrE3HqaWpPZT2fAumCWDrAkJCWfFEGPUkN8I2BGO81DtDBfUC3Scz/Jzrb3LLWT8gR3KtXP5ynoeyemCO/vhzLHIEIHJziuKJL8nD4etKD1U+nVdo/4NrmardcYKtxUbsJncsg1YPVHv+ZdAAW8d147Xt4EEPk0xGg9kq6pXf49CiqizDZIrkBvA1ZKSVyB5ag0LO2i1YSk3hT0mr56CqoiFSAw1nyKjL392iMTeN7A2fGSn4IZkYwtMEJ3EYP2LgI91tx4fur4+p6s12Z5nqR1lk6XnEcdEQcOzTAuBVZD2sK0AulM6fTwzJAlVC+Z8P0BwuL7lrjS+RzeJI/uB3nrytBqDQYpqJpyekoWVqoYSi4GU4X5fLZNoUnAAk1KWf73INJbY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb382d1a-94e8-48b3-a2a0-08dda5948f7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 07:26:03.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXyCa12PKlF3BfnLxLdV7m+w9ufQnlYWGMhyFxZQL9nFugyTj7hwuPffLgELbhhs/sJGXeGm4jLAA9IAktatZ6GaDrof9YTGlgD588xrdmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5967
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=687
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070053
X-Proofpoint-GUID: 45421XVJrSOKo4eHqwEycE2z_D-lyrWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA1MyBTYWx0ZWRfX1EPmWdloFeJ2 ponYwFWn8fssEHmnZH8bRVU8mpS4ErtERQaf4LhUc+JPcprJ4hcRiWuouF+jqalG8C0DjGRwt+B 2tZXBkyI/dOq1+8WofbaHUPAse/gO3+70aZmSYWWT13kuqJ7ZrY/kBWRPOJTdEqKgOn877kuG6J
 Bdh0xPxbgsVNTEfdbADesFpwNWBt7t4XBIwJYVL8H80mlRVe9WxfO69xEftagmLL96yhv7qBddY 0FdAoaRcF6/jFgQeHsxBom8jmjUMmG/TzajoCljsSWRntYJ+Ic9rHAsubDY5Gp3xw22Rl44wKiQ 3n+bG/Cwurh9+YVP8myR5bzVnqsaTzEkFy5ZQL6H+frqvX5VGT17s9SVzwsc1JgwmLlpJn/eLzl
 OjuhwY0/NS1IJ22G2LORgqHOkD0DYLdS6v2UsTtqKpuLm/b4Y3gbUNcvQ2iMJ2FCq2+IFGpZ
X-Proofpoint-ORIG-GUID: 45421XVJrSOKo4eHqwEycE2z_D-lyrWK
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=6843e990 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=hpu5UzxaIAJ4lTzMD8IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

On Sat, Jun 07, 2025 at 08:22:45AM +0100, Lorenzo Stoakes wrote:
> A quick build/selftest run reveals nothing concerning.
>
> On Sat, Jun 07, 2025 at 12:46:23PM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > frequently than other madvise options, particularly in native and Java
> > heaps for dynamic memory management.
> >
> > Currently, the mmap_lock is always held during these operations, even when
> > unnecessary. This causes lock contention and can lead to severe priority
> > inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> > hold the lock and block higher-priority threads.
> >
> > This patch enables the use of per-VMA locks when the advised range lies
> > entirely within a single VMA, avoiding the need for full VMA traversal. In
> > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> >
> > Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> > benefits from this per-VMA lock optimization. After extended runtime,
> > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > only 1,231 fell back to mmap_lock.
> >
> > To simplify handling, the implementation falls back to the standard
> > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > userfaultfd_remove().
> >
> > Many thanks to Lorenzo's work[1] on:
> > "Refactor the madvise() code to retain state about the locking mode
> > utilised for traversing VMAs.
> >
> > Then use this mechanism to permit VMA locking to be done later in the
> > madvise() logic and also to allow altering of the locking mode to permit
> > falling back to an mmap read lock if required."
> >
> > One important point, as pointed out by Jann[2], is that
> > untagged_addr_remote() requires holding mmap_lock. This is because
> > address tagging on x86 and RISC-V is quite complex.
> >
> > Until untagged_addr_remote() becomes atomic—which seems unlikely in
> > the near future—we cannot support per-VMA locks for remote processes.
> > So for now, only local processes are supported.
>
> Nice commit message!
>
> >
> > Link: https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local/ [1]
> > Link: https://lore.kernel.org/all/CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com/ [2]
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>
> Since I proposed the approach I am somewhat biased (you should get review from
> others too! :) and I would really like Jann to confirm the untagged addr ting is
> fine, but LGTM other than a thought/suggestion below, so:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Whoops, I should add R-b only applies with the fix-patch proposed in [0].

[0]: https://lore.kernel.org/all/CAGsJ_4x1RbQ+GKKc1rrTaNA8Xd+W8K-Zu6-kwVYNKzB0OWiowQ@mail.gmail.com/

Barry - Probably worth respinning a v4 to pick that up to make things
clear, you can propagate my tag with that.

Cheers, Lorenzo

[snip]

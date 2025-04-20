Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD410F1;
	Sun, 20 Apr 2025 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745172568; cv=fail; b=HoXMaPRzTN3JzLXnou10pc1WiCT3d+PhfeGc9vdoRzbKMHnoPYgVJf4l4vyipSOV5LVombQUFNZy41pZLazu0r261u9VHPWyK9FO64sNRTgo0ddwK+MyQKzHBU12JdX4OqEdQgk4v8AaoHEjv+xOdmPWniMFSczTOxlhWxxJxVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745172568; c=relaxed/simple;
	bh=/VDOi2N31rQR0kKeSEMXI+oNxuSswxY65LXVroFJPqc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PCnpYc87YDsmuabp+gcrLZlSRj27ZvW1iedHSytEnK3vUdNcjCp5dF/I8i0n3++QxcPmSje5fvUZ++qBlMqcSvqi946TcODj+QjoIiZqubNfLinuTRphNzPGr0vS94vPHQcg3+SJg9gdJ18G6Txi79fNPWBGzjcTrxsjYM29Ugk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BeIrhwFh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pHkJvCn6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BeIrhwFh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pHkJvCn6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KG0vid008106;
	Sun, 20 Apr 2025 18:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=6Mq4f8Cfgtc5KNjC6zyt5Q1Nqd9BVGUoQQAUaYwQpfY=; b=
	BeIrhwFhx3FpdrCw3F7vGowC194jaTolugYF5T2fzX7YjhVGGsRdJE/QuvQaSwt/
	Nfa2oty6JkJ4zhB787dWpG+o4OfPJusvoIc9Ga6pGfPRkE/yTresO6SxlFpIkjGI
	NNO0dD5y+BfPFPIBmZiGjhZhBPbrEuJ+mDE9r/K0+ncQD0BWRutUtGPEXgOxVmlt
	zWnU0JoqVzq4ffE3eQpcY3jFr7pirOOOiFbzPHL4DIyuWuleVYseoCoRVrKO1ay4
	9aTlt0gVwiI+EoKZW3bgg7yM52rdE/5E5uw5KUSfcwQPGyVYHPcdNksx1GUIUD9q
	VTOaNwJdcDd7KiVs5f7Pmg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642m1scmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53KDEMuo033381;
	Sun, 20 Apr 2025 18:09:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4642979y1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjQUKpDJbFOm/s/Ny+C2Zo/5rJy49KiUKEekjQCvaqwpyu2czEKjhUT4oTaah/eZf7ZXRZEcu8JWq+J0+GmLJJAS3iNMI2EgYxiuJQ39LyY8bNk6miSxjwDGUTJ3QK87NfBG+d5pbSOld4o91Q6jNEadNRT6K7xncEPC43RYwiyXK55+7sf3KE52x92T4wwObXsayHHMRQrAzK82xHefT+t1swtmmsDJBbLbcCB7CcaksrVqXpQO3zUJaAbMsFDLsPqCD6ENxsRNd90PJp5pGWmO4pvMLa+wetbGF2cqS1j5x8dgK1Bky2enq03VwipEEAxSmysZnqTnFD/NLX5a0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Mq4f8Cfgtc5KNjC6zyt5Q1Nqd9BVGUoQQAUaYwQpfY=;
 b=JmURc/oq02lXuesQC+Zz5vMyLoHAjM3BZo/qShqwjr3VYUSyy66ctnijOm1x7fLfyd4KD//kr2zgjaM+E6n/0fIYTnIrHeY4XqMw0k7f1ec8aFUxP16PInZrli70jzGgD8oPAl7bf7IrY+w9xc2lCSi18wHkza+z9VKP5SgMBgWBBH7UY+ViMM2++jg7IWopN153IQDMr5Fi5lzAZpTr9VL2xLrVBMqgViu1kyS1ZAeTdKapuVoZA3c5rqraRbWNXotAV3G/oYrJIJcXfjMurv6GWLsGHWdy/EkgARG5+lxlwCD9mAC6S3Jx1WJn7XOIBNpP+MaE1G3cgADSyuhrbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mq4f8Cfgtc5KNjC6zyt5Q1Nqd9BVGUoQQAUaYwQpfY=;
 b=pHkJvCn6H9okOhT3de1y+Wcnu9PsmZJmZkuPBM7mC3wJMP5aEZmV+HWXbETYA+0h0dFUKMNFMCwuv/atfxx/dL4399lK0xthg/5PRihUJJhFC0yYYN1pLs1m7RA1LiOlsINemSedM/m+6FUhLNywEtYNEaJ4aBu44djjbM76mdA=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BN0PR10MB4823.namprd10.prod.outlook.com (2603:10b6:408:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 18:09:04 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8655.033; Sun, 20 Apr 2025
 18:09:04 +0000
Message-ID: <a7d01c71-c8bb-4dbe-bb08-4d988bd16177@oracle.com>
Date: Sun, 20 Apr 2025 23:38:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
To: Xukai Wang <kingxukai@zohomail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Samuel Holland <samuel.holland@sifive.com>,
        Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BN0PR10MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b10977b-f392-474d-eb9c-08dd80366f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWgxMktVVTV0b2RudzlVM2g5SmczYjJCVGF2VmF1aDVQcGRuZFcwOEZaa0wy?=
 =?utf-8?B?RjNRMEhnSUkxdWRRY3p4S2FaRU1RQ3ZSTnE1aW52cy9BN2JTZUFjNCswZE5I?=
 =?utf-8?B?NHFHQlVFMUlwaERScVZUSmI2d1FWTFhncWFQSVFUaFVJdVVyZGNSNHVvODlt?=
 =?utf-8?B?VkZzbXkvNXdlVVFpelJTM1hLSjcvSytCNVBQZmxqVGoxRXJEOXVVa2IxQlFM?=
 =?utf-8?B?blZGQnV4VkRJVnd1b2ZtNjE1MUVZb3ZiYWNNZEg2cDB3eWdwOHh3NXh4ZkxS?=
 =?utf-8?B?VVpUc0d3cEk0Z0lFL2lUV2VSTWI5WTNZNVRnaUFQeFg5RjluY0dvN0lrT2ha?=
 =?utf-8?B?TmgxblQwdi9HUGR3d3ZnQUZYODlZeUJERzNFKy9BMUhaUTFHeCtnaVlQUFJB?=
 =?utf-8?B?UURoZ2w3SWZiZXVXcDM4U01SdWtjeVVZb1l4cFU0c1lEZ0s3Qno3RnF5ZEE0?=
 =?utf-8?B?S1VWNU53RDB3bkUyN01kUXNCdXZWbFZzQXBhb0hKZ0Jud2RzVHpYejRCL29Q?=
 =?utf-8?B?U0ozcXc2LzdRWEF1SEMreGY3VXNuams2Y2h3S2I1aUR4UFppSFpGM3g1cVdL?=
 =?utf-8?B?UXltVHVWaXBzYjJhRnJzdk5YUWR6ZmdSaGxaOWZ3dWlzRkR5YTdYcEV5U0xm?=
 =?utf-8?B?MnVUWDlrWGg5WXh6K2c2UzYvLzVCUXdpUGVORml5WVAxdm1xU252RHFsNUpE?=
 =?utf-8?B?ZEQ3YkFqQTFuREovbU96d09qRXVDUHJwK1gxK2pLYUFVWUgwZktPaHdYUUtR?=
 =?utf-8?B?MlBlNC9RcGxHcTBXSFRycEFtdTA3ZkNJVm94elBiUUJNSWo1UDhjZVJOWUdp?=
 =?utf-8?B?WUNyOUl6WGNXcmNSYkd0VjZQTytMUk9DaUNlaExUU2NmU3RZZ0FEdmdrSkJM?=
 =?utf-8?B?bHVid3hBTFNBQm9VbWFTSDZodVZVd2U0NmQ0TFlZbFVUN0RuRTBKMnIwN3VV?=
 =?utf-8?B?MzNGSzBrYWRxSnZ0QWg0T0V1Nk8yWnMzcmVqT3Mxay9KQUxrM2l1cndZMDRG?=
 =?utf-8?B?cEpUaTRXZHN2WExQZ3pHbmJGLzFqZEJva0h1R2JkU3Nyd1lXTTNNR1dYZ3VM?=
 =?utf-8?B?OXV2eTAwVDE2dDJBT0phYjhLYmFzZGl6U1RWMVJCU0xJUm0yakV1MkRVSjlC?=
 =?utf-8?B?b2RKeGVqUnFTRHNWVXJUdlJxSWJRc1hua1pKREF1UGxIekhaTU9NZkE2b3ZN?=
 =?utf-8?B?cVZka2ZVYWZwQkVkeFY0emhqYVNlTjVmRjFyRXdOV3FIa0Z6ZlZ4Qi9QRkUx?=
 =?utf-8?B?OWlvNDlQNXg1N05vSzlONzYxdkxwdklkV1VWNnZXTFJDKzEyWEZ1VVhhMG4r?=
 =?utf-8?B?QTNmMytSQ1RCZUZkSEViQTdlSHBxb3FpbU9GaGJUSzA5U21UcS9EZU8xM0Qy?=
 =?utf-8?B?SFplMzlXRUR0WUx0OTEzNXVwanl2VWdYNWVhK0N2SnZtV3RNcUlncVJPYUdX?=
 =?utf-8?B?R3g2cWx3SU0xcFNZOHJPcWRWVjdGV0pId09BVFlyd21JOThTR0NzWGlGU1hs?=
 =?utf-8?B?R3RzK21RUk5kcUlodzRxblNEZDZqSXI2ZExQYjRZL0RBNDdJb3E3OWJjVW9W?=
 =?utf-8?B?amQ4VmZad3BLUmZoU3NlNFJ1bno5ZENuTUR0NHQ4endMMEJtblJJU25QRU96?=
 =?utf-8?B?ZThYV3duL204ZXZkUFQ1dExRUVFGeGZYTWh1V3NZNFI2NDFnaGJRWW9GWk9y?=
 =?utf-8?B?cWZVQWNnNWZRaXB3cGV5ZkdoMXNvZzJHdzVhQVNLelludEtCTnh6dmpaejJG?=
 =?utf-8?B?UDNraEZjT042V2lJeFc3a0dhOUl6aUtlaVNJMlRmSEU3RnFUZDhyMElnV0JN?=
 =?utf-8?B?bFhnWEVxVVJ5enlBR2ZQUG84bFJKa1ovYklFdk0wQTNVR0VhYVppYlYrMUJZ?=
 =?utf-8?B?b2xKRDlWZXpEUlVYbGlHRXg5Rnl5QmxYOXNKL1o5eGYvVTFkWVhaZzlSRE9m?=
 =?utf-8?B?VzczVGlqVDM1TG9IeUdaQllmSXdXaytmQ3VCVmVSVUhCenQrRkVEU2RTb09U?=
 =?utf-8?B?c0ErTjFSbXNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJtYkpRd1FheUl1Nks3YTVoOTI4cmI0SmhPOFJqOTY4S3laUlpldEVWaTM5?=
 =?utf-8?B?SU9Ob2gvYkh2bXUwRjFOc01Da2MxVzZWc1lnWk9KZ1ZIT1ZCRVdDU1hUK2dW?=
 =?utf-8?B?QVBOZFVadTA1dzN5YXloQ1FuYWQ4V2d6WG9ZZEZMR0RRSk1QbXhYOXE4a3pX?=
 =?utf-8?B?RGMzcVJkTDlERFcyZU5yQ01UMnRjZnR2bHA2Uzl6UFpxZlErK1ZWQnRieWVM?=
 =?utf-8?B?ZEpPeTJXQVE5YW1MSThNN3lSbmVHVWtTS2hwOGhyOUljRTg4OHNHU3IzTlMx?=
 =?utf-8?B?bmtOQmxBeEV0Z0dCVzNjNWorTmN5RzBhd2VxbmZ0bUc1eUEwUHhDcFBaeEdY?=
 =?utf-8?B?UTdDbnVGSDQ1SlJkN3pTSEVBY0Nuby9GMnlXbVVwZVkrSkZHTWhTWVNxZlN2?=
 =?utf-8?B?WlZnelV5TzBBc05palNBSjYwRWRuZWFFN25pQU1KWUxETXNEUVVZUHJOYzhS?=
 =?utf-8?B?MUtmdU9yUjZlSUR2eHZjUnlOOHdpVEdWdVBhczNVZDJQWThseXZpZXgvZkh2?=
 =?utf-8?B?czVRb1BMRE5OUzYzVTNQWXJtdXRaekNCT1RYYnFCOXFNK25zUDlIc09Ub1Zi?=
 =?utf-8?B?bExOOG8rOUgvNW5Eelkvd0R2M1Q2aUZwYUpBclpPZWhvZUt2K1RzU1VUdHlZ?=
 =?utf-8?B?UGt6OGF3SGxDWTliMnZiYlByL3FaVktObFJlckxnL3ZJRVQvaFhPNXBEQ0gz?=
 =?utf-8?B?YmU2QzVYN08wM0U0cXNjQmN1cW94bE5sZ1NOZXA5VVdsNGhJVXhMZXN2WHFN?=
 =?utf-8?B?NE1TWHdhY090dXE5R1QyZUJtZGwzV1Rxck54VTZwOHQzVWt0c2FTNGowK3NG?=
 =?utf-8?B?UmZhYSs5algyRWtNRHlMOEtCZmU5YXFUZ0kvQmV4TlhFd0lyQXNqakxucU4x?=
 =?utf-8?B?TmJxbVZUQlV2L2xjMVVxTjZ0dHg5aGxYM0lqcW5LY3J6aHdvUFZ0bkFRYkRT?=
 =?utf-8?B?alJqcUdsNDZ1OElxa09VS0UwQlBmSDVGNnFUR2JoUVhHQ0FEVk9LTHRHaW94?=
 =?utf-8?B?cUxhRkcxaE5ZK2cyUGJ1eldNRWdYMVZWbEI0TXhTODRNUFBYb3l0NnQ3aEZR?=
 =?utf-8?B?dmdyUXpQcVUySDBLdnVCUHNib3BzYmhYUHlDMkVQR1FXRkc2bDcrNUtTMndx?=
 =?utf-8?B?bHZ5bFVLMVJjbHFObEg5SnFKWlE5dGZjWVVRWXFSeWhXYlZxak9ybG1HVURS?=
 =?utf-8?B?eTgzdkFXcDdlVGJPQXNJSW1MNGxtZDY0OFIxKzFVa1lIVm9ySlA3YzR6aTR1?=
 =?utf-8?B?VlloYjFlMGJyUHg4RTFJTWY5aVFzRVJkS2pacVl3akVGcXlzUHNNaGZ0a2w3?=
 =?utf-8?B?a2U2bGdvNWl0YzFxRTR1aitEdktMaFM3MXA2bzJac0Z5cUtpY0JEOW5GZ3B5?=
 =?utf-8?B?VG93WmpwNGhPUG8wUXlHSmg2eGNyUGt6N2N3VXJybVQwbEkrbDF1SmJsdzFy?=
 =?utf-8?B?eFB1YTg4MFlxMENlZjlyZkdYSjlpaURkMzRZYXNDRTlldVI1NmdYcjlpbjUx?=
 =?utf-8?B?RGhycUZnaHIyREtJRWdOa1JCNWVDZ05yTzZBcUVFMWZkcDBlTlloSzZXb2sx?=
 =?utf-8?B?K2k1YXNEd3lJMUVlTlBTa2pxUU1rYWpJeVRTSHpUYjRvVTJSdGRUdjcrZG9r?=
 =?utf-8?B?Wk04RWkyejhydXZHcGhqOVh4cGNYenFXY2FheThyZWF1d1VZY0NRN0tCRHF4?=
 =?utf-8?B?cnlKZ0o0eUpBZ3JFSEUvQktFM0l3Y2VCNFpDTmJ4UnFidS9FOWFuSTZlQmZs?=
 =?utf-8?B?MHN6VTNockRzNnhQSW52cWNNcXV6ZVZ3Vk8rTXJFZFBDYllqVDlwT3Nzd2ta?=
 =?utf-8?B?ZlZCUjRyMGxrY2xUMjd1WnRkUVMrZmNVZndKV0IzOGtQaGhiekkvTHh1cmRZ?=
 =?utf-8?B?WFk5VFFYM0o0ZEd6cks5Zlhsc2NuNnRCSGN2bDFma0RYYnlQam9CZ2dzRjZW?=
 =?utf-8?B?YkVsOEF2MFlleHg2dFNoQlVDYXplVFR0Zit5QjFJcyt2SHM0Q3diWHB1RTNw?=
 =?utf-8?B?N0RldFptR0RVWFRTVkxYa084ZDZST2IzOUM3SXpVaUFVbDYvbm91dDNNd3dz?=
 =?utf-8?B?clQ3V1RyVUt0REE1WlVTU25iNG5OQlp3dnRCejA5MjF4OUtzVHo4NlF1V1Yx?=
 =?utf-8?B?bEdnYUhBVHJ1dUxqWngzaTV5RWFVWitJUFpybUd0ck84b3QrWWFxMmd2TjRF?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7P1kqZ/E1uX8NmaA8Wql4FcXrNik2kYOx6yAAnh22Zz6rqpvjtlI2i9TOoJZoU9LnOpy8Plb7l60jyosAv6vXUfAKHUFHBCKQd6VF6YAI+lvGJ+9kuuir07ZSns8nF4fGts5VQaEVgBQf1NuKGPhulVvT1KVPK0528rSgPWLvpfYQTXM34iHfAPD6kjxYJ6yR8b490lMI+qFHPvxKdR6OTwL7b35eWRvATMeKGPItmv63ndP2XXxok9j9hzqNvpcvvUU1Hz0pjnxTSk+KpjfL6wry+h7T22e8Laor9niTnZU8CDwCzeNVTUAgo5tZNOtpSIoGGZQJDO6Q9PcUHy4M5XtKjTcaG9qTEUxQ3Jc17neTMAZS52QGHtr0GoPAMrz3S8D8XLPfQKG/lLZxqBmfyEjLqLOAB17D3rhpf9tIjw5DR9HFcDMv8kG/EL2/nyhpnsZSWISGRGJAMDst6I6sb0ivkvuS6bLQkUQAPownPSgkQBm4Qpo8DbUNXVPyE5nruebAEK1CZ7vSfaZvTpztySpW62AEda0NXTpxpPN1Iw8w648kVob354cC9bD2ZbRZHbiATFGr8AVV9i6OpjA4eCqipKJUkmzI2a8Dn1bGtw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b10977b-f392-474d-eb9c-08dd80366f64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 18:09:04.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwWPKjVw9Jr2WxZIWYPBRwPYj6fOKpJyRdVe/ifIqkqPRxaDMxxgfmHsaBa6D+eIF0BJ3c0nhBB+qUG3KXl3b3hxrsOkO+kMxMzVKoCorGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504200149
X-Proofpoint-ORIG-GUID: EjYvB5n9FZnF2fAM-W1iLiEjpNBYEZq2
X-Proofpoint-GUID: EjYvB5n9FZnF2fAM-W1iLiEjpNBYEZq2

Hi Xukai,

Thanks for your patch.

On 15-04-2025 19:55, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
> 
> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
[clip]
> +
> +/* PLL control register bits. */
> +#define K230_PLL_BYPASS_ENABLE				BIT(19)
> +#define K230_PLL_GATE_ENABLE				BIT(2)
> +#define K230_PLL_GATE_WRITE_ENABLE			BIT(18)
> +#define K230_PLL_OD_SHIFT				24
> +#define K230_PLL_OD_MASK				0xF
> +#define K230_PLL_R_SHIFT				16
> +#define K230_PLL_R_MASK					0x3F
> +#define K230_PLL_F_SHIFT				0
> +#define K230_PLL_F_MASK					0x1FFFF
> +#define K230_PLL0_OFFSET_BASE				0x00
> +#define K230_PLL1_OFFSET_BASE				0x10
> +#define K230_PLL2_OFFSET_BASE				0x20
> +#define K230_PLL3_OFFSET_BASE				0x30
> +#define K230_PLL_DIV_REG_OFFSET				0x00
> +#define K230_PLL_BYPASS_REG_OFFSET			0x04
> +#define K230_PLL_GATE_REG_OFFSET			0x08
> +#define K230_PLL_LOCK_REG_OFFSET			0x0C
> +

use lowercase hex


> +/* PLL lock register bits.  */

extra ' ' after bits.

> +#define K230_PLL_STATUS_MASK				BIT(0)
> +
> +/* K230 CLK registers offset */
> +#define K230_CLK_AUDIO_CLKDIV_OFFSET			0x34
> +#define K230_CLK_PDM_CLKDIV_OFFSET			0x40
> +#define K230_CLK_CODEC_ADC_MCLKDIV_OFFSET		0x38
> +#define K230_CLK_CODEC_DAC_MCLKDIV_OFFSET		0x3c
> +
[clip]
> +static int k230_clk_find_approximate(struct k230_clk *clk,
> +				     u32 mul_min,
> +				     u32 mul_max,
> +				     u32 div_min,
> +				     u32 div_max,
> +				     enum k230_clk_div_type method,
> +				     unsigned long rate,
> +				     unsigned long parent_rate,
> +				     u32 *div,
> +				     u32 *mul)
> +{
> +	long abs_min;
> +	long abs_current;
> +	long perfect_divide;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +

hope all is non-zero (mul_min, mul_max , rate , parent_rate)
avoid division by zero possibility

> +	const u32 codec_clk[9] = {
> +		2048000,
> +		3072000,
> +		4096000,
> +		6144000,
> +		8192000,
> +		11289600,
> +		12288000,
> +		24576000,
> +		49152000
> +	};
> +
> +	const u32 codec_div[9][2] = {
> +		{3125, 16},
> +		{3125, 24},
> +		{3125, 32},
> +		{3125, 48},
> +		{3125, 64},
> +		{15625, 441},
> +		{3125, 96},
> +		{3125, 192},
> +		{3125, 384}
> +	};
> +
> +	const u32 pdm_clk[20] = {
> +		128000,
> +		192000,
> +		256000,
> +		384000,
> +		512000,
> +		768000,
> +		1024000,
> +		1411200,
> +		1536000,
> +		2048000,
> +		2822400,
> +		3072000,
> +		4096000,
> +		5644800,
> +		6144000,
> +		8192000,
> +		11289600,
> +		12288000,
> +		24576000,
> +		49152000
> +	};
> +
> +	const u32 pdm_div[20][2] = {
> +		{3125, 1},
> +		{6250, 3},
> +		{3125, 2},
> +		{3125, 3},
> +		{3125, 4},
> +		{3125, 6},
> +		{3125, 8},
> +		{125000, 441},
> +		{3125, 12},
> +		{3125, 16},
> +		{62500, 441},
> +		{3125, 24},
> +		{3125, 32},
> +		{31250, 441},
> +		{3125, 48},
> +		{3125, 64},
> +		{15625, 441},
> +		{3125, 96},
> +		{3125, 192},
> +		{3125, 384}
> +	};
> +
> +	switch (method) {
> +	/* only mul can be changeable 1/12,2/12,3/12...*/

need ' ' before */
Maybe something like this could work here
/* Only the multiplier is configurable: 1/12, 2/12, 3/12, ... */
/* Only mul can be changed: 1/12, 2/12, 3/12, ... */

> +	case K230_MUL:
> +		perfect_divide = (long)((parent_rate * 1000) / rate);
> +		abs_min = abs(perfect_divide -
> +			     (long)(((long)div_max * 1000) / (long)mul_min));
> +		*mul = mul_min;
> +
> +		for (u32 i = mul_min + 1; i <= mul_max; i++) {
> +			abs_current = abs(perfect_divide -
> +					(long)((long)((long)div_max * 1000) / (long)i));
> +			if (abs_min > abs_current) {
> +				abs_min = abs_current;
> +				*mul = i;
> +			}
> +		}
> +
> +		*div = div_max;
> +		break;
> +	/* only div can be changeable, 1/1,1/2,1/3...*/

need ' ' before */

> +	case K230_DIV:
> +		perfect_divide = (long)((parent_rate * 1000) / rate);
> +		abs_min = abs(perfect_divide -
> +			     (long)(((long)div_min * 1000) / (long)mul_max));
> +		*div = div_min;
> +
> +		for (u32 i = div_min + 1; i <= div_max; i++) {
> +			abs_current = abs(perfect_divide -
> +					 (long)((long)((long)i * 1000) / (long)mul_max));
> +			if (abs_min > abs_current) {
> +				abs_min = abs_current;
> +				*div = i;
> +			}
> +		}
> +
> +		*mul = mul_max;
> +		break;
> +	/* mul and div can be changeable. */
> +	case K230_MUL_DIV:
> +		if (rate_cfg->rate_reg_off == K230_CLK_CODEC_ADC_MCLKDIV_OFFSET ||
> +		    rate_cfg->rate_reg_off == K230_CLK_CODEC_DAC_MCLKDIV_OFFSET) {
> +			for (u32 j = 0; j < 9; j++) {
> +				if (0 == (rate - codec_clk[j])) {
> +					*div = codec_div[j][0];
> +					*mul = codec_div[j][1];
> +				}
> +			}
> +		} else if (rate_cfg->rate_reg_off == K230_CLK_AUDIO_CLKDIV_OFFSET ||
> +			   rate_cfg->rate_reg_off == K230_CLK_PDM_CLKDIV_OFFSET) {
> +			for (u32 j = 0; j < 20; j++) {
> +				if (0 == (rate - pdm_clk[j])) {
> +					*div = pdm_div[j][0];
> +					*mul = pdm_div[j][1];
> +				}
> +			}
> +		} else {
> +			return -EINVAL;
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static long k230_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +	u32 div = 0, mul = 0;
> +

Do we need to check for rate == 0 or parent_rate == 0 here?"

> +	if (k230_clk_find_approximate(clk,
> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
> +				      rate_cfg->method, rate, *parent_rate, &div, &mul)) {
> +		return 0;
> +	}
> +
> +	return mul_u64_u32_div(*parent_rate, mul, div);
> +}
> +
> +static int k230_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
> +	u32 div = 0, mul = 0, reg = 0, reg_c;
> +
> +	if (rate > parent_rate || rate == 0 || parent_rate == 0) {

what about if (rate > parent_rate || !rate || !parent_rate)

> +		dev_err(&ksc->pdev->dev, "rate or parent_rate error\n");
> +		return -EINVAL;
> +	}
> +
> +	if (cfg->read_only) {
> +		dev_err(&ksc->pdev->dev, "This clk rate is read only\n");
> +		return -EPERM;
> +	}
> +
> +	if (k230_clk_find_approximate(clk,
> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
> +				      rate_cfg->method, rate, parent_rate, &div, &mul)) {
> +		return -EINVAL;
> +	}
> +
> +	guard(spinlock)(&ksc->clk_lock);
> +	if (!rate_cfg_c) {
> +		reg = readl(rate_cfg->rate_reg);
> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
> +
> +		if (rate_cfg->method == K230_DIV) {
> +			reg &= ~((rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift));
> +			reg |= ((div - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +		} else if (rate_cfg->method == K230_MUL) {
> +			reg |= ((mul - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +		} else {
> +			reg |= (mul & rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift);
> +			reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +		}
> +		reg |= BIT(rate_cfg->rate_write_enable_bit);
> +	} else {
> +		reg = readl(rate_cfg->rate_reg);
> +		reg_c = readl(rate_cfg_c->rate_reg_c);
> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
> +		reg_c &= ~((rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c));
> +		reg_c |= BIT(rate_cfg_c->rate_write_enable_bit_c);
> +
> +		reg_c |= (mul & rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c);
> +		reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +
> +		writel(reg_c, rate_cfg_c->rate_reg_c);
> +	}
> +	writel(reg, rate_cfg->rate_reg);
> +
> +	return 0;
> +}
> +
[clip]

> +static int k230_register_clks(struct platform_device *pdev, struct k230_sysclk *ksc)
> +{
> +	struct k230_clk_cfg *cfg;
> +	struct k230_clk_parent *pclk;
> +	struct clk_parent_data parent_data[K230_CLK_MAX_PARENT_NUM];
> +	int ret, i;
> +
> +	/*
> +	 *  Single parent clock:
> +	 *  pll0_div2 sons: cpu0_src
> +	 *  pll0_div4 sons: cpu0_pclk
> +	 *  cpu0_src sons: cpu0_aclk, cpu0_plic, cpu0_noc_ddrcp4, pmu_pclk
> +	 *
> +	 *  Mux clock:
> +	 *  hs_ospi_src parents: pll0_div2, pll2_div4
> +	 */

extra ' ' after *

what is sons?
does not sound good -> child ?

> +	for (i = 0; i < K230_CLK_NUM; i++) {
> +		cfg = k230_clk_cfgs[i];
> +		if (!cfg)
> +			continue;
> +
> +		if (cfg->mux_cfg) {
> +			ret = k230_clk_mux_get_parent_data(cfg, parent_data);
> +			if (ret)
> +				return ret;
> +
[clip]
> +
> +static const struct of_device_id k230_clk_ids[] = {
> +	{ .compatible = "canaan,k230-clk" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, k230_clk_ids);
> +
> +static struct platform_driver k230_clk_driver = {
> +	.driver = {
> +		.name  = "k230_clock_controller",

extra ' ' after .name

> +		.of_match_table = k230_clk_ids,
> +	},
> +	.probe = k230_clk_probe,
> +};
> +builtin_platform_driver(k230_clk_driver);


Thanks,
Alok


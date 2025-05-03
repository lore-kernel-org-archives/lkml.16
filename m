Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857764C62
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746282578; cv=fail; b=ka30V7Mt4/nxjgFWjwNtaDseK9p3cOZ+cJxRqhb96mIj7Lzi60Smetfzc6DWD2fFnRGMdZmpmoRduRAxtmAdqMZHOSgMbzGyFmHiN6SZRNW8xG+vQ8oT/Ab4A1CamYglO8LsQnQSUGlaJHmFE84fHU0q7TX7HrbVyF+tIUOZP/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746282578; c=relaxed/simple;
	bh=J+aE5o/gqj29aaA5/i3JbjmXmFV5bEF3pK5ymeVDAes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jCAbbwtjN5sitjE37OoAlRDmTxAFdHpnUOgHAR/5/ag0Wf/nuoznwy2JAJOyXVCeZA3RohlGgkxybNaSOyB6pQrHDx1B5371OTLZ3j5z9XJY/7rOXMC2DH3B2mfQajvEnaoqIUnenMSyWrxxIF2rfmmKMxEqCj+1stBirmhhIDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JRSqcgRj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wa5Mcgfl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JRSqcgRj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wa5Mcgfl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543ClSiU016354;
	Sat, 3 May 2025 14:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=J+aE5o/gqj29aaA5/i
	3JbjmXmFV5bEF3pK5ymeVDAes=; b=JRSqcgRjK3TbIsW0h4UloNDxdeumKexaqb
	momET62TlOL4pNrMvq6myskUnZM7vfJrgtIkKiB5XTAr+ZwgG4ZYIQg8fkOgq1XA
	wySq7IzLiJzfdqswDdRwwu7FStjzWcY5eCMAW1u7nlPFxYJXnghLCpGyH6hiA1Xy
	266xcewDifipNlhhqxDrgJOiLW9zrLUCUUxWdu0VQgt9UihKqBRfWxdVxWip2VB1
	I7MrbChVlZ9/CBXm9j/fmOl8xUTmMHUgUcTY1ngPxLJPsj6t/fPKo0Aoe6i7XeXQ
	e6TR7It7Hq20vZWaKs3kz/5JuJ6NvOLnuz1j0apxjB0FGj3w4x6g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dkevr1n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 14:29:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543AkHNC025122;
	Sat, 3 May 2025 14:29:13 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012014.outbound.protection.outlook.com [40.93.14.14])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcja55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 14:29:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iotfmZ3wsqsSHUKRzqlY1u7qRq8aoWjcnd8q2XgkSzcQfdhH3v9E322YeEQ7/Ngaf0EzMN4G+IzUYg7383cQ+jODEXHW6ZIwi9stcC6IrgWNMEqXRDA3XpQnqpyGdEMehb2oMABuXm5z2c1xluM71MDYszQB/ZeJZ2xm1VguDSz+OR+XNy9zHoYkTURNNbXrr9oXW5boNX0fGyL5JKKbuTekEf26AZjsRVRjQqa98/M4jCUP+vZ9H2u0q2ZUYeYssJJc8jcfR+uOxYAPkqHpYcppgg0NebzgdDFYh/5+O6mfIYnnp2yhc/N5CSfBbdPJwB0YrRyLdwSzqm+zJsqESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+aE5o/gqj29aaA5/i3JbjmXmFV5bEF3pK5ymeVDAes=;
 b=lC0MGWItY86eYMqvh2OuZD/fItfoe3P5aNFTUMNi/+40K7vMigu6/YtjVTY6Hbz96Gas358cpZVQlk3BNoKtbj1rCUgFvkN8cz5Wuc+yQ0W+A/YNvEkXbtKjP8eNjAHvuRMPmRfD+Aid+ZsDy/e9WKis6/BpwnYSVuV8nP/pFT9+p5DP4aLOd4SJ0rKfmML/2ew2pdbTKd3gFE+BTOb4J01qOscyoYwnfosZhw2rxOqeAOa7hwSQGmYKhzGimLgIVJv8Ml1wZ8KJoxe1E8f8tb47I9d1UgkZHvQ1KcoPt7//DK986bcS+tC2LeWxq8ysDGoYTCggtxhYFcTMa+LqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+aE5o/gqj29aaA5/i3JbjmXmFV5bEF3pK5ymeVDAes=;
 b=Wa5McgflfpNtAAiLM/uBYw4ImbvUfrGMLrD+K6tn1T9lpczj5ajljvyKjJU7y9pZ8WK+Jya8HyAjeKLVNm3X8GPykL4Kp/ZCF+DxKHUiHEfV6yOioEWcSyI32Lhj2qihKjKo7cWikT2fpXFl+ljpKVNF8eP4ZM/YhzqnExo0AwQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPF0FF25AAD9.namprd10.prod.outlook.com (2603:10b6:f:fc00::d09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Sat, 3 May
 2025 14:29:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 14:29:11 +0000
Date: Sat, 3 May 2025 15:29:08 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <dd10778d-3721-44da-8c7d-10d94378777f@lucifer.local>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
 <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
 <20250501011845.ktbfgymor4oz5sok@master>
 <d6d5a67e-efcf-4e23-90c4-4f6e370bde32@lucifer.local>
 <20250501143501.vljk4hriuc3c2yrv@master>
 <fb53f16c-9386-4b83-9696-1ab51f03fe54@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb53f16c-9386-4b83-9696-1ab51f03fe54@lucifer.local>
X-ClientProxiedBy: LO4P265CA0310.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPF0FF25AAD9:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9265ff-feee-42ce-9e31-08dd8a4edf3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/sKua2ns3sV3CyhtShAnSM+FWgmxGevm72BcTyjz6JhJHKVDG2vZAGqlX0wR?=
 =?us-ascii?Q?S+2aT05lgv+p1D29qr+y+SD7QbCNDtgrfSr8dtqPdFucs8FlxmApKRm07fPq?=
 =?us-ascii?Q?cqocBiQIobIzXeT0EJ2EC94a4gnJZNHXR0u9f7EaV0ok4hfp0NeP38HyNb0c?=
 =?us-ascii?Q?90cf4aapdFHDX7Z4/wRbLD7okRRf5mjNFmciWp/4nHFwj4TJCV/Fu+QcA2VY?=
 =?us-ascii?Q?Q3u67Wd8z1qzGLpN/W2Nfl1HZHaj1XcDahRPA0IHqy/LuYBv48unAEmjekuk?=
 =?us-ascii?Q?fHd94Crd8kIe3JBKUlrF9LzLqiotKluJj7my3eh61g0Ft/tYSH3r6H5uah9G?=
 =?us-ascii?Q?Dx1xjmBaq0vvKzjAkv1jiWr6eCIejZEnObvesHnSN+oWKR3EvTu5SICJYx2U?=
 =?us-ascii?Q?p3xxXOdXEPaMhmeH6vaNhnqXAt5BXkU4T7ovfwSE4BMqwmO+u/q8501MU6er?=
 =?us-ascii?Q?CGAhHRAmSQ+JoLCFVqoHpTSwTiB1XcjzPZWYPt8ohuvjC7fXdZgcPyr/C9E1?=
 =?us-ascii?Q?oSGzOPUhB/89h3KitltUvIP91d8oTl7L9KYoGWLmAOAGXRDZiZn33bf/vtxQ?=
 =?us-ascii?Q?gwZQ0LY+8WLThTEkFY4MB2T4rikBWpbUmXoNtWDVk+ShPxJNFtQGOnrxO9VA?=
 =?us-ascii?Q?RnA98mqVRKwTiOdgfOiIN1IvmC2NfuHT6NDOaou1RqHT9S3VEeWf+Wp8/RL9?=
 =?us-ascii?Q?PMaeXhfLosY4tmhzdwZbBNro34hNfU4hvh42IJEHIpmOTLCE1I/EbeGVlIlj?=
 =?us-ascii?Q?3NZCbwSf1BMDl3GX97UINHD+MQTWAYSN1UNcovSviDsiPOuS4E+OWvJMLjlV?=
 =?us-ascii?Q?4Rj41Shnf6T+GHJigXHMZ/eunbigs83umD7WWcVbjLjzSrjEWZlmYTRklsT4?=
 =?us-ascii?Q?mIQH827yJFTseOiPvI/BOK+tOXNVV4nLWz7OkL9ZMPHgiN3wpm/b+ig8XmCa?=
 =?us-ascii?Q?/aEWl9QVthRS73wozT/tEJs8Z534tj1o9J0KLWI82a8Om8hH422qocQ/mEsI?=
 =?us-ascii?Q?oiEJnlwa+JNLiQvlxghSVKy+HBENYyB/EjG+TcCzSbpHCRuRwWuI12uIyxjz?=
 =?us-ascii?Q?nl+JIeLM1ajb/i/jAimL0zZ7MwJaL6gXqZr6AxQ1ESzI4iaisIWofls45NYo?=
 =?us-ascii?Q?YDjLVtRjOBrCg3FajzrzViOf0Ysy9wwKswuJVZTY5otH3i4HERHvTA0XDDSo?=
 =?us-ascii?Q?R/RpNuPnHm1QLzcddhHiW1mlX/G0AJBelEgY0e2WCU/DEY18JfkRTHM6lB8/?=
 =?us-ascii?Q?0iIkXOetIz2JKXOs9B6ZayORL6+H8BgmzqCatEfIQzAEnxfdbAOR977UmRe5?=
 =?us-ascii?Q?DXT7Ky1QTSMDNxm+ZT/4KJTmELcMTmQAN/EtFL/Iu3OKU5KXoE47TSuceXUo?=
 =?us-ascii?Q?qZZCUDikhxDOIwz6WwNDsOl381ZqhEVoOBYnNlsCdglFblflow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/awh7eegJf2UBQKcNSu3mQteDpT+olmKrC091XUPdztODdIGLwBUQ9QIx8v4?=
 =?us-ascii?Q?x8VEiSW1W3gMzDfsWxGmIjUr5AYi2ukbOtebSGO5meA9JzmtzlnEjYnJmTVJ?=
 =?us-ascii?Q?hCPoNwhAXafwiRMlsyWHjt95gK/IiNdpsrd3eX4ft0Nqyig4zWkmjVqfxc52?=
 =?us-ascii?Q?bMmlUqHmUHnbxnBmX8WwmnpMAJEvXIu2zyceXo00PVud6yaVF9hzsCntZ4bp?=
 =?us-ascii?Q?iFeCbKBypAuqj+8dC3dOFQwL5msMrKXG0qGsVyyiWEnnN8H/rL8GQ+Kf2XIW?=
 =?us-ascii?Q?cSDbs/6S00hyMQikhxemqL79Iht00ok7iTCweV2TFK4g7rWhI6xexRc9mN6l?=
 =?us-ascii?Q?YysA1yChlqTeqwqnkeSisr3L4U8luibz45D53WngYjl226RJP/5AgV3ZjkWV?=
 =?us-ascii?Q?XXtZS4XMeCEXtQvogTxOK696oyK6R5TT+3JSrSgo1XM1a+Jf0aYkR3DfCwDj?=
 =?us-ascii?Q?/q5mS6LnhQQKHRY6UAQT8LmZXk5i17WocK0YLM1M4nUvyF4q6z8WEnKoxsg+?=
 =?us-ascii?Q?ZXq10ORHDZ+7PV/l3XUqKJOoE3cZl0P26OBpd9hSdOpCn+OF1ctXZ3sIWp8j?=
 =?us-ascii?Q?JX1WuLsE5CFUHUvN8UpokgV3guBSH7LCTlvv5HtBlLA589jhoQzh3I53mekC?=
 =?us-ascii?Q?LsSqTOSJR+7REPSsTzDcbqp3HqGEnveK8eywyPuvBPj/RAsA4vSPlDV/LR6w?=
 =?us-ascii?Q?vbPAjoyiPqyraQ8KaTMtGClL5IOmfDDM+IR5pKJ2Q/QTu4u33VUmXMMTcD9R?=
 =?us-ascii?Q?alrzYCxx0Ll3AbTXrD3tSNg44p2DCddeROcGTivhViDoFHIahyg9dMqGiWof?=
 =?us-ascii?Q?KfJ60JuZpVR7DXl/rd5V8xitzkGgECaJP8VcMbwo6ucsyQvcdXNrypopXtz0?=
 =?us-ascii?Q?5yIvR0iNX0iNM7CgozKDZB3NgabKInN+qvq5iU47VMUGVk++WrikxKMMJENL?=
 =?us-ascii?Q?kCgBNJE/QN9P5keQDiPQjr3Ykn1nqDSpDHZoTma7fC9i23Nnq8HTnA24n9Nr?=
 =?us-ascii?Q?DLuUzVzuBGB/6JMjBoT6pS+NOI3qqL6X0Tqoox9AqhSQ1nk0yHwvGp4YTWlZ?=
 =?us-ascii?Q?Yww72kVFTKotAAXdDtHmV53/JuI2T1E1ZlkIzHK/rhIBzHd87gC5WPCTQeRN?=
 =?us-ascii?Q?iZ2QBUTERQFMj/mkNLD2gkq+qk1Pg1pSsIjvtMHZx11uXQ/qXWKNgkHUVDSZ?=
 =?us-ascii?Q?rcjyxPAoUDcwK0WbUbC37a992hamNvVTaB2vmJwGxUtEV1GFstiSjYrp+Kg2?=
 =?us-ascii?Q?P+NUOUDWIKuEpWHgAcxqGQM1Lv3fdAlFyx0qwOKqiaxZMXP/cfRfEL7+zR3l?=
 =?us-ascii?Q?bLoIX5MCMoQNNpUyhmPeFIY2LBCG+Ac82hv9hibjk3S3bgvAyZOCqwVOOxOD?=
 =?us-ascii?Q?2UOSVUaptC4YuFlQBVpntsApqXTGOxlgjGOZ5AzJ3m5TydJTrzA+7Tpn/Ywq?=
 =?us-ascii?Q?EYe08AOh4NDBmDP0suSufd4EhOIx/AYJSARgU4/Ibfv7ZTLtnmzrAQA25k1c?=
 =?us-ascii?Q?Nyxh5gBUz9Yg8xak6d6mTWX2n/rH4ACYxcdxOdLFu4MLPPSZhGxJ9mWJyd3E?=
 =?us-ascii?Q?PdCIpKtuvF5mWueYKuEauV8gC2ea5fZd/X4OZSB681+PJTlP/n21WAetD0Vc?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9AIK1gD7SGbXUa+8EzCyhTTHeG/prapUS+6sZZQw0s1YCqpmbNkCKL2tkdolfqQd0HqYcUt4ZYqJIckSMbj88aruynzKVb1JyIL4lPtp9Itv1BSEm0Y3psu+XSnApxeUzh5teRjRZ7LahLLqnhPv12iWaVEiOFi2RQgmWSadgypNdYtU/1pOmCKHrG8j3zP4FZbOu8Jq+Xh9LDjxILuIVMmuMbEIBNvl3Ieh+9bemFlz/Ld7pTDYnDklh+x5a9YuzTAv1sP/mZAunUEDWHn5VqnRIP3bcdXRScmMf77O+4J1mpWXBE43kHSqMPxmwQBmJPcYwaVHcQvwXvwoe88wZPXu2ncIjVODhOb/GA85GXM7mv3bmhfXxTzngXIsRkjvu1cEcb3LEVF2w3QDORTzLpsELYSDdpvnU12RHoyZh603i/MeDVsuTBOF5GJ9Pfxh+V9lJPKJrXvHcHUVgLmZf2347AmNP3hz1rD9xZZOpkYQkVdq7Sumo7mNypBUpdLq2XcjKBCxF9Bsm/S9SIS3m+xfeu6wzsQjb2lg08VDbaicsVGRqgSDO9tREWgKif7wOO7gyrJK31YVrCxND+dF7HWvhGmLegfw3GC6vCLbUQQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9265ff-feee-42ce-9e31-08dd8a4edf3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 14:29:11.5492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8thOmosbD7nqg+4DFE64D0/s0MHPO4lAprQKQ1OPowhDV63VZg7I3Ag6RGgcU63Oy1wMe13S5N1WuX6I+sv+Y8DNW1e8q4ZNl2YRD5FAdxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0FF25AAD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=778 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030132
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDEzMSBTYWx0ZWRfXx9inzoVqs0ll ND2gej/8njAmUIBKW7F4ydW37soqkRc87RJnMBfFXTpoEmcB+8syLvKsXAnCx6gp8RZUZiOVoCZ A+1suSmB2x+8LhffuGsbXyIRWd3m/UuEr7l5/4ntz+lI/hBFW29Sck5p7t41CaxoSvhWwAxmuvR
 QW8JDKkPIeqLJ/GTDjztN94I4n+uOFufaHJGKeXjH6aA6+JXADw605IVqJHCKwDosBEktsZRlnU 4R1N5RIWOxUnaqMb81D44e5BnzuJFloD/4RJChwzsalXjOEMJ0n/w+WImShs6vmjwPFQCx+bz/C FX5dVY8XzBdCajxoGB7oBBEqmRtQVqIRyeY4HNMYKSDYXUKXc8jdRKnL7U8bLTAIEkcdMJXUZ2m
 D56Pyz7bD3k57j581JrkKVSfaioTs9BNy/sO+VxVIwoTLSFJ3mTZaATrEm2F6fqkBMlexkEm
X-Proofpoint-GUID: yBzIZCNUsTh8ehrltdsVvxYZXY2G_zEd
X-Proofpoint-ORIG-GUID: yBzIZCNUsTh8ehrltdsVvxYZXY2G_zEd
X-Authority-Analysis: v=2.4 cv=AaOxH2XG c=1 sm=1 tr=0 ts=6816283a b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=JqlImb5Us4JRaaO_aEoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13129

OK have dug into this some more with a drgn script to read actual kernel
metadata state and it's simpler than I thought - the root anon_vma is
self-childed, but descendent anon_vma's are not.

We can correct this with a anon_vma->root == anon_vma check. I believe
we're probably safe with anon_vma reuse, because in that instance the
anon_vma would not be mapped a shared folio.

However, to be safe, I will check this, and I as I said previously, I will
add a number of tests explicitly tested forking scenarios.

The respin should have this fully addressed.

Thanks, Lorenzo

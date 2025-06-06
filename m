Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBC3234
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205043; cv=fail; b=cYJWMPdCnUcvp2rqragdQDb4Yzcav5dpgkOAnQ7egPe9IBK64UN/S1XLMdF/UpO/FuQrebqZzrdnMw8ukBm0yIgllQG6DT9iUH8H4XeymOEgBTlB9sIcQtBBEMN5/u5PnI/XtXAXkKofiD3eobK68KqlLduNmx6vNdJc6oMji1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205043; c=relaxed/simple;
	bh=O2yGksW06fxF5Nq/PjJfW8h+csvvZYC0OLMbX5YlGyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XY6Hu0nItPvdXafbvgfaasnPdmcadqtpBnZTBJhOZx+jKIoSn5QIuGLSvChKyNb+NsM+cgXFkqFGraL8pwxZFEReoyMpliqHem/WPqQRuOAndHYCjvqMMVRyUkrWBbcpn2JvWGK6isUGcOgpEfZ6aFMFymXhwjLgPVHn8CswScQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O+TPOkmN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pk90iFkN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O+TPOkmN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pk90iFkN"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NGMl011378;
	Fri, 6 Jun 2025 10:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KKiUmUnwvxm1j35JRyPBnHQhP9bxW3PafOTZ5RdnsAU=; b=
	O+TPOkmN9TdNhWAiJK0bYYAf2oxk1iiCm+axuLaYOPjncTFIVYb5EOTQNmT60p3p
	4ZjvgBpDRiW9HwkhWrD8205b8OzfftwAbn+Cv8TuhKnfM7piYIC957rSZMBzP7WD
	zdqBIE2sLsfw3YVxrr7UmR2Q7/OU8kN1k3Foocc31AGu5HvlNF6h796UGeSBpkHC
	3dxo2znvgpdqA0tTph8/36WULkyhiydSrVfyOTWOlJLS+xWo7JeBtjMk7A4dyjTR
	J1W8TTbEGK/wFyC45NJvCIAjOBwgYmuioWPgDPxUD5X8TGGmEKvHXdXvtvoWpIH2
	5UTc/lwk52agC2NctSXRrA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwhfkhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:17:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5568JnXT038507;
	Fri, 6 Jun 2025 10:17:04 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013064.outbound.protection.outlook.com [52.101.44.64])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d5q8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUVUNQxzne7oTOt6CwO3Uap8oQd6MBsegDSlwsdYaGjUSb/vR9wUuw3h10e/kdES6FrZ/ho0rRYr++jJ3dyAMrVUHKAXtRpwpkhihti33aki83DL+SXbJqs9TJ39ROWmqwNxenecchJAKVAQkz0TNPLBfUOp2EdLN+ItC4tsLe9alYhCK8A8l6bva/byPo78Cu+xJdk4Ey06ywu3ivTjv9kbiSbfk+9k5FvsqQZvMluQ9Yv0mKtehAsLq7TztwnXAK3TPoqMeYVQ3Vxi0NR+f9O5Hju/LJKpYhsFnfDcbhs2ufZusY/aMZzD8xho0Zarq8GnQ2wHkq+WkYTKcvV38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKiUmUnwvxm1j35JRyPBnHQhP9bxW3PafOTZ5RdnsAU=;
 b=S8dX7Kz2hU1sFgaKWIT06lUgTzTQLMqn1crDzb9ap3/N0weiA6cHKf4Db8Z6+2V9b/rBdrlA72BjkFLL0EOGXvQldRNpY+G1t2ovHlOL4CCuOuQpkzyXcj72qeZfGBYJLf0E8XgEvzZRLf1BLYPCjYD0gmsQ06peHJHDxUvAmraMtVTiKOp04VvUe/o6qGrdNQLvGXqgRJo7pAbCS3CB6uV70sjtaOmgdzUnUAZKzp5mAUJpuw30676HSS1Ep4rPi1lfmoR3NG2aPZi5XY18HJwBlYWj4swA8RD1DwAa80ogQavwkXeJRKzsAUgIh3h2vD+v1q7g56wsXezmqwHB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKiUmUnwvxm1j35JRyPBnHQhP9bxW3PafOTZ5RdnsAU=;
 b=Pk90iFkN7dCjKeiv6mNeGeYJ8ITx+oSGqf9JPry6euF/NhnODRc9KmUpz2dO1Hcg/qPRiE3pVgaF/abemhhs2+3sibfBi0Er/PnjYAHBtzaiMOcwNtmVzXpmZ0ErmM63N+0vhQd1j8JBN0U5VwWRx5uPd47BUpjCazulOnE5Qrs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6494.namprd10.prod.outlook.com (2603:10b6:806:2b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 6 Jun
 2025 10:17:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 10:17:01 +0000
Date: Fri, 6 Jun 2025 11:16:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <66be7662-0c55-4ff9-af32-7c75e4f76bd5@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
 <CAJuCfpEaG8WuGboxgc6xB6s5==Lx8QT=UwzgNXJNxDH0-KMqzg@mail.gmail.com>
 <CAGsJ_4xAhtSxpLTf_foXbtnVWwTcjNuQfCnTYuVwpExbLKjakw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xAhtSxpLTf_foXbtnVWwTcjNuQfCnTYuVwpExbLKjakw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0527.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 2501ee7f-d634-4db5-949d-08dda4e346d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUZoa2dqdXFCeHlNRksrdzhUOGFFdXkwbXVveVJvZWQxejJRNXBubnBuVkV3?=
 =?utf-8?B?dlN0NHMvZFVubGg5ZytFTmtGLzFkSGNaaXVSK2FTSnlZWm9adlFhRnVjMkhL?=
 =?utf-8?B?Z2Q4TjZIVEZjMVFYRG1hVDJSRUVhTUFPbnZSY1ZIelNFbU1NOFlaZ2FGUE40?=
 =?utf-8?B?UE5XOGRxUFYrcGF5b2hQY2Z2cXJtNVlZYmZudDltdEY1SGkyZ3AvQmRUUTgw?=
 =?utf-8?B?NWZ4V3lNSDREWFQ4b251cElISThNdWtsbENZUUFXVXhpSzNpMXpoSjJHYTBt?=
 =?utf-8?B?bkwwNkMzOG1sR2tKR3RtMDNXVGd3Y3hkK1prVk95UHVzNEtoeVd2UnRZbFhn?=
 =?utf-8?B?MjdXSEpBMFlkNGgyUFlSNkYvY0dwaFpLZHBjemo5ak4xV2FDZlNVZjlwNk5z?=
 =?utf-8?B?SHBnOHVQMnlwVStrWE4vSlJET0lBUjVXT256TUZ4NkV4a09zL3hzNjJzV1gr?=
 =?utf-8?B?eTFVRHZWYS9FSnhJbEJVUjFQV1hGaE1vS2diU0x5UnovUWdPak1CY3V4T2Z4?=
 =?utf-8?B?dzExWlNqUjRUSlhxZCtJYXVpbDEyZjBqTHo1ZGFyQzFsTTVkNTNnYnA3S0o0?=
 =?utf-8?B?b2hwNTZYRko4bEZ5N09BRDhGdDRYeVFSZUQwazZ0MmNob1FXbXBTY0RiQjgy?=
 =?utf-8?B?L25TVnljUmZ0bVpDNFZtSzdXTFRYVzFYWWVJZHJIWmdwN3hXZktVMWJnVlh0?=
 =?utf-8?B?VXROOWVKUDU2OFZpMk0wVFVyV0VvdFg0cXR2QlVYbmJubk9zVVl3T1V3VHJw?=
 =?utf-8?B?dFRkYzdiWm55YmV2VExOL3N3Wjd2bWdoVWlWMGJsbnZ5Q1JhUCtySVltMjFM?=
 =?utf-8?B?clEvMlppM0V5czFXcFUzV0ZxS1p2eGFlR25oKzlVajkvdmJtQnFEUTR5NGhk?=
 =?utf-8?B?N2ViNExNR0VSMWJPYVBNeGFzZTNGWDltV0xnQlBkRW1qMTVFbDN2VmdjMTNV?=
 =?utf-8?B?dmZ1allzQlUxaGFkaGlTWWR6bUw3d3Evd1RnWEFaK1VoSWRZK1huS1VGcGVl?=
 =?utf-8?B?T1JZbkxsdDRwWWZmdHFwZXVXN0NQZ2t2V2NUZlE5TDN0ckxUcUprR1JmYllN?=
 =?utf-8?B?QUh5YmpQbU1tSFpPL3AyVStsR01RN3A4UTBwcDJrK1JNSnQycVp3VE9hdVNs?=
 =?utf-8?B?R0RuSTdtYVR4ZWtXOExsWWw4VVl1Ty9jMXJ0aWZEZk1jZzVCNS9uOGQ4N2RD?=
 =?utf-8?B?UEJqaFNHQ2pjN3QyeTVhWVlmZXhHeGdCUTBmS0J5WTBrTUp2NnFBYm5GYnJu?=
 =?utf-8?B?L09kRXZRWHVYcmZyRW1YL2RqaDZmRC9NNFZ0NU5sUkRQb3liL2ZacXFiUzFE?=
 =?utf-8?B?RjlmNC9RdzZKamRpOWNnNlUwNGxuZ3NwZ2JHaEt5bE91aTExMldMS2lzaXVw?=
 =?utf-8?B?YWdNVmQzZDNaQnJGdmw0ak1FbjdYS0JSRWxPdThWMXRWWmtjd2pScWVpY1Er?=
 =?utf-8?B?TWU5SzlHQ1VuTE95aXFnN1JUc1lIdTZFVUUzUnVkMHpueStxUFdwOVdmNHZ3?=
 =?utf-8?B?YnlNYXZESWVySi9sS3FsNVBYdE1JV2psZjBGb0Z5UlpicnRLRjcvQlFBcnJV?=
 =?utf-8?B?QmhQL25ZL08xUnRoUzdjN01oMDFtaWcvamsvemkwblp5NDdkVzF4NGFma1Q1?=
 =?utf-8?B?VEFjMDFjcmVPOG5nYitQaDlDT0U0bWMyTy96MVF5ZFAvQnpJZ21zZ3FiTjBK?=
 =?utf-8?B?RkZWNmxaNHBTVkMrZ1Y4eDA4NkJRN2U4dElsY1BQMHRVNmE4MG5BczlHWUJa?=
 =?utf-8?B?cXAvZlhPUkZiK21iYmlJWmZiaXVMaXh3c2U2S25qano2d3ZtT2U1TzEzZEVn?=
 =?utf-8?B?N3B0bjFLWG9GTjlMYk5LWTdtSVZGbHlyLzc4Q1R2M3B5NFdTM2V4b0hocktN?=
 =?utf-8?B?emY5TE54enVGZ3MwalkrWWpoeEhRYjBNL3FIakduYXZYYzgwOXUrMUZucEZw?=
 =?utf-8?Q?y+Csk6Xqx8A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmFtc0t6MURlY3VwV25kY1VmbmRuN1dLWUJiVC9RcWZSRkFQVUN6aWJuTVlN?=
 =?utf-8?B?USs1OTNQblB6cnBldUJHcVlTWTJLZVhmSExyRC9aQWluckFlLzg4Mnpoa2VE?=
 =?utf-8?B?azEwWGJjbVJFMHpBb3lJZ3BReGptOW9LYmlrSW02VFB4bWoxVkJQcndHSWRK?=
 =?utf-8?B?SEhxdWpSakkxOWQwTmRLdmxyMUZCeVNoRWtRWUZVY2dTRzBRcm9sSHpWSXA3?=
 =?utf-8?B?ek4xL2hZSVo5b0VqT0hKdnJTK3BFYVczcUZNM0RncDFleHZ3YTZ3U0l2dHJJ?=
 =?utf-8?B?L2VRSkgyYldHdW5HMm5Wa2FBMldUMWpxU3RSUy9yUjlMMVpxZ2pEcGJ6WlV1?=
 =?utf-8?B?akVQS3hEbDYzOWhqRUxoUWFGa0JUWUxuYVAwbXhHWUtRTXYrUXlMT0U4TkVh?=
 =?utf-8?B?Qlh2bUxVeG1tL3dSWEpnaWZNak9kZDQrc2NkbTNIRHkwTkNpY0FrVW1SdmN1?=
 =?utf-8?B?bFlpTWtMZ05LTTVtS0ltZjUrbExhUUEvY01Xc1VCZStOemtXYWtMa2NrMnRE?=
 =?utf-8?B?bGNZczZodzFFTEVDL2p4R2ZLaFNrYWlVdVFYdE5qYmREblpqUTlpcFVWaGtu?=
 =?utf-8?B?VFdKektWeGRHcnVJanBWcXl5WEdWTTdvOWkxSjM3R21PMUNKUFpjOVE0U1hP?=
 =?utf-8?B?bjB5TDlwdFpTTzJPOWVIcFVxSEtWTzNZZ21GTDdQb290OTh6Y3VmZklZWVln?=
 =?utf-8?B?c3dVMGdKdkRscjBhS0l5eEtabjBkemVEczR0dGpHYVRuMXB0T1lFRUhlVHNU?=
 =?utf-8?B?MFd0ek4rSmEyZkFXMFA0aEUzQzVnQ09DVElubmpWUExMMnhIVDBuWWhWZEhY?=
 =?utf-8?B?Vi8zd0RuTnpRY0JpbTlhK01FUTF5OVFiNFk0ZUY1UCtPWGdxYzAyT0FJdFky?=
 =?utf-8?B?L2h4MklPZWQ1a0tSMGY4TFRnQ0NvbC9aS1FjN3hSNjJ3R0hiaTlHQ0JaNWp2?=
 =?utf-8?B?bnFROVh0THcrcG9xbjJwMEFQV1U2YVRxajNwR0tYZHRvK3ZIbGRsUzdwRnI3?=
 =?utf-8?B?V29YUkJYWWlmTmN3ZjNMN1JzRWJ6ZCtSUkhjanBqTE1qY0NZZStweTNkY0Y0?=
 =?utf-8?B?d1hUeENBdkV4a3c3Qy8rR0hETkMyTCtLVVl5RWs2NCsxeDI0RG9DN3l6YVpr?=
 =?utf-8?B?ekZRdlNHYVBoSm1MMk8rR00vTWxLSGJQRXhPZG9MN3piRkdqMFUrK1QxR1U2?=
 =?utf-8?B?cjBVK2p2RHA2NWRoV0o5LzdkRkhEc0NtZzJZaTY3a21pa1V3Q3JBRFNieVdD?=
 =?utf-8?B?aGFaSVliQmE4ajN3aGlrQmIxcU5xb2lxTTU2T053UDhBdG12cVErMUM3TnEx?=
 =?utf-8?B?OXBuN0lqeDlIU25XbDMzMG4yTTVZdDZJS1FhR0ZRM09sV3VOTUZUdlRwQ3A5?=
 =?utf-8?B?TGdKaUZRSmRqU01xYVByckpqSzMydEtyMUs4a2VybHFPQjRSenBHRVg0MGZr?=
 =?utf-8?B?b2dib3FQVzA3WE9hdWVyOHh6dHJBUUwzRDY0SVdHUFlNUE5kK0pDM205MVUv?=
 =?utf-8?B?RG9HejE5OVFVOUo1VHRrNVdBMFQ2MGltRHk1eUpvZ0YzTG9LRjVadWlOOG1z?=
 =?utf-8?B?WFJFWTkySUxiUUkrOVZyaTNLZld2c2diYndqQzFHc3VYUld4VGlpd09NdS9j?=
 =?utf-8?B?dEZ1YU1vd0ZoRHc0QmlKY3o5WEFqUHBnSE5iL28yRVVjQkxyZVZQQ0x1VjJF?=
 =?utf-8?B?am1GaW1raTJDRHVLZDhnRncyZW5QVzFwNm5pMmg2VTN2bS9PKzZuc3dMYm9n?=
 =?utf-8?B?NTBPKys1bHRhN0JpbmM4RURxTDVuMElhVy85NlpGendncXhYMnd4U1ZYZUJi?=
 =?utf-8?B?aUlhMUFyNzhISmNhTXJoSWptMXNZTm5aT0ErdXFpaGVhUHNCK0s5N1JRRWFh?=
 =?utf-8?B?NVA5RE9NcVRBOUtnRmEydHRjT1llZjV2eTkxcjFIanZxUzNtZGM0MVR4U0JP?=
 =?utf-8?B?OCtLZkFnRElaSGJUTnNsL1IxN3lwTk1meU1KK0FWRW5ZSXhwbnVaTTlQbWU3?=
 =?utf-8?B?cHlyMzJya2dpSlVQamIzMTVXaGtrdlVpcDZDejIzY2MyYzEyWnFBUTk2QkZD?=
 =?utf-8?B?Q1Q0UVJQcitXV2hSdWU3OG5WZVREaUtsbFZWOGtGWGQyZ2NmWVRaZlZxWHVz?=
 =?utf-8?B?L3pnMXpBYkU3Z05Oc3BBVERDalNxeVo4dmw4RHZDeWhpWGo2ek5rbkFVV2t0?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wK2QZV0HQaZBDQqJl6+BNIOqJ+nOlzSCe0AZ+bX4WtGC9h0I7BvdMU4NdCeDeCPwB8/aqqQUOOo02Cmkx+gGL6TjVQL9jQAJUvcqFFxITGGEVeBfNoM+6Ak1uhz9HB0XpXDgkCgvMcDkl2EHkTXP98Vg8MAWAeXuowbvt485l9cj9TDkrLgIkRbUzYXXzKECj57OUAH7d+EqHLe0k0Q0FwgtWo4y8roU5KDVJASJUaXlbOc+8PbfZn2/ECfjmNkzXmKd69hkxgW+zSYil4EhTwdxdw506uLFrpkAGsGbWZqB4sf8RLQX6l/pwCdbcjJeCKkFXfq9Isno1HdjGVXLsXY4v5fNtaPFaovyRsJzuHGCV+KOR42ZyTTmahYbN/RHAMw97pK0QlJpbipQz0Cei954MslnF853o4VPw0QS3UJYU2HNyjHHCEIOHoEC6xJme6KNvp1f2eDwL+lQry/HNvNQpZwobftCr974JIYP5SsJB50Io+spzg5SNlk9NP9AQ9rL5atXD5HNhRCdwnPXYY+dWqBnbR4wl/AznAz9dh9irs41IILFYVnl7jLTORcrTi1IsupIb7c/E87o+lDDesGDd71QGg6AQ8EJ1O6+ZUo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2501ee7f-d634-4db5-949d-08dda4e346d6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:17:01.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aAZWsCcVK3YcsQdBSn+pTYomsaHJ7OcyZNZi6xqLl2v1hRatLEaFVReAYkoW2X3+98+wucmauTqA83VFon6rQTuTVLOB4pdrFFV2jpdLM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6494
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060093
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=6842c020 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=25MXHmvSDuRyV_qfCIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0iRSxKa2ftDzaUCyiNWhCMAChW3H0KHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfX1EqVB9jK4dz4 YBOJoR0lYQYxZ5bbCIw9vKntej6zoA+JEpC7ONF0Dl8iIiub581hqBw6CMxPw26S0wZdWDfPR8w x6FXUux8/IdFFzeLkWAoG4XXthsoIHthchqzAd4BiTAZWqkWbbEsoI5KQgi/EPeNSQoIu8m+TBF
 sHeGypG+sQN6hDRCe++Bwci2NjcHLquc73OESvMZblcHGlMPi5HPk94exyQ6NRVKCmEp2sXRYk/ fCoNHzLsTvp1dFPuc9mI5m+akiLz7GjBfcrOfDX7G6wXkIdAFX7SHYNo9g0fJA75KjzHjc1zqQA mFzzueu4AGQj0Q3KPpqBH0xfIy0ksKX38w50pyn6x+g7xggWHUzFYTatlLFzGvkAZakHlCthnkY
 KgVhuTlM5ChED5sPq/0XwPFJhMMOeLtaXlyeibGOw73QsvRbo0roPlBkiyym2LGEcEtBpt33
X-Proofpoint-ORIG-GUID: 0iRSxKa2ftDzaUCyiNWhCMAChW3H0KHv

On Fri, Jun 06, 2025 at 07:18:25PM +1200, Barry Song wrote:
> On Wed, Jun 4, 2025 at 8:17 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Tue, Jun 3, 2025 at 11:43 AM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > Hi Barry,
> > >
> > > As promised, I enclose a patch to give a sense of how I think we might
> > > thread state through this operation.
> > >
> > > There's a todo on the untagged stuff so you can figure that out. This is
> > > based on the v1 so it might not encompass everything you addressed in the
> > > v2.
> > >
> > > Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
> > > _despise_ the void *arg function ptr stuff there added just for the anon
> > > vma name stuff (ughhh) so might be the only sensible way of threading
> > > state.
> > >
> > > I don't need any attribution, so please use this patch as you see
> > > fit/adapt/delete/do whatever with it, just an easier way for me to show the
> > > idea!
> > >
> > > I did some very basic testing and it seems to work, but nothing deeper.
> > >
> > > Cheers, Lorenzo
>
> Really appreciate your work on this, Lorenzo.

No problem! Hopefully having it in code form makes things clearer on how I
felt we could thread state through here.

The truth is the madvise code, despite SJ's great efforts to improve it
(and indeed he has!), is still a bit of a mess so it's fiddly. More work to
do there I think!

Obviously you are replying to Suren below but I will be so bold as to
quickly give my thoughts here :P

>
> > >
> > > ----8<----
> > > From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
> > > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Date: Tue, 3 Jun 2025 18:22:55 +0100
> > > Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_LOCKED]
> > >
> > > Refactor the madvise() code to retain state about the locking mode utilised
> > > for traversing VMAs.
> > >
> > > Then use this mechanism to permit VMA locking to be done later in the
> > > madvise() logic and also to allow altering of the locking mode to permit
> > > falling back to an mmap read lock if required.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > >  mm/madvise.c | 174 +++++++++++++++++++++++++++++++++++++--------------
> > >  1 file changed, 127 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 5f7a66a1617e..a3a6d73d0bd5 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -48,38 +48,19 @@ struct madvise_walk_private {
> > >         bool pageout;
> > >  };
> > >
> > > +enum madvise_lock_mode {
> > > +       MADVISE_NO_LOCK,
> > > +       MADVISE_MMAP_READ_LOCK,
> > > +       MADVISE_MMAP_WRITE_LOCK,
> > > +       MADVISE_VMA_READ_LOCK,
> > > +};
> > > +
> > >  struct madvise_behavior {
> > >         int behavior;
> > >         struct mmu_gather *tlb;
> > > +       enum madvise_lock_mode lock_mode;
> > >  };
> > >
> > > -/*
> > > - * Any behaviour which results in changes to the vma->vm_flags needs to
> > > - * take mmap_lock for writing. Others, which simply traverse vmas, need
> > > - * to only take it for reading.
> > > - */
> > > -static int madvise_need_mmap_write(int behavior)
> > > -{
> > > -       switch (behavior) {
> > > -       case MADV_REMOVE:
> > > -       case MADV_WILLNEED:
> > > -       case MADV_DONTNEED:
> > > -       case MADV_DONTNEED_LOCKED:
> > > -       case MADV_COLD:
> > > -       case MADV_PAGEOUT:
> > > -       case MADV_FREE:
> > > -       case MADV_POPULATE_READ:
> > > -       case MADV_POPULATE_WRITE:
> > > -       case MADV_COLLAPSE:
> > > -       case MADV_GUARD_INSTALL:
> > > -       case MADV_GUARD_REMOVE:
> > > -               return 0;
> > > -       default:
> > > -               /* be safe, default to 1. list exceptions explicitly */
> > > -               return 1;
> > > -       }
> > > -}
> > > -
> > >  #ifdef CONFIG_ANON_VMA_NAME
> > >  struct anon_vma_name *anon_vma_name_alloc(const char *name)
> > >  {
> > > @@ -1486,6 +1467,43 @@ static bool process_madvise_remote_valid(int behavior)
> > >         }
> > >  }
> > >
> > > +/*
> > > + * Try to acquire a VMA read lock if possible.
> > > + *
> > > + * We only support this lock over a single VMA, which the input range must
> > > + * span.either partially or fully.
> > > + *
> > > + * This function always returns with an appropriate lock held. If a VMA read
> > > + * lock could be acquired, we return the locked VMA.
> > > + *
> > > + * If a VMA read lock could not be acquired, we return NULL and expect caller to
> >
> > Worth mentioning that the function itself will fall back to taking
> > mmap_read_lock in such a case.
> >
> > > + * fallback to mmap lock behaviour.
> > > + */
> > > +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> > > +               struct madvise_behavior *madv_behavior,
> > > +               unsigned long start, unsigned long end)
> > > +{
> > > +       struct vm_area_struct *vma;
> > > +
> > > +       if (!madv_behavior || madv_behavior->lock_mode != MADVISE_VMA_READ_LOCK)
> >
> > nit: I think it would be better to do this check before calling
> > try_vma_read_lock(). IMHO it does not make sense to call
> > try_vma_read_lock() when lock_mode != MADVISE_VMA_READ_LOCK. It also
> > makes reading this function easier. The first time I looked at it and
> > saw "return NULL" in one place that takes mmap_read_lock() and another
> > place which returns the same NULL but does not take mmap_lock really
> > confused me.
> >
> > > +               return NULL;
> > > +
> > > +       vma = lock_vma_under_rcu(mm, start);
> > > +       if (!vma)
> > > +               goto take_mmap_read_lock;
> > > +       /* We must span only a single VMA, uffd unsupported. */
> > > +       if (end > vma->vm_end || userfaultfd_armed(vma)) {
> >
> > vma->vm_end is not inclusive, so the above condition I think should be
> > (end >= vma->vm_end || ...)
>
> I don't quite understand why `end > vma->vm_end` would be a problem.
> For a VMA with `vm_start = X` and `vm_end = X + 0x1000`, wouldn't the
> range `(X, X + 0x1000)`—where `end == vm_end`—still be a valid
> candidate for using a per-VMA lock?
>
> We're checking which cases are not eligible for per-VMA locking,
> not which ones are.

Yeah agreed.

>
> >
> > > +               vma_end_read(vma);
> > > +               goto take_mmap_read_lock;
> > > +       }
> > > +       return vma;
> > > +
> > > +take_mmap_read_lock:
> > > +       mmap_read_lock(mm);
> > > +       madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
> > > +       return NULL;
> > > +}
> > > +
> > >  /*
> > >   * Walk the vmas in range [start,end), and call the visit function on each one.
> > >   * The visit function will get start and end parameters that cover the overlap
> > > @@ -1496,7 +1514,8 @@ static bool process_madvise_remote_valid(int behavior)
> > >   */
> > >  static
> > >  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > > -                     unsigned long end, void *arg,
> > > +                     unsigned long end, struct madvise_behavior *madv_behavior,
> > > +                     void *arg,
> > >                       int (*visit)(struct vm_area_struct *vma,
> > >                                    struct vm_area_struct **prev, unsigned long start,
> > >                                    unsigned long end, void *arg))
> > > @@ -1505,6 +1524,15 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > >         struct vm_area_struct *prev;
> > >         unsigned long tmp;
> > >         int unmapped_error = 0;
> > > +       int error;
> > > +
> > > +       /* If VMA read lock supported, we apply advice to a single VMA only. */
> > > +       vma = try_vma_read_lock(mm, madv_behavior, start, end);
> > > +       if (vma) {
> > > +               error = visit(vma, &prev, start, end, arg);
> > > +               vma_end_read(vma);
> > > +               return error;
> > > +       }
> > >
> > >         /*
> > >          * If the interval [start,end) covers some unmapped address
> > > @@ -1516,8 +1544,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > >                 prev = vma;
> > >
> > >         for (;;) {
> > > -               int error;
> > > -
> > >                 /* Still start < end. */
> > >                 if (!vma)
> > >                         return -ENOMEM;
> > > @@ -1598,34 +1624,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> > >         if (end == start)
> > >                 return 0;
> > >
> > > -       return madvise_walk_vmas(mm, start, end, anon_name,
> > > +       return madvise_walk_vmas(mm, start, end, anon_name, NULL,
>
> I think this should be:
>
>  +       return madvise_walk_vmas(mm, start, end, NULL, anon_name,

Whoops! :) you're right!

I kind of hate having to pass the state like this but I guess for now we'll
live with it and can refactor this whole thing later perhaps.

>
> > >                                  madvise_vma_anon_name);
> > >  }
> > >  #endif /* CONFIG_ANON_VMA_NAME */
> > >
> > > -static int madvise_lock(struct mm_struct *mm, int behavior)
> > > +
> > > +/*
> > > + * Any behaviour which results in changes to the vma->vm_flags needs to
> > > + * take mmap_lock for writing. Others, which simply traverse vmas, need
> > > + * to only take it for reading.
> > > + */
> > > +static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
> > >  {
> > > +       int behavior = madv_behavior->behavior;
> > > +
> > >         if (is_memory_failure(behavior))
> > > -               return 0;
> > > +               return MADVISE_NO_LOCK;
> > >
> > > -       if (madvise_need_mmap_write(behavior)) {
> > > +       switch (behavior) {
> > > +       case MADV_REMOVE:
> > > +       case MADV_WILLNEED:
> > > +       case MADV_COLD:
> > > +       case MADV_PAGEOUT:
> > > +       case MADV_FREE:
> > > +       case MADV_POPULATE_READ:
> > > +       case MADV_POPULATE_WRITE:
> > > +       case MADV_COLLAPSE:
> > > +       case MADV_GUARD_INSTALL:
> > > +       case MADV_GUARD_REMOVE:
> > > +               return MADVISE_MMAP_READ_LOCK;
> > > +       case MADV_DONTNEED:
> > > +       case MADV_DONTNEED_LOCKED:
> > > +               return MADVISE_VMA_READ_LOCK;
> > > +       default:
> > > +               return MADVISE_MMAP_WRITE_LOCK;
> > > +       }
> > > +}
> > > +
> > > +static int madvise_lock(struct mm_struct *mm,
> > > +               struct madvise_behavior *madv_behavior)
> > > +{
> > > +       enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
> > > +
> > > +       switch (lock_mode) {
> > > +       case MADVISE_NO_LOCK:
> > > +               break;
> > > +       case MADVISE_MMAP_WRITE_LOCK:
> > >                 if (mmap_write_lock_killable(mm))
> > >                         return -EINTR;
> > > -       } else {
> > > +               break;
> > > +       case MADVISE_MMAP_READ_LOCK:
> > >                 mmap_read_lock(mm);
> > > +               break;
> > > +       case MADVISE_VMA_READ_LOCK:
> > > +               /* We will acquire the lock per-VMA in madvise_walk_vmas(). */
> > > +               break;
> > >         }
> > > +
> > > +       madv_behavior->lock_mode = lock_mode;
> > >         return 0;
> > >  }
> > >
> > > -static void madvise_unlock(struct mm_struct *mm, int behavior)
> > > +static void madvise_unlock(struct mm_struct *mm,
> > > +               struct madvise_behavior *madv_behavior)
> > >  {
> > > -       if (is_memory_failure(behavior))
> > > +       switch (madv_behavior->lock_mode) {
> > > +       case  MADVISE_NO_LOCK:
> > >                 return;
> > > -
> > > -       if (madvise_need_mmap_write(behavior))
> > > +       case MADVISE_MMAP_WRITE_LOCK:
> > >                 mmap_write_unlock(mm);
> > > -       else
> > > +               break;
> > > +       case MADVISE_MMAP_READ_LOCK:
> > >                 mmap_read_unlock(mm);
> > > +               break;
> > > +       case MADVISE_VMA_READ_LOCK:
> > > +               /* We will drop the lock per-VMA in madvise_walk_vmas(). */
> > > +               break;
> > > +       }
> > > +
> > > +       madv_behavior->lock_mode = MADVISE_NO_LOCK;
> > >  }
> > >
> > >  static bool madvise_batch_tlb_flush(int behavior)
> > > @@ -1721,6 +1799,8 @@ static int madvise_do_behavior(struct mm_struct *mm,
> > >
> > >         if (is_memory_failure(behavior))
> > >                 return madvise_inject_error(behavior, start, start + len_in);
> > > +
> > > +       // TODO: handle untagged stuff here...
> > >         start = untagged_addr(start); //untagged_addr_remote(mm, start);
> > >         end = start + PAGE_ALIGN(len_in);
> > >
> > > @@ -1729,7 +1809,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
> > >                 error = madvise_populate(mm, start, end, behavior);
> > >         else
> > >                 error = madvise_walk_vmas(mm, start, end, madv_behavior,
> > > -                                         madvise_vma_behavior);
> > > +                                         madv_behavior, madvise_vma_behavior);
> > >         blk_finish_plug(&plug);
> > >         return error;
> > >  }
> > > @@ -1817,13 +1897,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
> > >
> > >         if (madvise_should_skip(start, len_in, behavior, &error))
> > >                 return error;
> > > -       error = madvise_lock(mm, behavior);
> > > +       error = madvise_lock(mm, &madv_behavior);
> > >         if (error)
> > >                 return error;
> > >         madvise_init_tlb(&madv_behavior, mm);
> > >         error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
> > >         madvise_finish_tlb(&madv_behavior);
> > > -       madvise_unlock(mm, behavior);
> > > +       madvise_unlock(mm, &madv_behavior);
> > >
> > >         return error;
> > >  }
> > > @@ -1847,7 +1927,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> > >
> > >         total_len = iov_iter_count(iter);
> > >
> > > -       ret = madvise_lock(mm, behavior);
> > > +       ret = madvise_lock(mm, &madv_behavior);
> > >         if (ret)
> > >                 return ret;
> > >         madvise_init_tlb(&madv_behavior, mm);
> > > @@ -1880,8 +1960,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> > >
> > >                         /* Drop and reacquire lock to unwind race. */
> > >                         madvise_finish_tlb(&madv_behavior);
> > > -                       madvise_unlock(mm, behavior);
> > > -                       ret = madvise_lock(mm, behavior);
> > > +                       madvise_unlock(mm, &madv_behavior);
> > > +                       ret = madvise_lock(mm, &madv_behavior);
> > >                         if (ret)
> > >                                 goto out;
> > >                         madvise_init_tlb(&madv_behavior, mm);
> > > @@ -1892,7 +1972,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> > >                 iov_iter_advance(iter, iter_iov_len(iter));
> > >         }
> > >         madvise_finish_tlb(&madv_behavior);
> > > -       madvise_unlock(mm, behavior);
> > > +       madvise_unlock(mm, &madv_behavior);
> > >
> > >  out:
> > >         ret = (total_len - iov_iter_count(iter)) ? : ret;
> > > --
> > > 2.49.0
>
> Thanks
> Barry

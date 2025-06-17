Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A712EB10
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167565; cv=fail; b=k5BBUXnvjWsqnod7em7b0wrZdQ//dWugP0v+G96xMJQ3ivSA8ZDinDXO5rq+VCzNTpukOHwLszCYFcW3UViTQBV3a42HUcq5wrCc2Q5skw8Af7D+0Ug24asvUZL81rcOI+PxTvvS0z4J11SCvoBBVeTRqjJRuR2JevZI0jFAA7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167565; c=relaxed/simple;
	bh=sjSudrUrak7hrqL8PPQIrDwTAMUXMvyweAk+lBqeoJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vjb5TjrBguvdNS1Cy6XaWVDiSJxva7/+1l+f4vJCRyeC9vXFMrfoJbY1l5Eq+z4LcyiDq2AECD/oiYheYGaPZlt1FI90eoMU+krpucKMSfpOkAOZJAl0BrHkyMlvOYP+OfhJnAEApsS8c8TwTHMl0w2uE0h6E1cMt3GPcL7TFZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VoMgZOC3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sc/JPMsT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VoMgZOC3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sc/JPMsT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tZeX023895;
	Tue, 17 Jun 2025 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Nen58jWTOpASJ9/RJlzFs/JyNd3xRewHuoDGi/jOl8w=; b=
	VoMgZOC3TyTOs08AOrI33XhTQSWV6kCMVd1sb5+KEgTwMuJstXrfYHBaJAmS5lWl
	GfsMsO4Z3xUhK1rUTlvHzCfmvbfhkNsnOM/JKs+qTz22TAOq5OXZsHPtMxYO81zS
	pdak7w8bAfuBgw7MSBAtkeuSvEGjxYpLeHaqMRXHr60LwrLgEd7BMD2pv1G9TEnM
	cN2F2jgFW7BgRyarlthD9vH4q4LeS2nuThM6FUFAsbcJsffSFzTEgN3NLRvGqKer
	MbmMQdBT4lLITfSVBKWU6Wbz4aa1+f6GoXDAWdS22amgqkXpKAunsGdtNP7SJDuL
	+Y6Hh4fUQvojPNQZc1HZRw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv558e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 13:38:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HCbkM5036256;
	Tue, 17 Jun 2025 13:38:58 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhfr9vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 13:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGT80eehCatSwqP923caT6BxYdnRHv+YCOlBtSqBaooL36k+nkrR0qjnKRx4QirsQ45+gbzTLr+dTT+bZFpRF0ebW8D1tkeDqs2rRsYGg5oSlwIX32aH0w8mZzFQXqC6CdXBMEQHuOXEIkcdy/Ifby0lfpTA5NDxsy9wmyyuGSgSH4q6hCeZpxDmMusqWkNWBFJGY0YH7xUwElndBoMKnfojgly24fPQgpvBlBr9CNmxj4hJHHdHgwsfClmE133dvE59DaIxiFCUU4nWmgkqKHOJCxdUNx+ioxG+UQ0botoEsWmAKROvJZP7vHaHKyzUv9qcfBYoFycAc3RqcfQPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nen58jWTOpASJ9/RJlzFs/JyNd3xRewHuoDGi/jOl8w=;
 b=OgONf2voEaw2xNaFjKlZObaj4z5FX5Ydq6mzzURlq2ZsFdpkDCy0YHoVU+qq8QDefE6tV7AR8lii36SWi6WbwVUqEEFiCZymW2g4IOm4/HgBQebXLmrfpWwqfBwiVgxBH5yKn57yYN4r8ijREOej2aFYx8Ml5a+bsPFITPRVw6BDi4KnVvhT+h54jE3H21/fhIXnv0WrLJ9804MBwVHK3vgBZceDXZx0JnkzXoldaOXUtF19Pqd6bfgd5SiREb2PA70OOw1JLRyVsSOMz1DbSSbVnTBzhS60/lYIinfy+x2HiY7o8MaW+Trg1ktjXIZ/T7JhlR6ANi0RFVn94OWguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nen58jWTOpASJ9/RJlzFs/JyNd3xRewHuoDGi/jOl8w=;
 b=sc/JPMsTCvKe1Km0+x8PXs+XUrODK46f0QYTErrvLPkIzSg5+ougtE1As2Wpu5hvdbblmoTF3BWLRkyS6A6SCQ+qmaKCjmMGR3G0vPqbpTHXzLsUM5gppQcgZGFGj4UuMaYx6mGXjx4j1vdFvscvTony3mWtuCw8mqUkLz2A4w8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 13:38:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 13:38:55 +0000
Date: Tue, 17 Jun 2025 14:38:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Lance Yang <ioworker0@gmail.com>
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
References: <20250607220150.2980-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250607220150.2980-1-21cnbao@gmail.com>
X-ClientProxiedBy: FR4P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: b32dffa7-adbc-4fed-da4a-08ddada44de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG1JL0VEYWhIVlFsU1VTZGpVdUhNbndoQzZyaUVpNUJ3YnB4QzlZaUhjcDFB?=
 =?utf-8?B?S1B0NHhrTUFtd1FuOU9ONTFkZ0VySmhiUDRPN1FIMGp2ZmRjVDBCYlo0MnN0?=
 =?utf-8?B?bXNicmdXdm9LamMyR3FkN2cxa3E3cURHK3p0eXVJWjBWaklreWtNMWFlQlNp?=
 =?utf-8?B?dTNZQWZ1ekJ4VVdSbCtpMHFnVTZ5dnhQRG9VMHNtamVmMjYvaTNOclJJVDJW?=
 =?utf-8?B?WDRXUUVRNXY2OUFES0s0RU1kV0JBbDNhWHM5N0ZvMXFSc3YwNXIxOUZMR2xz?=
 =?utf-8?B?Z3JndjZvQit3bmhhSEYyWlM1VmxGa1ZVZmxoMmxRV1A4Z3N1cGhacS9uWDEw?=
 =?utf-8?B?d2dPQ3lrNzZsSHV1RVlxa2t1YjI0Z0pvOEIwNjNkQ1Nrcy9HbEl1ZFdkQ1JR?=
 =?utf-8?B?MEhlc3JHSUMvL1VTdW0wb0xaUXE4ZmNYRnNZOG0xNXRwUGxkNjZ1bHN3SHRx?=
 =?utf-8?B?NnQ2Q3Izc0twbThPVlVMVWVqTW1rOG9iMmxnNUxBbEc3QjJ5NGltTXpIRHVI?=
 =?utf-8?B?allmWkdLM1NpNHhUSUJMZXFiMHVBNVJOYmNtbTVocVFKTE1xaml1S2ZTWExV?=
 =?utf-8?B?dWVmMGpKUE1MTnRNMS9sUjZQajRob2t0VHFnbFBGNWhia2Jxa0pxRkJGM2tL?=
 =?utf-8?B?a0FDSXVzUFNTcjloZVZpL09uclNTOXB5cFZJSFVwWER3U0tiS0tOL0xQVzA3?=
 =?utf-8?B?elVuR0FhWkkwd0NhWTBjMjZ4a3ludkt0TVdjSGJnWDFCR0dneVZHZ3lkWE1z?=
 =?utf-8?B?S1dXTFJyMHdmQXp1M3RvUWEyS3A2c2wzYndBSVNzSHRMbnVuQlZzdlRDY2Vl?=
 =?utf-8?B?MGVHSE9VMERjS0FlSk56M3ZJVjZadFB1YTV0YnZwc3ZWb3pNcG5OVDd3SXNl?=
 =?utf-8?B?YktwdFNNR3F6ZmRxSGRJTWxJWWJVSmJJNnpVK01wNXZGc0tlNE9qWWJDaFlL?=
 =?utf-8?B?T3lEY002czh6WDRQbVlxbGRSTlh0N0d2VkNmTDIzTFVQMWNQMnd5OGhBTDZH?=
 =?utf-8?B?aGNGNjBKa21yNVA2SHJ0UjhYb3ZJSERqdlJHbHQrVkhPUWZicjNBaTRGZnB6?=
 =?utf-8?B?K3gzcFFFSWJLWHA3SmJpenZCT29VV3RSMFJRVHBrTitjUHJOaDI2L1c2ZUx3?=
 =?utf-8?B?a1U4NnJ3b3lkZlErNVgxRlJPYVo4ajNBY2hjckpkZVBlZlpSdldWQmFFeWx1?=
 =?utf-8?B?WDl6M1YrdEwzZTVUVmN4a0wvT0orTE8ydjF5Q3BYaFFaUWc5Um5rU0lNdDVs?=
 =?utf-8?B?ck94VjZlSUhTblFhMm9QMjF0WGNvVkovNWJLbTRoOE5PSHFtcUVXdEptaWQr?=
 =?utf-8?B?TzMxc3J4L05QaTdSWE5ranYwSFl5QkdQa2V3K2dLLzRBZ2I4V2V6Vlc0ZDdG?=
 =?utf-8?B?R3Z0cDhPT1FDaFl3NDMxUzl4a2hQaUQ1UFl0Vjg2ZnZIT2JwOUJBbUpaSzhR?=
 =?utf-8?B?b2ZzdFZ5Y0g3UGMyYnNhVVlyTWErUHJCejZUMnAxZXp3VkJ3dkRiYzdMdlVX?=
 =?utf-8?B?S2cvWnlqUWlBeHhaZTh1ZGFUcUlyN09FOWxlL0R3b1dVblRpQW1mYUhQOHdH?=
 =?utf-8?B?STJPWmQzS2ZOZERQMEo5eW5NSkNTRStiSzN2QVFqeTRGZ2JxcVE1ZUFtdFhD?=
 =?utf-8?B?c0syQ1hvaTdFWkNkMFZ6M0VmVjNaUUVUZ3Q1b1QwcCtqRllFd0E1bjRNMGdC?=
 =?utf-8?B?Ukp6UjlxTnZjcGNndGRNM2NlTjRHejRDa3dJNmUzeTRLYkRRT2Z4NWpRVE4v?=
 =?utf-8?B?eTJPMGI5U3ZaelRuaGNCYUY2TFlTQ2plZkdZTFNJWkkyUlBzNi95SW82d1lQ?=
 =?utf-8?B?V1VMOVJjUVBvT0daMmlieGVPbUxxdGJwL0FVSVhmdGZSc2swNXlPZGo4Ny9M?=
 =?utf-8?B?OTBiR0ZpV2puR3F6bW4yZGtrUjkvN001eCt0d3d6T2ZUR0NodlprZjBGYStp?=
 =?utf-8?Q?MQpadCE5aGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmVpaFZxYmxZS0pkZDV6UmtWRGJUNjkvelFiMGluUWx4OGg1dWd3aXNkT2xT?=
 =?utf-8?B?MFEwL1FMUFpiVy9XTExJcldWWStMTytXcndtc3lxcWtGTXp1LzM2bi9DSFYy?=
 =?utf-8?B?aHdvb2VlWjJTSS85RGJOT3lTN3ZhTU5ORklYSHRJZ1d6aWlQQ2pEcmhESnNO?=
 =?utf-8?B?U2hSS3lHTU00c3hmaUdMazRxR1ZKVlNaQWYzcGVEbnFqcDhLODBMVGVwczQ0?=
 =?utf-8?B?b0hQbTRPMlA4dS9EOUpJNFA0elpzOXlEaDM4RnJZQm9MbStCZ1c5YXRmVzQ3?=
 =?utf-8?B?TTJRK0lGVzQ5b1AranRRZHA0dHY3d2t6WjkwZVZwTlIvSUptaElhdHl0SzUv?=
 =?utf-8?B?dUxJNXdrMmhOKy9xeXRDRElGVENJaXZuVlRpaXcrZ1VpbEx5K2RwNGVFUW1K?=
 =?utf-8?B?V2RlekhEWHkycVFYaithem9LYXhMUEx1em1rL21JRlB0YXN0KzIrN2NYT1g3?=
 =?utf-8?B?NDFiQUxVR29GbC9YcTFRZUtBUXVCZmo3MW9ZVUVGMllQQkNIWUwrV05qL043?=
 =?utf-8?B?L0hsWFVVOW9tNjd4anZsTWl6MUQyUk1VcmVOZ0xLMjZPMURoWEhZaXBpUktO?=
 =?utf-8?B?ekE4Tm90Mk84cG5oS1BzSTRVejdWLytzeDh2eFJMM0pWUHZ1aXVobkJseHBP?=
 =?utf-8?B?TXdJeTljZXV3T21BTWVyL2tKd2VkdDdoalN3NWJJZElvZTN6eDk4eUxCSjdv?=
 =?utf-8?B?QkYwdjZKMTdxU3ZoRTBpMkh3dXJKTmlzRmQ1Wkk5RWljZVpSajVtRXU2OTV6?=
 =?utf-8?B?aDBZemttNUtFWldCa3kyemdQak4xWU9sMkZtbWNGTmZhUS9TcFR3TUZoa3Yz?=
 =?utf-8?B?RHV0NGtJejRWaXoxb1l4eEhQTCtrT3RrNzB6MVRWRFc0N21ndS9jSHh1bnFj?=
 =?utf-8?B?c3B0S2ExcU1GOVJFZGIxejBHd1RpM3J2K2V5aFV4c1RZRWt3Vm9uOU9wUDUw?=
 =?utf-8?B?aUF4a0swVEVZdDUxUXdPOFNWUW9RbitHNmNUZzExK29JcVAySldtTTYvQjdS?=
 =?utf-8?B?SEQvN3pqVUlKYW56UlE5Q2l1c1Y0VHlDamtRdkpVMTlWdFhoRVE0WWV6TTlL?=
 =?utf-8?B?NGFDS0NMcnh1eWN4SlNUOXN0dUljeWZCcXVaWUpYNE45bmJsQlQwUTZUU2hP?=
 =?utf-8?B?cEx3NWlEVVRaZkk4dU9saDB6NFI4bTN3bjFsWEVJb2EweFdHQm4vUkUybkJm?=
 =?utf-8?B?bW1jQjI5Q0RmRTFIWTIyN0dsYXVlSFdrQThPb1N6dG1tOWozNU91a0M2QkFW?=
 =?utf-8?B?TDNVazdIMStTalZaNk1ZeWRsZHlPSklWTkdBMVJSQkRBcVh6a1FyTGVLaUho?=
 =?utf-8?B?bW01S2NMN2FBUzJXRnpqSnVjWVZEVzRFK2EzTkE3RGxROWZTMzYrcWdseHdO?=
 =?utf-8?B?OEg0K01CMk04K0JRVVhiK09Pc25ha0xsTnhjWlovSnFOTjNQTklqVzdOWDBq?=
 =?utf-8?B?WDNzYjZESUFVYmJQOXhHTGxzbFFuSE1ZYlN6NCsxNDUxMHNBMUNPeEw1dUpD?=
 =?utf-8?B?MjRmK3MyU1N2OGdsQ052OFpHZHUyOEtreFVPTndncWVpTTBwYVR5M2syV3I5?=
 =?utf-8?B?cFM5TkhBaFY2N0ViOWF6ZDhFSEZyd2VZZ2llemxKS1VjWFZKWXc4VFJjZ3Y0?=
 =?utf-8?B?c1B3RUNtV29FV1Y4MDh5bEtPTFQ0VVRJeTF5aFUwQXNhdUluQ09JODlWa3Zw?=
 =?utf-8?B?cnMwSDl1MDYycEU2N0VkMFNHdEltazBzTndDcTI2UXQ2eGxvYllmei9EdWYz?=
 =?utf-8?B?UGhLdnFVQ2FoZkpETHdlaWxMZDJZdmFHSUlVR0xLZ1RBZ2NIYVlBRDgzQjBn?=
 =?utf-8?B?Q2ZzYTBWbCtCMU9yTEE0RC92VzdjcHpBeWpTL3BLT09CTTNoTHFwOW1WeC9a?=
 =?utf-8?B?RUFjNEhLQnI0dlIrNCt0Nit5V0U3cVlKZnhlQUJhOWp5YXJlTlhZZHVZamQ1?=
 =?utf-8?B?b0MzYXNvSjN3RFBHeEFCbUNWYzlZRzBheVlzRVN4MmdISlJGQzlCUExHOGZW?=
 =?utf-8?B?YUhnZ20ra2RkeWRXRExCYzRIZEVuVDlSTllQSnpJcXhUVzBMTE9wdDRDMGQ5?=
 =?utf-8?B?a0Nma3UwTGZaSlM5bmdZanpCditiS3hJMUVRc0U2eVlxMVBFN21rbjNlS25W?=
 =?utf-8?B?TE01Mit0aXJJYldvUnNWNExtd083TmRkL0dpNUE5N0lLWnFkK1hpVjY3Z0x5?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kMj8Zh5VjOqcB4obpDXKms5kN6j5QUAhcHKp4wu7RJ2/Wi2VVqSpKsN4S3UybKcVW3/0A9dXwIXSa9ZDDdodGAoF8yazxNfXO5VUMesqEwT2pcgNEfp2+21iu9bc5mlvH0ZYJk87T3/yizdXN5LCFKsLY46B7nhUvvBp9nOdb5Jqi8cA7kKrCCZgsLFsLRL6B42wGngoHJV8sMTPrHmD4T0OgULIH9Pop2GTOXiee77/S6ZQopArGo1SatcPzbHbNVE22MUwS/ILDhMN2W5GCSbliy2PyhBZew3/L9hqewnCoV6+PvZ0mmp2jXgvnwGPNUjMD9/KWGC9Z4Wu45m5CfzEddMEYu2WPBjZ28YOozwgoaDSOgXJsgna/V+pXZkchVg1+BvtzaqB7TAI1soXLLU/57cWgkGMa+w0sdqZ2EkaeuWmiUEn0Slw8HggxkKZ5afoVJPaWfXzIPFgGunHS8eMrAxpejv0l8w3bXRM2I4bArXJdJ22Cb6VuN/t6uaDSGgb8TDTzEZ7Q4v2HtRScBRoCEH3Go+pTIPLb9F8ASyV0bUmW+fA2ST67npMFVLVS7EHwdVGWEt7pn2dCED7R0NyJSIzXYITlDP27Z407Fs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32dffa7-adbc-4fed-da4a-08ddada44de3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 13:38:55.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssEhXa1/RE14eFUsNplXku/r2Nd7btPMAgnv90uAyjURsv25j6l7/9PsArnDtLE6N6avmQ8NC2RWxHzIiRW+gURZ4lF4txNHQ5hVbi9fR7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7325
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwNyBTYWx0ZWRfX189Odd1wRx18 MFgS6KQVOYJhS7UzNFwcrATvLhv08ivh7356JSdJzBnumgMACSLzgimUwfNi+D3CaJMoQzpUwjN NbWKDMIeUGdgQfMA3tjrAuicOIrDoUu1svkz0rf3/RiZEX/odeD3MKLX62rk9guDW9GQ8Rj67HB
 s3nfNpj1WDSjYxlBLSEe46NvcPaV4da5kP3IeFrko4vsSODY5Vt4UG3ddpCWTGIBPEEZpXWsdNF +AFBr/PqDBi7CzUW+8xw9tb4QLjBh0VjYLNw3EQp39nY5ubJ9MuuccEGSFs2ulB1l6zM9eiYPmV i8brkIoiD+c1JB61oFDGZGJHRv/WAUdyC8zCiNK4G7vlkLkm/WskAv1RhcW5lWny8+t6IFIP/5f
 eHo4bzXG0IMKzbjWqK+7w72TsTfiibUd4MlmSgBDqWZxtJAX20rIq9zHnsteS7vep2mzpaF5
X-Proofpoint-GUID: BvZDv4y6-YZiRL2hFMK3rzH6Tl7YumC8
X-Proofpoint-ORIG-GUID: BvZDv4y6-YZiRL2hFMK3rzH6Tl7YumC8
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68516ff3 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=SwWZ_8iV1UNDhXpagP0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714

+cc Lance

Hi Barry,

This needs a quick fixpatch, as discovered by Lance in [0], which I did an
analysis on [1].

Basically, _theoretically_ though not currently in practice, we might end up
accessing uninitialised state in the struct vm_area_struct **prev value passed
around madvise.

The solution for now is to simply initialise it in the VMA read lock case, as
all users of this set *prev = vma prior to performing the operation.

Cheers, Lorenzo

[0]: https://lore.kernel.org/all/20250617020544.57305-1-lance.yang@linux.dev/
[1]: https://lore.kernel.org/all/6181fd25-6527-4cd0-b67f-2098191d262d@lucifer.local/

On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> Certain madvise operations, especially MADV_DONTNEED, occur far more
> frequently than other madvise options, particularly in native and Java
> heaps for dynamic memory management.
>
> Currently, the mmap_lock is always held during these operations, even when
> unnecessary. This causes lock contention and can lead to severe priority
> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> hold the lock and block higher-priority threads.
>
> This patch enables the use of per-VMA locks when the advised range lies
> entirely within a single VMA, avoiding the need for full VMA traversal. In
> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>
> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> benefits from this per-VMA lock optimization. After extended runtime,
> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> only 1,231 fell back to mmap_lock.
>
> To simplify handling, the implementation falls back to the standard
> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> userfaultfd_remove().
>
> Many thanks to Lorenzo's work[1] on:
> "Refactor the madvise() code to retain state about the locking mode
> utilised for traversing VMAs.
>
> Then use this mechanism to permit VMA locking to be done later in the
> madvise() logic and also to allow altering of the locking mode to permit
> falling back to an mmap read lock if required."
>
> One important point, as pointed out by Jann[2], is that
> untagged_addr_remote() requires holding mmap_lock. This is because
> address tagging on x86 and RISC-V is quite complex.
>
> Until untagged_addr_remote() becomes atomic—which seems unlikely in
> the near future—we cannot support per-VMA locks for remote processes.
> So for now, only local processes are supported.
>
> Link: https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local/ [1]
> Link: https://lore.kernel.org/all/CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com/ [2]
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  -v4:
>  * collect Lorenzo's RB;
>  * use visit() for per-vma path
>
>  mm/madvise.c | 195 ++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 147 insertions(+), 48 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 56d9ca2557b9..8382614b71d1 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -48,38 +48,19 @@ struct madvise_walk_private {
>  	bool pageout;
>  };
>
> +enum madvise_lock_mode {
> +	MADVISE_NO_LOCK,
> +	MADVISE_MMAP_READ_LOCK,
> +	MADVISE_MMAP_WRITE_LOCK,
> +	MADVISE_VMA_READ_LOCK,
> +};
> +
>  struct madvise_behavior {
>  	int behavior;
>  	struct mmu_gather *tlb;
> +	enum madvise_lock_mode lock_mode;
>  };
>
> -/*
> - * Any behaviour which results in changes to the vma->vm_flags needs to
> - * take mmap_lock for writing. Others, which simply traverse vmas, need
> - * to only take it for reading.
> - */
> -static int madvise_need_mmap_write(int behavior)
> -{
> -	switch (behavior) {
> -	case MADV_REMOVE:
> -	case MADV_WILLNEED:
> -	case MADV_DONTNEED:
> -	case MADV_DONTNEED_LOCKED:
> -	case MADV_COLD:
> -	case MADV_PAGEOUT:
> -	case MADV_FREE:
> -	case MADV_POPULATE_READ:
> -	case MADV_POPULATE_WRITE:
> -	case MADV_COLLAPSE:
> -	case MADV_GUARD_INSTALL:
> -	case MADV_GUARD_REMOVE:
> -		return 0;
> -	default:
> -		/* be safe, default to 1. list exceptions explicitly */
> -		return 1;
> -	}
> -}
> -
>  #ifdef CONFIG_ANON_VMA_NAME
>  struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  {
> @@ -1486,6 +1467,44 @@ static bool process_madvise_remote_valid(int behavior)
>  	}
>  }
>
> +/*
> + * Try to acquire a VMA read lock if possible.
> + *
> + * We only support this lock over a single VMA, which the input range must
> + * span either partially or fully.
> + *
> + * This function always returns with an appropriate lock held. If a VMA read
> + * lock could be acquired, we return the locked VMA.
> + *
> + * If a VMA read lock could not be acquired, we return NULL and expect caller to
> + * fallback to mmap lock behaviour.
> + */
> +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> +		struct madvise_behavior *madv_behavior,
> +		unsigned long start, unsigned long end)
> +{
> +	struct vm_area_struct *vma;
> +
> +	vma = lock_vma_under_rcu(mm, start);
> +	if (!vma)
> +		goto take_mmap_read_lock;
> +	/*
> +	 * Must span only a single VMA; uffd and remote processes are
> +	 * unsupported.
> +	 */
> +	if (end > vma->vm_end || current->mm != mm ||
> +	    userfaultfd_armed(vma)) {
> +		vma_end_read(vma);
> +		goto take_mmap_read_lock;
> +	}
> +	return vma;
> +
> +take_mmap_read_lock:
> +	mmap_read_lock(mm);
> +	madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
> +	return NULL;
> +}
> +
>  /*
>   * Walk the vmas in range [start,end), and call the visit function on each one.
>   * The visit function will get start and end parameters that cover the overlap
> @@ -1496,7 +1515,8 @@ static bool process_madvise_remote_valid(int behavior)
>   */
>  static
>  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> -		      unsigned long end, void *arg,
> +		      unsigned long end, struct madvise_behavior *madv_behavior,
> +		      void *arg,
>  		      int (*visit)(struct vm_area_struct *vma,
>  				   struct vm_area_struct **prev, unsigned long start,
>  				   unsigned long end, void *arg))
> @@ -1505,6 +1525,20 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>  	struct vm_area_struct *prev;
>  	unsigned long tmp;
>  	int unmapped_error = 0;
> +	int error;
> +
> +	/*
> +	 * If VMA read lock is supported, apply madvise to a single VMA
> +	 * tentatively, avoiding walking VMAs.
> +	 */
> +	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> +		vma = try_vma_read_lock(mm, madv_behavior, start, end);
> +		if (vma) {
> +			error = visit(vma, &prev, start, end, arg);
> +			vma_end_read(vma);
> +			return error;
> +		}
> +	}
>
>  	/*
>  	 * If the interval [start,end) covers some unmapped address
> @@ -1516,8 +1550,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>  		prev = vma;
>
>  	for (;;) {
> -		int error;
> -
>  		/* Still start < end. */
>  		if (!vma)
>  			return -ENOMEM;
> @@ -1598,34 +1630,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>  	if (end == start)
>  		return 0;
>
> -	return madvise_walk_vmas(mm, start, end, anon_name,
> +	return madvise_walk_vmas(mm, start, end, NULL, anon_name,
>  				 madvise_vma_anon_name);
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
>
> -static int madvise_lock(struct mm_struct *mm, int behavior)
> +
> +/*
> + * Any behaviour which results in changes to the vma->vm_flags needs to
> + * take mmap_lock for writing. Others, which simply traverse vmas, need
> + * to only take it for reading.
> + */
> +static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
>  {
> +	int behavior = madv_behavior->behavior;
> +
>  	if (is_memory_failure(behavior))
> -		return 0;
> +		return MADVISE_NO_LOCK;
>
> -	if (madvise_need_mmap_write(behavior)) {
> +	switch (behavior) {
> +	case MADV_REMOVE:
> +	case MADV_WILLNEED:
> +	case MADV_COLD:
> +	case MADV_PAGEOUT:
> +	case MADV_FREE:
> +	case MADV_POPULATE_READ:
> +	case MADV_POPULATE_WRITE:
> +	case MADV_COLLAPSE:
> +	case MADV_GUARD_INSTALL:
> +	case MADV_GUARD_REMOVE:
> +		return MADVISE_MMAP_READ_LOCK;
> +	case MADV_DONTNEED:
> +	case MADV_DONTNEED_LOCKED:
> +		return MADVISE_VMA_READ_LOCK;
> +	default:
> +		return MADVISE_MMAP_WRITE_LOCK;
> +	}
> +}
> +
> +static int madvise_lock(struct mm_struct *mm,
> +		struct madvise_behavior *madv_behavior)
> +{
> +	enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
> +
> +	switch (lock_mode) {
> +	case MADVISE_NO_LOCK:
> +		break;
> +	case MADVISE_MMAP_WRITE_LOCK:
>  		if (mmap_write_lock_killable(mm))
>  			return -EINTR;
> -	} else {
> +		break;
> +	case MADVISE_MMAP_READ_LOCK:
>  		mmap_read_lock(mm);
> +		break;
> +	case MADVISE_VMA_READ_LOCK:
> +		/* We will acquire the lock per-VMA in madvise_walk_vmas(). */
> +		break;
>  	}
> +
> +	madv_behavior->lock_mode = lock_mode;
>  	return 0;
>  }
>
> -static void madvise_unlock(struct mm_struct *mm, int behavior)
> +static void madvise_unlock(struct mm_struct *mm,
> +		struct madvise_behavior *madv_behavior)
>  {
> -	if (is_memory_failure(behavior))
> +	switch (madv_behavior->lock_mode) {
> +	case  MADVISE_NO_LOCK:
>  		return;
> -
> -	if (madvise_need_mmap_write(behavior))
> +	case MADVISE_MMAP_WRITE_LOCK:
>  		mmap_write_unlock(mm);
> -	else
> +		break;
> +	case MADVISE_MMAP_READ_LOCK:
>  		mmap_read_unlock(mm);
> +		break;
> +	case MADVISE_VMA_READ_LOCK:
> +		/* We will drop the lock per-VMA in madvise_walk_vmas(). */
> +		break;
> +	}
> +
> +	madv_behavior->lock_mode = MADVISE_NO_LOCK;
>  }
>
>  static bool madvise_batch_tlb_flush(int behavior)
> @@ -1710,6 +1794,21 @@ static bool is_madvise_populate(int behavior)
>  	}
>  }
>
> +/*
> + * untagged_addr_remote() assumes mmap_lock is already held. On
> + * architectures like x86 and RISC-V, tagging is tricky because each
> + * mm may have a different tagging mask. However, we might only hold
> + * the per-VMA lock (currently only local processes are supported),
> + * so untagged_addr is used to avoid the mmap_lock assertion for
> + * local processes.
> + */
> +static inline unsigned long get_untagged_addr(struct mm_struct *mm,
> +		unsigned long start)
> +{
> +	return current->mm == mm ? untagged_addr(start) :
> +				   untagged_addr_remote(mm, start);
> +}
> +
>  static int madvise_do_behavior(struct mm_struct *mm,
>  		unsigned long start, size_t len_in,
>  		struct madvise_behavior *madv_behavior)
> @@ -1721,7 +1820,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
>
>  	if (is_memory_failure(behavior))
>  		return madvise_inject_error(behavior, start, start + len_in);
> -	start = untagged_addr_remote(mm, start);
> +	start = get_untagged_addr(mm, start);
>  	end = start + PAGE_ALIGN(len_in);
>
>  	blk_start_plug(&plug);
> @@ -1729,7 +1828,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
>  		error = madvise_populate(mm, start, end, behavior);
>  	else
>  		error = madvise_walk_vmas(mm, start, end, madv_behavior,
> -					  madvise_vma_behavior);
> +				madv_behavior, madvise_vma_behavior);
>  	blk_finish_plug(&plug);
>  	return error;
>  }
> @@ -1817,13 +1916,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>
>  	if (madvise_should_skip(start, len_in, behavior, &error))
>  		return error;
> -	error = madvise_lock(mm, behavior);
> +	error = madvise_lock(mm, &madv_behavior);
>  	if (error)
>  		return error;
>  	madvise_init_tlb(&madv_behavior, mm);
>  	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
>  	madvise_finish_tlb(&madv_behavior);
> -	madvise_unlock(mm, behavior);
> +	madvise_unlock(mm, &madv_behavior);
>
>  	return error;
>  }
> @@ -1847,7 +1946,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>
>  	total_len = iov_iter_count(iter);
>
> -	ret = madvise_lock(mm, behavior);
> +	ret = madvise_lock(mm, &madv_behavior);
>  	if (ret)
>  		return ret;
>  	madvise_init_tlb(&madv_behavior, mm);
> @@ -1880,8 +1979,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>
>  			/* Drop and reacquire lock to unwind race. */
>  			madvise_finish_tlb(&madv_behavior);
> -			madvise_unlock(mm, behavior);
> -			ret = madvise_lock(mm, behavior);
> +			madvise_unlock(mm, &madv_behavior);
> +			ret = madvise_lock(mm, &madv_behavior);
>  			if (ret)
>  				goto out;
>  			madvise_init_tlb(&madv_behavior, mm);
> @@ -1892,7 +1991,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
>  	madvise_finish_tlb(&madv_behavior);
> -	madvise_unlock(mm, behavior);
> +	madvise_unlock(mm, &madv_behavior);
>
>  out:
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> --
> 2.39.3 (Apple Git-146)
>

----8<----
From 1ffcaea75ebdaffe15805386f6d7733883d265a5 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 17 Jun 2025 14:35:13 +0100
Subject: [PATCH] mm/madvise: avoid any chance of uninitialised pointer deref

If we were to extend madvise() to support more operations under VMA lock,
we could potentially dereference prev to uninitialised state in
madvise_update_vma().

Avoid this by explicitly setting prev to vma before invoking the visit()
function.

This has no impact on behaviour, as all visitors compatible with a VMA lock
do not require prev to be set to the previous VMA and at any rate we only
examine a single VMA in VMA lock mode.

Reported-by: Lance Yang <ioworker0@gmail.com>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index efe5d64e1175..0970623a0e98 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1333,6 +1333,8 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		return madvise_guard_remove(vma, prev, start, end);
 	}

+	/* We cannot provide prev in this lock mode. */
+	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
 	anon_name = anon_vma_name(vma);
 	anon_vma_name_get(anon_name);
 	error = madvise_update_vma(vma, prev, start, end, new_flags,
@@ -1549,6 +1551,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
 		if (vma) {
+			prev = vma;
 			error = visit(vma, &prev, start, end, arg);
 			vma_end_read(vma);
 			return error;
--
2.49.0

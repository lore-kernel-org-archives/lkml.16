Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0F21B8FE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539295; cv=fail; b=RoN1P2rke1vYXHGITResdIGO9JEggZVV60rnzIPdxF+Chh1Sld65EskvXB8sR8Fox3FD3XMMl459tLND0IGCQLxnsg+/EqOYmrA7nFtVQ/ry/casyxRHnXk1y3LoITMhCGBBqSTuAj60bfLCgugeMPnitJxcVZplPVtO6pDSC7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539295; c=relaxed/simple;
	bh=OWwLicqmMnLkkiAkybPoILEV8+2/cXXqDNK1uM+ffxk=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l+W5I9EYMJGasK97rIhIzQYNHy0CxGqUVDnb5/XbwGUF7hgBC9rf2pj/EEnpVyY0t7XeqiI+T9D1/wcRbetQ5M9hxVNXb1qagLQoH468CByO5BS2RhWatyyyxpZWjVinROTScMLldYD5H6hqX92Hu8FkGjxrnRLnjyvaUu8H6UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sko1jgjr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HmaVLWeG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sko1jgjr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HmaVLWeG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2fXV9021435;
	Tue, 10 Jun 2025 07:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=q4EJgiUp92vu1zHPA6GQU9zLvMeJ1Z3QUyG1T5e79GU=; b=
	Sko1jgjrpXpwRdtcEggBuj6XUN1STBRtzO53J+2DE18Vlhl364uvl/QIOx0s7hPQ
	PK1vjPo5+6wn0xQqxnUFseAuvTNGF+d/5SJThsBNTu+q21deZADx1oF8VV18wmt1
	GUHgBeVLT0aWCwPXroBRmHp6f0Sujzx+3MmE5GRDs/9G5Zk0ksAhPEEBgYDNZQiG
	HMm0OtIaMXoPuU+3Z4B0Lo3oeeK+TIqQVol332hq2LVXdi+ic8fKO24HKUhdYXbh
	XoBaSlmTFaf11f8gf577P6mEaV2mT5lIRR5TC+biIKqJ8eI5ruKlgJpKs4kNbxpX
	RY/Netny8mIEa4XvIxyxHw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjty3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 07:07:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6aMIo020927;
	Tue, 10 Jun 2025 07:07:58 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvekfse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 07:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imm45+pxVvIB/CDfxmpU1ye5D+IW+S5AqCXZj8bsX1DazS8bhfUYwHqlsgLlUSQTbSewyBF9UlVVwjQOXmAzgzJ+A8XwEAyYu1KqcK6l/a+oUbY9TWqI+U1bIe3mD3F3tY+Dm++GUvNRNdoLZbo6cOgCLZSRNiIGh6jyIx72R2Gk4Y5TvUd3eFWmKuel00PHWmQd0KBTa6bekCvuqYYiGuDhyBFAH8joDfri3Lqui33GC3/WrgMSkYpj9IMpjPRGATMpna/j2kH9mSsA0us4p/YMxnGsSPbs2X5B6uc/wvmx3EB1PuorQBIz5ngeAPVHJ1ws7dxARHBQzPfp1JhaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4EJgiUp92vu1zHPA6GQU9zLvMeJ1Z3QUyG1T5e79GU=;
 b=VNxm6wotdt5tU94yIrhEhOtn//hwJqfigWVh7hEMIpGSil26vn4iS2qU7s1HWBn9C8u1XYn9CUW3nR1njn4TqVZaArpEEqJ+SaqO1+81pRwLFw2fRDnuVHlbes4FJCyvCv3vtLCsW/o0HN/vdNSk93W71dyJclaKZC4+Z7h7AEhaXXhTopk3kk4jfwTJbSTz7EryP1axAX5dDuzA5I8TXRVPZBo5NhYHpLxLLQiPR0/D1lvSL9l3Fqe3NYHJKZ27vu3ApHxY0Yea0wzQZZ1/M0aiNf23Z3uhtxtmHP8/CeUHlFjbaR2yc6gYUa+woIb13TPlq+AS0jyk6S5MwLkU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4EJgiUp92vu1zHPA6GQU9zLvMeJ1Z3QUyG1T5e79GU=;
 b=HmaVLWeGjYld8NML0NSS1D7bmnpurB6UqN9zvk7KoBKaMxFF4wbv7jTKqpNvMoyA0okoNobQI1d2FZMUITADqQB9p9zkN02hZCGiAVVwj9Md9Y3twtksIOogWPnik5dsgdv2FbxXMo/Hw4XaH3XjR8syBtQbQejZKsBYmOzVxtE=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by CH4PR10MB8074.namprd10.prod.outlook.com (2603:10b6:610:23d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 07:07:56 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084%7]) with mapi id 15.20.8813.018; Tue, 10 Jun 2025
 07:07:55 +0000
Message-ID: <d52b6b3a-dd18-4c8e-b7f6-5ac0879d959a@oracle.com>
Date: Tue, 10 Jun 2025 09:07:46 +0200
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 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
 swLliy6PdpST
In-Reply-To: <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|CH4PR10MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 89100591-4eb6-48c9-3ad9-08dda7ed85ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tm51N1ZRb09oYWhtSm5nRkhlV2hsQ0pzZ1pscFR1WURuaFBETTJQWnVmNUg0?=
 =?utf-8?B?UjhnUDVZRXkreXUvc3AyQytRckNseStCelg4d0lmMUtCV0pySFRrS3U3aHhX?=
 =?utf-8?B?ZmxqSndVeGNKdVl4WnJkenB1NzhtaDhoQTh2TnZEdGsrcUJYWUVMTXBoaDRq?=
 =?utf-8?B?aEpNNnIzMWVtL3VKZENWdmE0bjJrb3ZpcGFaZitaWXBTWjdzWnAvcTNhWHZG?=
 =?utf-8?B?dUw0Q1dMVC92TzJrK3FnUnZxa00ydHdBZmk1WG9VdUl6clMyOExGLzlseUh4?=
 =?utf-8?B?a2tkNWI4VzBTWWR5RmlJNVVOakhlWDZTL0lIU0FVVHV4Z0FpcStUMnlablll?=
 =?utf-8?B?bWV6RnpXRzA1N3dXM3IwZ1daMGh5T3RmK1RUR2Zad1lqRThUSVFhR0V6MTd3?=
 =?utf-8?B?N3Q1TUY3eFhMaUh5MHBlb2ZDQW9kd0lGaHJzSG9LcWFNYVdBWDQwOUdWdWhQ?=
 =?utf-8?B?Ujd5ZGFMblhWWm14TnV1Y0g0TS9GSmhaKzBoRkxvRHlncmQyVXVBckJiY1VG?=
 =?utf-8?B?VkwxYWkzZTlNYnNJK2tacW1PU3BGZnVlUm96SjNWNUEvWk41NmNoQmxXRHh6?=
 =?utf-8?B?dXNQMHVMTzBGUi8zY2F2RGZqZVBKTm5YOERTT0ZsOVh0aU93MzlZNGpLRXNX?=
 =?utf-8?B?d3h2dlppc3VmbnZSbTB0cW9xVGlOQ05aa213T3djS0VWWFRocFNyQmtLdzZY?=
 =?utf-8?B?NHBuRFNSb1FHTGxlcGJjTGkwN0MyYkFvdDBJenllditVZ0FWVjhwNEVuTUZj?=
 =?utf-8?B?WEJTOFVyNzc3MW1Hclk5WWM5TU4zcHR1ZE1LRUlobWdzWUlHRzJrUGJTU3l4?=
 =?utf-8?B?dVNlUWIrZUpnSEhacE5rY3pMZjEvMHhJVG1UbllyNXVBb1JneFV3blcrQlFG?=
 =?utf-8?B?ZVNwamwyUFlnbEJUVXRWY25xUi8wT0NHOVcwZi9obkZqcVhUQjZQSWdObFZY?=
 =?utf-8?B?M2pSbU1iWCt2TURITHVQNHlVaEF4V05wekQ0anZvYnV5bDhJV1dDV2FaSVNQ?=
 =?utf-8?B?djNmWXN6ZmltTml1VjZ3Qlp4S1RGd2lOdzRwdGF0aGJ5dU9XTEJSdU5TYVRR?=
 =?utf-8?B?QVdsRG1GMDdYRDVlZVhFTjN2eVdDODEwaDJqMVdwN05mMG1XVndhK0Z6UXlz?=
 =?utf-8?B?dEtXMEFvQVk5YmFTWElnVlhBZWg2Rll4enNRbVBnb1cwTVhOZlZEbkN3VXB4?=
 =?utf-8?B?NmI0dlFibGNoRXR1NE5hZDVjeGhVZkc0ZEtIWUFPN3NQOS83WDRSN09rOVlL?=
 =?utf-8?B?Y1VmM2lORkJ5QnZ3WkZrd1hkRUs3elZMdS9IZVBZVTc4MGdPN0loSjNmdnFy?=
 =?utf-8?B?cHVQalFobWd0UXFuMHM1dEVLMUxuQVVVQ3hkOGdia1IzS0FSQmdDQVRwMFJ5?=
 =?utf-8?B?MzhoWjM5Nkd3Q2kyeFBQMWxYWEN1UkxGTno5cmVEYzNaNG03NnB2QWNaTzZI?=
 =?utf-8?B?ckJZcXdTQkF6S3IrUWlTMlQ4U3FSOEN2czJ0RlNaT1hIbDBQcjA3OTlBZmor?=
 =?utf-8?B?emZLZW4xQ3daV1l2eEkrYVZwbUZ5Uk5mdE9qbVN3TVlPL2N5RXByL2VNWTBH?=
 =?utf-8?B?cFlvdlUweFRBL3Jhb3oweU4zZFdoRFBaQ2xCUXJqOWNhMm9GWkh6MHRuQUVB?=
 =?utf-8?B?NEIxcUVIMHBFWkVJbGUwaHBBRlBQR0RxYlBNckRQSmpUOG5PRXNSTHhSS0Mr?=
 =?utf-8?B?TnRuZDRWS0w1aVdubG5EbFhXeENCbk4wWVQ5QWdSc3N6VHV1UVdUVXcyUytD?=
 =?utf-8?B?RzgyTVVkQW5CQmFsYkN3WkkzWnBYL3J1NTA3VjM2aTNibEJtRUFHS1NLMU01?=
 =?utf-8?B?ajRRaHcrZmlSdjIrUW4zQncyVXA4MlhpUXFRdk5LMEg3SzNvWDBSVWpJemN2?=
 =?utf-8?B?dGdoTGZiU3duTVBvaWZqZFBKTEJ5NGtnQnpVVnNVeEJiUzBHdk54Q0xUZG56?=
 =?utf-8?Q?JromBz438Og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWJZZ1pyaEJPT2s3UGpDblppMDV5YTNXdzdFZGpINk0xanBPQWdJbitZNE1G?=
 =?utf-8?B?YkJXeFlrSjE4dTJZc2dqa3gzYm1RSng2dTdpNWtzNjFVQ0o3dmFJaXZFUU9W?=
 =?utf-8?B?K3llWE1UWm14L2p4N0s5ZGhFbCtnVktKWXpMb2RUZUlpS09BVHhlUStBWVQ1?=
 =?utf-8?B?ZmVab05GRDNiNzFIM1NsNjhlV0RwQStWZVd1ZFd5czM3Y0ZxWXhOT3pmZzRM?=
 =?utf-8?B?eHg1TEpJcUZzRXQ1dU54c2grOC9DejQvdHJlbzBhZEM5L0tPdUZwL3ZHMHZo?=
 =?utf-8?B?TXJsVElTMjd2aElnZWZmK1JLRGtvcUd5NDlRMU03YjJZRVQ3TTN2VVVQRG05?=
 =?utf-8?B?eGFrU2wvWGRsbkZOSTFTYkdiV3dkQXE3eFpXdGI3ekZUK3dIWGFjc1NGb2ZN?=
 =?utf-8?B?elQ0UXh2QXd3a1F2TTBRUEkrMk5KNzI2YkVQVU9DR1Jwb05Nb2RqWmdBUUdI?=
 =?utf-8?B?azd3Vm1haWxkMDV2dElJSk9nK0V6TmRxSWtJL3I1RG9adEVVYmxET3F6NFZS?=
 =?utf-8?B?TjcyZ3prY1E2TmJSdTdmSGdoWllqbHdIVURtSjJiYURZdHB6aDEwR0JzM3lJ?=
 =?utf-8?B?ZEQ2eU1vMlVOMjllNGJqYlBWbDhaOEQwN2kyU3FFVFpRRFg2d2hzWm15bzZS?=
 =?utf-8?B?LzlZdk9STGtPNzlyMUFZa0xwaXRmZHluVU5aMlkvaUt0SnN1OUViVXhrZ29C?=
 =?utf-8?B?VVYrLzBYek5ORW43Qk51T2g2Y25KRlJMUFZBYWZKWkVMSUVjdmYxN016Nk1Z?=
 =?utf-8?B?L1dPdi9FVnU3djBZOHlyODRvUktjZE5PRlRjWFFRZmR3QWhKUG5ZMzFOZ0ZP?=
 =?utf-8?B?MWh0RE9BZm5zcmhoSjB2aWJOWmdVQXpwQzdIcEhGVm8vc2ZEeWRpbDFNRmdn?=
 =?utf-8?B?WXJIcTZVSWgzdVR0eUZiQkxocUpTVThTT2R3Y3VJMHM0a0F4QnhvWHRIRnhB?=
 =?utf-8?B?b0F3am1EemV5R0ZEcy9LNlFBNjRRajFnNjljMW1SUTByRWVlM2I1YUlzbDIz?=
 =?utf-8?B?c09NalZPcGFWYVYwNmJBNzJZaEVmUkFhZ2NrV09kangzUGRlak9GcHZFa2w1?=
 =?utf-8?B?b29iZkswNzB4NklodlFaZU1rSW1ucHlNT29CS0dpRjdZcDQrRW84VW5Lem90?=
 =?utf-8?B?SFBJczNjbTM4M3k5MEo2SzdQTVJhenN4WHgreEFvUklOTzBaLzZWQ0VJck1B?=
 =?utf-8?B?YjNKQVZNSVJKSXp5OEVDVHhadFdhbERJelNYQ0N3Zmc5N0NhaUtmdVhKZjRl?=
 =?utf-8?B?Um96bXNEV2ltQi92dkU1a3dxSkxqVndMUU55STl1Q1ZHRjF5a1VuVUtuTG12?=
 =?utf-8?B?bHI0WVFRSjhTemZ0YVdFSnF2U3c2bEt2c3hpTlA4eUZucFBXZ2UzcEFWOXpV?=
 =?utf-8?B?ZVZ6WTQwSjVPbDh6SWpkOGhtaWJQUGZQbUtuUFc0Y0lJV2JLRjE1UlYxVjYx?=
 =?utf-8?B?WlBVK1N3b0cwaTJRcVFSRFlnK08vMzBHOUpub0lQMmdkdVFOVm9XbTBjbEdz?=
 =?utf-8?B?cWI4b2J4bk5RTGcxM0ZmaXV0anBjNkpNMGlHbkR3dm5CcVpIZEJjd250Vm1i?=
 =?utf-8?B?SW5VL3lSZkNYZHZNZHNkdk1mS1ZnamkvNXU4UGV1RzlVZy82a2R4NW00dW5D?=
 =?utf-8?B?MmU1TjNDTzB1TjM5L1ZnVDlyOVRUWjRWS1VaYTFweGJVRmx2ajl3ekp6UGd4?=
 =?utf-8?B?ZzZ2S0tKYXg2ejRhcUdvS0xFM2JMUWhLYnM3aFVsV2t3Z2Ixak9oQUV0S2Nk?=
 =?utf-8?B?ZmhnSDR0amNIMDlTWVE5bityS3l4ZGxEb3NIeUZsUGRiQWlqK1Bhd0R3UVAv?=
 =?utf-8?B?elRvZnVxdG9tUmtLUEJ6ZW1yRXR0YU1QL0l3UjRoMVo2Ny9hMlEyREY3R2Fk?=
 =?utf-8?B?WXIzMmpKMmoyUC9SRVoxc3RBTWROMVUwTEdOWS83TkN5NHFMYm4vSklCeTl2?=
 =?utf-8?B?WDBmeEtlMzdkWVVKa0FsNlhjUXVBZmoyUUNBSnVwUmNYYmx0T2JIMEtJZWxH?=
 =?utf-8?B?NkxzRXJLUHVNc2FaNjY4amlpQjR6c0JBaHdkc0JrbXhJK01tbWw2eTY1Y1My?=
 =?utf-8?B?OTZiN3N6d3BCOGpTaTlYNmJ5RHhrTTFLaUh4cmRLL256dFRBOEswOHZicTNO?=
 =?utf-8?B?MHBvQ2wyVFE3NE9DUXJhZ2phOVVab3gxRzQ0Ym1zemUzOCs0Ry9HVDIzYTJG?=
 =?utf-8?B?WVo0RVZEWGpDeTNYMXlpK2ZQUnMzYXY4Uzdhd3VQQTVqcVNjOS9YRTlDeVVM?=
 =?utf-8?B?alNxZ1dxZjFERlR3N2NydVZoVzd3PT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7mwLgfoVOTg7t5MD4Kvh4yDsoGUL4b+QkV8pY1RO20d5E1s0w8a866G+tSmL3Hsi8DJAY9+metHpWao3IRQkZD5pZaTXOjZQshNp1/a6kZMfMHq9HGJwtgPUdvmOtCvGmrLDveZ/T3nNhUIP81M6nCa8Q6a/+ZwniKy7O9lkomN3DlhsFNQ1RqSwo1K3Tu1A9V1YTjhmvUSW36JcIjzv44aZMqXvdwWLwg9tqScu+dV14SRodNIwdfddZWInSfNwwZIbTk1+Psd/Iw16yo0f6X5WyDbN6S8oorC5RgLbRQFcQ40yNQjjuSt/KIc5edx0FWlVUrwE4Gm9+Q3CNl4onJIyG1NB3vGMxrrhALrBkdKueaXX+lYd1yV1S347LJPpurMKDkJZ3IdNL8zADK+QbIOUQPtlADv3sUKotG0knrlTONBeWWW1d+a6eFtp80ftPmqGiEK39G9J9e90KwSVvk0X+y0De+CHJ0c8LHS1rFFhoUnrsRQsx0vg5Y/JX8j+IakdjLAlnYIl++e0XSJdGvX6n8+Qj3vh479G0lO8e7UzjJ1SiUBVb1aQWLVeK29ak/1BytA4S5jtS8B6bh3dyIgndH8aXpb1JOB5YDd6sY0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89100591-4eb6-48c9-3ad9-08dda7ed85ed
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:07:55.8592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHOnzq/P2DajyuVitBc2Jbo+/uReR3ZPj80xcRYhNuTb/a+kj0nvyaAhs6S4gb/Mk5kk+9KjaWb+YkAkHQjzVK3bd2sLHYH3Rfoyvgf8sEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100053
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=6847d9cf b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=hByXpUN8GbXz_SXqzeUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1MyBTYWx0ZWRfX/HYCFshvSQ0o t0VYqMplpSH+GitJmXfUFcR6OvphOTMdZXEZFJZ5XpUt40Xf2MBuvy2wp2s07w6UqTsViEbZ5d/ /JXpi9eP+VUyQHEXM+Fggl08Xbpy7c6vSr5mNx9RZL2gFR7k/BHa8k9eKmxYouN3T9YCo+Vb/GS
 cL2yexHEvpC2vEfsDjcNm6WXz2CVr92O1btVZW9o8Muex+0Z47MdpDVkNxoP8+JXWZmqH8AW1Sj qNZULdLFrlomOC2NA+iAS7JsjJ5WMLkkUDbGf5+jdZEDxRzBYGSGU1CdjrcN524uOCV0/lmbSyV fgaMK4CPCv8mN6afcJqPgKY6puPDEKf9oM21wZq4mxepGLbitXTVB/HaKfrY720IV9OsgwW1ZG1
 08Dz1Z7hKx0dJqBKBQoLSHRhpG/CQmIQ/fHNeGnuH3jFAVZauf04AX0MdoryIGiZxSXAjljk
X-Proofpoint-ORIG-GUID: OllxLgofYtve3H4wNOHhdqZ8sOln7aEG
X-Proofpoint-GUID: OllxLgofYtve3H4wNOHhdqZ8sOln7aEG



On 6/9/25 20:31, Josh Poimboeuf wrote:
> On Fri, Jun 06, 2025 at 05:34:27PM +0200, Alexandre Chartre wrote:
>> Hi,
>>
>> This RFC provides two changes to objtool.
>>
>> - Disassemble code with libopcodes instead of running objdump
>>
>>    objtool executes the objdump command to disassemble code. In particular,
>>    if objtool fails to validate a function then it will use objdump to
>>    disassemble the entire file which is not very helpful when processing
>>    a large file (like vmlinux.o).
>>
>>    Using libopcodes provides more control about the disassembly scope and
>>    output, and it is possible to disassemble a single instruction or
>>    a single function. Now when objtool fails to validate a function it
>>    will disassemble that single function instead of disassembling the
>>    entire file.
>>
>> - Add the --trace <function> option to trace function validation
>>
>>    Figuring out why a function validation has failed can be difficult because
>>    objtool checks all code flows (including alternatives) and maintains
>>    instructions states (in particular call frame information).
>>
>>    The trace option allows to follow the function validation done by objtool
>>    instruction per instruction, see what objtool is doing and get function
>>    validation information. An output example is shown below.
> 
> What do I need for this to build?  It wasn't compiling due to missing
> bfd.h, so I installed binutils-devel (Fedora) and now I get:

That's because of the more recent binutils versions, while I have been using an old
one (2.30) and some functions have changed. But tools/dis-asm-compat.h handles that
when the appropriate #define is set.

Below is a quick fix (tested with binutils 2.41), and I will work on a proper fix
(by using the tools/ features to check the disassembler version).

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 00350fc7c662..300ea727e454 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -36,6 +36,8 @@ WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -
  OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
  OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes
  
+OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
+
  # Allow old libelf to be used:
  elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - 2>/dev/null | grep elf_getshdr)
  OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)


alex.


> In file included from disas.c:12:
> /home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h:10:6: error: redeclaration of ‘enum disassembler_style’
>     10 | enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
>        |      ^~~~~~~~~~~~~~~~~~
> In file included from /home/jpoimboe/git/linux/tools/objtool/include/objtool/arch.h:10,
>                   from disas.c:6:
> /usr/include/dis-asm.h:53:6: note: originally defined here
>     53 | enum disassembler_style
>        |      ^~~~~~~~~~~~~~~~~~
> /home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h: In function ‘init_disassemble_info_compat’:
> /home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h:50:9: error: too few arguments to function ‘init_disassemble_info’
>     50 |         init_disassemble_info(info, stream,
>        |         ^~~~~~~~~~~~~~~~~~~~~
> /usr/include/dis-asm.h:480:13: note: declared here
>    480 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
>        |             ^~~~~~~~~~~~~~~~~~~~~
> make[4]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:86: /home/jpoimboe/git/linux/tools/objtool/disas.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [Makefile:65: /home/jpoimboe/git/linux/tools/objtool/objtool-in.o] Error 2
> make[2]: *** [Makefile:73: objtool] Error 2
> make[1]: *** [/home/jpoimboe/git/linux/Makefile:1448: tools/objtool] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 


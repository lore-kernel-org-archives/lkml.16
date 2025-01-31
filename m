Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD881CD215
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336115; cv=fail; b=sl/Uw7E3YzDyGho/S9O8u751rySx8q3aqfdcy0nUrvx/KPrVEKLcrTw/g4+kuV37qoISWwSthoKmU7bP7nW4a6YyYRUsriWUt5aDjO8ck/VYbEYLgbPWWt2KLNbbK6mg8nScqHnk8QkjCfGdcsX/PV00fRNqa5rYRIuAnbtil7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336115; c=relaxed/simple;
	bh=3TZ0YxvbtTsrD8/vrWJK8aSEls+HEjxMI06e7sZR8JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oNB+F4nbcnXsdTF2TmiaccLDCF0mFWFbc88HtlIhKIUPXThE4Frm8rW2w4p/IHvEMxeyRiklx9/eIgAdnS2ZkU7ULg61VbwEK4AXoKaltwCarxeuXjxTiA0p7eUu6uNwNeOpwoVos7GbCGou0eTzCm4omy39DfkQ3DI4+66/fMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a+ygeiDj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gCQztyUh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a+ygeiDj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gCQztyUh"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDcawB005931;
	Fri, 31 Jan 2025 15:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=620CRbA4XcfDOwZdiKotyXDkC7koZ2/5JTV6vRBRHiQ=; b=
	a+ygeiDjA2UXc5rKQJxqezAIOw5HLfAO3kr4vl/rB9jkFaRLJyaN28ICygqgQQQj
	pWNddXXTqN5wkKkCVX1kU524iamrKoADSze2LcJAAq7eSVTIo9S+HHFCAdmMJ6w2
	ab3s+5IcmTlCa8A+b0dMwjPx0wa3BZvfHBXw17XsjrSIocqDeUygq3TNCWYzfEeP
	tGJi8YrPnbfpnsw+uLnheHvyHA1arc2SNkAZ+EDyJbKXWPruv41c/kxLa3hpqrB4
	lCNkDbS85ugFFi19KZMMw2rZHb4EKm5xpoRAm/e2Ja7zgn3+Ix7niYwfGyujw6Ap
	vs9AQj9WtZv7/HhcyC8Szg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gyj7r644-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:08:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VEpG7v022375;
	Fri, 31 Jan 2025 15:08:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf9396rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyevjnXfyLXY1j8Y/kGQrooZ1J/3Q92FqlRDPNujmf9Uy8UHumgEIcYXF2YfjUVnxivlgdpmaJB6TY1+sBBstZhTd24BQcDQiqKTAaCHUx3F3cEQtk49HNCvOy5yQLfXFVa+Xd4rP8YsTSCY8850BvAzX3oqafq8clLAYZ3A+ubZEUzjDyoC1niNV0HCoHkPeNqle4sFBFg5kLNJuQjZggCGwS4GzUJEbSG+CFbyzyF3FGnO2DSibh9xxddg70BvjkENnFb70A9dMKj88XkaADAI0sb436If1l9pjRiaLmL86IRPWFJnXTxmTtGgH8Y1eeXwd5jBcT9aGE0ko3MnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=620CRbA4XcfDOwZdiKotyXDkC7koZ2/5JTV6vRBRHiQ=;
 b=sVw2SO/nDTN2Bl3G1Jlsr0OZiDylnSfmaEFUUKFoH1hAGePkBbx4PwaaETQx6KGVXiwWGLq1VoxLx8iu9ysURo1Gprj17Bh9gy6H5d6gL2hATHUgcG4uDTCnAKdkPcVnpS1N2rTV3SiI11mo7Hs8UkKcs1TzIhmGRQLQbTiCUDwDCbNyzrWntNBhJsTzGkAGsssjDp97zMKU4b47itghxr9bf4qUfQZUeLP5cliFNRiEc3JRq5/mN0izFqKZOQk0T7qEXG3p1B6xbzokgOWfNC1BO4KgDr5J4PC+qJKlujmq08GFMwk7jQ7hH8aOt0JgreI6NdxkHUSlobUZE2ZMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=620CRbA4XcfDOwZdiKotyXDkC7koZ2/5JTV6vRBRHiQ=;
 b=gCQztyUhHLcnM1A748pMiCmHB7/JSa55ZIvOeAOMBvQcvUSjLd8mqeR5E6cIWMG8QzRCiuILarSZtyPntrVesj6CJgny84uz5jt25VqGdtHAI3WZ87FnTo6weO7UuobowEUY8/IZ7BM/uaCmG8pQ6+OfwEbYUsyQwg9cebbLOmM=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB6459.namprd10.prod.outlook.com (2603:10b6:510:1ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 15:08:03 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 15:08:03 +0000
Date: Fri, 31 Jan 2025 10:08:00 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Scall <scall@prosemail.net>, Andrew Morton <akpm@linux-foundation.org>,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is
 larger than 1024 bytes
Message-ID: <troejyyno7oiokx4njv7cbahwhkvkovlopj2igwlsexxqmrmaj@f3cjalwkpvf6>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Scall <scall@prosemail.net>, 
	Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
References: <60cee319-4914-4a98-b74d-32e06fb3cbd8@prosemail.net>
 <hxxufpccovvtnoypt4bukrpt4qrhiydlena5tdxqdxpmlduiii@2wac57fy4mqj>
 <8415a24a-a19e-46f6-bb56-dfd529143dd9@prosemail.net>
 <20250131133735.hq6kwncyb5uibe7j@master>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250131133735.hq6kwncyb5uibe7j@master>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::18) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: a64f0801-5552-4797-a4fb-08dd42090f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akF0a20xeUw4cjBKRGNWdzB5ZVptSlRKL0NQcTN2bEdlQmw3c0JEWTI4L044?=
 =?utf-8?B?RW9kSWlZTGJKY1dac2pYeHdiem1IdGdINndjU2JRK1p6YTgyUlpSV05xcFBQ?=
 =?utf-8?B?QzZzU3N1STBoMjI1bmo4SCtCMzFyMk1KRHF6dWN4QUZobUxqeHJ3QWJrbGZw?=
 =?utf-8?B?Q21jWGNXL1EySHJJREJ3SU45YXdPanlISkVTMDFtSGFENVU2U3dMSmlPVXl5?=
 =?utf-8?B?RlQ3Y1JqTWJoYklCSEowem1ORlNIU0dnOWlzOGZUU1pPZC9pTXdFcXZQUEhP?=
 =?utf-8?B?S2FGTmZ5eWJwRHZWWllDeS84Tmw2YVZOZlhjejQ4NlRRY1NFbytoZ1pScWtI?=
 =?utf-8?B?Y0FlNy9JS1NZYXJ4clpNeUJsd0lYT2FPcU05T3VYamVWV09lUml1RmJ1SDhT?=
 =?utf-8?B?UkRFMkJaYlBTb3U2ekRSYkNFVFEzUXBxelpWczZtQXdLZjJwejluQ0VlNWsv?=
 =?utf-8?B?dmlpMndDSk9tbnB4dXA5RmNKaTE0LzdkeEwydmcxOU8yOHVxdUxTUU9mV0JE?=
 =?utf-8?B?NGpQTGdnQWFWdnpkS3N6UHcvNjNOVk05TVBaV0N5NWc5cUF6S3dHZXN1MGNx?=
 =?utf-8?B?eGk2R1BUYnZKVkR4dmRIRnNDams0YUkyTUNmM21Tbnc3OFh2UGovaVo0Q1My?=
 =?utf-8?B?NnNYRFU4NVJUYVFwOEFBTno2KzMwYkxkTGsreUVXTTZxSk9ranQzL1BBSWV4?=
 =?utf-8?B?ZzIybWpMeGpyMmZvS05kdnZNMTB6eEsveDJHNWoxd0pGZ05wZEx2bHN1WmJh?=
 =?utf-8?B?dGh2RytnUkllcSs0MkszdnZIbGduVWJkU3VaZDNIeUgrVXVuZDJjbkh4bFpy?=
 =?utf-8?B?N1Y1bVhhZTNhMkt3ZTVrTlM2dTBHQ24yaXNUTGNhVVU5NFR4TWptUE9NTzk1?=
 =?utf-8?B?T3JqVFJWS296elpheUQ1UXM3cE0ycllobHIrMjZIR2dvS1hWT1pQcDVGUmVl?=
 =?utf-8?B?djArSW9KYkllL3FYTmxwWEdxR0IwMzV1OW9QZVI5RDJpY2ZkVmY1eVdaTUNk?=
 =?utf-8?B?S3k4UGhoRkY2eGZnWGJ5M3ZLQWNzL2lTM29lNW5yZ3EzbjZWWVhPdjBuNG5N?=
 =?utf-8?B?VTVmN1dqdDZQVnJCUjQ2RTVCdHJEK1pqUzh4RGZkSFpNakZ0N0VYVlI4elhB?=
 =?utf-8?B?ZjlEUEZCaE9mVnFzbnlVT1Rnc2w4UmM3Y2t2c3NNVmo0SFFrb0UyNi9ibGJU?=
 =?utf-8?B?VC8xSEpEYkxYd0FkK0FSS0Zzb2wyYmcvRGFjQ2Q4RW54czFBc2o4Q1VoZURS?=
 =?utf-8?B?SzBjMmlpWnhReUx4THZ4T2tqVk5OZURxTUF1ZUVBYkl4YThLNC9IYXR2WWlJ?=
 =?utf-8?B?VGJWZGU4L1BiTmIwbG1GSC9zdkpVYWV6aG9TOFdZRzNOQ21CRDNXalN6QTRj?=
 =?utf-8?B?RzN5bEFDazdqRE03eVhpNjVTcTNyRkRUN2JOOEpJSHpVQ0RRZmppWnQvZUht?=
 =?utf-8?B?dG9OdkxHU1NuUUVpWm9XVGtucnhPY09LVTBJQ1FnSVZIbWc4Rm8xeWZsblFm?=
 =?utf-8?B?dWhJTXNaZUhSQ2Ezck1pUzU1ZGpNRWsvc3FZNmVjT2V5NE9aeXIyOXA0enVJ?=
 =?utf-8?B?azhSOTdkbWVnak5GZ0RBcU5PS1R5ZW5nU0VWRVNmR1BlN2RFcFp4Y3MweDZ6?=
 =?utf-8?B?NmV2Rm1Mb3Zsd2xtOXhuR2FIOERCYjVTeU5EbnhISjBuRUM5T09ZV0JvZGRq?=
 =?utf-8?B?YjZRZmVlUmFqTjhaaVpyaXlqU1dhS2RndUVpQnE2OGp5VVFicEEremV2V1Jx?=
 =?utf-8?B?dFdrYXk2cHhXVjU3dFJwRFdocExvQy9mV1p1dWdlclZkbHdYUGJmbTF1WlY3?=
 =?utf-8?B?OHl2VXNnVlJRTXQxZTlYYThvYWJrZDdYbVVzTTZiUkczaHVmcDcwaXFxRnlu?=
 =?utf-8?Q?UVSY6z39oZQkP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajF1eGRaOGhFSm9LZW50b2pCeTV2eVlScTFFeFhPUnNEZDlSTDlpYU01bHFa?=
 =?utf-8?B?c2dyUXkrbXpwQzRmN3pxazRlejhVT21PME80KzM5TUlJZlJNT3JpQjJOVjV5?=
 =?utf-8?B?Q0JLemZ0clFGKzNGVUlBb1l0MFMweTdLSisyR1ZYSm14dGZCcU1FRE84MXRp?=
 =?utf-8?B?aDBrZExMRDRHbDBZRDlkNDlJZWdzSTl5UU1jaFBLNnFTU1RvS1RuMFBsVlFV?=
 =?utf-8?B?WjdLQVBybW5MVTgrVE41SU9EeFJJZ3F6MVBYbnVhRHA1UG43N0p2TjlPKzNI?=
 =?utf-8?B?NDBSWkdiRHN5a3lHM2RLRXBLKzNiT1VGS1doNlJ2S05XMkRQMEZmSHAzT1Ba?=
 =?utf-8?B?M2lVSVJEZ1JDbWhpbW9BbzBjdDRVcjFHU285dVZvWVBsZmhCVW96V0w5THpk?=
 =?utf-8?B?QXNtdittbmtGMEgyTm9Lanlud21ocnpuU1l3c0Ftc0VWVHQvRGxGTTI3MXZt?=
 =?utf-8?B?amI4cG1RRTg5bW8rc3pyT2NXOWRzV3lkNW5MSk16ZXlpUHR5SjlnMjhOOHJl?=
 =?utf-8?B?eHRvQWxuUjk3dDg2bnhvaFIvVFkxa0lQcUY2YXh1WE9qWFUxMDJlSC85c1Jq?=
 =?utf-8?B?emlFamJ1WXVXREhhUWl1NGxJZENYTXVpTDRLMWNFQ3F0Q1VSdVRNM3B6a0wy?=
 =?utf-8?B?VHF2UGlOQzNqdk02LzFId0oxek9lcW9QZWpFYm1JV1A2LzFGWWFUWUhJcW1y?=
 =?utf-8?B?dksveFNNM3JYazFaZk5NaE9nRkZyVk0wNi9qamdOSlplMFM2SUEya2Q1UGZW?=
 =?utf-8?B?WDg5R0xhR0V4N24xaWJnVnVVYjk2T2x0MHphZWFRKzFKQXIwa1lpK0w2czZn?=
 =?utf-8?B?UTl5a1dIb250dEdCNjBrNmJYR1U1aW5URHU3Y1oyWkNuUnJqaUZ4bi9EVVYx?=
 =?utf-8?B?RTJ0SFhXSjBPU2VXelFFVmtuUUcxZlNRNnA3UzRGTVFMbzR0R2l0SGJyUTFa?=
 =?utf-8?B?YXBtaG9vaTJtd29VWTFOeVNwZlpxL2dIZDB4OU1WNTB0a1lEUHpBZjNsbXpq?=
 =?utf-8?B?TzhtcndTUHc4aUR1S0NVT0tPM1Q2d2xGZjkwaFMwT3dPalJsRFhjMEdhcE1T?=
 =?utf-8?B?TkFPNWxnN2VXT1lURzFLYmNiK2d2clhKTWFmUG0ydVczL003NkFUcHIyNnhi?=
 =?utf-8?B?LytxRkxIWmJDaS9tTWRZb2xHT2lJZ0dYZ3Z2WDFiWmJhNll6Wk9rWUp6bUlt?=
 =?utf-8?B?MVRwYmptSFRac3F5RGZNL2Fvb1M2WjF0UVlMcnNtNzhBK0lmSGtIc1Yva216?=
 =?utf-8?B?YUxncm5FbnRNazFsZmdvSW5oRWl5ZFU5a0VKd0IzRVNoSU5qOUtCanFLNjhT?=
 =?utf-8?B?ZFUyQk9EdXV3THpzZW5jajE2RkNscWZxK0VVVTRTOXFMRkhyQ2tNWDBVWG4y?=
 =?utf-8?B?Y3ZUSzNLM1o0S2NKeWhwMEFQUVMvRzVSenZoYkJqajZvOFR4MzV2ZG5JSjZp?=
 =?utf-8?B?UHpFZEMvd2gzV3JocjZ2QjN1MWU4UDZURVVsTTFaQWJ3dElwYS9lRjIyRzVK?=
 =?utf-8?B?bG10L042ZHBDVFlLSDhRQmU1RGovQll5Q2pPRjRndXlONkFVcWt0a0U3QklH?=
 =?utf-8?B?Q21heXlIbjR3V2NpRGNvNk5JcmpMTlAwcUYzQ0Ric1NNUC8rRTcrdmx1OUZr?=
 =?utf-8?B?NFVaQk9NM0pXRjdIS3d2aGpqaFRQOVNiWWdXbFRNeXc1QlFkSUUxa2F0aW44?=
 =?utf-8?B?bmp6ME1XK29lSUUvbWk2OUdPWmx0QmxVb3c1TVBveCtmdVZYdGpJR1A4M3Nz?=
 =?utf-8?B?VXJOWXA3d3pHdmZkTm1YbEN5dGVWWDN4cmt2TEtqUkRJMUhUMSsxQ3c1dkZP?=
 =?utf-8?B?UUpObk5mSDc3MUdTNGU0cTZCdWFnY1ZFS0Ria0tFRTUySUpZMU5vbVpiK09Y?=
 =?utf-8?B?ZENTMkdhUHhMVjJ1WGl6OHdVV054TWtsMzAwd1MwVmJUWm05V1B5ajRwaDZ4?=
 =?utf-8?B?cExhZ2NOWlpvVHRzanlKVFgvWGVLS3VaZlpFTFRTYTBCZlZ4Z2RXcnYxZkR5?=
 =?utf-8?B?UjJXcmZBL3l1RzZHRis1OXdrZHBuZnMvNHA5bWY3R3Q1MW4yK3ptcm4yUWk0?=
 =?utf-8?B?Y082OWl6bXUxU1NZbGtvcG1NbEN1eXdrd0tlclgvRExQZUM5R2hVUityOWdZ?=
 =?utf-8?Q?G7pTGbFasYSoqfv0w3LGhLHiQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MSrRQIgzSNQdjJMcERpfSPDW1Aq3+gRVu9B9MsHMNugghuQy7nl6zRPTpEpQna/OGRlu4dFVwV/xDfPi9+RKf9P4eEYGHt/EH39RSoGs/G2gAZ6FdkszSPcr7IRl3b4z4sbUsm5LoJomxCPtxO2j26YoCPnf7eYr1+Weow9ptqCLJLQeBKA+Dj/kgAX+xRV+JnpdTxyxxbriNZpGr+1S4oTH2qrGzxTBa1gSEM7CCe8RODstxjRu18jSFRGyxNy8vw340SOSFLvMysO3AKenEw73tKCBergC/dQpndTylJ5GwsCc8HkHiqkAXpB79J+uRmyvnl0p60h6DCQhabSIiu4ERxug35flq7FL5uwWPX8T8M+CQ2Q/7shgYqhy31W5yOtu3wXds/AJF8mgZenD1pzkUL4cHzzFkOYlF7v1slQyNVg/Vpk/hZTwQ2HB2B6+Q0X8mbVsGVkDPar1oQZFhsvxr3DE/z4/qWSTcWXJjfjmplgLFag5fD/25l5WbVlP7xeuSKl3EpbGubWkhyMFDvkwOlUyBr6mwfc9oZeUjjY0vRKUVMt02T6bLAEpx0NjClDrWufWph6kBBVYOQkgXxDyBi45zTNTXTuJnO5o0HE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64f0801-5552-4797-a4fb-08dd42090f57
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:08:03.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grI7e7NTpu70FhXp6z6RtAhv40hQiCnFvp/BSRBLxLQ5IN/5RmLdXTisUn9ktmj3AsI4rpzsFL+4aw9NnYb5pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6459
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=852 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2501310116
X-Proofpoint-ORIG-GUID: F6qTnz3soIHgWXUsLE_nWdJLjso7RT0v
X-Proofpoint-GUID: F6qTnz3soIHgWXUsLE_nWdJLjso7RT0v

* Wei Yang <richard.weiyang@gmail.com> [250131 08:37]:
> On Thu, Jan 30, 2025 at 11:31:50PM +0100, Scall wrote:
> >On 1/30/25 5:13 PM, Liam R. Howlett wrote:
> >> Do you have KASAN or lock debugging on?
> >
> >No, I don't.
> >
> >> Does the issue go away when reverting 8c7904a8cd0df ("maple_tree: i is
> >> always less than or equal to mas_end") ?
> >
> >That commit has not been backported to the kernel version I tried to bui=
ld
> >(6.12.11, currently the latest stable version).
> >
> >Good news: I learned that the issue has already been solved in the mainl=
ine
> >version with commit 5059aa6334fcf ("maple_tree: memset maple_big_node as=
 a
> >whole") and backporting it is the solution.
>=20
> Hmm... I tried to reproduce this and found different gcc version may beha=
ve
> differently. An old version doesn't report warning while a later version =
does.
>=20
> With GCC 8.2.1, the latest master looks good. Even I use -O3.
>=20
>     7004a2e46d16 2025-01-22 Merge tag 'linux_kselftest-nolibc-6.14-rc1' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
>=20
> But with GCC 11.4.0(I don't have the exact version as yours), the latest
> master still get a warning. But the message is a little bit different fro=
m
> yours:
>=20
>   lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=E2=80=99:
>   lib/maple_tree.c:3804:1: warning: the frame size of 1040 bytes is large=
r than 1024 bytes [-Wframe-larger-than=3D]
>    3804 | }
>         | ^
>   lib/maple_tree.c: In function =E2=80=98mas_wr_bnode=E2=80=99:
>   lib/maple_tree.c:4065:1: warning: the frame size of 1048 bytes is large=
r than 1024 bytes [-Wframe-larger-than=3D]
>    4065 | }
>         | ^
>=20
> Then I tried to bisect it. And found similar warning even at the first ma=
ple
> tree commit 54a611b60590 ("Maple Tree: add new data structure"). Below is=
 the
> warning message:
>=20
>   lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store.isra=E2=80=
=99:
>   lib/maple_tree.c:4047:1: warning: the frame size of 1032 bytes is large=
r than 1024 bytes [-Wframe-larger-than=3D]
>    4047 | }
>         | ^
>   lib/maple_tree.c: In function =E2=80=98mas_wr_bnode=E2=80=99:
>   lib/maple_tree.c:4325:1: warning: the frame size of 1040 bytes is large=
r than 1024 bytes [-Wframe-larger-than=3D]
>    4325 | }
>         | ^
>=20
> Hi, Liam
>=20
> Do you have some suggestion on what I can do to help?

No, this isn't worth chasing down.

The proper fix is to remove the big node, but that's really involved and
I'm working on it.

Thanks,
Liam


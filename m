Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D7185E4A
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746896223; cv=fail; b=rOHpCbvogi3MMkAQPQTV/KbF6zBm2SxOGnJp1jnhbi6+KbfYkTeHrN0c4og5EJANShjf9couQQowGMJskUn8iIY9YsYsYDT6a2G6mOMLL0cjz2ShGJAQhsmwKEhvvtWa+tvkNpRWcZ2lBlMd7TaEaEHm/8UdvZ0drgItfEPVp5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746896223; c=relaxed/simple;
	bh=82zpRh/K0bGt+4L+3Wek6TFs9fA0YM9WijHlJyifxY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o+q+kNIr8gcJ6GK8b9et3lBxfSnIoKcmqB0qJfextBLjsts/SkBmbct+lnyIFskTJ/CWObsUutpj8KxsDKAfDCVDxftqbSPaZZ0u0IPwj69WSKStxHcmVsu91SpEpyVSVlQkVCNCQ/bw2lCytJB48+Dp5UqOBGtXzThyDl4fmUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sQAwXbqR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GIqaq+jh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sQAwXbqR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GIqaq+jh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54AFwplS008135;
	Sat, 10 May 2025 16:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=o39a2hSltq9dZYXOSEpMPjly4thBewZ78ZZ17Io3xl8=; b=
	sQAwXbqR4jAKNrsJdoyhwVIWnAAdPLZYRD9VC3ZoOGuJU0mRMdHMw4llBHedaB+D
	1VdIfQrcBpjxJkL7e+y3wAtGM16mpGnqEEn1zylZwzmA6C222luHb2A7e0PXyLGT
	CpIkTU7uyJieHi+33xRKzi2MJaeVcYY6uNWGR3tLW16ZWg1uzB/DdZ15t+3JE29A
	BZhUYiA3dv17790Z7oZM5b2o0o61DXn7ucemxiTrwon8TEJDEba7l0s4YNBqBMGj
	ObuEnEOX/0mQYupLigUtxzIMrhEO+8//Oh3SONKrua9evQnZDAtz/HugKVaSElqI
	EXczFe+Yl6MpcVUkxDTMZg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j11c0as1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 May 2025 16:56:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54AGAhxJ036422;
	Sat, 10 May 2025 16:56:57 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010000.outbound.protection.outlook.com [40.93.20.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46hw863eg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 May 2025 16:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIOBTaTXYN7E/B9zsNLK3X64VtHEjsPDuILhQUMYhwXngHg394O/UlX4doFrqGdmABRNGgMnBtGqvAamPhDFAd3bdrFCLkrm93wjlLCWqMopB7MxWJMp/uhHsIls2st3QZGrujCPDBpDFOXFwet1xFxJC6AbgoLS2whcR3domcCGN78Wz4wkuE7cgxbjJC0z5rT60Rlv79xKeqMvAVaSr/Hs1hKeBqTb3tAFrgC66CU4gLvJZj9ZRSfE+R1aCAZ8iB27XG3ZmxzWQ08Z03L9S6DyCEIE3N3bZDVkDcI2L0vyPK2IXBnQvXzZT7LRxh/MRVWQfkHmnhjgAXpay2164Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o39a2hSltq9dZYXOSEpMPjly4thBewZ78ZZ17Io3xl8=;
 b=JulzTB2NHab7y5PPWjSIeYj6VJM8qkEQMQOkIpuGsfVKcCBxiiGav7ZFJazqWfHsze9XKrXJnnkeYSy8WH3BmGx1II+llNy4rVt81XD7i5hVbljxMJqZSMrgPOiQeRWl+/DFRiMrwHafDHoWpHFG7AdpnkbjzoQEGVvv0sc5HpF4B1xylVWnVIRpJu5KDcoA+o2XQ/wGzT0pIeJ8VF4k4PhDfSXFB09Q1pGDlmHcGqN7iwL4pC3uPCGXkrE+F52tiBQNUuUjKQnhuQ9PcM/jNJ1WO90+AY8t0CAHehCDby3kxnWAnZleczxGWeiemBsZojsCwqoE03Re0Vvu1RWAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o39a2hSltq9dZYXOSEpMPjly4thBewZ78ZZ17Io3xl8=;
 b=GIqaq+jhqjRmWKyPI+0ZvrJaSoz+NWmwjgVu1z8X7PMxG1u9gR7ZVoRnFDmEiX9PvvEXPtwzhHp2PSFcCLnMCVS/Y69Bo1ahKNKiB7SwaaSVuux07JqD3vQOJMbyO+cqB0Ys2uTDfdY7VJyoBnBh/JxZ0SUllmtEixYnOTdwTRo=
Received: from DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10)
 by CH3PR10MB7632.namprd10.prod.outlook.com (2603:10b6:610:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Sat, 10 May
 2025 16:56:55 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38]) by DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38%4]) with mapi id 15.20.8722.027; Sat, 10 May 2025
 16:56:55 +0000
Message-ID: <c1de8c0b-2640-4020-bdfd-8d09cb5a5487@oracle.com>
Date: Sat, 10 May 2025 22:26:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add vulnerable commits for few CVEs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org, vegard.nossum@oracle.com
References: <20250510161043.473006-1-harshit.m.mogalapalli@oracle.com>
 <2025051059-knapsack-imbecile-9bb0@gregkh>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <2025051059-knapsack-imbecile-9bb0@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To DM4PR10MB6886.namprd10.prod.outlook.com
 (2603:10b6:8:102::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6886:EE_|CH3PR10MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 813c0542-4fe1-4b14-4b37-08dd8fe3ab3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUpURlQ3UkNUNkpLbVVlWEJIQkNjRXFRSThXMnNyTWtPcGxncVJFbVhJS2M5?=
 =?utf-8?B?Tk9HaWo0anJ3QVQvWGE0emxFZ3NJMkFOeUxsbk8ySkd1bXEvcGg2ZThGaWdh?=
 =?utf-8?B?TG1jN21VK2l5M2UyV3k3S3dYY3VJcXMvQVlhWnZ5WXZxTGJBWU5ueUZjdld6?=
 =?utf-8?B?VHpWY1ozNUJ6bkljL3VzQjZWTmxNY1hmZTJLWjZRdytwMlI5dTVDZzlaVVZk?=
 =?utf-8?B?YkoyZ2ZxOGR6eHkrTWN1OStqc2pFTkQ3dWt3NC83VGxwcU5ZcC9Ca1U5VzFp?=
 =?utf-8?B?NXlrTHhWZGU2R3V0REtJUXR5VnJ3WE9EYW1kQmhvZnU4TnFGVklkTERaYkM1?=
 =?utf-8?B?ZXp3azZ0cFRhNHdzMVBlZmF1aGZMbVJuNFU0ZHV1YnBYWkwyZVpBa0l5UU1X?=
 =?utf-8?B?M3N1aXZ0Nkd5ZUNqclRPZ0gvVzVON1RESnFMTW9rRnExalNOcmQzNnEzUTVS?=
 =?utf-8?B?aWE4MGVoQmFDaUNrMThDKzR1aVZkWWFjREhMakg1T01oTVlYQnY1NTZiWmxI?=
 =?utf-8?B?RERkem1EUWdZV2VtWjRUR0R0ckRrWnJFMEdGanBVeXJxRmxNUks4YW94VzF1?=
 =?utf-8?B?Y3ZjYmFjV2NLbStDcXYwM2RPeUtZdjIyZ04zUEFBK3czYmhCYUdNUU8xalg4?=
 =?utf-8?B?VUlyODdKQnphYzlEd3ZWYkNrSlV4QW1FNlNBNmRObUNXQXRXKzBYdjdneGtG?=
 =?utf-8?B?Z1BNYXZyaFcwUzR0QzcwMkpIeDVmL0poWUY0dmlVdVNuRFFJUlp6YnkvOGtJ?=
 =?utf-8?B?dzR6cUFIcGVYMDZHYklWRjVFMXZPM0pJc3VmM0dlUjJVOW4zUHJ5UXlBZGsr?=
 =?utf-8?B?eVphOUcrQWdDaERkMU5xcDVaZjAvWHZCTDZBdmNaV3dTU2U0Rk1QSWV5UmRw?=
 =?utf-8?B?S1JzaEY1MHVYT3VKTUM1ajl3ZkR5UnVra3lvQzRyeUdNeWxlZllURFpWN1pa?=
 =?utf-8?B?ci92Ky9SSjlkUThmRThDZHIrcDk4MDVWTCtkRFljS3lQUWFnYW1DQmVOemZw?=
 =?utf-8?B?bFFqaUFGaHZZOVNqUVR6eHdBNTRSeWxrYy9EM0hKblhreXNRaWRUcm5LRy9L?=
 =?utf-8?B?QmJUSVB6YUY5eWlUeSt2c1dhVFR5VlBROG0yanlJd0g4dGlOMFNXNVBTODhx?=
 =?utf-8?B?T0hRMm8rVW1IcC8wZDhBM2dhZzEzU0ZKVzc2NERUZFJHNS9NaG52SEpvcHgw?=
 =?utf-8?B?QWwzKzlGWC9XYmR2dzlOZ1NtalU1Y1RuWTQ4eXUwNktwRTZoWHRoMi9mK0NM?=
 =?utf-8?B?eUh3M1FmbzVmVUR1VFBVbjdjZVYwQ3FsbW96bm03Y0hqUk9yT0xyQ1MzUWVB?=
 =?utf-8?B?Y2dTeGF4WjFHd05KQ0VzOFhTdEtjOFZRaThudnpRVUViVXR3Ni9ndUJTcms0?=
 =?utf-8?B?RGhRQy9vaXZ0bndmS2p4K2xWYXRPWWk4YW82dUpMRU1rWFQvcGFEY0kwZjFW?=
 =?utf-8?B?OStFbGJTSGZhQ0thM2ZMOFVhRElJcFB2bzdiOFQrNjNFUnRhcTl0Wld6Q2Vt?=
 =?utf-8?B?bktIbXFlTDlMbTBDWjhoemRMeGN1V1B4a2RvbXFUWU5UVzd3YnVURThFbktG?=
 =?utf-8?B?RkhocTRGRFdQVHFZY0o4U0wzRzIrZTNDdDBDYzNVRUhLSk9kelpWYmZsYkV5?=
 =?utf-8?B?M1VhTEdIeEJ3WlJtRXFkaU8zRU41V0RxYU5lRlZzV1VUaExOUEg3dnV4cWFM?=
 =?utf-8?B?Wm4ycnRxOFVYR0wyR0dHeEF1NnF3V1JWcHNVRHBuNndaQUprOU9tSldZUG4z?=
 =?utf-8?B?elF2K3krSm5GSWdaWDM2bkJ6WFhCUUVXa2s1ODRxbmlrcExER2ZRMS9lQjdK?=
 =?utf-8?B?NElOcFcxL08xT1dtQ0dBeVluTEt6MUE3ZXhQUzB0dTRhMzB3VGZ2eTJ2Tlg1?=
 =?utf-8?B?WGdHa3FWNUpreWFieE81MHpod1VhcnloY3NWTXNQOVVGcmtkQysyOVNDWVE5?=
 =?utf-8?Q?AdigmED4eLI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6886.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVhazkxNVZCcmJjL1RLU0REV2pSSCtBcmhwVnUxcUg5QlBDV2FQeWtGMGt0?=
 =?utf-8?B?OEcxVjYyZXRxdGhjRW42MlJSNEVEOGN5b0lnZ1JIMHFpQWVCejdtY2tiZkxv?=
 =?utf-8?B?MDhhbVM4eFg4WVBPNDZncXdSTGRMQTdJbUZDbWZ1RXFSMnZ2MlJiL3BOakI1?=
 =?utf-8?B?OC9nQ0xvNFFMa0Rsb1dPdjhYVjFaTlJIakVYYWxCcVhpMVMrSUtJOVRqOVRq?=
 =?utf-8?B?UnFCTkp1WlJTQTNuanZwWmxmNE1OV0ZpV0JUWUk5aExZV0w3Szd6VDAwdkNX?=
 =?utf-8?B?YXFLT1JwRnpqL3cvVHFZdXIxLzR4eWVxdFRpcllocHVHNThkVGJkQVlibnU2?=
 =?utf-8?B?dERFUFdBeFBLVStRSGFVYmxUVjFlb0M4WmpCOFF2a0huY1QrWEpMRXF3TzFz?=
 =?utf-8?B?UW5RU21yeDl4NloxRnM1Kzc0enFxNUE5b1FCS0l0dGRrM29CZDVuYlAxb2lp?=
 =?utf-8?B?ZFluN292WVJBMThNWllJNnR0cW9KV2U5T1FLd202U0NxenhGVkM4NWo3dkN3?=
 =?utf-8?B?d09uUnNNZG0ycVlqM3BicFJSbTBsRWhpTzJWRm9SdmNidnJVZnJnTnN0cGN6?=
 =?utf-8?B?L29jT1hNWitxYWMxZHhMWXBsV2FQazJUNVNUbHhlV01FWGdaM2s3WW5PVk5U?=
 =?utf-8?B?UmF5aVd2cDVJVkpIb0gzcjg5b3ljdCswazJuRndVNXl6RHFCQlFlNmNsaUZP?=
 =?utf-8?B?OVFTbVRZeERDTXFhUkhaUS94elRITEFIb3JrOWxCTzBlWVZPWHlQQnN5cTdB?=
 =?utf-8?B?QVh3RDFyRU1VT2tlUzdOKzhSMHJndjQ4U3NkYXBBMzd4NnNtVDJPNTBLSkRt?=
 =?utf-8?B?OW9DcGd4Q3cyQXBZb1dBcDVuWGU1dXRpNTNzZFBIYUx6VTBWMnlRWGpwVGpm?=
 =?utf-8?B?M2hsUllxMnRKbWQ0SUh0V3FsV1l1TmRWTDY2eFBpTGJ4WjhuRVlIS0x4elZn?=
 =?utf-8?B?UitKcTArNmZXc0tLek85Zk53ZFhDZGlVd0ZNd3g2OS9rUmtEUHVxbjFkdTF3?=
 =?utf-8?B?L2xHM093cndpUUEwM2xmTEluTDZPbnpSbXhGaTdjRkNHMTR2eXF2WW9TSFRB?=
 =?utf-8?B?UnA0SFJSempwT1B3THFKUFdZUFcwWlV0YW5TcUxmN3dYamhSMkRYbU51WXUy?=
 =?utf-8?B?cm9aN1FVSGd1TVM3R2NtdlNTWHJJdkNCcjlHR2xwUmg5cXROQ2FjVFA1eEtW?=
 =?utf-8?B?bjhKN01FaXhKZkYxNDk5ZGExUkM0aUZvV2w1OHFNTkl3WDUwQWJOYVhIZGVv?=
 =?utf-8?B?YjFlNFhCaU82cXZUT1MxQldOU2UyOFV3M0MwK3F1cXNZcHpKWUhjbU5JeWg3?=
 =?utf-8?B?NWJiSS9uWFdwKzQzRUhLT0VTdklmZmkwZzgzZ3RlQXVUNWdPSVZMS25pYytQ?=
 =?utf-8?B?ZW9zVENnRlBLendDNGZKM3dQQUc0WUdzaHZOdmVJNDB6UUx4QnZaM2dhcW9r?=
 =?utf-8?B?Ky9ka0I0ZmFhdGl1TVN1S3RUV0JMamJRdXVzMzhYUVBFVXpGS3h6OWV0MEwy?=
 =?utf-8?B?QVBHaUthcFB5eFo2NmFKQnZFeDlvL0NSRFVqZXh1WHJ3Mm1xcFB6V2VpVXJI?=
 =?utf-8?B?MCtQV0lPR0NaSkdEV0twcnFpQUF0VitKR1VpMCtadVRYeTBaWDh6VkhXTC9q?=
 =?utf-8?B?ME1sUUh2MFN2MUE4SE45aklxNkxuQ2dacnFtZUJIbGNXUnVYT2hBbG5MRWF6?=
 =?utf-8?B?aTczUXNjaStTTkVKM29RM1p5d1YyV2FqYVg3M0xFcEc5UlJYcEhJQnJVTE41?=
 =?utf-8?B?QkdSZXE3dVVDQjBGMXdmZVZ4YVo5OTNoOEZVNHc1b2NSRVBvWThSQVNZRTNS?=
 =?utf-8?B?blF3M3FERXNEVDFoWnpRS2k1ek1yZFdXRGwrY2pieksxeUFvU3NFMnlFQllL?=
 =?utf-8?B?eldFOC9UK29MVjhnYzFDN3hRNHpxa1hNQ05laFpXVkUrSWd3aW9MOUhPeWo3?=
 =?utf-8?B?dzZGaTRlRGMyNGtscEZadm9VUjN4dFBodmxzY1dxV3lyanRhUFhsZVJSMHNJ?=
 =?utf-8?B?RFdlTjBKUUJZVGpkd1IyNFJvdGZINFY0c1VNTlNvNllzdk1uOFN1QlpKVlhp?=
 =?utf-8?B?OUI2elVlVytyclJzUE52RElXZndEK1BHRXRrdjljMGdDVVBzemdYUWhIZXox?=
 =?utf-8?B?QUlVaGNUR2puNUN6MVkvTWV5WlNFbEFQc3ZSMTRjRFN1aEc3blVKU2UxNVR0?=
 =?utf-8?Q?NDCwGvse4iKo//v4dqtJ268=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1ymLa2sqqq7CcF3jWLY2YTQTheYYJD0Hhh61Jamx4uZ3TSmdr/M8xRl0rMCaSbn+mnKApvrHi8sh+RynyVKD5JFFagg7R88ftMAqfEJH+nFL/Uu2U/oKoPAn0kGC2zpvPF1Pg3oaWHGpwZKfjL73fJxFKar7GkQHVIuPCf3ese5t3/b1EHopcjxd3od7b1qE5/srlNHUhZo5xw1VL/89wc1gQ4BUNOYSGqOqI8oAgVpNgJ6Jk3bmUPchiDHos0m6DGoIShKZYCTsmTOmeS5aZzf1eeRjaAaghSio9RKuy/GolzQZDG97nDNAvKtKLSv12AlfM3VPUKIdZEDxbMk4lgvngky+5xvCGXhafrHd7AdCxTjXrpKKDDkPQpkf/q2uvXk24siDPbh5+qc7k09N4Lju+HOBb4PHwrYnpVfqMlC+UfCq50LZ25kUa10gLdVUz1sQcuZ7FfOQioPdlcqqvxNrydz3J/BSA1cE6RW9yDLQB4zbLC9o9/sGDavt92ngfEss7eTf2ggcppOoXtc591WvsmIZdQQ0OzR7WQymfctaXjzGaF3C/4nxoWn6jxTCeMB/fJoHiD46X8IHnJTVVR3CrarYEwdZaBiMUuZ5COs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813c0542-4fe1-4b14-4b37-08dd8fe3ab3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6886.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2025 16:56:55.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0LcxR3jXVe8E0g5FLNjLIQrcTyCOSOIgW4F5kFLtlv93apUYKF/Ci4pt71Ux2oB5u4eaPzgZIGsdGl+cA3MvLRPwIofYEd4OqzcntqOHyt+LUCR+KUj7/cPTBn5wLyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7632
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505100173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDE3NCBTYWx0ZWRfX7LmGpVmfvmmX drCYIGfKdyBnqUp/vl9CBxBsfz8n0eXGNH8VQFCBqE2WCFNHFAwFyacKmxfmAJzl4rmHhhaUis+ LUZGDy6Myab47IPti+7GZmvBzCQ236DLmFyipjwztUJ5b5nkSlIi5/iQa+Z0fTqs9flLw5eqZ7A
 SdcyAOtSAdaxb/gTL9iYrgBlg6h8b99Ec8ACdpywknDIvDYi9k9iJQ8I94rTloPMeiMjHg7+lQ7 w5eyuTBAVz7ehBdYdMSr8VS5ZzN+527yDzKxIe1RZj5K6HghTe4GxFqP+V4nthxsl/O9eXUHKvj u7m8eC5e/+naCh+KfmzNwGd//PnQP1vJzVfkxdt3+U+3KH+g7Ha8ZNuq9HgJmdcCmaAmq+kPaZf
 +NxkYY5TkL0rfy52k2lNr+V4Kj03xR3dF/N6P1/oC4chXC9it+70eoZvxYZjRTkwA5Bq8Cu/
X-Authority-Analysis: v=2.4 cv=YJ2fyQGx c=1 sm=1 tr=0 ts=681f8559 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=3rtqRsK6k3BnceV_bWQA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13186
X-Proofpoint-GUID: JeizVsWahH6l6DcAv3CgRQ0WTaQF9px2
X-Proofpoint-ORIG-GUID: JeizVsWahH6l6DcAv3CgRQ0WTaQF9px2

Hi Greg,

On 10/05/25 22:17, Greg KH wrote:
> On Sat, May 10, 2025 at 09:10:43AM -0700, Harshit Mogalapalli wrote:
>> CVE-2025-21872: Re-mapping the entire mokvar_table is the problem and
>> the re-mapping is first done in this Fixes: 58c909022a5a ("efi: Support
>> for MOK variable config table"), so this is the broken commit
>>
>> CVE-2025-21833: The fix moves dev_pasid dereference inside
>> WARN_ON_ONCE() as there is a possibility of dev_pasid being NULL, this
>> dereference is first introduced while adding debugfs support per file in
>> Fixes: d87731f60931 ("iommu/vt-d: debugfs: Create/remove debugfs file
>> per {device, pasid}")
>>
>> CVE-2025-21832E: The problem is that iov_iter_revert() is done before a
> 
> I don't think CVE entries have "E" on the end of them :)
> 

Oops, sorry for that, that was a typo, I remember how this happened, I 
copied starting from -2025.. and pasted it in incorrect mode, that ended 
up leaving a E from CVE moved to the end, missed fixing it.

> I'll edit this when I apply it in a few minutes, thanks!
>

Thanks a lot.

Regards,
Harshit

> greg k-h


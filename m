Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B232DFA3F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560469; cv=fail; b=i4qbJMEqoIhWp7bvpj6MZg+ONjwC+gD4aYdq3DEpQhEAEFKkzo73DhaWHJ+32WIffKIVi8OYhZxB5NKsSdkzwH1t8CXtCSvgF0sgLmOVLyzq0AbDIOn0eT6uF+I8j0hkT34VNrJYjT7Eki7kmAr2QqSuucuLc0AaT2zEc9UY/TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560469; c=relaxed/simple;
	bh=DGCsTuXlew8Fm2GlkTO8uk/ditTPF81V6hnQseSoXXM=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bj05VIi4VhJIF+pAIWuAOpyBD1ePDBxL5v8EQ1L2UTQxvjJH2490HobmUF23GBfgB7xR+dVqHwiFpYcZL4NETgYKZVFz0bREbRvXkdRKnW0ol7ATlcloGymBHo9f0lx3aTVey1EPOVEXxiPfUa5bkUw/S2s65Gv2f0I6L/EpPiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iLIfVoxj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wqHvd9Ti; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iLIfVoxj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wqHvd9Ti"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2fZFX007249;
	Tue, 10 Jun 2025 13:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=e0jORwB2ZpYLSlb/BP6/4yiq/mzCq/geW515iQJecP8=; b=
	iLIfVoxjVCbyl47TTKvV1vyfEuCMImsst91BbcAM7eRr9dn3/ehjcicgaH6WvUrn
	4IVpHAeSECcjdpfoobENoe4ay8ArFry+aPLtDbJGrSzSxhqw7BPXjzcqrvjCHAQt
	zFPittkh5Nq93VilwUVzD06iGSIMnkPlX9TT3YdMu8LCwIhx7JSrU8lr1Uq4Vrm/
	GVLsVm7LneNLBzhbJK0dY3bGuVD+NKIG4Vy4Oxz6mXIwm3TD1Vxxlmy+QFrXSxK9
	bELVhax4R/OEgHeSP+mN9YduXj7eNw27x5W7KG621vNMLRGCntGCyGYPn75Y683i
	dVIoCKwozKWSf2egiS+msA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14c5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:01:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ABroiK011859;
	Tue, 10 Jun 2025 13:01:00 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9phr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5r8ytGXqPLuA1BbrH5MRnek2vIV0xnuxXa1NFdKG09o5TsQLSUoHNexLaCDLoFyjh3rJF2UeYJZTMlLlp0bwRQ76yze82UfoEAGkR5po+XmXJ86rY7uK0qjnc07jo6/LFsWKkxfFe35UBcEIFR2K9kNIDOVypLiI4T3bjGMLBQP94Mmc0RnJob6QIBcSP7MpFIUh0tb6P9H64vtkDSe1uRLtR3CFQ9gbnbvnOVWrQJOuw/8QzHUBmWwQyUmYHvm2YH5vkgbaLUvprKhNMyzl+w/9nY/9AXy9CPSh82fCvLtXQ/Er0ZbmunAg8cs9t1c3zTezrGKM22ZxiGmJ5h8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0jORwB2ZpYLSlb/BP6/4yiq/mzCq/geW515iQJecP8=;
 b=ClznV7qpUWrHg9FktMuRYIUbpWJXSGWJQLPS2tLOmfCzshIr3X6vvSY3W2WkpB9yN5zB0OrHfvyU3yCOXbFCsgr628yHWRIkCpQvto42tFnBu/OwzCpEB3Xwo4MtCmnPyIGp+rXZ3Stziiyva5cFkgHCKNbbOC3yimboRBRP/RctjRVHB94jQXtY9pJl1sJnEmiSY4MhRHB9VgK5eIadWZaPgbQuixpyAvysBJ4zthyfv1M6+pVe0pAUcuCv5lwcKmpnLtklr0+3Bv5A+AG3WnMwD7/qPS8Yk+CS1JNhlKFlIJEvPm2sp4Rr17bYSIw6U3WuQwJ/iH6Qrf0/OnBsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0jORwB2ZpYLSlb/BP6/4yiq/mzCq/geW515iQJecP8=;
 b=wqHvd9Ti6206BuWBfmIb8V0GUagYk2OBR9AwEX0bCCKYGQDKFicof+ROZDmek9yYYPwbc0xm20mWYKgke5SuTVqUInD69whHH5VGqHCmHEClEL8swKEHnchX9JnJHLsJyFdtyD1cHoJ3+0Q8sAIYp8K2EXvmRyohIMubJE56PWs=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by CH0PR10MB5033.namprd10.prod.outlook.com (2603:10b6:610:c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 13:00:57 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084%7]) with mapi id 15.20.8813.018; Tue, 10 Jun 2025
 13:00:57 +0000
Message-ID: <c0153249-5643-492f-ab2f-70dcafcfdd0c@oracle.com>
Date: Tue, 10 Jun 2025 15:00:50 +0200
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
 <d52b6b3a-dd18-4c8e-b7f6-5ac0879d959a@oracle.com>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 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
 swLliy6PdpST
In-Reply-To: <d52b6b3a-dd18-4c8e-b7f6-5ac0879d959a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|CH0PR10MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e82a083-17fb-459d-1a1e-08dda81ed745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkZxQ3kxUDErRjUzbXpBeVBzcHJvOFFkd1drbm5uMzdtRU1VUlFSSjVaM0lS?=
 =?utf-8?B?MTJ3VytqN1BjQi9xWFJkeVhJaHZuYzBpQlMwYmZJMTAvejJSWEdFWlZGc2hN?=
 =?utf-8?B?Vyt2WVJTZXhBZU9SRTJqTmNDN1dzUk1FYUtjQ0t0L3hqdHdtV1V2bmcvME41?=
 =?utf-8?B?UkNVUHhXOCs1aEZRbklWWWU3cTNFeVpFR1ZOOEpOMWlxN1c0cmFjcWcrZmZF?=
 =?utf-8?B?bWxmaGxFbGdFa3lQdlBTRUppbzFyZHVUL2hHQmdVeGtPV0NSdHV3cDhUUlUz?=
 =?utf-8?B?Q3JuNnNGYVc4NSs3Mkl2VGl1VTF0YTVLWkcvdHVCbU9idzZLVkZLRklFaFFV?=
 =?utf-8?B?elVVMS80eEpHZEtEZlJXU25rK1Q3N0tGTnF2SDFhdExRbXZaaWswZXA3QVMw?=
 =?utf-8?B?ODRuNzhSdVd6Y25oMUVRYWd0ZHR2U1M4ZU1KWFFOdE5vOFBzSzlJSmhFTUEz?=
 =?utf-8?B?cDNXZDRlYitZdHVEbGc5bTNzclF3M0FRTlZiM091TStUR3JIcGxFY1BnUXVD?=
 =?utf-8?B?YlIvMmx1V0xPVklvbFNvUStQcUNSSnZYNndmZHYvZEl2bU1IaXZJVTF3bVVy?=
 =?utf-8?B?WEdkdVoxSWZOVHorNHdCa1hVWHNZVHh6MWsyeGxMMXVhdWphMlhMK1Vpa0x0?=
 =?utf-8?B?NC9memFTSjlzK2ppYkNBNVY4VlhYYXRzR2tScXlZUXk0UDFPY3ltUjlUeVBQ?=
 =?utf-8?B?NmlTdUZxMnRuckxTUEpoVThuZEVxRWVicElIT2ljQ0RROUl6RzBKWm13RHFv?=
 =?utf-8?B?RnhWTlJSS1JCWTU0OEtpQTkxN1Rab2hXd3N4R3VYZmRGZy9xaTZBaGpZTzNC?=
 =?utf-8?B?RDhROUZrbmRZU1l4Q01nVUZoOTc3VTlNb3VLSUVUd2xNdUppOFNaUXFZekl3?=
 =?utf-8?B?UHNhNFVYS3oveElEVnhqREJaSW9MUzgwTFBtQzYzU2ZOZ1FIaFJKY2VPMW5o?=
 =?utf-8?B?NTVlT0FKSkJCOThZdkZBdEtRQlFJWk9YNkhDMXFVdTkwZlZsemswc3RLSnNo?=
 =?utf-8?B?SHZMYTBPQndpdUhxMDFEMHY4RTBHVW91L0NxaExKQ2t6YTR5SzhXaUtra2FG?=
 =?utf-8?B?REhOQTI5MjJJa3ZhZm1lNzRxQXltQjFYNjdrRTY4UWJXek9ST0NteGdoQ0xR?=
 =?utf-8?B?cVNkcHVHSHFPamhnRkk4M1pWaldxbHZ0ZXhOY0trMm9zekVqaldRSlg5WW51?=
 =?utf-8?B?bGV2UmVxTUdJVHFoZE9QWTVIa0xnNHBpWlpWejNrNlZlSFpmNDlEaFpyRllR?=
 =?utf-8?B?elBRMFZnRHFydlYrRE90eStQWGZpMHNRdGNtYVU2VmcrcFpNOWV1aDRHTFdU?=
 =?utf-8?B?a3VoMldDS28wb2w2djh6dEROd1hHQlpCMWxwc1ZDb3dMRU12dllibkhjYkp5?=
 =?utf-8?B?NHBYSUsxWnlDbmFUMGpVSURlbHhJQ3VLN052QitLZEJxYmQ3M0ltVnJDV1By?=
 =?utf-8?B?a2d1OXc1d0daeXBHQk1EQnNLUW01K0tTSnF0aEd5a1ByNURoU0NtYitvVkMx?=
 =?utf-8?B?bDlTQlJoS0NkR250NTI0RkZTSTBRdm9iMmp5SDBWSjNwbFFKK3A2UmZXR2pp?=
 =?utf-8?B?L3BhL3ZEbUpvRUg3TUd2YngrNU5JTDkxZWxuSjVFMzJKSnV5dlpQK29mRkxQ?=
 =?utf-8?B?OURwb05QU1p1Z3htbWhWZytCWktoRzdUUkVuNmpCdi9NYlFqeWVqUVpXQ3hj?=
 =?utf-8?B?M0UzZ2N1RE9MR0ZzV2hMeFA1MENMQzd3Q1lqeUlZL3M4ZXlDNHdoN1ppU1Jz?=
 =?utf-8?B?bUc4SUNUamUwcnlpYWxUMGtieXI0TjcvTWhOM2gzaWhiSGs2Y1ZhKzRGcEtY?=
 =?utf-8?B?YStvZnlkOGVOWTBxODlad0VGdklMc0thcUxDclFrY0V5a0pkbnNQWVkrWnND?=
 =?utf-8?B?M1dEdnFCeDlsOU5tMTV4U3BNaDUvWkZpZjdBelMzZlVKcUxQc0FoL3Q4WXBE?=
 =?utf-8?Q?vonFooWOddo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDlaS1R4V0xHdUFsNWhvZkJvZVJCckdPWC9nY2JTUUY2T3FudXVRTjBYbm82?=
 =?utf-8?B?d1NRQ1lQYU40QVVzOVhVR1MxV0REcVdzTkdheHFSTjBFd2tyVGxsRDUzbUpM?=
 =?utf-8?B?UG1pK1RJdHdidkc2N0VEYXY0TERtTW4xeGZOK0cvU091Wi8zMGlXUGZtajVC?=
 =?utf-8?B?SVlNMy9sb1V5MVhSVFFqb1VnVWU5NURhUG10dXErNTdZcDdZeUNlcjQzQitk?=
 =?utf-8?B?QXZ3bjREc1lNTjdtYXJpZGN3dlVraDF2cVRQSG9RVXMrRmt3aU5jZ3Rxa2tu?=
 =?utf-8?B?UWxHY3JQUnkxT2xOWVNrRlI5Qi93V04xKy9CazhuMlZEUnN1NVpkakVwaXg4?=
 =?utf-8?B?RGpUb2dqZklKT1F6YnVpWDhGd1lyUjRZMHl5anRWTnIva29kUGE3TUpCeGQ0?=
 =?utf-8?B?U2Q3c2RmWW10dmZvaG5zcFpGdDY5emJ0a0E2RktMaWFxU05OSFN3TkhUS1Qy?=
 =?utf-8?B?YnhkWUlpeVFxZlI2V2NsN0M1blpsazRCMDF2dSsvMk42dDh1MUNVT29CbGJT?=
 =?utf-8?B?c3l2TWx5TnBrRWdXdGV2OTd5OWd0VDd6QWVGTDZZeUZVd0dzWXFmMGkrOVov?=
 =?utf-8?B?TzcvVlhCVWsyaGJsK1NCaTlSRnFQSVkxUzZra3Q1aFVveG9QQmk5QzVUeU9u?=
 =?utf-8?B?amVOYVRwT29RY2RPQnZEa0E3Y09zektScHU0Z0Yxb1c1V2ZMcFE2QU9jVCtB?=
 =?utf-8?B?STlRVjZjbUVrRE41ZVBMTERvK0gwVjVlK2tGNzk4eUFnbjlUZGhDV0hkNFcz?=
 =?utf-8?B?L3hjT3lPSVA4V3B5M1dRVFoydy9KSHMzYmp1Y2ZSUCsxMjBPRXNZanhrb2VT?=
 =?utf-8?B?QzhyQi91bXN2MW5LQjNaSC9ERlJ3WnhTdGxHcXNmWE50eTNqN0R6N2E0dFBL?=
 =?utf-8?B?RUVKYTVrWWdyMWZrclBBNTNIWFhIRi83NDhWQmw2bmd3ak9TMGdvcDhLeUtD?=
 =?utf-8?B?MUp0YUphaDFPcytUVnorMm9ueU82cjMvMVh2Uk0zbjg5eXUyMmhvUWgxQUJl?=
 =?utf-8?B?anorZEVHcEd5aDFaV043YTBwWjV5QkpmaERGcmpveFdadzI3NGxoais5aDBY?=
 =?utf-8?B?TWVRV2xETXF3c3AyTnhCaWNuNmttN1BhNVczc3dOcFpmekJHVmVUOTZleUFM?=
 =?utf-8?B?dG5YblhleCsyUElLN3JrTEd3aDlFQkk4UVFUdmY5ZjZuSkpVMzVReUFzVm4y?=
 =?utf-8?B?R2lBOGlWcE1RMWg3dmhUM3MwcnA5RnlmdzFmNXVMMDZHMTFhSW5vaVFKTUFE?=
 =?utf-8?B?alU1d3dYL0dPam5JS3FNZExoNE02UDd1M00wams0VFRoWUs4OVBsb0UyZTVx?=
 =?utf-8?B?ZkIvOFZGZTBxeUZtVmJjNzdFQW5CcjZzOUxMbU9LUTREdDBnZXFBQ3U2dzQ1?=
 =?utf-8?B?b3p3ZnpqS0JLcStJVS81RHp0ejdJQ0FZSE1TOUFLeVExZHhUOVVQMVZVMGRs?=
 =?utf-8?B?Y2MrTUpQTUorZ1Vsa3dSemxZUCtka2pKUWRaYkhkZ0VzT1BxRVJjNXhtSlZR?=
 =?utf-8?B?cGY0Y3VTSkdHVWtVQ09JejhqUm4rS2hDQkpoUHkrU01uMmJPdFpKRGVESi9H?=
 =?utf-8?B?N0VXSW1Iams2S3lmaXFsYTVtTGNSQy9KT0lXMGx2MmIyUUNxaXRISTNTbGtI?=
 =?utf-8?B?Y24wOStHdE1rS3JLNURBZlg4Z3FlV2V3UjQ0NHNSa05HWnhXb1Q2QlZ2SlQ2?=
 =?utf-8?B?Vnd2bkhNZmk0Z1plQjE0L1VPT1NrN254S2pZY3NEbHo2QlZXWHA3YkxvZWJi?=
 =?utf-8?B?MFdkc0ZPbU5pd0Y1cVpjbDcwMFZWU2J3SjBpQ3pNZUJFVC9RZXZoWVc1NWRx?=
 =?utf-8?B?RGh3QVI0bUp5Ukx5KzgvK3dIQnd1TU0xekNmRlNLd0pKNEpiYnZCcFllTnBa?=
 =?utf-8?B?TkluVjNkQUUxNWVua3FSREhsN3VrVkZVTU9aSHV0Yi9zdmkrajIxL0k5d2gr?=
 =?utf-8?B?bm1qemxKWE9FaXBqVUtMdzFGd2V3YjBJTnRqOGhUcHU1SEV5SjdGb2N4eTll?=
 =?utf-8?B?Vk41SjYwd05HMDBYMFdrSWRjY3J3eGt3ejJJeXI5RDBhem1DdExBUEtzSm5U?=
 =?utf-8?B?dEp1VlM0RlNSeTNZLzhIcCtUaEJjcGhpNVZNUWxjRCswQXZobldCMTZ2NDZV?=
 =?utf-8?B?Vlp0TzJvWWp1alp2YVh5RStIZkRIUTEveWpjUHM3d2JnRFhRS1d0RVlOaU1U?=
 =?utf-8?B?dVYzYmgvOHlGd2pJL1dPa1hJaG04V0ZoVjE4S1Rud283NitXejdUS2wyMzlB?=
 =?utf-8?B?ZHovR2ZhOFp4UGhiSGR4d0xLNFpBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iXYgZZn02oCrzcDJmBR95PBMqTyymGoFB0uJyipa31qGUaUiCb8fhm9n+EXAP1ttdBFi15WrCYnxMnAFT6UWRq91ExYrStdIY0AUpB5sBduH9AOjatxDi4EdQspTjW7E2NgCXzMme5WkugiFT8uzrxKM4OpPaqqnWeidE2qbxhmBtPhVuqliq9LBLkjUHW/gWyWXRpsG9ltaAGCcdtNOHZ4J/LVT+zP4nSpyojATXqcCU6psRw+AOoOTp7Wm8ptMbiJSyp3ohvxfGVgnRguNRM1a+P+p+skqE15evMXnWcQOG6ecSvabCX1wo0z1Z4DzGsMdDgG/OLNzvJ4S/n9h7rmp2l8dU1wDtUEWi1EUjXxPHRConJTgC82EypuYvRtSpraWdc2pvRgbfX/vGBiEDTvOuXI5nu4AVPv9r+g3r0xwcLGHqZCB7YWYwXwDe/rf3osEqE/BDhtNM97CAuN07MC+kFIK93NTTgYbGsarLN2Dtqw3elPESNxF5DXuR7k66MG/rJxen43bETPw8xelZdZsWIkNi59wUKqMj35RF7nblqZd5bFy2I2bNAONkhuT44PLhGm0MG6spWLPGdvbZetauTBYefhTNOcY99pMRFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e82a083-17fb-459d-1a1e-08dda81ed745
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:00:57.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDCiKJOAg3vUJ5KqqfVlWGo5Dj9KLOQRlKfHfUyQNmuU5TTbQYjUfJqUguUsJUTo5q5lPytH6lfyv62NuknwPtAanArCRmwe0A/LJdM/SeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5033
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100102
X-Proofpoint-GUID: l1pMH_IFfA3erVNJkQgMzq8yHDPTYuYA
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=68482c8d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=BNA63VqD68wlHJIsyZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMiBTYWx0ZWRfXy8gw2SjJI8+4 FyTYHzLU9lNiw1pGczxFLZn0xLWnOQTxFSUhI1NkT3RUHxMn3/ETxpcTmCll9CaFmTUwzqci2Lj z7OINyJguFvp6H0Cm7n2wuCELL2qVui2N4EsTSTdvKK8F1j4/ZbajoT+/eqGBzYrNBUQ3kR0TI2
 9y8XDkd7gG6dkB3xX56ummywgFlLK2lv2ZmHEmWx2ODJB60P0AoLleXt5JtJLDLCUPjZm4anecM XEqYQmIYoWFyjKv+ijf5S888hKIQUUbknnHqtABqzlrROJ5LPVA20dpoDgk4fP8o6yugObQJKfV ZSdtKOaRwcvFRWv6OjBMRZv+qBxq7VaktQNR/dlL968DUuR5Nl00Xyw0CRZFo+GkueLp/JBbR7P
 e/uiQ/HQI+N4rVcRgdUv8pR7RcNavmY5h4d+OAssjE3AhGaWjI60wWtxO2VVw7/07aVQQ5CA
X-Proofpoint-ORIG-GUID: l1pMH_IFfA3erVNJkQgMzq8yHDPTYuYA


On 6/10/25 09:07, Alexandre Chartre wrote:
> 
> 
> On 6/9/25 20:31, Josh Poimboeuf wrote:
>> On Fri, Jun 06, 2025 at 05:34:27PM +0200, Alexandre Chartre wrote:
>>> Hi,
>>>
>>> This RFC provides two changes to objtool.
>>>
>>> - Disassemble code with libopcodes instead of running objdump
>>>
>>>    objtool executes the objdump command to disassemble code. In particular,
>>>    if objtool fails to validate a function then it will use objdump to
>>>    disassemble the entire file which is not very helpful when processing
>>>    a large file (like vmlinux.o).
>>>
>>>    Using libopcodes provides more control about the disassembly scope and
>>>    output, and it is possible to disassemble a single instruction or
>>>    a single function. Now when objtool fails to validate a function it
>>>    will disassemble that single function instead of disassembling the
>>>    entire file.
>>>
>>> - Add the --trace <function> option to trace function validation
>>>
>>>    Figuring out why a function validation has failed can be difficult because
>>>    objtool checks all code flows (including alternatives) and maintains
>>>    instructions states (in particular call frame information).
>>>
>>>    The trace option allows to follow the function validation done by objtool
>>>    instruction per instruction, see what objtool is doing and get function
>>>    validation information. An output example is shown below.
>>
>> What do I need for this to build?  It wasn't compiling due to missing
>> bfd.h, so I installed binutils-devel (Fedora) and now I get:
> 
> That's because of the more recent binutils versions, while I have been using an old
> one (2.30) and some functions have changed. But tools/dis-asm-compat.h handles that
> when the appropriate #define is set.
> 
> Below is a quick fix (tested with binutils 2.41), and I will work on a proper fix
> (by using the tools/ features to check the disassembler version).
> 

Here is the patch to handle both old and new binutils versions:

8<------------------------------------------------------------------->8
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 00350fc7c662..91a2858fea14 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -7,6 +7,11 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
  srctree := $(patsubst %/,%,$(dir $(srctree)))
  endif
  
+FEATURE_USER = .objtool
+FEATURE_TESTS = disassembler-init-styled
+FEATURE_DISPLAY = disassembler-init-styled
+include $(srctree)/tools/build/Makefile.feature
+
  LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
  ifneq ($(OUTPUT),)
    LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
@@ -40,6 +45,10 @@ OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes
  elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - 2>/dev/null | grep elf_getshdr)
  OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
  
+ifeq ($(feature-disassembler-init-styled), 1)
+OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
+endif
+
  # Always want host compilation.
  HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
  
8<------------------------------------------------------------------->8

alex.


> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 00350fc7c662..300ea727e454 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -36,6 +36,8 @@ WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -
>   OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
>   OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes
> 
> +OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
> +
>   # Allow old libelf to be used:
>   elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - 2>/dev/null | grep elf_getshdr)
>   OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
> 
> 
> alex.
> 
> 
>> In file included from disas.c:12:
>> /home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h:10:6: error: redeclaration of ‘enum disassembler_style’
>>     10 | enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
>>        |      ^~~~~~~~~~~~~~~~~~
>> In file included from /home/jpoimboe/git/linux/tools/objtool/include/objtool/arch.h:10,
>>                   from disas.c:6:
>> /usr/include/dis-asm.h:53:6: note: originally defined here
>>     53 | enum disassembler_style
>>        |      ^~~~~~~~~~~~~~~~~~
>> /home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h: In function ‘init_disassemble_info_compat’:
>> /home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h:50:9: error: too few arguments to function ‘init_disassemble_info’
>>     50 |         init_disassemble_info(info, stream,
>>        |         ^~~~~~~~~~~~~~~~~~~~~
>> /usr/include/dis-asm.h:480:13: note: declared here
>>    480 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
>>        |             ^~~~~~~~~~~~~~~~~~~~~
>> make[4]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:86: /home/jpoimboe/git/linux/tools/objtool/disas.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>> make[3]: *** [Makefile:65: /home/jpoimboe/git/linux/tools/objtool/objtool-in.o] Error 2
>> make[2]: *** [Makefile:73: objtool] Error 2
>> make[1]: *** [/home/jpoimboe/git/linux/Makefile:1448: tools/objtool] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
>>
> 


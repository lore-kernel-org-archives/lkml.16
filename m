Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA381BD517
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220270; cv=fail; b=bLvIIycy7B7lFpFGxCe5xSRIEFAujTs1Af01gqOXOPckKZMCYPOYKWnt2SHYglLoSDRmlGXiFFp+YfF7jAt61tC5hhNYUN3mc4CUc7l1FI/kLO98iv551ppu2kVqmTv9yllK4LoW02gUPpb2PHSHgUj2D6txlWHyAjf9WwHZRvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220270; c=relaxed/simple;
	bh=lkouklFO+FY7gDtcn0PlGvG3oXRoOpqQORdTu/5zy60=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d/XeJPpG8czPFYbWGhfcEkY6eHs5O2R2NW78PgFEgC/PXYdGRlfJpHVUVw8lnAaViXOsHrDTTC+Hig+CzolUy6oeM3EMY+lCKf0XG4C9fOhphIT/ssP5ZRerr8Pc3iVK2UrHkNLtBM9PXkMhDo6dK8LDhoYVCR6AMUrhEdHs5U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a8TWT4ad; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=istJvzm7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a8TWT4ad";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="istJvzm7"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Gu2LW024209;
	Wed, 9 Apr 2025 17:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=8ZcfrWflG1+eYbtqATNKbzHx+9gjQiaViM/LuZLLCQA=; b=
	a8TWT4adTm9jiHX5Nd2hWxTv8FBRL5z5iJlOoBJT9Z1dnHzMyUMXbQB/dNug3kfr
	D4WOhJf7iNNbnobxsKDhYpeCOPyw42CPsHSCNr4hlLij/LpEBlR/m55nOms5iPMK
	Yoh4lGXADzRc87kiNyd/URWzybq3YQhAhTnCgKDDC45txis6ieKqbuhH6/jjhXzx
	Grl+CLQmYeItm/uSiAGrDGT+9W6fi6BqTKmgY+pgAhL0Rd2xGj6+krWgIlypeZkk
	hIN/0UVzFxU/oP6ll7Qu60zk9mUQ36eSnmC4r4CXk7566bJO3i0pMWAb1FwT0sxQ
	jCTh2pjPh+tL555VJ4V8GQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tu41ft6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:37:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539G4Vo5022183;
	Wed, 9 Apr 2025 17:37:34 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttybufrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:37:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueOLE2g3h0aVNhtX5jlk0hpc5X5sH5bzz6JNa0thEb/23I9boM0x87fsbmAA7vb7HhG3gGNmF+Y2TBvN8cPChMthnkLWFmshpqTrUoAQFIKsP738p3DdRjXqvMMhYzL99rxRuTnS+FZcd5msQpbepvd8iSRpmudspAdywJnCobpLTiRVrz9EivYcXN/+KIdqOc3FJt+LRalkJsynppVLlf23tepbXVHK5BGCshhe0tYdhfaP/tyBJDwjKU+qVSu81R++BCm5HfBMRl5eZ+F1+s8KygRIASNFgc1jQU8cwCe4N0s/W++l533hZ+PMq0d29AWvmdZbzk9QvYfbIMnC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZcfrWflG1+eYbtqATNKbzHx+9gjQiaViM/LuZLLCQA=;
 b=VtCMdEpTgLS/5Hpr++OLkvohbX5qoqc64TrmqoErbiK0cJRows7D+mLlSb7eXUcamPwurWlEyMGJv6TVraDaM+GO0/Jc2MiUajvFq2eh69XzNXs+OuBkLwW4nbbuAKmsn2gFmcXdcCh4+GSXpkZ3jro/GAxLZsyAzW+6deiHvapTshiuihffyIFt6kiOWZxml5HOrlysQIdALqRH+IGjzf/vIymhUUWVkAFK63/YZ2uP7sUGx0lLVDJePV/KRHM1ST4llmlSVH3gzBbnBqzBNQx0kJi1afg15aT5PJA0Zlk0oAVgX7ZV/wLTj64jaK1z7V0P4fReh9NV3hq4ntZjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZcfrWflG1+eYbtqATNKbzHx+9gjQiaViM/LuZLLCQA=;
 b=istJvzm7pWLLuPQE7YmAieC0qM2cTiHBu4MfyVHHu/kyElXOnTCtuNw5ETv9Q5X7Qq4pPeQmvJ5bJTq6erNJ/eRUEpaObHYMGjaQj0fw0YdLJtAJobVcvike+kGMastcVH2dR3LECUNkerko261UFvIT53ooChmPP4DV4PCa4HU=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by IA4PR10MB8688.namprd10.prod.outlook.com (2603:10b6:208:55c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Wed, 9 Apr
 2025 17:37:32 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 17:37:32 +0000
Message-ID: <66de2aed-f17b-4802-b479-3463fa32751d@oracle.com>
Date: Wed, 9 Apr 2025 13:37:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] maple_tree: use height and depth consistently
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
 <20250407184102.2155415-3-sidhartha.kumar@oracle.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250407184102.2155415-3-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|IA4PR10MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 506e7a99-3fa0-4ad9-6d51-08dd778d3538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDJnQU83ZGVaWHVKWTd3RTJEdFM2ZFJhLy9qdVVwc0FrU21KcGh2RURjWlRV?=
 =?utf-8?B?T0tPTzBpSXZQQmlNYzRaR0tncDhaQjh4V0JENHJjK3hHaXFWUzhvdEp5NnI1?=
 =?utf-8?B?WU8vdmMwRDFBM2tKd2JsU2cyZ0VPcXh4TVRiL0hQZFVhU2FqT1llS0d2ZXk3?=
 =?utf-8?B?anZwb2RwYm5OZ2dtMzJPZWF5TW1mbjlDUGR0dVF0V2VCVGE5ZGpCVlZvRnBn?=
 =?utf-8?B?TWxpcjNWMmJvbWlUN2tBdlByZis3SmF1STltOWdvQ2x6Ty9JT0F6L0RLUFJ1?=
 =?utf-8?B?VDlHNDREaVVmSkdPcXRLTUM0NzN3b0ZheFYyb2dUKzBoWFhoQTltR0RqaGNy?=
 =?utf-8?B?Nml5VGhMV2lBRDAza3FzVTBEOGVKU3FWOG5jWmI3YUFIbmJxOUxYQnM2WW4x?=
 =?utf-8?B?RkVya3hJTFlhNjBqK0xXWWQ0dzBoUGhjRVNNUXVTdGFWV1ErZ29iTGlvNXBS?=
 =?utf-8?B?TjBXbGtKUDczTkxibVYyQWdtUnlmQ3Bnc1l2eDNTY3M1VnhjbzdHeldhczlW?=
 =?utf-8?B?cmp3V1A3TG9JSE1GaG5YUjlVRW44aEg3QTF4NS8zdFU3emxmOHhkZHd6eDV6?=
 =?utf-8?B?c0dlUTF1SUk4YWhRYUJXT3ZYZUdXM0JsQ3ByTVg5SXZINHgrNE50RkhCa0hQ?=
 =?utf-8?B?TXZ0VlFkMkN2NTNpWjIvUkpXdW5CMlQyKzEwMFNDZ1lIdFR0eHZFUHVDdnhT?=
 =?utf-8?B?MkVnZXF6aEt2enY3MUN0RFlheCtqdHRLbnhiR2hCemNBbGt5ZGNBOExNNGU3?=
 =?utf-8?B?VW9lbElEOExreXZEbVBvd3lwZEZzTFU4S2gySU1RMjF3YXdObGdObzcrMHlX?=
 =?utf-8?B?cmxQcHlpTDU2ZmtTOVdSbE8rRTJ2am1SRnlxZTRqa2FsMUEzdVdGeEQya0Fy?=
 =?utf-8?B?QzJGOWhrUEpiVjJtbDFLN0hXbWlSNE45MHNyeVdrUHQ4dTdNQ05GYWQxV3FN?=
 =?utf-8?B?d3l2N1A1Nnc1YVlNcXg2V29wTGJrcGM4SlRhQzdCT0JaTytyNkVrSXZiamFS?=
 =?utf-8?B?bVV4K0R5M2dBQWlaSEZQQVBrSlNFZS96YzdTazJGU0pTeENwaUYwVWY5Q2ZY?=
 =?utf-8?B?MkR6UGRjZXdTdFBrRHJuRkNndkdqeDliOWFKUzlMVjVrMEZKKytObkd3WURk?=
 =?utf-8?B?TWxib2l3S0djV2g3TituaU9sd250ZUdoSEFDcFNxQkJxdjE2Z1VyTmdRVU10?=
 =?utf-8?B?czJhZ3FNYWdTSTEvZnlOdUZzYU5MeVQ1ay94dTVsVzdjVWRsbG5JNkNkN3pY?=
 =?utf-8?B?OFVtSnppRkxuT0J4UmxWOWFCbU5Ta1lxZGZYK0xuZ1d2UTl3aXVRelhsQjhT?=
 =?utf-8?B?c2tUNHV5WU54SzZ4YnpQalpKSHpwMXJUc1Fxd1BYeENzWnlvZVRoaGhKTmtK?=
 =?utf-8?B?TDhXWHVjdC85R05lWVRvNlRBYTIxcG9hRjcxZ0JBY1ZRTVh2c1lPdHhsRDB6?=
 =?utf-8?B?QUpIWFNxNTlZOGNKK2hTeVlxMHVYYjRRd2p6cG9NVEE5QzNLSmx5ZTdZUVNx?=
 =?utf-8?B?emdwVlFNK0plZjg3bmxnbGZWdjAya1ZTT25HbGxpN0c4U1g3THZnSXg2a1cv?=
 =?utf-8?B?RUI0ZWdoanpXUERhWE5JdGNRZnBkQm0yU0oxbitxQkprR0g1bUxUL0E5bzVB?=
 =?utf-8?B?SVE0RzRYZm41a0Qwazl3S1Z5VDJWeU1KR1ZRUkY4TjdNRGhGWCtHSEhRanVn?=
 =?utf-8?B?U3pDbHZ1eEJFOUJwTm81TVdxYng2YU9xLzlhS0NYNlpMbWw5MkhMdlRZQXRy?=
 =?utf-8?B?UG9lTGhBc0JiY2tjNG5FYktvOVRyNThFMTlXZDlYT1A4WDJZNGNTdGhTb1Y1?=
 =?utf-8?B?cUZEM0szUitSbmxwZkh1S0Z3QkZ4OE53ZmRPZUxpRTdITlZLQUxZM0s3N3hB?=
 =?utf-8?Q?NQR/z58kEWR9J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3pCSXVQS0JJRUsrWVg1azIzdGJQWThYT0daK1lqeTZuZE8xWlVPWEh5amVE?=
 =?utf-8?B?ZDV6aHNmK3E0ditzZ3RSNWUxd2N2N2xLS3RqSmczdy9UQytva1N6MHpjOFF2?=
 =?utf-8?B?aFZDRjA3SnRpZ3VKOTh6Rlo1cUlSSm1kTG5LYzZCUzVNK3YzUjVJK3NCQXVL?=
 =?utf-8?B?SHZLYUpmSTFhUmcyYlRyOUpTTTBYVWg1QTd5SUtBbCtNMUtiK3ZUVlVHY3lV?=
 =?utf-8?B?QWNYQWpCYmZNaXFHeFFCeHVLRTJYSVBzNFFJODlzdGw5SkRRb1RUTHpnOEM2?=
 =?utf-8?B?QnVuTTF5WDhTSGZvMWNFL0g3NnQ3SlRjUERwUkp0YVd2cTdhTGIrUHlBOTA4?=
 =?utf-8?B?Mytkc0VnSVBObC9NSmswTXdCN3FESTVLbk4vVWZOalJBNmVTWXg5OXB2TEw5?=
 =?utf-8?B?aFduU0FDNmJ1Rlk5anp3TlFrTXNVYmdEeW1VdVhBa3VNdWRxTThvaVZnVjFm?=
 =?utf-8?B?SFhHWUtjQ3BSdFVCcFl6K1h0VEU3dmQ1NkdpbE1kZnl0emp4OHh1YjAzZTJY?=
 =?utf-8?B?NGZBNkFOSnEzc0FLUWMzdWpNUWsrVFgwOVBSNVhjYkR3dFdkZk5zVzRRUXZT?=
 =?utf-8?B?MU5zV1E4WFp2Ti9jL1Jvb0VmRHdQd0VWMHFXazNjWFpsazVxOVNUckRSdVQ2?=
 =?utf-8?B?WWlqc1p1ZU9jM3d4MDJGZ1BId1pzRGhncTlTT21JNEUrVXlHZGhTc2IwYXN4?=
 =?utf-8?B?eUlqU3B0NzgvY0FpNTlvUDlRM1F6aUVaRk5IUU0rTHgzSVp4UmtrdjJKVWc5?=
 =?utf-8?B?R3FzQWhCaFhvRHdBSjVNbFB4RVpTWjMvSVhET3ZtUkw5bllRUG9Hc0dIcFo5?=
 =?utf-8?B?YjlMRU9DMXVMVHFFSzdjQitmY1hBRGZrRzBZY0RWaU1GSVcxaDF2SXVZSTNk?=
 =?utf-8?B?VTg5Z2cwamtXTlNURUJla29UOFQ4Y0c1N243c2hCQ1k4Y0JWQXM2b2pGVHhX?=
 =?utf-8?B?YzBWbFB6eDBVamtUL0VIcTArdUppREtCUzZNZFNSbkdlY3VoVmVFeHJ3Um0x?=
 =?utf-8?B?QmZ5QlNFMURFNkFJZGlIUm04YUlhWnh4MWFUN2JjTkhZZTFZeFhPNWp2SkN1?=
 =?utf-8?B?OFlwVml2bnFUYmVXb2d2akRnSm9xU1VzNXF5dk9iNUd0RjNURmhiSGxhNFBn?=
 =?utf-8?B?ZFNNczRPRzlzU3EwaEZlWUxJQ3hzRGxVT1RrSnR2NHhDTmZDQU1pVUthbkxn?=
 =?utf-8?B?akRzWlRrSUMwMGVoMHdRVXJvYVdjS2tYRHAvaG1DSE1FZ1hCVmN5bWJIZVRl?=
 =?utf-8?B?TjE1bGJxNTM2dWlJUkhCN21EaURETlI1b3JUajJTUGt4eHVDSUcyc0szclAv?=
 =?utf-8?B?b3ZyaW9MaWJnUE1IazJXNTNYV1dCRmRkM3AweFpBKys0Y1NQNzAxTmxIakww?=
 =?utf-8?B?MXIwN29ZYjlnWWdEUTc4cllLQ21sVk4xdk9sd29ZeFFuQWxmOGM4N0lRT05C?=
 =?utf-8?B?Rk1IR1l4TXR6dGNpSTlEN3VrUHp5dFUwL1l4ckFKdkdUeUhxbDRPbWN3aDQz?=
 =?utf-8?B?RndoUjJDUGRMR2creU1LakMvY2RnRXhubnd1MW9kWVRUeXRNRXA0S1prdkFP?=
 =?utf-8?B?bGE1bktGQlZtbzJ3TFVlMUdoUUhxUVFRMXFJT0VWUDMxdHR5UEI1MExYZVcz?=
 =?utf-8?B?MzBWRVZjbGlPUGY5QTJ3RFoxbDRlRUp4ZHljSkoxdHMzT0NuWGgweW12WnNJ?=
 =?utf-8?B?bWhoTno4Ri9Xd25JdlowdXlpRlBMcGdQYWlLRnczYVFLRmtiQ1RoKzRkRmxl?=
 =?utf-8?B?R1B3aTJneHE3QWNtUHJZWm8wUmhxb1ZTcis4TWJYY0J1N3o5cEczOWZlZXdr?=
 =?utf-8?B?ZzNDakYzS013R2szTG1sZWp4K2VOV2hNSXV0NnNpRjhBVURKWVJ1NkJJQ05x?=
 =?utf-8?B?cFNGQlU1WHdCU3kyYXF1TlVqbTlyeDJ5ektJT00yWnEvL0orMEdmSXlLeGdZ?=
 =?utf-8?B?VTlQMjFDSmUvV3pyVXRtQWpqVTdMSGl0cyt0Z2Fva2doRUtYSlBlTkVCZHVv?=
 =?utf-8?B?ZkdIY1FadmpjSW0yblFIYVRlbUsvOXlUNGw1RmExcUdRSVBQN0dVR3VyQlVo?=
 =?utf-8?B?RDdyZWIwUVlIcWF6WGlmRDNid2xFQnp2eUw5dW11TzlWSllGM25XTWU5R3Zi?=
 =?utf-8?B?ejFVZ0VUU0M1NVRWZllOZEFMYnN4UkF2dzRQak9vTjMvN3kwd2tDaU80RGd5?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	faCgSehP8KLrUHyBDa3GF9uBeB2k378xEllNbYAfAZv9u33ykWKqTzqqhwELlGBs6UjKhNjRrhYq/OnaFEsovV/0ynRS5m6hAaIMhDFgO8vPX4ZVpw4kKHytW1U3wnbVp72L9qMbygJ5XurjWNkujt6JlkTflmzN2Z2xGFR6yki096zq7Db0NkY/AZou69tpjqEgFIjJ8WK4+PVGP+ccdQgGZOo5j4iEdHWtdMh/jOnfLPY0O+V/wRdfgcv7stHYooxIDNhbnj3fGw4x2Q8rrj9j4glem88RUyfycNhf3eX3bL01dae1RXUA+X0cTZFslaAtzuLeAPNsbchh38jBta87ySGOlplobODD6R+ZC9L1NiOHsgdM8z3DTG6XQRebiFrYquCif8IM/+j61jaiIq2Y3fQM/cQGD/mC+XjVoNS+HcLGDhO70Fktg0WTRLMDRdlnPwhHjOEM/HW/5vIlLbHqazvXnU3hE6h5SQ2OC/MQtAcT9bHTef0QomFR2HwYl+nbVNKBQHOt5haPSQyah/kPzJG60ce/4u9HFrxDJZcUNlzMl7IMqbQnzLFv4s97AdUktgv2I/KC948/OjXjq0Lh1VMUP94vX3HUCrTAF1Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506e7a99-3fa0-4ad9-6d51-08dd778d3538
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:37:32.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AbEhNME14rZdxXf9xw6BwKW1DZoHOrh+Mu17EUTwZSIEfFcNpe8S/oVmfR9VKkoRAbMfhrAEqkR0FsvLkzHyfL1+bH7WfnUqJ5o7ioZCDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504090114
X-Proofpoint-ORIG-GUID: 132dydSPYeWW596rHHDhVHU0VosIIgBI
X-Proofpoint-GUID: 132dydSPYeWW596rHHDhVHU0VosIIgBI

On 4/7/25 2:40 PM, Sidhartha Kumar wrote:
> For the maple tree, the root node is defined to have a depth of 0 with a
> height of 1. Each level down from the node, these values are incremented
> by 1. Various code paths define a root with depth 1 which is inconsisent
> with the definition. Modify the code to be consistent with this
> definition.
> 

Hi Andrew,
could you add the following to the commit message:

In mas_spanning_rebalance(), l_mas.depth was being used to track the
height based on the number of iterations done in the main loop. This
information was then used in mas_put_in_tree() to set the height. Rather 
than overload the l_mas.depth field to track height, simply keep track 
of height in the local variable new_height and directly pass this to 
mas_wmb_replace() which will be passed into mas_put_in_tree(). This
allows us to remove references to l_mas.depth.


> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---
>   lib/maple_tree.c                 | 82 +++++++++++++++++---------------
>   tools/testing/radix-tree/maple.c | 19 ++++++++
>   2 files changed, 63 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index f25ee210d495..236f0579ca53 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -211,14 +211,14 @@ static void ma_free_rcu(struct maple_node *node)
>   	call_rcu(&node->rcu, mt_free_rcu);
>   }
>   
> -static void mas_set_height(struct ma_state *mas)
> +static void mt_set_height(struct maple_tree *mt, unsigned char height)
>   {
> -	unsigned int new_flags = mas->tree->ma_flags;
> +	unsigned int new_flags = mt->ma_flags;
>   
>   	new_flags &= ~MT_FLAGS_HEIGHT_MASK;
> -	MAS_BUG_ON(mas, mas->depth > MAPLE_HEIGHT_MAX);
> -	new_flags |= mas->depth << MT_FLAGS_HEIGHT_OFFSET;
> -	mas->tree->ma_flags = new_flags;
> +	MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
> +	new_flags |= height << MT_FLAGS_HEIGHT_OFFSET;
> +	mt->ma_flags = new_flags;
>   }
>   
>   static unsigned int mas_mt_height(struct ma_state *mas)
> @@ -1371,7 +1371,7 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
>   		root = mas_root(mas);
>   		/* Tree with nodes */
>   		if (likely(xa_is_node(root))) {
> -			mas->depth = 1;
> +			mas->depth = 0;
>   			mas->status = ma_active;
>   			mas->node = mte_safe_root(root);
>   			mas->offset = 0;
> @@ -1712,9 +1712,10 @@ static inline void mas_adopt_children(struct ma_state *mas,
>    * node as dead.
>    * @mas: the maple state with the new node
>    * @old_enode: The old maple encoded node to replace.
> + * @new_height: if we are inserting a root node, update the height of the tree
>    */
>   static inline void mas_put_in_tree(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, char new_height)
>   	__must_hold(mas->tree->ma_lock)
>   {
>   	unsigned char offset;
> @@ -1723,7 +1724,7 @@ static inline void mas_put_in_tree(struct ma_state *mas,
>   	if (mte_is_root(mas->node)) {
>   		mas_mn(mas)->parent = ma_parent_ptr(mas_tree_parent(mas));
>   		rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
> -		mas_set_height(mas);
> +		mt_set_height(mas->tree, new_height);
>   	} else {
>   
>   		offset = mte_parent_slot(mas->node);
> @@ -1741,12 +1742,13 @@ static inline void mas_put_in_tree(struct ma_state *mas,
>    * the parent encoding to locate the maple node in the tree.
>    * @mas: the ma_state with @mas->node pointing to the new node.
>    * @old_enode: The old maple encoded node.
> + * @new_height: The new height of the tree as a result of the operation
>    */
>   static inline void mas_replace_node(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>   	__must_hold(mas->tree->ma_lock)
>   {
> -	mas_put_in_tree(mas, old_enode);
> +	mas_put_in_tree(mas, old_enode, new_height);
>   	mas_free(mas, old_enode);
>   }
>   
> @@ -2536,10 +2538,11 @@ static inline void mas_topiary_node(struct ma_state *mas,
>    *
>    * @mas: The maple state pointing at the new data
>    * @old_enode: The maple encoded node being replaced
> + * @new_height: The new height of the tree as a result of the operation
>    *
>    */
>   static inline void mas_topiary_replace(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>   {
>   	struct ma_state tmp[3], tmp_next[3];
>   	MA_TOPIARY(subtrees, mas->tree);
> @@ -2547,7 +2550,7 @@ static inline void mas_topiary_replace(struct ma_state *mas,
>   	int i, n;
>   
>   	/* Place data in tree & then mark node as old */
> -	mas_put_in_tree(mas, old_enode);
> +	mas_put_in_tree(mas, old_enode, new_height);
>   
>   	/* Update the parent pointers in the tree */
>   	tmp[0] = *mas;
> @@ -2631,14 +2634,15 @@ static inline void mas_topiary_replace(struct ma_state *mas,
>    * mas_wmb_replace() - Write memory barrier and replace
>    * @mas: The maple state
>    * @old_enode: The old maple encoded node that is being replaced.
> + * @new_height: The new height of the tree as a result of the operation
>    *
>    * Updates gap as necessary.
>    */
>   static inline void mas_wmb_replace(struct ma_state *mas,
> -		struct maple_enode *old_enode)
> +		struct maple_enode *old_enode, unsigned char new_height)
>   {
>   	/* Insert the new data in the tree */
> -	mas_topiary_replace(mas, old_enode);
> +	mas_topiary_replace(mas, old_enode, new_height);
>   
>   	if (mte_is_leaf(mas->node))
>   		return;
> @@ -2824,6 +2828,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>   {
>   	unsigned char split, mid_split;
>   	unsigned char slot = 0;
> +	unsigned char new_height = 0; /* used if node is a new root */
>   	struct maple_enode *left = NULL, *middle = NULL, *right = NULL;
>   	struct maple_enode *old_enode;
>   
> @@ -2866,6 +2871,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>   		mast_set_split_parents(mast, left, middle, right, split,
>   				       mid_split);
>   		mast_cp_to_nodes(mast, left, middle, right, split, mid_split);
> +		new_height++;
>   
>   		/*
>   		 * Copy data from next level in the tree to mast->bn from next
> @@ -2873,7 +2879,6 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>   		 */
>   		memset(mast->bn, 0, sizeof(struct maple_big_node));
>   		mast->bn->type = mte_node_type(left);
> -		l_mas.depth++;
>   
>   		/* Root already stored in l->node. */
>   		if (mas_is_root_limits(mast->l))
> @@ -2909,8 +2914,9 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>   
>   	l_mas.node = mt_mk_node(ma_mnode_ptr(mas_pop_node(mas)),
>   				mte_node_type(mast->orig_l->node));
> -	l_mas.depth++;
> +
>   	mab_mas_cp(mast->bn, 0, mt_slots[mast->bn->type] - 1, &l_mas, true);
> +	new_height++;
>   	mas_set_parent(mas, left, l_mas.node, slot);
>   	if (middle)
>   		mas_set_parent(mas, middle, l_mas.node, ++slot);
> @@ -2933,7 +2939,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
>   	mas->min = l_mas.min;
>   	mas->max = l_mas.max;
>   	mas->offset = l_mas.offset;
> -	mas_wmb_replace(mas, old_enode);
> +	mas_wmb_replace(mas, old_enode, new_height);
>   	mtree_range_walk(mas);
>   	return;
>   }
> @@ -3009,6 +3015,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>   	void __rcu **l_slots, **slots;
>   	unsigned long *l_pivs, *pivs, gap;
>   	bool in_rcu = mt_in_rcu(mas->tree);
> +	unsigned char new_height = mas_mt_height(mas);
>   
>   	MA_STATE(l_mas, mas->tree, mas->index, mas->last);
>   
> @@ -3103,7 +3110,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>   	mas_ascend(mas);
>   
>   	if (in_rcu) {
> -		mas_replace_node(mas, old_eparent);
> +		mas_replace_node(mas, old_eparent, new_height);
>   		mas_adopt_children(mas, mas->node);
>   	}
>   
> @@ -3114,10 +3121,9 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
>    * mas_split_final_node() - Split the final node in a subtree operation.
>    * @mast: the maple subtree state
>    * @mas: The maple state
> - * @height: The height of the tree in case it's a new root.
>    */
>   static inline void mas_split_final_node(struct maple_subtree_state *mast,
> -					struct ma_state *mas, int height)
> +					struct ma_state *mas)
>   {
>   	struct maple_enode *ancestor;
>   
> @@ -3126,7 +3132,6 @@ static inline void mas_split_final_node(struct maple_subtree_state *mast,
>   			mast->bn->type = maple_arange_64;
>   		else
>   			mast->bn->type = maple_range_64;
> -		mas->depth = height;
>   	}
>   	/*
>   	 * Only a single node is used here, could be root.
> @@ -3214,7 +3219,6 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
>    * mas_push_data() - Instead of splitting a node, it is beneficial to push the
>    * data to the right or left node if there is room.
>    * @mas: The maple state
> - * @height: The current height of the maple state
>    * @mast: The maple subtree state
>    * @left: Push left or not.
>    *
> @@ -3222,8 +3226,8 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
>    *
>    * Return: True if pushed, false otherwise.
>    */
> -static inline bool mas_push_data(struct ma_state *mas, int height,
> -				 struct maple_subtree_state *mast, bool left)
> +static inline bool mas_push_data(struct ma_state *mas,
> +				struct maple_subtree_state *mast, bool left)
>   {
>   	unsigned char slot_total = mast->bn->b_end;
>   	unsigned char end, space, split;
> @@ -3280,7 +3284,7 @@ static inline bool mas_push_data(struct ma_state *mas, int height,
>   
>   	mast_split_data(mast, mas, split);
>   	mast_fill_bnode(mast, mas, 2);
> -	mas_split_final_node(mast, mas, height + 1);
> +	mas_split_final_node(mast, mas);
>   	return true;
>   }
>   
> @@ -3293,6 +3297,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>   {
>   	struct maple_subtree_state mast;
>   	int height = 0;
> +	unsigned int orig_height = mas_mt_height(mas);
>   	unsigned char mid_split, split = 0;
>   	struct maple_enode *old;
>   
> @@ -3319,7 +3324,6 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>   	MA_STATE(prev_r_mas, mas->tree, mas->index, mas->last);
>   
>   	trace_ma_op(__func__, mas);
> -	mas->depth = mas_mt_height(mas);
>   
>   	mast.l = &l_mas;
>   	mast.r = &r_mas;
> @@ -3327,9 +3331,9 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>   	mast.orig_r = &prev_r_mas;
>   	mast.bn = b_node;
>   
> -	while (height++ <= mas->depth) {
> +	while (height++ <= orig_height) {
>   		if (mt_slots[b_node->type] > b_node->b_end) {
> -			mas_split_final_node(&mast, mas, height);
> +			mas_split_final_node(&mast, mas);
>   			break;
>   		}
>   
> @@ -3344,11 +3348,15 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>   		 * is a significant savings.
>   		 */
>   		/* Try to push left. */
> -		if (mas_push_data(mas, height, &mast, true))
> +		if (mas_push_data(mas, &mast, true)) {
> +			height++;
>   			break;
> +		}
>   		/* Try to push right. */
> -		if (mas_push_data(mas, height, &mast, false))
> +		if (mas_push_data(mas, &mast, false)) {
> +			height++;
>   			break;
> +		}
>   
>   		split = mab_calc_split(mas, b_node, &mid_split);
>   		mast_split_data(&mast, mas, split);
> @@ -3365,7 +3373,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
>   	/* Set the original node as dead */
>   	old = mas->node;
>   	mas->node = l_mas.node;
> -	mas_wmb_replace(mas, old);
> +	mas_wmb_replace(mas, old, height);
>   	mtree_range_walk(mas);
>   	return;
>   }
> @@ -3424,8 +3432,7 @@ static inline void mas_root_expand(struct ma_state *mas, void *entry)
>   	if (mas->last != ULONG_MAX)
>   		pivots[++slot] = ULONG_MAX;
>   
> -	mas->depth = 1;
> -	mas_set_height(mas);
> +	mt_set_height(mas->tree, 1);
>   	ma_set_meta(node, maple_leaf_64, 0, slot);
>   	/* swap the new root into the tree */
>   	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
> @@ -3669,8 +3676,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
>   	WARN_ON_ONCE(mas->index || mas->last != ULONG_MAX);
>   
>   	if (!entry) {
> -		mas->depth = 0;
> -		mas_set_height(mas);
> +		mt_set_height(mas->tree, 0);
>   		rcu_assign_pointer(mas->tree->ma_root, entry);
>   		mas->status = ma_start;
>   		goto done;
> @@ -3684,8 +3690,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
>   	mas->status = ma_active;
>   	rcu_assign_pointer(slots[0], entry);
>   	pivots[0] = mas->last;
> -	mas->depth = 1;
> -	mas_set_height(mas);
> +	mt_set_height(mas->tree, 1);
>   	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
>   
>   done:
> @@ -3804,6 +3809,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
>   	struct maple_node reuse, *newnode;
>   	unsigned char copy_size, node_pivots = mt_pivots[wr_mas->type];
>   	bool in_rcu = mt_in_rcu(mas->tree);
> +	unsigned char height = mas_mt_height(mas);
>   
>   	if (mas->last == wr_mas->end_piv)
>   		offset_end++; /* don't copy this offset */
> @@ -3860,7 +3866,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
>   		struct maple_enode *old_enode = mas->node;
>   
>   		mas->node = mt_mk_node(newnode, wr_mas->type);
> -		mas_replace_node(mas, old_enode);
> +		mas_replace_node(mas, old_enode, height);
>   	} else {
>   		memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
>   	}
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index bc30050227fd..e0f8fabe8821 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -36248,6 +36248,21 @@ static noinline void __init check_mtree_dup(struct maple_tree *mt)
>   
>   extern void test_kmem_cache_bulk(void);
>   
> +static inline void check_spanning_store_height(struct maple_tree *mt)
> +{
> +	int index = 0;
> +	MA_STATE(mas, mt, 0, 0);
> +	mas_lock(&mas);
> +	while (mt_height(mt) != 3) {
> +		mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
> +		mas_set(&mas, ++index);
> +	}
> +	mas_set_range(&mas, 90, 140);
> +	mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
> +	MT_BUG_ON(mt, mas_mt_height(&mas) != 2);
> +	mas_unlock(&mas);
> +}
> +
>   /* callback function used for check_nomem_writer_race() */
>   static void writer2(void *maple_tree)
>   {
> @@ -36414,6 +36429,10 @@ void farmer_tests(void)
>   	check_spanning_write(&tree);
>   	mtree_destroy(&tree);
>   
> +	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
> +	check_spanning_store_height(&tree);
> +	mtree_destroy(&tree);
> +
>   	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
>   	check_null_expand(&tree);
>   	mtree_destroy(&tree);


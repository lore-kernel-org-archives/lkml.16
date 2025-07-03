Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC982E612B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545281; cv=fail; b=fBx7DnSDM0UWPvRMWd0jwtK/uPtDtAXhu0heEGTvzNVAmlm0UpCB5uWefBnDHVTmgdzMQ9yd9Jt/lf6utB71Fsl4NFCcGNSxE1HYr6808nMSF7zQZ9finDBx5s6UEgt6Jtkor0TJ+eYFgKYfXuL6Ku7uuNV9NMaxMn7cODEeZhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545281; c=relaxed/simple;
	bh=9HYrIihak/cqbUwvPFJznlgEO2lbgLWwaJrEhI4N0Vc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SIjjmmWfkfJ6Owt1rv0yU/bqwa9yOzJBpka2ULmsx/Ehc5q4HJ/j0OlIuHHXbEJHR2/SCsZJo5v5Ajik8CyaR4019QUQ0yCnrY5TJftEXM636w6Dm0sAVLjNxvQbFnmQrWAmkkozS12p3JhI7zCKnlYwzIZ5+IDdW9thTV3F4dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z17Es/mj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S2YUzzbG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z17Es/mj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S2YUzzbG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639Z1nH001710;
	Thu, 3 Jul 2025 12:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tjiJTTbwz53/XzkFbYuwqUz1cj59ud3fjGmRl+Iq/SY=; b=
	Z17Es/mjc8Nc4iksJdCl+CeSPHXum1/HBr3Dl2m3kYIP21JhO4v+C0tNFgx177JZ
	QLtezQnZEOjYE25dDjYrpNalwc2KPZYINjdX8QNfwbAHs+fy+LxtxkLc/SaFkdCY
	oDI1nWtmMPMEHtq1+NR/OKYBrdnn33p2c3x4DaErT8rtjdmLF9cYbf9SEgP5ma4x
	zM4/BSP0kQV26+DPKbnpAejx/kwtAOYR96qoLJqYqJWxdOfQakQcLb0XG5wOrvwl
	G6ZFJiHXo0D0cqCHHYJrOhMWj7wxal9nsHVrBVOU9MEfj95XTxl49j9YdGii8STN
	4AfQAR8974AxdEMx2zfdKg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af8vs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 12:20:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563BG1W0027590;
	Thu, 3 Jul 2025 12:20:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uchm2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 12:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2DwN9gRBPH9fWAAciGxIiXLqfduWC/EM03zIdOBQUiOHJ45eCqkkmJyxGunXDpNZ37q9CztWYvxMzjII+zGp2cPGLa7WGIc/KmSorO4IAz3IzE3i9nuXKcqzy95VhZJswzllOG9CMhB5HISAWTTqMerBrVU23uIdI/WJt52fBzndSRew6ldhQ60hKRz1gtpzoNIy6Xmz87GZpVVLPveV/zLgjUfVHxIVD3dDoJgNTEW/uFXSXEB0+A0EecC6SpPQLrohRRqyQVAIgVREa9rCos5IfCE/alOwcAgh8SjiNXbjKlJaOQat8lGGEAUgv2nCPXkwJd566Dl7DBs9/iqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjiJTTbwz53/XzkFbYuwqUz1cj59ud3fjGmRl+Iq/SY=;
 b=ndyZaDUmYlSvYG37BJRg61Swsk9G3tPHTmVQVJPeBD5TLuzRf2BRyT/qUMO0+E9dx3jhJeXZoSSkG/mwb3YZJBUbcRASGy7g1enWfZezuLKU6iibJd7UqezCfOuVBUwxLtvO/TghjDvZU8kIGXadbroGe+nHXe9TtGe1N+TMKDB2J6hxNlHfohLypfxIVteXkbmYOzScYe2RCZS270Wkj/itqFvD0uQvmnZfZhsaalb8xda5HtZYco0dSFAE26ing6hGwEhZRPPlXd1nKs4tdLFlDpQBtysa0VxtDaa1j4Y/QXoPLfkwO/SbzvlC+x7/K29gRsN+HTOnfrpQYaAKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjiJTTbwz53/XzkFbYuwqUz1cj59ud3fjGmRl+Iq/SY=;
 b=S2YUzzbGPS6CqDUxJNlzvyggvYqSfV0a5SQPC8P19jyqq1GjQXXJwUr41ZXcYfweMsoQc1PzWGMMZDltJSHuChkG3WPs/TrTrlrhf/uIqc8TzGO4k6MwOr2i11xe/HhuH2ySegv5p8B+MOlR/IMkq6XziFLjSlOLUI62GBz35c0=
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f) by PH3PPF0A29BA37B.namprd10.prod.outlook.com
 (2603:10b6:518:1::787) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 3 Jul
 2025 12:20:50 +0000
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a]) by DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 12:20:50 +0000
Message-ID: <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
Date: Thu, 3 Jul 2025 05:20:47 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: "Chen, Yu C" <yu.c.chen@intel.com>, Michal Hocko <mhocko@suse.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
        Jirka Hladky <jhladky@redhat.com>,
        Srikanth Aithal <Srikanth.Aithal@amd.com>,
        Suneeth D <Suneeth.D@amd.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka> <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF5ADB4ADFC:EE_|PH3PPF0A29BA37B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f24449f-a736-4649-8c4e-08ddba2c0be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVBzTEJvOXU5cWJpT3NhVlU2UW00NlpVc0M5M3lkSmh6SWlFdnRDS1Y2aFg5?=
 =?utf-8?B?dUFxeEZ4OHBvOE13NlAzNmdMRnF0UUkwWmsxOG8rU3NGcFdPeFU4NVc2MjFu?=
 =?utf-8?B?YzhVNzNkbU1Sc1pCWWtkK2F5RzY4QTUvZk81a1g2L20raUVjanYxQ241TXVF?=
 =?utf-8?B?dU14U0FOcUVTYmwxdTNHQ0pZK1ZGUWxQcW1QQmFrSElKMkUySHdhVnYxV1Fi?=
 =?utf-8?B?MWFTVm50ZVN4a2x0YTllbTZZOUNwOXhPeVl0TUF6YkpTcXpoK0Y1VEFCNS9x?=
 =?utf-8?B?TndBTEVrVUNucFIyMWVkQTdzNXF3ZVc3ZTExLzV0RjV3OEszR0U1VXJzSTZM?=
 =?utf-8?B?RFEvTnM5Y2gzVlpKUWdKaGdKK016RjBCRW5OOEI0L1hiQ1pTc3R1SkNTSEdF?=
 =?utf-8?B?YkkwV0tObGVIV0ROV1B6VE9JV3I4S2l6N1E2azJ2WlB0RDJ1TEFVcVcxWFda?=
 =?utf-8?B?aUF4QkxXSTZNRVJ6VG9KaXJkTGxwN1dNcW9QZHp4dk9lYkJOK0pScDUweGg2?=
 =?utf-8?B?a09BbEtzNVVJcDlYN0piTk0zTVErc1ArWERIQTZHVW9PaG5QYjJOMnI1UU5I?=
 =?utf-8?B?elBqM0haSE55ZHVtRXBzRWNGRDBkNmhYSnlSaTIyTm0yc3h2bm9QSGVJbmpm?=
 =?utf-8?B?dmEyVkdSR3FkMWtTR0RvY08zQ2xvNjJuemloaG5ReU1oTm5sTUJ1TFR2Zmw1?=
 =?utf-8?B?eHMvSS9veVk4T0tFVU8velltaUJsSmZuNzZFTXprR0QwWmxwWnV6UFlzbm9Z?=
 =?utf-8?B?OGtmQlZZZ2txZFFJMjZFR09iNnIyMHlCN21DdEhveXNmZlJibXdya1AycEVP?=
 =?utf-8?B?ZC80M3BLTGcreGdDVlFEcGcrcVVNMjZnMExBbFY1dmdLYlNUMjVTaWxwd2VF?=
 =?utf-8?B?aHliWXNFV1lIVXhNZUYrcEUxRGJYcGZ3eGtySjBWbWhsZ0hlYlhuT0NWZGMr?=
 =?utf-8?B?Q010SjNlK2hla01qNTBmdDFKQ0NOWG1GKzFJekpwNVU5d2tSRmVOeW5ScGpI?=
 =?utf-8?B?TzhhT2V6eHlBZUJ0UE5NRDEwYmVWSTNNS2tBYjJUVlZwbEdQY1A0eTE1UUtM?=
 =?utf-8?B?RmRyZTAvNFZycklyNStJSG0vSVFZd2huQnNOTW54M1dzSnp5TnNENmpMSWNN?=
 =?utf-8?B?TDRhSm11QXNOd2NNMll3UFZHT0JaVVVTaDBkZnl3S2ZpczV1aVhxYWd3Wi92?=
 =?utf-8?B?MU9TcTFQbllwWXNOa1dRaWJ3MlpVTmM5RFZBT1Z0Vi8xT0FPRCtBOHRoSnNv?=
 =?utf-8?B?dDFDSFdOa3Q3MktHSGJ6aVliWk1tMXBXNEUxdnlIcmNaSEEza2lXVlhabHVh?=
 =?utf-8?B?Q3FOUXRBU20rVnhnY3pDd2dEbXFmcXAzeFhoNDZyd2VUN01USjNDTmc0d1pK?=
 =?utf-8?B?TU5KeWhJc01aQlBHd0NNK2xpUUl2QU8yUmlHK0xaS2EyKy9lTFFiZEljVThX?=
 =?utf-8?B?bjVwS1IxMDZHcFVWUG10NnJ1SmVRS1lySHNWN2dMeG52WkJrSVNkbzR5anRY?=
 =?utf-8?B?ejFMZGQyd1JBd3pzdTBSb2h3dWgwck4yb3pnSGxxVHVoRi96WEU0V1FabHcr?=
 =?utf-8?B?ZE5NVnh3R3pUMEdIS2p1ZU92ck5wb3htekx2ajVDdmxHaVhRb3crNUNYeWla?=
 =?utf-8?B?LzBGMWlLTnJ4cHRmRVl6QlFuVGQ0RmJVZjhIcUtENW85T25qbGxpOXB2aGRD?=
 =?utf-8?B?T1A0TmpBM216RXUzbHJranNkMi9TR1ZoZ1BlUURndmMySW53TGNlb2srcVVv?=
 =?utf-8?B?UkFEeEp3WWlBWWZuUWF5Y1EvaFZZK2QwWm5qSVZ1TTdKSEp1QmhQdGtXZk1t?=
 =?utf-8?B?bFlDV2xYQ3VSV0dWNk1kY21yOVZ5MGMrcHZXTVd6OHN2TE5TclI1ME9GZTNi?=
 =?utf-8?B?ejdGQnltTHdkdG5xaExZMGN2K0w3OUNtaktkNWdZcEZ6QW54NkVhRGY3ZExt?=
 =?utf-8?Q?5g2UrGyvdx4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF5ADB4ADFC.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a29wdHFZbUdOVCtEOEhPR24zRi9VL3NDM3NzSFY3RlM4VXRiTnkxNTFlbDZz?=
 =?utf-8?B?dFhSZW11ZUZOenlMTitsTk5kOWdRcXVrMHQ0TW1hQ0VjdU43UFdVYUtja0ZQ?=
 =?utf-8?B?RFZ0NkZCbHAxbXdJTU5Xc3EyNkdLZWlHT0VIMlhtTkYyTElnVStvMUV1akU5?=
 =?utf-8?B?MDlDU3ZIWU95VURvbUZRb2EzTy94Z3FtUGhpcEFaSUVYbE1DZ3AvdCtpYjFx?=
 =?utf-8?B?Sk5QWWw4L3c4UkxuMVBFWDlhVmcvWjE4RlVSc3lSTHJpSm40OFFxTzM3RVRr?=
 =?utf-8?B?VGdvTE9SUGp0cGl6R3doMTNaTm5xNlAxYm55SDhLSWJrTzV4djFrTHc5dHdW?=
 =?utf-8?B?aUVPamJjYXVyL0RDQTdiVHlZY2VIeGNYUmw0cnVMUzZpaDFUN3JzNWxHTFpx?=
 =?utf-8?B?M3NzNzFXV2VjcGE0Rk5GZ2NJM0Vva0JMWW1NVDlqbmJ4UzBSYnl4bjZYZ0Ew?=
 =?utf-8?B?ekJ6MzMva09tQUxuR2MxVGwyeWJDdmYzcE1aaTdhM0U4aVN0OFFiWTQyMVdn?=
 =?utf-8?B?ZzFyZlE2cXpkekdrR1poZmpFOXRrSkdzWXdnMmFNdDRoMnVpN0NWRkFNY3BP?=
 =?utf-8?B?cmN4RlNZZkd2c3U3R08zN2Y3S0phUENQZWdRa2NYOG1kclVtbThKUWgyYzg5?=
 =?utf-8?B?S1N4Um5qVEIySmhvYjB6UGQ5RXRVOEtBZjNJeTVlcUZSaE1kNncxU1FCWFNW?=
 =?utf-8?B?OFNtYjMxMC9RWGNLZFl1STdhc2dnc2pUNE5jbXFKYnlUMXd3MDdqSmpwSnpH?=
 =?utf-8?B?TzU0d2xhYjJTMzFJR3FvNVFjM1A5QTIrS3g2emdUYkREN1c4dC9XMG5PREps?=
 =?utf-8?B?dTloWVRLT0hWcVBoYXVhYnE1WU40RXArdy8rMEc4ZnB1UGlOa1pjSjFMU1dK?=
 =?utf-8?B?U092MHRHWHNhQkhyc2NJWVV1RUJETWdFVFVqV2tLMVd5REFaNU80RjhMcG9J?=
 =?utf-8?B?QytqK3dYajBQN3JUblN4R29xU3oyd1Axd1FXdUM4VkxDUTVtckZibUNmbmJE?=
 =?utf-8?B?Q1N1S0RDT0JvSCt6SC9XS29BTzVjVFVwbHM2dzRKRGk0eGZzZzZDSWRIWlJI?=
 =?utf-8?B?Y0pDY3Y3K1BhSkg1SkJCUmZqYUl6RGxJVFozOFhIQ0VQVGFiSEhtam04dnpY?=
 =?utf-8?B?V1EyeHZveUZ2QWFuMFgwVHh4eUFPNXZkazQ3RndZb3hLOEV4RjlodCtiOXhM?=
 =?utf-8?B?Vm1IM01BNG1nbXl3ampkbUNQOEVYcHhwYWVUaEdyaFhRUzRpc2psOVZUeHZH?=
 =?utf-8?B?RzZjQXdqNmx4d3p0QSt4cm1TbVN6MmZ5bDc5M1Q3eVAvSE5rTDVwRnQzU01N?=
 =?utf-8?B?NDVaelVEUXhZYkVtVDdZTWVsZ1JtaEV2elhHckw3NVNWQk92NUVvQW1rcmx2?=
 =?utf-8?B?ODcyU0t1aUlNYjczRndORld3aWhtUU5ZYnRkSFl3N3ppWFliRWd3ays0aXFx?=
 =?utf-8?B?Q0tvSUNDcmV0OEdNeGt2cmZOamlFVUU1TEdtRXhLSWlnZHp6bUg4NzRBU0hB?=
 =?utf-8?B?Zm1EdFhpdjJDcm4zQXo0OFQ4cjBDdEtvaExGNDc1S2lnK2xtRWtGM0dmOXFL?=
 =?utf-8?B?eUxLTC9IblUyKzA3dEFZU2t2aExpK1p1eDhhVTVkNFQ5Z0RETXlJUU5zZTli?=
 =?utf-8?B?YzhrdGtMU1c0Y1BBaGNma2svTkNyOVVia040R1cvajNFcC8wd3hpRVR1WWxw?=
 =?utf-8?B?NW54cmZqcDZXUi9SUjJseEJwTHdBRlh0KzRBK3c3cXVBVzRiNUdWclRCMVN5?=
 =?utf-8?B?VnJkVkdROHpUQUN3QTZabDZVUWdYbW94WlQ5RnFxSW9LbjVheDdMVzFJbjlP?=
 =?utf-8?B?d0c0QS8wOG9vOU44NXVxQmhNbmZSYUtWalM5ekRuMVVkc3hPQXdTcGhQMFlo?=
 =?utf-8?B?ZmpjUUlZVmRXQUZEUFV4UUt1TCtrQnMvVkY2bmN1aERRKytIaFQwTnoyYlRQ?=
 =?utf-8?B?c2hLOUhINVdUVGRZZVB4YVc3bE1kaGJNWUZBbWRna08vNldDa2YvRjhLdWZz?=
 =?utf-8?B?djlQZ2lCZkk5RWNWVTg5cVNsVVU2TWt4bDlLK1Z1ekZ0M2k5VnplZDlBRU1V?=
 =?utf-8?B?ZEgrc0FFdU1RSHBQVU5NQWtnWjJLTSsrVHZDSzZzcUpzQ1krbkQwaVZPcnB2?=
 =?utf-8?Q?r22Lb28Hu2NbMJlIbo3wbABan?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qQxDSmJrA1LcOVaCV3j8Xo16LZiSi3G5g9aCpHu6sfbUa82x3QFnB/33+cY9nhWlXFkPGkEqSPr1l4p0cAxly1PCpzN6adQPRTcQW9fCKKFjBLg01j3/AXLLZB+2ERMWv2KEyAOzNCsva53iNlBVWiuYKzaIN6AofeAnS7k4iGNWZpBKYYde1RVdUGU3qhZmzA+Q9V3rE7gKdh5CGFvbcRBmrz/Kb1oPHXiBzeipxZ8CiuRTAMoaWWZ9wOFsTyT4Wi+3/wPhxst/o4DMuTx62bgbqX1uXcFnkevnTFK8jlal7i6HWPkguX2V0PktTIZsOP/vCOQsGk/mB/b2j9bOAdo00uqx0ZX0kLBBC0RJladsoa5/16KwgDUfN1hoiqUYYdXBNRK7EFLp7e6pSHga+NiEcC/IIHYqygwQlSYGCyXVRf2CJ5DHp7Sqx09hmD21TOJdt0+fNVJl24aEZQDISrkMkPyUQQE5DuPAg7wO34L/g+AEIanNcZVcmU0UWgMeo8h4MxEtoXWUkCSSlE8tkJlFnbYkdB2uq9ZFTwYbyyXErk5Pql16DNMP1UblIsD24wBBUBiu5oUHv31Q5bY2BBjzOg04y7F9xQNpQ0uRX1U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f24449f-a736-4649-8c4e-08ddba2c0be4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 12:20:50.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzXNEAMKZYEmyokuOYeQ0XVlppfBmmI2zth6tes3TNNh6g0Llf27yP8cH9IGWT/lOzXROg5YHN1rPb0jaPuhLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0A29BA37B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030102
X-Proofpoint-ORIG-GUID: gM0um1rLwEQu2mqyWWWlll6iqc5OIdSB
X-Proofpoint-GUID: gM0um1rLwEQu2mqyWWWlll6iqc5OIdSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMiBTYWx0ZWRfXwK/NqS4fJ5M9 6+OwyRo+1XmdRLSk7y/33VItIlFToc6wBdUC1e6TxGDI2cMJvVEi8032fphxJnBU10eBS91iOgu 547Ar6dyzAxm7GdABqNkR1wAglzk1rON+vX+x4gwHqaj4AKaW81KbLRN7SGqaMHkKtL6MijbFz6
 gqtM79jCroCzRoa9G7c8wlNLXj00ZztRU7K1mxxoRiQXM90bfOFumSls5uj3JHurP8alN7SIn69 l+e68tH+MYG8zvWthKrQiR8T1q7N+pt5e+OwOMPCyz7RaMJScwiw2TD7X8P6q58jd3ICt2FB362 wtXIGysXrsbhJcWcJZ5XnHnP3dGhJUGDCLpYScP+lQLETNBs69C/+4yfmu/oOxn5XqMIiEL/AEr
 IExbUyVaLpFWr7EtQFrR4vOIqG3WUOjuFKXhYI2f7WIKccbdxkfi7xfKzkuht97UcI9ArRoy
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=686675a6 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=BqM5uE05BchT_LHo8y4A:9 a=QEXdDO2ut3YA:10



On 7/3/25 05:04, Chen, Yu C wrote:
> On 7/3/2025 8:01 PM, Michal Hocko wrote:
>> On Thu 03-07-25 13:50:06, Peter Zijlstra wrote:
>>> On Thu, Jul 03, 2025 at 11:28:46AM +0200, Michal Hocko wrote:
>>>
>>>> But thinking about this some more, this would be racy same as the
>>>> PF_EXITING check. This is not my area but is this performance sensitive
>>>> path that couldn't live with the proper find_lock_task_mm?
>>>
>>> find_lock_task_mm() seems eminently unsuitable for accounting --
>>> iterating the task group is insane.
>>>
>>> Looking at this, the mm_struct lifetimes suck.. task_struct reference
>>> doesn't help, rcu doesn't help :-(
>>>
>>> Also, whatever the solution it needs to be inside this count_memcg_*()
>>> nonsense, because nobody wants this overhead, esp. not for something
>>> daft like accounting.
>>>
>>> My primary desire at this point is to just revert the patch that caused
>>> this. Accounting just isn't worth it. Esp. not since there is already a
>>> tracepoint in this path -- people that want to count crap can very well
>>> get their numbers from that.
>>
>> I would tend to agree with this. Doing the accounting race free on a
>> remote task is nasty and if this is a rare event that could be avoided
>> then it should be just dropped than racy and oops prone.
>>
> 
> OK, Michal and Peter,
> how about keeping the per task schedstat and drop the memcg statistics?
> The user can still get the per task information without having to filter
> the ftrace log.
> 

I agree. The other parts, schedstat and vmstat, are still quite helpful.
Also tracepoints are more expensive than counters once enabled, I think
that's too much for just counting numbers.

Libo

> thanks,
> Chenyu


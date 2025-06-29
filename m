Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB5239090;
	Sun, 29 Jun 2025 18:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222925; cv=fail; b=slNszvUUpEiBZocoIgvgE2tnX3aNtdcRDC+H2KDGC87rltxHI/7xJVoja5AEdTfYON0vUfQ/nzOgHq5hVoziCv9LulDxQnRJGHpKVEZdjAdb+WhH6Y+GHWB4rYWCpkTPVHqKmyfdt1MTbfMdOGIRRInipVBs0ZJbeIyQIXXBzfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222925; c=relaxed/simple;
	bh=dT425XwllpobGRRuUckNZqL9UM43uj+P0/LGZdqJfb4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GZn3duDCAaBKZ5q/x2kyvl2fWsL4Sw66aF5oi1wRZjOibDSV/2L52eINz2kgZrA5wBbqMARtExWt6glRzJ8F3QLD6wNvTaE86+Hlia9pw6CIgrHf1LfPCndvDVOMY5QtV+KcSXHXI8e6jd3oKV2IykPsvjcHOHRePpCFoIkywRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qVQxzogU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OV23KqIk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qVQxzogU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OV23KqIk"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TISve0001767;
	Sun, 29 Jun 2025 18:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=n3Udv0ec9XNJPw2yqzU0Tca4uT14fLCg/UGJcCQBE6o=; b=
	qVQxzogU7UuXKn1DPnSO+vcma1wQirM5IstPrMlZzKQWCDDa7VQsVJXuIzfsy/Rl
	M20qYdcmgTPelS242C3A2Sb6/yGKkkXmAdo8hakreN+Jgmj+cSEelS6lm9osUdXV
	7vJ/nbJE+OavNClC/2Q7CiGQdsjPgFe5Ff2LPvpEo5T+yEC/vo74EwDBmA4SVnUM
	W7w2LAasg4T2MV5RKIJSNJiEzxOvVxsWU4EZRzVls+2A6iIAe3xfr5UQubDQ4B/G
	eqmk7MVeaMQFmO07NlwpYtBtrALaOIue9nzoHTshVRMm+lfGibqspm0aJy+z4DW4
	yINPxoi+i6Qa7Kvb5nzv9g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af1ava-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Jun 2025 18:48:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55TF7X5S038416;
	Sun, 29 Jun 2025 18:48:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u7kgtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Jun 2025 18:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3VZtIe3TjxRuZCHbxb4g3XI8TavhrOm/a30IA9nH0Nk2qkVzZ+c+QZ+FZpXOMR1p3FEHPrYonC9LQ1Kr5hUFS4Pyw6hK4t7Wee7/8FkqpVixzCvRu8VuvLw/XWOPuPaEeSh7BdVKbV3HldtUfISLAOeIoUi2IZjKAqellYHVkwbcsFe9iRdlxxMUDz8OY0yZvbSd5EPXWgnWy+yAg+XfOmWm7p6Bg0xPCChYRuRraT/zpNt41uME/JVhjV5W0cI94MJxLhRaSUZNlYUKx5h4C6jDik2suCgeMKBSP2vOJiScnjTqkFvMV172wt0w8vrpM6goAWP/H6qJVDGemPiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Udv0ec9XNJPw2yqzU0Tca4uT14fLCg/UGJcCQBE6o=;
 b=R10p0gcKX25BqjNMPk0JrembrhwcA26ONGJ4/uLcYSNbPxWz4hlm4jT/IqOgcGndHI/mRiiOxdLx/aD8hVtTAWvRCFjr06sSzzj8f7SFuskjDQ1BGj1ba9pI6WwF9RG0zAWYN/mx1Dye9JWCxiyaZdKnhfG81Rh2cWZWLL0Xe2DXARKFSV6TT03dIEyEk8sI/OMKSYdjJNzqx1CtPpOjlzNuTajNIPYbnaRFnOnWgbhKmL4OjFiX8ZHC27A5kT4pdMOgv2WmJuH++Wv5QiYAuNZrjSpdCBJ1Pr1oZsBf/oE3ufWZvZoR42DJ1JSbAK2EoYHiOy6546DAxehgtrdoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Udv0ec9XNJPw2yqzU0Tca4uT14fLCg/UGJcCQBE6o=;
 b=OV23KqIkB8Un+l9gznMxXNUpzhOye/+aKp6RS7vNefJzWnnHUBAohkAg77HHfgeuuQMusyR55ccM4lbg70MjBkxCja1CiturX73qgI7stxGiDttXNrUvmBYPMGFHsSFhojcrJXcusfSX2t3EtcyzgPY6nYpmX4wz+nD4yi27ujU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SA3PR10MB7096.namprd10.prod.outlook.com (2603:10b6:806:306::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Sun, 29 Jun
 2025 18:48:06 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8880.027; Sun, 29 Jun 2025
 18:48:05 +0000
Message-ID: <1d44bedb-9d75-423f-9902-75acd12c834f@oracle.com>
Date: Mon, 30 Jun 2025 00:17:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
To: Denis Benato <benato.denis96@gmail.com>, linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
        "Luke D . Jones" <luke@ljones.dev>
References: <20250629131423.9013-1-benato.denis96@gmail.com>
 <20250629131423.9013-3-benato.denis96@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250629131423.9013-3-benato.denis96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::22) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SA3PR10MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: a16770a5-a6d4-48a9-9129-08ddb73d7b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXZNSDF6RWNTZVYzOFhGbEcvQSt5T1NNUDMvaHdvZFpDemwxUS9QcUp5SmhV?=
 =?utf-8?B?SWRwRUZyWWhIWURuT0UvdG9ZaTlQclExVEdXUi9IeXNNWDB5TlZmdEZ1T3hM?=
 =?utf-8?B?Q1IwQ0FOVXpEUXIzNFoxeTY0MHBLdUVsdnJJeUpYMDd6RHljeDA3TlgyMm9u?=
 =?utf-8?B?eENEaWtqai9HZ2pHbElLQVFmcDhFaHd0NzIyM1R0c00xWHI5djZIeE9vN1JV?=
 =?utf-8?B?dkJ3MllPMVhSWWp4ajEydmxXRmRFVEYxMjdnR20rU1NwRWlFc2QrbUlOcmVH?=
 =?utf-8?B?NTkzUlJKNVRRT3VjM01RRm1ib2xaS1hsZXFxNTl5K3JEQUJ5V01HKzEzeUI3?=
 =?utf-8?B?L2J5R2dhOGdOKzllUWlNUGF5d3c4OTVkM1pLa0xOcnM1b2wrUGFpSzJOTGNG?=
 =?utf-8?B?dHY4bzIxUW56OUtIRnRjRlJsYitQSlVCc2pIa2FBMVhmZmVBT0MzS1ZMOXlp?=
 =?utf-8?B?Sit5ODQ3UWpWTkZpMFBwNGk3bk1pc0FNWm1qSXhtMzZuSWU2cmNhQk5uSmJi?=
 =?utf-8?B?Sm1vL1c0by9MUmdBakNpWkZHdkpKMFIzL1g1bnkvR0d1cEVpV0RJSVhZNXBG?=
 =?utf-8?B?L0d5eGFaVVZsVmRZQi96eGFvWW9BKzZoZSs4TTM5SG1tZWxJOFdLRDdtOXcx?=
 =?utf-8?B?MDdiUzBlUk9uRmtsYkoyVmtGTkZ4Z2lIdnFWSk9uSFdOeHdldjZYU0dxZnlR?=
 =?utf-8?B?b201UmNySElwc0hBd1h3Q2RkOUtCOFJCOUFTUHFBR0dDaksvVG9BbmlYNkRE?=
 =?utf-8?B?V25ReDFrSzVSZFR5bUEwbHRCMnV3V0RxeksxaGhqSkF4eDFNRHVUbkEzZ25y?=
 =?utf-8?B?b0tvMk4xTUljaDZTWkRuK3JLYjdLcGdsMEN1NXd0T1ptSDArZ1dxR3VoczRz?=
 =?utf-8?B?RDFCaWdEc05UWUlWeDBjdUp4NnMvUmR1NElMQ3hIeUlnYnBDTHVxWk9ZQmlB?=
 =?utf-8?B?bGNLb0pqYjJpWWxwc2d5ZkJSZW5OczVvVGNZWHk4SEx5eXlXN1VRdmV2VTFT?=
 =?utf-8?B?eFZXTEhzQUh5bzBBZlI1VU5XM2VTQjQxWTNSTW53NGpoaW1YZ2o1Y05YbUtp?=
 =?utf-8?B?NC96N0RXUkVqTCthSlgzaFM5QlFWbWJLend6Uk13dzdlVExIN24vaGdFSVNz?=
 =?utf-8?B?NW9xaGVWdml4Nk1waUNvTXlqNVdBZFoydUd2L0lyWjRKdEpydkxWc0NnWjFX?=
 =?utf-8?B?YzZyMkoxblo4SzQ1MXJQRWp4bEk5ZTFGeEo3QzMxR0xveGxTcFRxRnpZbHZJ?=
 =?utf-8?B?OWdQdTZIT25SaVVOTU9IWXhIV1lVZjRnU3paOGpkcUZsVlI4eTFtbXZjVXQ5?=
 =?utf-8?B?S05OQTVSb2hQYUZ6cEk0WGhCRlh4aXBWUG90MkxkU2xvQzh4c0UyU2l6SlND?=
 =?utf-8?B?V3JTV3BGOVRzKzF5ZGFnZXoyNWYxbjZuSkJtNFFyTkJJR0wrZytVdW1uUkds?=
 =?utf-8?B?MnErSkV5ZzAzL0VsR3YvQ2JHYWV3cHRNcElpNkV1VjF3WC8weU1WWTc5VERn?=
 =?utf-8?B?U1lRU0tzbUJZdGt4enhDdFhleDZHWHFlYUtja0wyMkhQd1dZRnZpUnJqODc1?=
 =?utf-8?B?MEM5Nmo4RTRaOHdGR0FjQ2JiOGJaRkVEdDVIWEZUTzMwUnRGTk41anR5bEpV?=
 =?utf-8?B?OUswaWtvKzBrM1BRMzk4SlpYUlRLRzFxT0NyU1NVcjI2RHB4SkY2RytaYUZL?=
 =?utf-8?B?Z1FaQlhndVE1d1dkY0h2cFJqdkpiS0J3dXozbHN5dE5VOGQvTFdwMkN2VDNj?=
 =?utf-8?B?Nmp5YTU3ajdjL3I3emFBV0lreHFIV0RSMkwvNy92Z1FmS1h6b1RxKzV2M1ZI?=
 =?utf-8?B?VXU0ZzYwZ2krMkdCKzRyZ3VtaThzQ21kOW5TN2F6T040MUNOOHBkTi9mckZl?=
 =?utf-8?B?T28vMTcvZzFDU0xjNzFEdk9KQy9lQ3hzVHhxUUNsZHJWZ29qVi9oNWJnUDNB?=
 =?utf-8?Q?7Ua6pMBFt2U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGYzZ1hrQ25PWmRKM1Z3anh0M0RVNGdDb3RJSDllQlpyWGRpU1NVL3VweEtN?=
 =?utf-8?B?Nm1xR1ZQdjlkMnBtUzVtcEE0QjN6emR3QzFwcStHbzMvcXJCZnpXNU1UTkxG?=
 =?utf-8?B?b1dLSEN2Wi96SVlYZzZpM0xjb1I1Qkt3dFFQWFVGUFRnc0F3ZThFRUZLRFNH?=
 =?utf-8?B?NE9zeU9DcU91UUo2aWNDVTJNTHF3dXYxZENuRHNzSWZjOGt2VFIxZXFXdmk3?=
 =?utf-8?B?Q1dYSDd0c0g2MlMzYkNKQTJnYmpmdmhRdTNwdDFCL095MUhVNFVlYU1nMzZD?=
 =?utf-8?B?UXFhNHpuWFlVdnlzWTloUEFFN1p3RGFaQ1RwcHJMTmhpcDNtY2F5WGI3SXNB?=
 =?utf-8?B?dHVoL0ErRys5cUFMekthaVlidGdFdnQ1RUZ3UHN1K0twNExEbTJwWDNHVktn?=
 =?utf-8?B?N1Zhb3JCV2YzeDY1Qm1ROTJvcCtTNzJmMVJBSVhRUy9hWXJyMDNvMWMyT0JJ?=
 =?utf-8?B?ZDU0TU1BbTNCRENKOHJteFUzWDhXNUlEem5jekV1ckZyYXRQbm9qQXhZYyto?=
 =?utf-8?B?T2grQ2F4RHYyQ3QrRC8rU0xCUlBOTzNueXlYNU0zNlZhelpJRzEwU29OUEJO?=
 =?utf-8?B?ZzVRYzd5QUFPMjB0OTljTUdGVUNSd0xORDkyYkZGNlRxY2VOOURlTGd1QXJu?=
 =?utf-8?B?YVIwdVg5cUR3V0NmRzRvYy9sZnNvTUNIUU95VXp0L09XRjNNOEtvWkRCQ2Yz?=
 =?utf-8?B?N0RxdVJ5b09MZEVoMnIxRCtBZ3dTV2lPUG9mbURUT0NpemY2MDkwZkU1b1lY?=
 =?utf-8?B?SkQ5emZrK1pIMEZpeklwYmUwT2xLMHVVN2NabVExOW1oclZld1lDZkpxdHZJ?=
 =?utf-8?B?Yi9CRGliWThkVGpvZkkzb0l2VlVSaTNaSk93V01HTmxSNzB2T0xNdFRmWFZF?=
 =?utf-8?B?Qy8wTytIbHl0OHZrajAxalBZa3hRL2VVYi90Y0pxYzByMENSOXFya2p0ek53?=
 =?utf-8?B?c2dMZDF3eGxSNm0rRUhlQVJDdy9oSndZdC90MWY4b05qR1FMTU8wbjkzVThC?=
 =?utf-8?B?N084eHJyNURDMFlyTnI4V083SWtEWmNPb0FHTWtOS2VnSk5KZ3h2dnkvTlpK?=
 =?utf-8?B?L1lpTFMyWWs0bFBPcXg5UmRjN3F2TWFUWXRBYlgxWmw4OFFEaWY3WlpCaFNw?=
 =?utf-8?B?amQ5TkxUNUUyWkJMdWpDV0J6WVR0dDY2QXVmU3YwTlF5bXl6eWJzUys0UlpF?=
 =?utf-8?B?WHo2K1phQWwvR0QxRkExNnQzdmRwVlVOVnFUZ29QUERFdjFiSkdkSXJIZXEy?=
 =?utf-8?B?OUdwVFdIbDVJL28wTFJSU2tRNENrOXk1YUpSaGtneFIxS3JlazN0WGhDOXlP?=
 =?utf-8?B?eExWR25DTU5hQUt6UjhkMlFqdE5sa3pSMHlpakxRQkVDcTByM3gxaVlydCtt?=
 =?utf-8?B?MndtNG5PWk9XTDJsRTAzYzR4UG9yWVc1WkN0b2Y3OEowV2FLb3lKZytSOXJ5?=
 =?utf-8?B?ajZXNWlOeXUzRVB1SXd2YURTMnFYdytnM2QvY2t4ZmVLUndYdG54R0xyZHJk?=
 =?utf-8?B?d0pIQjN1L3BzR3h5aU15V0w2dHUyWFZYQk5QWnNDNjVrWUdWMmhXKzIwK1ZU?=
 =?utf-8?B?bWZ4N2ZZaE5WWlhQM1ErSDd2QXE3TW1HUkhDTHNkNVAxdFdNVWkwTHlhMVVy?=
 =?utf-8?B?UFo5VXVDaHdrczF1VjhHTUVkNGZjQmNDMkZnWmtjZzd1cDJIU0dZa1BXaHRq?=
 =?utf-8?B?VGlDNnFCOTlIWW9PK2NGNXhvNmhQK0N0ZW8vT25tdWM5cWVKNjZkQkVYYnJI?=
 =?utf-8?B?NGMzNEdIT3RyVzN1Z2NvVmtLWTEwZnBzWGRoMzdQZ3lrcmVlVzJFenIvdmhQ?=
 =?utf-8?B?azRLT2g4Z2lDcDRTeURnaTFERkdldndwQnJDelBJQWdvRExOUVIvYWVLNURp?=
 =?utf-8?B?b0U4aUFRZTcvS3RpZGFKSDhPT3ZVUUxLdzlCaVkyQjVrN1VsZzJ4WWxKQk1z?=
 =?utf-8?B?VUNRNERJOHpkNk5hV2dsLzB4Sngxdng4YnI0a3hTeXczcXBXOHJwdDhWQmYw?=
 =?utf-8?B?Sm9jY0hROWpFTXFwSitNdjFNeEh0TlpLNEZYT1hVUGFzUVhFUE1UWGl4OUV0?=
 =?utf-8?B?YTRXS3JUb0daRHpLcVIvaFFkZ1FqdzhGdFZaVEhzaFBkUk9YRGJEaWdFR0Vy?=
 =?utf-8?B?MDBVQkdGcU1KZ3hOT3BHbW5mVkFsM3E2N1o0a080SmZPQlNHdWFOTjRoRC9G?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Njn6uQ1q8BOLwKq0RIW8YD6HMGvEXMwHOeaLRBS8q5n8yElZlOBbH9VZthZ2Xngmnx+DLp9EcJMoCwS/SIXs1qZ4pqxEEoCx1nIlReFWaLfFB6W57xG3gISpBLitCSNTjmGEqZthN4dXw5cOXlV5jYPLikUucJ4yqXkhwG02OMIcvBEyZmTiV4vBx6Di5bzMF2+UVsAxcXjHiaeWkT4zwptTJJNgXH1n3PGi0xsghi0Qyk3DjKgccNsQo6wr5qAnqNEbUTaSZxnuqlDZn/W0/h2WFlLcZ5Ej/vHwpEn7L1xfodt+WdGCA3uWQ6j6CvLwVU4P3GLor8BhWp0OOJoHt0OeSr/5Lv4qbj+keMAWaRVg2Y7G+xkC9jw55oFFC7HGZc/zbqyKmJ+7PtkynTpx25nX4RbYAc8sTJo83uhf+UVjN+zYqTkHXNnQ0GSZqRMxa1EyU81qORJzdVgK2oIKl0U/QJhpPJniD+LJyjDfE1am3P8TO/qESHRXcOM4q1qFHdqliHLYr1B1/ti/cvBRN2rnieMJRFTAkcTVeIXUldmDb7uMuR1utFoUA3rslDC0Eve6quY6MDxPmXIHchBSp75CDtdCNcWLN+19ts7C0SA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16770a5-a6d4-48a9-9129-08ddb73d7b9c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2025 18:48:05.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1aJh2iy9RM/eX3tlML/eDoOHERxgiR/eo0+t0Ne87LrTDx9pAhjtIDDDAM4PLe/Mt0BAtQUuTe+FDklsR1KOryPeef1/qfWnwstsVlpZ1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7096
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506290159
X-Proofpoint-ORIG-GUID: 3b8uPRKraOm7oXXYikhDQRKz-PbyuHo4
X-Proofpoint-GUID: 3b8uPRKraOm7oXXYikhDQRKz-PbyuHo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE1OSBTYWx0ZWRfX1f08ed+Etu0w H2FQLQ1mUkYV7sAkamFBeoDd7MCWRkOyeXz74p95my52t4h6uQA5jvA9k+fA4jjPgao/egsq1fJ LAY+UNwCihyZYN0BN5MQojbjnjOX91uowEUt0ZS09rfS+U69BC0eOo5qEgDS7XwP0SQEI93RPNK
 zqDUJggk1DLABtlKvBYkC7PV84VC0clkY7oOmLbdZKBoNm4uYrSATZSjAiZkntaaGX/4OFK6sNn bu6UgdrRha97XsANz8xTi6luRzdU5R1AWNxJVvNAzsvZRaAHWWP08mXCxU0J95oRflSE0Dshomp nO7lhxwkuFrhSGVMso0/pijiV5r4UE1bl1651HaTcw7mTmPcoKLE0cjRdl3+xxnzd/eAlmxHdwv
 ubV415TPvDOWR3hwxOJi+mVdTPfjLPG11KAlpJYgwOQovjNIal+ILgsOaj20kAfnMzkRo4E+
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68618a7d cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pai6EMpnbxpv-xk2BVAA:9 a=QEXdDO2ut3YA:10

>   obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
>   obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
> +obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
>   obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
>   obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
>   obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> new file mode 100644
> index 000000000000..98b6a918f44f
> --- /dev/null
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -0,0 +1,547 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Asus Armoury (WMI) attributes driver.
> + *
> + * This driver uses the fw_attributes class to expose various WMI functions
> + * that are present in many gaming and some non-gaming ASUS laptops.
> + *
> + * These typically don't fit anywhere else in the sysfs such as under LED class,
> + * hwmon or other, and are set in Windows using the ASUS Armoury Crate tool.

hwmon or other -> hwmon or others

> + *
> + * Copyright(C) 2024 Luke Jones <luke@ljones.dev>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/kernel.h>
> +#include <linux/kmod.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_data/x86/asus-wmi.h>
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +
> +#include "asus-armoury.h"
> +#include "firmware_attributes_class.h"
> +
> +#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
> +
> +#define ASUS_MINI_LED_MODE_MASK   0x03
> +/* Standard modes for devices with only on/off */
> +#define ASUS_MINI_LED_OFF         0x00
> +#define ASUS_MINI_LED_ON          0x01
> +/* Like "on" but the effect is more vibrant or brighter */
> +#define ASUS_MINI_LED_STRONG_MODE 0x02
> +/* New modes for devices with 3 mini-led mode types */
> +#define ASUS_MINI_LED_2024_WEAK   0x00
> +#define ASUS_MINI_LED_2024_STRONG 0x01
> +#define ASUS_MINI_LED_2024_OFF    0x02
> +
> +static struct asus_armoury_priv {
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +
> +	u32 mini_led_dev_id;
> +	u32 gpu_mux_dev_id;
> +} asus_armoury;
> +
> +struct fw_attrs_group {
> +	bool pending_reboot;
> +};
> +
> +static struct fw_attrs_group fw_attrs = {
> +	.pending_reboot = false,
> +};
> +
> +struct asus_attr_group {
> +	const struct attribute_group *attr_group;
> +	u32 wmi_devid;
> +};
> +
> +static bool asus_wmi_is_present(u32 dev_id)
> +{
> +	u32 retval;
> +	int status;
> +
> +	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, &retval);
> +	pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, retval);
> +
> +	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
> +}
> +
> +static void asus_set_reboot_and_signal_event(void)
> +{
> +	fw_attrs.pending_reboot = true;
> +	kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
> +}
> +
> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
> +}
> +
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
> +static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> +{
> +	return !strcmp(attr->attr.name, "gpu_mux_mode");
> +}
> +
> +static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 value, u32 wmi_dev)
> +{
> +	u32 result;
> +	int err;
> +
> +	err = asus_wmi_set_devstate(wmi_dev, value, &result);
> +	if (err) {
> +		pr_err("Failed to set %s: %d\n", attr->attr.name, err);
> +		return err;
> +	}
> +	/*
> +	 * !1 is usually considered a fail by ASUS, but some WMI methods do use > 1
> +	 * to return a status code or similar.
> +	 */
> +	if (result < 1) {
> +		pr_err("Failed to set %s: (result): 0x%x\n", attr->attr.name, result);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * attr_int_store() - Send an int to wmi method, checks if within min/max exclusive.

func name is attr_uint_store

> + * @kobj: Pointer to the driver object.
> + * @attr: Pointer to the attribute calling this function.
> + * @buf: The buffer to read from, this is parsed to `int` type.

using kstrtouint so "parsed to unsigned integer"

> + * @count: Required by sysfs attribute macros, pass in from the callee attr.
> + * @min: Minimum accepted value. Below this returns -EINVAL.
> + * @max: Maximum accepted value. Above this returns -EINVAL.
> + * @store_value: Pointer to where the parsed value should be stored.
> + * @wmi_dev: The WMI function ID to use.
> + *
> + * This function is intended to be generic so it can be called from any "_store"
> + * attribute which works only with integers. The integer to be sent to the WMI method
> + * is range checked and an error returned if out of range.
> + *
> + * If the value is valid and WMI is success, then the sysfs attribute is notified
> + * and if asus_bios_requires_reboot() is true then reboot attribute is also notified.
> + *
> + * Returns: Either count, or an error.
> + */
> +static ssize_t attr_uint_store(struct kobject *kobj, struct kobj_attribute *attr, const char *buf,
> +			      size_t count, u32 min, u32 max, u32 *store_value, u32 wmi_dev)
> +{
> +	u32 value;
> +	int err;
> +
> +	err = kstrtouint(buf, 10, &value);
> +	if (err)
> +		return err;
> +
> +	if (value < min || value > max)
> +		return -EINVAL;
> +
> +	err = armoury_wmi_set_devstate(attr, value, wmi_dev);
> +	if (err)
> +		return err;
> +
> +	if (store_value != NULL)
> +		*store_value = value;
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	if (asus_bios_requires_reboot(attr))
> +		asus_set_reboot_and_signal_event();
> +
> +	return count;
> +}
> +
> +static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			      char *buf)
> +{
> +	return sysfs_emit(buf, "enumeration\n");
> +}
> +
> +/* Mini-LED mode **************************************************************/
> +static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	u32 value;
> +	int err;
> +
> +	err = asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &value);
> +	if (err)
> +		return err;
> +
> +	value &= ASUS_MINI_LED_MODE_MASK;
> +
> +	/*
> +	 * Remap the mode values to match previous generation mini-LED. The last gen
> +	 * WMI 0 == off, while on this version WMI 2 == off (flipped).
> +	 */
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
> +		switch (value) {
> +		case ASUS_MINI_LED_2024_WEAK:
> +			value = ASUS_MINI_LED_ON;
> +			break;
> +		case ASUS_MINI_LED_2024_STRONG:
> +			value = ASUS_MINI_LED_STRONG_MODE;
> +			break;
> +		case ASUS_MINI_LED_2024_OFF:
> +			value = ASUS_MINI_LED_OFF;
> +			break;
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
> +						 struct kobj_attribute *attr,
> +						const char *buf, size_t count)
> +{
> +	u32 mode;
> +	int err;
> +
> +	err = kstrtou32(buf, 10, &mode);
> +	if (err)
> +		return err;
> +
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE &&
> +	    mode > ASUS_MINI_LED_ON)
> +		return -EINVAL;
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2 &&
> +	    mode > ASUS_MINI_LED_STRONG_MODE)
> +		return -EINVAL;
> +
> +	/*
> +	 * Remap the mode values so expected behaviour is the same as the last
> +	 * generation of mini-LED with 0 == off, 1 == on.
> +	 */
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
> +		switch (mode) {
> +		case ASUS_MINI_LED_OFF:
> +			mode = ASUS_MINI_LED_2024_OFF;
> +			break;
> +		case ASUS_MINI_LED_ON:
> +			mode = ASUS_MINI_LED_2024_WEAK;
> +			break;
> +		case ASUS_MINI_LED_STRONG_MODE:
> +			mode = ASUS_MINI_LED_2024_STRONG;
> +			break;
> +		}
> +	}
> +
> +	err = armoury_wmi_set_devstate(attr, mode, asus_armoury.mini_led_dev_id);
> +	if (err)
> +		return err;
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}
> +
> +static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
> +						  struct kobj_attribute *attr, char *buf)
> +{
> +	switch (asus_armoury.mini_led_dev_id) {
> +	case ASUS_WMI_DEVID_MINI_LED_MODE:
> +		return sysfs_emit(buf, "0;1\n");
> +	case ASUS_WMI_DEVID_MINI_LED_MODE2:
> +		return sysfs_emit(buf, "0;1;2\n");
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	return sysfs_emit(buf, "0\n");

Unreachable code

> +}
> +
> +ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
> +
> +static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
> +						struct kobj_attribute *attr, const char *buf,
> +						size_t count)
> +{
> +	int result, err;
> +	u32 optimus;
> +
> +	err = kstrtou32(buf, 10, &optimus);
> +	if (err)
> +		return err;
> +
> +	if (optimus > 1)
> +		return -EINVAL;
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
> +		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
> +		if (err)
> +			return err;
> +		if (result && !optimus) {
> +			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %02X %02X\n",
> +				result, optimus);
> +			return -ENODEV;
> +		}
> +	}
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
> +		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
> +		if (err)
> +			return err;
> +		if (result && !optimus) {
> +			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled\n");
> +			return -EBUSY;
> +		}
> +	}
> +
> +	err = armoury_wmi_set_devstate(attr, optimus, asus_armoury.gpu_mux_dev_id);
> +	if (err)
> +		return err;
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +	asus_set_reboot_and_signal_event();
> +
> +	return count;
> +}
> +WMI_SHOW_INT(gpu_mux_mode_current_value, "%u\n", asus_armoury.gpu_mux_dev_id);
> +ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
> +
> +/*
> + * A user may be required to store the value twice, typical store first, then
> + * rescan PCI bus to activate power, then store a second time to save correctly.
> + */
> +static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
> +						struct kobj_attribute *attr, const char *buf,
> +						size_t count)
> +{
> +	int result, err;
> +	u32 disable;
> +
> +	err = kstrtou32(buf, 10, &disable);
> +	if (err)
> +		return err;
> +
> +	if (disable > 1)
> +		return -EINVAL;
> +
> +	if (asus_armoury.gpu_mux_dev_id) {
> +		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
> +		if (err)
> +			return err;
> +		if (!result && disable) {
> +			pr_warn("Can not disable dGPU when the MUX is in dGPU mode\n");
> +			return -EBUSY;
> +		}
> +	}
> +
> +	err = armoury_wmi_set_devstate(attr, disable, ASUS_WMI_DEVID_DGPU);
> +	if (err)
> +		return err;
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}
> +WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGPU);
> +ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the dGPU");
> +
> +/* The ACPI call to enable the eGPU also disables the internal dGPU */
> +static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> +					       const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 enable;
> +
> +	err = kstrtou32(buf, 10, &enable);
> +	if (err)
> +		return err;
> +
> +	if (enable > 1)
> +		return -EINVAL;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, &result);
> +	if (err) {
> +		pr_warn("Failed to get eGPU connection status: %d\n", err);
> +		return err;
> +	}
> +
> +	if (asus_armoury.gpu_mux_dev_id) {
> +		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
> +		if (err) {
> +			pr_warn("Failed to get GPU MUX status: %d\n", result);
> +			return result;

here returning status result or err ?

> +		}
> +		if (!result && enable) {
> +			pr_warn("Can not enable eGPU when the MUX is in dGPU mode\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	err = armoury_wmi_set_devstate(attr, enable, ASUS_WMI_DEVID_EGPU);
> +	if (err)
> +		return err;
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}

Thanks,
Alok

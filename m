Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69608311A6C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470075; cv=fail; b=psJVXUghHI6NArmUlZFj9YxyswAbtD4NWUjlKwWq23KnLBvNLCe3h49LSkDGGMuBdDDFHinhHhoZmk3+qtTCa5nSaAeGtjm9SEduD1ZutHNwZS3q0L5T94tXGYsAN1A37/qM6K01HLCwEuxC5bTEpxme40t4ttmicZ6bCLpeZWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470075; c=relaxed/simple;
	bh=RkpU+7VNVgvIqBbwejCu/dIFnt87ecct2OZQ3iwI2Os=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lgnFjTLeYiaW0+0ngmuchTkQAx9MYpYCSlIl91SWi3gxxl+8H6iXdW7Pc/55zlH2TyDDLxZlQYke0czIln9LlM3w62kZVVdMRH5rlbprDFem7gTXNSXjOsjw7ICFV6GSdAWIixuTfDRm594fU/dT/b8KZtS//LU5RNTBkBP4JQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=IyIv3xjK; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="IyIv3xjK"
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 562DKNeP015440;
	Wed, 2 Jul 2025 08:27:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=M+oA7HPy/qJoq2GbYFfehKmwJpr91qebWU7ONY/2yfQ=; b=IyIv3xjKPYtm
	axMh0j+K22Xps7u5z4Q7aLJSr2u5FI1AdgWfkmrknl13K/LyVMfpvk8jrLvF1pkl
	Yeha2bYBH17U3BlNXLaVFoe1lcFMgHjklM4kXBXJnENkse/EOvKliPIPd3UP0tnN
	O6pR2porFkifLPN3hearBYwsN8fX7wKBeZ1fHRWiECtISm4rC2lPoqKDTK18M+Im
	bWkjA6tGRQQfIsuUbUW/SQbEW911nCmGLI6j1AnXs89FHoNnj+lwsIe1uiEnb60P
	yXfgLk7UoN9A7oDvKgxDYsEnRRmVZRtgysnuFabIHzSmj1WqIz8OAuURidxCxJoy
	+098GjkwNg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
	by m0089730.ppops.net (PPS) with ESMTPS id 47myvm2y4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGTa3nARX1gjcpbXv6sDO+UDzr80QU/JKqBd7v/dY1DVv0PkkU5PUbeTKIfhuHUtx1xoU7JipLaizDeJBDGEjhQEYD8OXb3kucK3x2+Wgbp3zeAGRc3BQ0z4aUki91rPle/UxIitqDQYT4nrcK+45kqmlmmM/IK3VTLuMwQLVCgXE5t5e0Ftq5fZ5ss1Xm7OHzhMtetlUR5tHp3TQMIAziDsEfjM4LzFfO3tWpRiai5kTJ1CS8meYOJcx5HsrLmZ/D4sATsX/8L4gTTjdo7AJdmg19SuXB/+Rpf6hRnpDYhuVsW1ibSwiqZ+KQZ8KyprqJ9Eg5SPDiZE2jGkPTz8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+oA7HPy/qJoq2GbYFfehKmwJpr91qebWU7ONY/2yfQ=;
 b=TfSYipCCC6NKKkgF0XHzvfwChAlefVYQtEbFA556nnW86ROgbNWvI1gZxk2eLXasPGIxwXRFjASGLJNsOZ7nqaVtw81jWFG2CWUKm37P/raDJbQLhlrC0HASTgNcARLw7LI07yzKu5PZ4Km4BBebZP6kdeEweyfvQxJ30578x5duNrU/cq86+Y6LhRt+jv307el+M48iJRsDrFmZKM/04kXjsu4LkXIjBnWsDV835PaOpXCuaMHiUotAt/pWyHn4LtBCtYhtZY0FKM3+plxDWXtDJPQz5Ui7xTYwiTVkZNbEYljFFBDJh1MvPCGSPwjfwI/7H8k5ckKhjNCgmXP3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by IA3PR15MB6559.namprd15.prod.outlook.com (2603:10b6:208:522::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 15:27:30 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::2fde:34d6:643e:c01b]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::2fde:34d6:643e:c01b%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:27:30 +0000
Message-ID: <de989df6-3484-4298-bfee-6256e30d69d4@meta.com>
Date: Wed, 2 Jul 2025 11:27:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] sched: Address schbench regression
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org
References: <20250702114924.091581796@infradead.org>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250702114924.091581796@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::21) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|IA3PR15MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff1fc64-7489-4b99-3011-08ddb97cf55b
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVN0Y01ZZ1FhYU1pTDRpdHFrVjhhSUZxZlg0a08raHRxVDhMWTA5anlLZVk4?=
 =?utf-8?B?My9OY0d2VEtwOC9SOHFWOVRJc2tNNTZ1UzhPWUl6VnJCdGpvQlpXU1BJbEVV?=
 =?utf-8?B?YXFITE9jaXN2b1R6OWlBNVVxUytCaWRlZzdxaGVjNkFKaWs3MTBtcUNIdXZh?=
 =?utf-8?B?WXhWSTA4eHI2TlhlMWtKSGRiMmdoTlBmK2sxNTN1K29Oa3g0dGM1Qm5VbjBR?=
 =?utf-8?B?ZHNjaVBsalNLaDhFeGgzU3JwUXZmMzNicW4rU0s0OS9ONTV4WmRmTzJCSGpR?=
 =?utf-8?B?M0x1YzViczFMMkgwTTBGRnoxclhKbjQ4d2pZRE8yVnRuSWFjVlZtMGk4ekt2?=
 =?utf-8?B?UENXU0kzcDh6TkxtTWEyZ0tvTXR5WHl6V1hzZEl5TTdiNmJiTmpLM0JoK2kz?=
 =?utf-8?B?VTJnNlgvdTk5WEZaRVZvSUNnT3FXbEtqZUtURXpWNzdhaVRaNEt2YVovYTdJ?=
 =?utf-8?B?V2U0Sk5USlFENkdDQ2RRU0JSVGxaMDZ6Zzd0V1cvTHluQUJhVCtpN3FIQnY1?=
 =?utf-8?B?bGN4YTFSZWNMY01ic0hLZnYwL3ZWeFBuakZGNC80NzcyUjJVdlFibXpxQ0tw?=
 =?utf-8?B?N2JrSk1MSlBtSlM4MW4yM2pQYiszT2Z4V2tUZncwVDYxRENuS1N2VW1HY1NV?=
 =?utf-8?B?RHM0ZnplR0xqWDY0SEpyem8wb1ZJYWxPMTY2SWo4UXRJS2ZtOEVMTHlhc0pK?=
 =?utf-8?B?ZmdKb1p5OFBUU0lESUxUMEhDM2NUSlNCc1g0dEk5aGRtQURvTWQ3a2FOK0Vh?=
 =?utf-8?B?OTNTWkVNc3VkWHUzOU9ib2lmMkxLbFdoTlZncmI5UmhLR3VhSnVlejNGOSs3?=
 =?utf-8?B?R3J4MEZLSEJGa2FBb09rY2oxWTJPVmpEM2ViVEEreVpWRWpJWU1ER0RwWSt5?=
 =?utf-8?B?L2pUcFJ5ZU1PZ2NldEI0NzZueGpMSmEvTXdrM1dINUhuWk9wUjhwZ2lJcGZG?=
 =?utf-8?B?QWpnNDNhN3JsTW0yVHk1bzV5WkZZZGI0U3hDZDFFQ2g2V2syeUxFYi9NYjRJ?=
 =?utf-8?B?VVdEdllYOUJxNWg0MjBGVW83c1JuSnl6RDgrOVJXVUJEeU51b2xpMUlNYm45?=
 =?utf-8?B?WFBPdlN4TDVESnpQSWZYZ3VISDFKRlhqRXduVGdoemI2ZjU3UENzVnB6M0ti?=
 =?utf-8?B?YkVlTFR2cTl3N01pMU41bnFVOW00K1RxdU8rSW5KUDRXTGpscjNOYlBvZjY5?=
 =?utf-8?B?a3IzbEllTFI3NU8xcnh3OEl1ZkM3ckJEbHNaUHdnK2Nzd0NVcW1hdWFWOExa?=
 =?utf-8?B?cjR5S3NmZjMrL0w2TmtpL1ZIcU5pNU1lNlZCOHVTM0ZPRlVtL0dHTHVBMW9P?=
 =?utf-8?B?Yk5QdE5qcng5cHBhRU9qRHpNYWRhS0NLOHI2ZFFDS2ZLajdmVEd1ZEMvSjZS?=
 =?utf-8?B?WkNqcFFTVFNtRTBzbEVRbGk3c2R1UUdtMnhXb05Cb2JtZlY0TXd2eVJ3K0FQ?=
 =?utf-8?B?QTJLeG5aOTExekY3TVRYaGFrQkdtQVlBejIyd1ZkM0N2cnJzemhNY05SYkZD?=
 =?utf-8?B?cG12cGdyNHVMaGY3REpseGNWL3dUR1h1Zk5CTTFIaVU0c3IvY3JWeStPTWVU?=
 =?utf-8?B?dXZSQjVqVlRZOExBS0hRU2ZOL3A0MWdUbno1VjVHNGo2eVNZSEVjL1hTM1Fl?=
 =?utf-8?B?NVhGSktjc05KZGk0N3pVWExiamVRYnZVbjdPa3U3Y2RDa2V1RDhpMUxYNjhP?=
 =?utf-8?B?MVo3c2F3REY2Z042OTh0ZUdkSTVWeXkvTmJaSW1kZFNLUkFBTGtrS01obUxs?=
 =?utf-8?B?bGZTNlBBaHNnQWU5NVBJV21BQVEyVGMxbUlZLzJmUmlLNENwWWk0MjMyQXlh?=
 =?utf-8?Q?Pw1tT1DIFnOfSQ0Ac3NdGCAdZ/Q7bYJ0xMl5g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjM5d3hpQklQTCt1MjlBUzY3YkUzeFkxZlg5SFBuVGJ0UlNTTi9aOTk3U1ZF?=
 =?utf-8?B?bW9SYWpjbmY1ZGhnOVg3bTM0bHZjVjNQbHVpTVNRRXJUWTVTRFMyaWxoSURH?=
 =?utf-8?B?eGpHUzE3SEFCYU0wdE1QMkJPOE85Y2xUbFk0TTd0T0c4ajBSRjVQVkRzSEpm?=
 =?utf-8?B?SXdUcGxMZCtjY0ZoRlFqUEE3anloelRoSXBMcUtuK1ZzVjlqSzlmK0IrU212?=
 =?utf-8?B?Z0lrajBvY25YSEFEMEdPeXplTk1MMXh4dGt0MmdMTG14T2ZWdm12QnpTcGdI?=
 =?utf-8?B?YUVNSEJxaUFWN3R5R1Y2elgxWEUwUmZldTExNyt0TFp5c2NGQThFVFErRDg3?=
 =?utf-8?B?OEN6OHFXMTk4dDJjRUJlbENENlRrTHNyZVBkYjNMTEFRcjFDRmc2Rk9adVVU?=
 =?utf-8?B?NGRjWnhTT25XU2N1REEzZk9NTWduMFNGZ3hxVFZEc1RLdlgyMU9JVXpaU0gr?=
 =?utf-8?B?eEJsTTFvU3FWMSs3NUN5K2llYWhHU0pzMmhVU1pnbW9DbDgzbXZiUWJBRFdK?=
 =?utf-8?B?dUx6TUZkOTFxUTRuRTF0SmVRM0x0YSs3MHJ3TGpNdzlvNUNuZEQrb3dLNTlW?=
 =?utf-8?B?YVorYURoNHQ3aDZFbmFmb3BaUVlMdU9OT29PbmlhaGVWeEFtaXpDM21ZQSto?=
 =?utf-8?B?U0N2RGJ6b1o5NjJLdUd2VU9UaE9idjJnZW0xQm81a1h3VnhjRmxiRHNQamZa?=
 =?utf-8?B?TVJGSEljQlZzYnRqY004aHkwNFpQTm1CL1NtZVhISCsxeGlYV1gyWCtZMlJi?=
 =?utf-8?B?R2QwSitUVWtVRlJCdnRVc1M3ZVMvdDMxMjhFSVFMbzVtOERUNkNyVnVFWWpx?=
 =?utf-8?B?SXFUWHF0bWpEOW1JRFdBUWNiSkNxY2pGZEpjUDdFU3VQdUhwdytsTC9TUERo?=
 =?utf-8?B?VHgrVnliekQ1UHlyRTk0RW5LQWk0WXJNVll2ZTFmdXRSQU1MK05KcThuZkVq?=
 =?utf-8?B?aVNoYzhidHBZelBMa004c0VlZG9GTnE2R2dneWVDNEZseXNNaXowbTFkRXNz?=
 =?utf-8?B?R1ZjNUlTSTl3WEE3NkU2UGFtb1dmdCtVMlZUTm9RaXZaYk1Rc29FRzkybm1y?=
 =?utf-8?B?QWZMYlFnbm1nRlMxdnZmaE9PZ1E5QmNDSTFKbzRHZjhVSHErZjU0MG5NbVE3?=
 =?utf-8?B?YnE5dXNpS3dkTzR6aDg5RVV6TmxZYjlsdG9MdkM3SjVPNFRCdHIvUDVVUWt0?=
 =?utf-8?B?UlRzV3RoSGU1dk5vbUJQckcxaTI0UnZQN3YybFBYNjVSekhyYklTSkpoU1k3?=
 =?utf-8?B?RzBkdGJvUGNLNGhvczlaMndveG4zWmZQTFNCdkxZZEtaUWFReFpNVWxkTlVn?=
 =?utf-8?B?dHNENW56SEdZY3B1T1ZRUVZVT1d2WUovNFViS0dXaUZvcXNZbzVwL3NNems1?=
 =?utf-8?B?UVNIMHpWRnBBSkNMSXY4UEU0b1RmZm5nSEJCK1JydldCLzEzUzRYQ2tOQ1cr?=
 =?utf-8?B?T0NXRXQ0aXYzRXRmMXFqWHB2QmVVZW1jMTd6RmVDZUs2TlY4TkZNWjJNSnc0?=
 =?utf-8?B?MERrT2VhL3RLQ0xxNUkybjRQcWQ4cEo5VjNpMzgzTE5xT0V2MG5NY2l2WG95?=
 =?utf-8?B?Rk1PMHUwR0pHTDYzRjE2WWNiTC9JL0pLTDBka2o4ZldlMmk1RHJFYzEwQitF?=
 =?utf-8?B?cnpacktzMUpEckJRdFQ5RUxKKzI4UUVzcHJTZzgyTHBJc3orZWVhMmt4OTE3?=
 =?utf-8?B?VXZzb1JldDJQVDgxbFR1a01YUHVwTU5DVDFXeHlZT3BCZWlqTDdCcGhFUDA3?=
 =?utf-8?B?eDhiTzFhdDZ5bVJDMHRIWGlIVGVBYXdXbTZaVVkxemxvVVMwV2RTZ1ZwcjJH?=
 =?utf-8?B?RzVkRmoxd1RCYnNzcGFLOUoxcjFjYUxhdmJGOFFuUGJFQjc4MEVYbUt6OStU?=
 =?utf-8?B?T3VldW1pQkM1NER2Wk5FQU91MkQyVldmd2hQOXJES1hrZkJWRnp4cndtQjJ5?=
 =?utf-8?B?Sll1VGlUZEdpZ1dqdkF5dTRyV2p6cjRKZklXZnNheUtCYTQ4TWdNV3ZoOWQ4?=
 =?utf-8?B?THZuVEdQdUZaMTBwcjA1VTBYbTBtOFM5bWV3SWJHOVFZdHR3bXNRZmhMWUJ5?=
 =?utf-8?B?RVJBUmpDa3lDRkRWOFZxU2ZEZ3BLUERlWkpsdHNyZXk3UmRIYU5MQ3pFcFJx?=
 =?utf-8?Q?IqSI=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff1fc64-7489-4b99-3011-08ddb97cf55b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:27:30.0908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMopsBsq72Fap9GVW+CUh2XPNiHfpqwMh4qTv83GXVd0TjWhqAvhJCbyjyuvVqKR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR15MB6559
X-Proofpoint-ORIG-GUID: 0zcDeM9M2YKyCCXUaqqvtNyDfMh5kFo0
X-Proofpoint-GUID: 0zcDeM9M2YKyCCXUaqqvtNyDfMh5kFo0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfXwyWTMEiofw5M w8fMtGkuksa2HKDy7oSDQEYenXc+u/kYRmLGyDd7AXRsm5rpD9AwthYczwu6UOF92lRsruU6PCX hX1tbTRyJP8CDCZAZZFeWb4aV13JwDhkMze/qnSs3TV7dsm/BLLputJexwPjM3+XlYxgF+J/fPs
 aXHb6CZljskGw8Xvh3eiuRzqA6ZgMGTZCjiYTgjWNY8EVwdUubQ+N+b/fFrmCjWIphP/s08vUqz I9RuIUL4Vx2agg4CCBECZGOPBpFBpnMRgSgpLcC+BAyTdzLYuHvKt1nE4wwzr2vpJ6shbxLzCLa 1UOHoSf/wElqothyv7grjZsXhyh8wbLNr9unyAd6lxYRqj9sEmY47tWxRw3bDAjdn42kxs1eMuJ
 242basE+z0nFsFYvD5wg5+BV4UA2A+srwKjSsyH3cPuflfjmXagaEAkVVn8quTgr1XZlWFuh
X-Authority-Analysis: v=2.4 cv=Avbu3P9P c=1 sm=1 tr=0 ts=68654fe4 cx=c_pps a=RnuTvXxHdiR3w6MmYaEnsw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=ZvIDCRUfadwAn0HhLloA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01

On 7/2/25 7:49 AM, Peter Zijlstra wrote:
> Hi!
> 
> Previous version:
> 
>   https://lkml.kernel.org/r/20250520094538.086709102@infradead.org 
> 
> 
> Changes:
>  - keep dl_server_stop(), just remove the 'normal' usage of it (juril)
>  - have the sched_delayed wake list IPIs do select_task_rq() (vingu)
>  - fixed lockdep splat (dietmar)
>  - added a few preperatory patches
> 
> 
> Patches apply on top of tip/master (which includes the disabling of private futex)
> and clm's newidle balance patch (which I'm awaiting vingu's ack on).
> 
> Performance is similar to the last version; as tested on my SPR on v6.15 base:

Thanks for working on these! I'm on vacation until July 14th, but I'll
give them a shot when I'm back in the office.

-chris


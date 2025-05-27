Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012034.outbound.protection.outlook.com [52.101.71.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5517E0E8
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.34
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316076; cv=fail; b=A3zgfB6O5PsUKKn16YT/j3ecQ7q3BhUek99hXAlQXbvZ7kfZ04iK2o1wiELpK23AJGQUFvDoOgQN3MZ673QeJWYjSWsnnx1URJItgTaMaW2VIgg86j/B1k2j5RT3KWhMd2gkwOB/fjkxgeo+TCc/wiZ4fsG0qHGlkDHGWgfQP6k=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316076; c=relaxed/simple;
	bh=pJ3ZXVZvt7DfDFDziQR43vqykMLgRcRFRjxv4U/OFbU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nfcyutptpCP0t6VqvYTDZdln+VANtrwyf5onHwkPAez32pGCczdwz1FQrQ4gx8Fcf27zmjSoE7CTSUajzcGAbSDvSxVm3myAbT6a4+5ME+d3v3guPmLtNPUxgs3VXIqQIYvQjQ+NQzFx/9ym5qW7HjMu9CRFRWSbHPV3pUZQkAI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XznDTPjZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XznDTPjZ; arc=fail smtp.client-ip=52.101.71.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XznDTPjZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XznDTPjZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nSV5aCHiW2U43YqZFxW9rxIZcMAx8ff1j5lRK6bUEVSODNWfg2+/pWUdNw7NxGeHfGQJ7s3nQCgFKZtnYIR6zwUXESRy3Fwli919DaO9pXyHawFKrp9HV7JWMe1v2gmy2BKeW4i1AiRD3UZsoHsFS67P0MU3b4VYBkZrgeOqjj3N2vN6yJfmn+HCEsC2ZwvZJgsAj1DPX5ssv32u2hINn3JwXo0BJ4kHKxbCoLDwlfzx6N4dtDhYOt6+Ms1fs7J2KSJdkZVxQRL3QCwnHJIuV8Zfz90EaHDpRSgfiiBjYGsdYFl+IscPDM+ym0T5xjLi0jrp5WpiJ7F0Z9BVimy06g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BPGPScep4PbDsuG1vJThgotnAANjnq0fhaSWolk0g0=;
 b=Dy9yHnDuZRxsJ/SgoNTZTKUKmceTSYNDVi0ahHuNawuyCMSsaX6lpK1mfiDdHqRTAF3qQ0kCb4IJ16kwBguxrKy+6jkyaERBmlq0s4xvpDQHycxJXLBeaJrAsousu0dWC4xhlPSvMnN3KjHZOtEG9/v2nd2OwwpeDr8lN6R1g+l9I4o39wIhJSteenVauOYXbr7eiYyhTllwLRCIStAA8dVinyvCX0UaVJAD0TAPnrgLe1ZSXfpKiSBd9kg+QLqdH/Q9HLG7ONTLXQjmS/KtPiQTNAHa4fORXT1EiCfzZDjA8CzH9O5rHvLE3R3JtoAlrrStnAmqCHn31k/IvaVJzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BPGPScep4PbDsuG1vJThgotnAANjnq0fhaSWolk0g0=;
 b=XznDTPjZtMBbqx+2DugeIuhNE/WUtol7P31oRs63L9PbQFTk/2/Y1oLtz7LPgRQs2hjhpkz3O3T5m+J3RL7SKLyXRVoEtMmW3kEmalGQwsepHfhu8apSPSMqIEB13z6v90n49eeimTEAnekGaGoS/EYaQa8gxNliJR10o0yIN1I=
Received: from DU2PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:10:3b::28)
 by GVXPR08MB8235.eurprd08.prod.outlook.com (2603:10a6:150:16::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 03:21:04 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::eb) by DU2PR04CA0023.outlook.office365.com
 (2603:10a6:10:3b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 27 May 2025 03:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 03:21:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1Yqs3NjtfYXPFW3Wid2j7MvEmR5zZi6eeI3ov/rglfndQjShZJorUk0VOTwjGGhyg2Cj+zMxYqfh1fYPnBePO/Be8tUYGm0Zf0PRPbmsKKfPPlqXuchdFo1hVxOSR6lnEeuHztXeFsIoFrCd1s5g2eQW4QCKBCzAF3etdMPW29GuNmjWwbGio+F+PWID5Znm3pxMEx8+s3OXewCfC8uFwVeX84XraHtyl1McGdLIqkDtXKQWACtkGGjXmAMvDcuJSnYbUMWBNtMf1DOwg+gdjPWALR+9JBeID0PAXwMgWjG8/muQ0kAUt4o9FChhUaCqh1yy9IBDc/fWafhCKqbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BPGPScep4PbDsuG1vJThgotnAANjnq0fhaSWolk0g0=;
 b=qFHdFvaM98QoKJ2UwI+ZCjhGZUhs3AFi63NfT9bjZ3IT5lN7bG2XJnZIW21yrcgpZkQraHs/xiTHvZthNyMeyNqnaO2RKnHRACkDTonrYJsdPO4/McfaHYU0v83X3dQ8kUHGEW6LO+Or+2YorY9+D5rHJCbozZYAnQ8VUgmKn4hvMV8VNf+GljA7ottMhVG+6NvSoEOx/VEQovZWQxDo7LteKeV0oJIP4vJkcRnsPZTg89S7j7yFAJO4d1R/foMwyRL5dheL+jap0GoQumhE6W9mVAzWQbfq+dQuEw9CsVhxoqeO4yfhvyFFbJ4syxXh5gqp+UVR0Fw0xRDaATcJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BPGPScep4PbDsuG1vJThgotnAANjnq0fhaSWolk0g0=;
 b=XznDTPjZtMBbqx+2DugeIuhNE/WUtol7P31oRs63L9PbQFTk/2/Y1oLtz7LPgRQs2hjhpkz3O3T5m+J3RL7SKLyXRVoEtMmW3kEmalGQwsepHfhu8apSPSMqIEB13z6v90n49eeimTEAnekGaGoS/EYaQa8gxNliJR10o0yIN1I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB6585.eurprd08.prod.outlook.com (2603:10a6:10:250::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 03:20:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 03:20:27 +0000
Message-ID: <b19653ae-8c9a-46f1-af93-3d09c3b0759e@arm.com>
Date: Tue, 27 May 2025 08:50:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm/khugepaged: fix race with folio split/free
 using temporary reference
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250526182818.37978-1-shivankg@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250526182818.37978-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB6585:EE_|DU6PEPF0000B61C:EE_|GVXPR08MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 3980a51e-92b8-4085-8c02-08dd9ccd813b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ai9TNHdYL1ZxVmtUNTdub3JMQmlUaU1YKy9pcW5GVXpRMUNCSWdSQjlGVkVF?=
 =?utf-8?B?ZmEvQXVqdlNGdUw5Z1BTOUViTGRxS3EyWWl5SkdySUcxRFZOSDVyb1lMaUJo?=
 =?utf-8?B?a3RjdTI0ZHlpVDE0QmxsZ1JxQmNnbDhpbVlpa3JPU2JrT3NwYTcvci9PbXE4?=
 =?utf-8?B?cUpmRXZ6WnhrWXZOQmVBOG1Cam5Iald3RERGUWRBYjRySUR3bzRhUzJyVWlt?=
 =?utf-8?B?a1dtTmpOdmd3VTNEQ2cvOThIdVQwRGZpSnRnL1hyRTdQRWo3cnlrZnM0ZFZE?=
 =?utf-8?B?RUtyYU5TV1A5SXdhdHF6d0lkYnVWNzRCOFZQT003ZE1JVmFXc0JoVFhINXlH?=
 =?utf-8?B?Mit6VFpSSjJiZUdXaTdTeW5UKzQ3NWlVWVVmOHlsMDRuRXkveUVjTXBkTEZB?=
 =?utf-8?B?dkdncDA5RjBQS25wTjk5S1lPekdJRnZpREF6RWZNZ1lTbWdUMEYzU1ZUaEE3?=
 =?utf-8?B?SjZoTEp3TEFXN1FxdHJLZkQ3enFhVmpiTXcvSS9aczBLamVOWmdZSHhNR0pa?=
 =?utf-8?B?QUFac1pOYnhydkRnMlEzUmk5WnE4Wk90K0cxZlZjK2M5ZnVkSXUvRzVjRE5E?=
 =?utf-8?B?RkpxVmpkSXRnMkRWUENIMWFnKzIwenNrSXNhUkt6RlJhZTRuTUZSUStQWXdq?=
 =?utf-8?B?WWJDT0planpGVGcrK2FQdS9OcFJQaWRGcXVIT2FTTFlnMU8xYVVueWFDdUFa?=
 =?utf-8?B?emFBTzFEWDVtR2R0RTUvM3FKd1RTYTZIOEt3RlZEaTRPT0NObENXUS9aWW9V?=
 =?utf-8?B?QnQ1bzNxa0htdjRnL1o4WGZxZUdSTmNQeEpIbDhxMVZJT21OUkh2L2N5eWxQ?=
 =?utf-8?B?ZVN1dEJNVjhIM1RsUzE4aUt0N0hNejcwVzhPOWxJeC95bnh4alNDU2JtQjVF?=
 =?utf-8?B?QitjRGErN0VKOXhxZHd6bnJLWjZwRjRvRTdMd3dFcElPQlROSFVGcWRoZm1G?=
 =?utf-8?B?cmd1ZzhhU1FxUVFuM2kxOG11TU5NMHVkZTZxQnJXUUlka0piaExFRi9xdVhn?=
 =?utf-8?B?MzRUSFZxQUZZSWozTnNKVVNHTHdCcUNLOGV5Q2JUclEvYmJ4bk1scHJhNU1s?=
 =?utf-8?B?WUVkdWZpc2hCYkF6Rkk2RUMwR0E5K1d2WjZsN1NOSnNXS3IvYmg0MGJlSUVJ?=
 =?utf-8?B?WlI2S3VXK1RYbC9PNzJHSUlCbmVxcGhzclpmaHZRV1lDLy84VExKTWxkTVdU?=
 =?utf-8?B?SXpLZ1Bpb0dtb2dCdVE4Zkc2Q05iaWUxdGU3RzJJWmdMTmhIa1RCcHdMa0hS?=
 =?utf-8?B?eWhWM1gxN3c3amh3dm1WemdSNkdVaGxsSldUeU9RZGdGcGZjNDBWTmJuUkdS?=
 =?utf-8?B?cTVmUFpjbWRYeEpSckIyaGxUSjlCZ3k4OTlrSnhuc0NWYktWczg1Yy9oMFZ5?=
 =?utf-8?B?UnllOVJCMUpmVzBNQXFrL1hyTGt4cXBjNDJYWkJwT1dsbm1ZcUZSbE0yNFpy?=
 =?utf-8?B?RERVL3VaaWhmdXFqQWJ6RWVRQjFkUnVoWHNwaUZqM1RZRTRsaUVHS056aVl2?=
 =?utf-8?B?Um9ob0srUDMyVzZKaUJjWHhPTGdGbWhibEt0cGY4cllOUm5rdEdJOTVESzR2?=
 =?utf-8?B?UHlYQmI5T2JZdjVFZ3lpU1dtMzhiajYzVFRRMGE5bDBJYXlubTlYMHlMaG1W?=
 =?utf-8?B?OXFMTXh2eHFqSC9UN3FiSlFqNHJlcGNGNUcxWjN4L1hMWDF3RmpKSVg4UW83?=
 =?utf-8?B?dFo2ZHNjMDFVVzdSbHRObUFTcU12QzVsbjBEQmRqQUs3MHhBeWRVcmxOdXdT?=
 =?utf-8?B?OWZDNWdManIyb2pHU1JoVlhzNVd6NGRCekhBOElVeHY0Sk5mYTFMYWRJWEFF?=
 =?utf-8?Q?pPTwuniNTkTwApTfpEO1X9ZKjtKhJ9bu//Xkw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6585
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c314c3d-d477-400d-0332-08dd9ccd6d66
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|7416014|376014|35042699022|82310400026|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnBqOWFWb0pKVXYrTnIvOTRacDFmeFc3ZkdUbVJuKyszM2ZJbFhxQlltUktH?=
 =?utf-8?B?eTdSN1hqSkRIeVN2T3RxMHA2QjJOSXhBdWE4WlhSU0d3OERqNHZNWE1MRHVQ?=
 =?utf-8?B?S3I1RUQ1UmR1KzBab01YM3VkeGtIUGhvMFJRK2ZHVWprSWwrM0VRVm5pUEN0?=
 =?utf-8?B?aWRueEFxalU3ZDRlS0hOQjBlV0JJN0c5N05paHA0UkVWcXZ0VGdxSzRWZzNv?=
 =?utf-8?B?emhld1NCc05KUEU2bDhhQy95ZkluZGdDWkZBYUxETnVhWHV4QnpjMk9oSjF3?=
 =?utf-8?B?UHZLajhGUEpUY1FWSStSTHdVVE9KWDdTa3VacXFiQlZncGtaQUFFZlh3SVQx?=
 =?utf-8?B?Z3ZPRjU4K2VSVnlhOVhKRW9TbFowcExiNThLd0VnSlRPZFl0cG1mYVNRL1g1?=
 =?utf-8?B?TFBkZFczRWtjYnBzdGwvNG1yQTFyN3ZBMlVmQlV6eGdyTStvUWd2dnliS3Nu?=
 =?utf-8?B?b09NaEY3T2JsZXphNUZVRmJ2dmY0U25iNVljL05IVXJGSHkvaE1rU01oKzhF?=
 =?utf-8?B?bTMwakZRVXJKYUEwYld0WnVNOFNEd2pDeEhIeXNjKy9rSGMwVEwvQTI3bnl6?=
 =?utf-8?B?WHZRRy9JNUNvcDV4MDlIRHZSVy9QcjhLMW1zdEVYR2hOQlNncmxLOXZncmhK?=
 =?utf-8?B?U29xR0F0T2dDalVTd1JEWkxkQ05hZFQrbXFxZksyY1NKajR0dUVPVkVCRk1R?=
 =?utf-8?B?anJwK3lzaDFzWE41RHcxUmRBYWlTZ0YxcHJlcllna3VZcStSZ2VZMzNPQ3l3?=
 =?utf-8?B?WENaaU9zWTFZN2JwZHdISkx3aHZ4U25tZndhZXdZTCtRUXhKVlhYOGNmUjV2?=
 =?utf-8?B?YXBFcHBDbkZrNUVTQkhNK3VEVG00OUJoR2VOV013bGlIM2lHWWQ3VG13eGV6?=
 =?utf-8?B?UnhETE5xaDdCNGVwVnFsWnArRjRNQi91NmJJbVVBbmp3M3NueDlvano0enJs?=
 =?utf-8?B?aTR0eUR2RW5za0IxaUxWd0hoNjZnbTFaZmk5OVVhVFMrY1krUzM1UlJGTzVH?=
 =?utf-8?B?Wk9pc1VOZ2V3VzZwTkhEWUhGLzdRK1lCN1hGc0JRc1czcUtjTWFHVlR4NWkv?=
 =?utf-8?B?TGNzL1hseHY3SnNqd3BQTldMblVQbU11aGJCdXp1dWdYdjk5L3BaOFh4VG1V?=
 =?utf-8?B?Vzd1YnhTaU1KM00xK292OUVvbHo3aTRtUFZabTFvdERnVy9VdVRuekpIQ1RL?=
 =?utf-8?B?RlpmUGxyWFFMMzBXSVB4VXZiWmNkN2R4MGs3aFFWQ255clAxS3FOUjllS2pp?=
 =?utf-8?B?TlBmUDR4N3JMMDFCSWViRlN5RnVvYVVEUG5LQVN2MW93VWFrUWdiQUVkOXda?=
 =?utf-8?B?MUtHT01BemN6U3BWVE1OT090K0pDcU9ZMnVoa3FXdkJLR0twTHBIY0dQZlpP?=
 =?utf-8?B?Y21lbFp5R2JFS1JrMktlSWV4dFdoMlhDbldoeGhJaXFaSnY4R2xsNEl4Y21G?=
 =?utf-8?B?R2I0cnJ0SEgrOGY2NlFaRDVzY3EwTnprRzUwRitKcGxYeExEZ3lYeDVwY2dO?=
 =?utf-8?B?S2R6V0RyNGdUQ2VFNlZJcjZTZDB3M1VuRmlxUXVWMW9JUnc3RU10Z0JpR21C?=
 =?utf-8?B?V1JDN3MvT1FDQndaeVNLeUxwUThzdzE4bzdYQWFiR0w1TXZWU0hRSE01Ynk5?=
 =?utf-8?B?WUtsL2x4b1JON2xrSStaNXJjQ2gvV1UwTTFpazFKUnM4Y3ZxOG5SY28wL1la?=
 =?utf-8?B?c0tHaUlSQ0wxTTZpYUhUeWFRTnRBMGJWbmVxNXRyWnpsdzdwT1JkQ0NGNS9E?=
 =?utf-8?B?NDUvWjVKWEpMZWZQenlPSlUwUG1vRm03bXJzeGlET2JPZXh3WGtLbGNiWVhM?=
 =?utf-8?B?TXMvemk3cEhNQ3p1V2lMakc3SXFjZklaMkUzcHpTWDV6OVptRVpmYVdqWklm?=
 =?utf-8?B?TkpOUjh0VXU5UDR2TG1mSFZlZ3Z1V3RPVE9adFJhcVJXd1VVRE16VjlOd21s?=
 =?utf-8?B?OHc0Qk83SDBEWnVEN2IrZEFIc0U2ZnQ4aEdiaitYcmh3clVUZjRiSzBYSWVv?=
 =?utf-8?B?WDJjMDA1QzlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(7416014)(376014)(35042699022)(82310400026)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 03:21:00.5883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3980a51e-92b8-4085-8c02-08dd9ccd813b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8235


On 26/05/25 11:58 pm, Shivank Garg wrote:
> hpage_collapse_scan_file() calls is_refcount_suitable(), which in turn
> calls folio_mapcount(). folio_mapcount() checks folio_test_large() before
> proceeding to folio_large_mapcount(), but there is a race window where the
> folio may get split/freed between these checks, triggering:
>
>    VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)
>
> Take a temporary reference to the folio in hpage_collapse_scan_file().
> This stabilizes the folio during refcount check and prevents incorrect
> large folio detection due to concurrent split/free. Use helper
> folio_expected_ref_count() + 1 to compare with folio_ref_count()
> instead of using is_refcount_suitable().
>
> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

The patch looks fine.

I was just wondering about the implications of this on migration. Earlier
we had a refcount race between migration and shmem page fault via filemap_get_entry()
taking a reference and not releasing it till we take the folio lock, which was held
by the migration path. I would like to *think* that real workloads, when migrating
pages, will *not* be faulting on those pages simultaneously, just guessing. But now
we have a kernel thread (khugepaged) racing against migration. I may just be over-speculating.


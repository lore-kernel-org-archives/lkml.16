Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375562367C3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444025; cv=fail; b=C1qCH4vcRYuDLsPqjXJnigFbJaZaIgjLismD/5KjWg4/HD2/UDkK5gjAvM4lIb2yPeo6d0vZ00yInHpmnm2A+YV8fN67dVcWeLdyR+a8IuXgUsuJzZVq3MBQ5WV/8ndBWIqF/C+0HpVOWkXZKNi4ebs1ufNYJn8F1B6SCHOXKUw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444025; c=relaxed/simple;
	bh=69eLqbNqJw+BzlKiGg/tDswdCWZwvOlYggRvVntMcDk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XBp7ZaQ7LSqX6wqileUXAYMron70qjhiHPY3qcQyFenLQL0rcRMl7tDPvU/+GU4GsWLUY+XUV0eBVxGcg5UOeXQLIDLjtQOHbt3BmXI7IetilVMjxcQCxynP45q/2lgYup1/DEaLHOvzgqSdDs3HsA4Nk5WkAoISMu/7ZjkRZ7Y=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nAZdYZUp; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nAZdYZUp; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nAZdYZUp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nAZdYZUp"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gQXYgyML0a+rtpBMn9vmqiiZ/BD8ksxXvZouC39Hep8ZG+zvIOoV3mrXPtuiqME97ZCAQBI5UN9v+bp8oh8vUvKVyHIyLanvucDWWYGPufM9F1KguSvzbV25yU5Ug6AqDzmmee0xJOr/WF+Wem0U2EkoRoSicibN4w/PKN1zc28aYH99N0SwXGjxKha+2g+qFYsUc83Oigoy8Zjn9XZ8VDp6agORIvLsuHt1n0Aq+JEHv5XOB+dHwQ55+TOFUIXHaDH+KLJlWx35vJkgkdnqmoofm4mo1xpBsyL1R4CpHOaFW8gsvwgPXdcujt9TTvsVBwLy+k4IIBkAjxDcy28ahw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLbNYdLBlUGdtXhJ6//wVBE3BxSuP612IWFrBrnPMFI=;
 b=R5b1rtvSwbfZzNPDkSCZ6OPvg2HaVb7IgoYp8mSqkRtF+y/huGuzguPc2E+TfF89v+8fYvgWizFw3LVdkexAY+P/6CffOgac710Zzi7p09xK8+rWkteeLyQaN0xvMklw+QuoG3Lcg78mPSUEavNwaXgZo2+fZetjfpyGK2zgSn5oOU495mG3f/7pzNsxAOFW4UnRD8AYxggvj3lRhOKhB5r+GQSIyRxZpjkKESISi5J1tNnMBKh8KSfOL0CMJC+3zauvomP819DU0FP610P/itBNii45l7KLmtWeQ1fZZLHD7Yea3gK2QKFN0DcdtgreCgTUtot7EuVn/Wsyo2/rEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLbNYdLBlUGdtXhJ6//wVBE3BxSuP612IWFrBrnPMFI=;
 b=nAZdYZUpM7NTUaucRS1SneR5api1sa9Y/AdTy7NKOS9uM5VzxaZIezwz8kDTE68cKTSmuyFN1NKURK1YsUKKkHZQ7jn5HwYHYwVYz6l4B6CyjSzR+OxQcMCjnQrtyL/5kcOFioJjdBnrjUoFRc3IBUuhZU2RfWLb608SpuLcjJQ=
Received: from DU2PR04CA0283.eurprd04.prod.outlook.com (2603:10a6:10:28c::18)
 by AM0PR08MB5300.eurprd08.prod.outlook.com (2603:10a6:208:18e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 08:13:39 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::f5) by DU2PR04CA0283.outlook.office365.com
 (2603:10a6:10:28c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 08:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 08:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbYvOBp3GuL0so0PVd1TxkJ2/mloZyyMwhO/ELJTWRu1L6t6NJ9aITyy05s3LpbbiiZZDJn4Gov9qKsNZfW45+tJ/8BNKJ/ix8yPEFwo0duzrsmonl7sFjiNRvsdES24HaUQVFanq3TCvmyHBKVJngl0/wDltCGPsguwMIe1aE+ZIqExZaVEJ8cH32e+whPWuwsnKKqb+JQt/ZnCImZvWMHrRc6oyO0CEoF+/1kbQiIT03O0X58gXVoBFJXtTcDwrw1hZvdCKFhS+HWTm63Xiid4G3LkZtFuWSzuCdrWXvKo+9i/eZz+6xQ23ro9jzuWb1N9S4TqCZeGzFgeDp9YYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLbNYdLBlUGdtXhJ6//wVBE3BxSuP612IWFrBrnPMFI=;
 b=nvsduJyGwd4Be9kUDsKhK/a+IdaJpomknC+gXfFV/dBdjWiaOf+HtrcdnppxQG0jlpSwjSUOTVaXSISV9tMba2xssXtBW/2heKn00g4CWNm4qxvZpHqphDSzm6sYh1V32fPesOg67E8AHb7Phb5cDxZ8Iffy9xCK9KriF73Hl4bXW16siiZMX3VtEK8HVzME8RZcxlOUir52SCjAuiHzo6oj/VX4QbjEbQpLkDeLQxxidmgiqXCWqRrKsvV8T32CBtII9r+Ud/8x3CBLu+3Qx1TsrQ5yBZtMY+xPxamUu84clFLnKTvwuWIWarE9r9iOKgX7EQt8IKWfC+AbrL4usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLbNYdLBlUGdtXhJ6//wVBE3BxSuP612IWFrBrnPMFI=;
 b=nAZdYZUpM7NTUaucRS1SneR5api1sa9Y/AdTy7NKOS9uM5VzxaZIezwz8kDTE68cKTSmuyFN1NKURK1YsUKKkHZQ7jn5HwYHYwVYz6l4B6CyjSzR+OxQcMCjnQrtyL/5kcOFioJjdBnrjUoFRc3IBUuhZU2RfWLb608SpuLcjJQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU5PR08MB10494.eurprd08.prod.outlook.com (2603:10a6:10:516::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 08:13:05 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:13:04 +0000
Message-ID: <980a1569-cdae-4343-bd94-4fb2ea6e247b@arm.com>
Date: Wed, 2 Jul 2025 13:43:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250702064319.885-1-raghavendra.kt@amd.com>
 <8adf60ed-91ed-4469-86ae-59e8e30bc6ed@arm.com>
 <1ffe2e4d-88f2-4e2f-8888-8cb278f1cc28@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <1ffe2e4d-88f2-4e2f-8888-8cb278f1cc28@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU5PR08MB10494:EE_|DB3PEPF00008860:EE_|AM0PR08MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ed181a-8001-400d-91de-08ddb940599d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ajlZQXNyV1VtV2xWUGQ0b0tBK1JLVkFUcjBXYTMrWHY3WjNHK1hOdHhaT04z?=
 =?utf-8?B?UEZlK3RGbElMeVZSQ3EwUkhhZzZmODlRaXdJSXFNamg1UEdtMVVpWjdyRE41?=
 =?utf-8?B?SzJ3ZjZaVmJIUnAyWmplUUpwSHVwK0EyWFpVNzlHdVFZdGh1WmI3N0p2TDA3?=
 =?utf-8?B?V2JzZldOZHhmVnpFdk1FdUNRRWM1WUVPYkRqamN6ZjJLVjJXRVdOQnF3TnRK?=
 =?utf-8?B?b01xVVdQN2l0YmhtekRoK0xRbXlHOGxjSFNUL0ZXUVZUeC9GdE5JNzlIME10?=
 =?utf-8?B?Q2swa3lydGNWNWtDQ1ZWeTB5R3R1dC8xVzZZd1BVcUVVSzF1eERnL0NFNVF6?=
 =?utf-8?B?UnNjWEliWlMvcE5ZWHErVkw2aXQ1aHFOT1lIN2FZNGVvOVZmVnpGNitieElR?=
 =?utf-8?B?TStHRTIwYkFuY21VejEvZm0vdFNrc1JNWUtPZzJnZDJra3JhdTRrWmhEZUts?=
 =?utf-8?B?MnE2OVpaVmZSZ1NCYjkxeEpYeXEzSzJnbGdEazZpWG5TQzc4YlU5WG5aTUsx?=
 =?utf-8?B?RGFLWlo2a2xLUGVObENOWmRQWTA5NnBzR1JlREpQdnBzQ0JtaHcxL3MzRUVH?=
 =?utf-8?B?YlNUeEdjR3Y2b0Nxc2tqWDNsbVlpd2tnb3lMeTVidDgvODdLU3lXM2VNeWdF?=
 =?utf-8?B?MHgvdGtNd1ZGU3lxRjBjQklVdmtVRlo1VHduekNpYzhacGE1ditlRmpNRnFs?=
 =?utf-8?B?bmlxSjB5THgrQzFQUFpERlp2Z2Y2cTRWZDNaV000Sm9JMEhEelc5d1lCeFZS?=
 =?utf-8?B?NHNEVXg4Y2pqWWVHcjVwMkFELzRQVnhZc0pOQmd4LzlFa244ZTRzc1ZGRy81?=
 =?utf-8?B?VWMzKzZEYTVESDZKUlVBMnRNTHpUR1JKOFVQSHQ2NFp1ZlVnM0ZYNUNDS2Y1?=
 =?utf-8?B?RXN6ZGZTWWFDUzZsS1JZQllKaWd1cGdMbElua2NSQXVjSlVJcGVKYmwzbER6?=
 =?utf-8?B?R0s5WWx6bHhOTlpBSXpLUGtxRThwUGt3aVZwMzMzSEgzem9tTy82eVZGVTJn?=
 =?utf-8?B?M0JSRTcvOGtDeStPYzQxTjlLaldoamFHaGV2Qm5nRnU0d3dEMEZIRnlkREds?=
 =?utf-8?B?YkdrSHU4WHc3UmRveUFlZFpBOWxuWHVna3pSSlU2aUNiRlVXaEZHclJqQjBF?=
 =?utf-8?B?b1oyaGRNRHRyMTFvMnNoUmxFTHR4K1dma25pM0w2aUFWRlpjUVNNWGgwZ2kr?=
 =?utf-8?B?OU54SzU4ek5CWWtYYndRa0RLeDF4b3BPNXVhaXpRYmZoQmVnMTJhUzRHdkpi?=
 =?utf-8?B?bTVkeE9IendsVEowK2R2N0dvNHVSeEYvaml2aFo4S3kybXN4VUs3cVdHYUEy?=
 =?utf-8?B?VjdhbnB2T2lEQnoyWWl2WDUzckxaRzlVYVoyb1JxREtpY2xSZEVucDJKcjFa?=
 =?utf-8?B?YldROWxPVGpKRnFucmNXNUtMZHoyS2xITnpIRjNwNFZvc0h0QTlpMmlxOTJn?=
 =?utf-8?B?d1NjT0FKdnR5c1d5WkU0KzFtMTZQdG55M05UU0lCS2t3VWo5cmd2RDAzR1hV?=
 =?utf-8?B?TVJ6TDh4bFUxK2N3UkZDZmJjZlF2Ym1oWUdHV0ZYWDZNbDFYMDR4Z2p2anBv?=
 =?utf-8?B?QUZEYjV1VE1FT2FJY1Y2ajg4S1dHV1YwL0NITkY1Qm9yb0IvUkJ3MnJ1bnhY?=
 =?utf-8?B?MUx5MXBtWFJsT2E4bmt2R3YvTFhFNU0raFhjb2trM2JiSGQrZWxWMFZoVnB3?=
 =?utf-8?B?SUpKTFk4eUNUSXVQR29XdEVLdldjclNGbmJQVnpGQ2doRzk4NmYyM21TOHlT?=
 =?utf-8?B?S0xSdDYwUlBaUlVDOEgrZmpURUtVbUhaZzRXaG1aSDAyN3ppbFZuUE9iYkFO?=
 =?utf-8?B?OHg5eHh4ZFFtWnlRQ1h3cHlZSGp5a2FNbVltYkVWY1FGWXBMQVp6a244VHRU?=
 =?utf-8?B?ZENCMkt2WFlZMWZXSDRCaXpqSmhGK0VyYTFQOHVwSUg5RHFnNWZvWlF1aW1l?=
 =?utf-8?Q?wJpxCWepoms=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10494
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0821bc96-606e-4ea6-36eb-08ddb9404522
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|1800799024|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ync1Rk9WWm9TNXFRK2tTbzBhYlRuSnZGT0kxSDVuTXZPNXpjbmFYL0k0Zkhy?=
 =?utf-8?B?bC9yRkhvK3pFd0NGWEtDUWN6Z3pyTFFRWVdNZTJvcXhwZFJYM2hldkU4akdn?=
 =?utf-8?B?U3dDZVM1cjJ0VWZjOWVyMWpXT1lacTQ0V05XRGtXTm5DVHUveXYwUEhvZVp3?=
 =?utf-8?B?UXA1NWdDanBkYjJlanB2SDF4VHg4OFpPMXNVMm1KUW12d1hpMDNObkpvMHNv?=
 =?utf-8?B?cVlEQ1N6NmREZFZzdCt2NGNCZzEwRGFzNFIrZTNQcEZkZm00anpjK0p4QW95?=
 =?utf-8?B?emVhOEJLS3puTHI0WGRuWm0wZi94MnA2VEllMGk4cmRSckpnVlJXZnNZY1Bp?=
 =?utf-8?B?WFI5RCs3eHA5Y2ZQZStVUVlTQTRRYTgzOThPODZzSUNwUTRXZTFqT3FRMEFq?=
 =?utf-8?B?QUFCRHd5L1RRR2VmU1IzRWdtUTBGWGNOemlYT2dZeWkxejVmNVR1clBWRHZV?=
 =?utf-8?B?N3NQS2dEWGdMS1Iyb2hqKzQwRVE2TUJnSGJDQ0VuTXFYM0E2RFlGbXFQUnRh?=
 =?utf-8?B?WVFjRko4SURVUk1zWEVjL1dwU2ZmTHdFVHIyeVlnMTZlRnJ1bjNUbG1ILzVR?=
 =?utf-8?B?UFE2dE9qZC9zRWJ4Yk8rQnNWUmdCTDcxYlk4bk1rZCt5ZSswcjNoMzkyRlZ0?=
 =?utf-8?B?RVVraXFOWElFWTBKdmc3TE9OZVJEMDAzOCtKNUcxUlcrU2c0R25rRnM1RWJT?=
 =?utf-8?B?cWxEUyttM0VJV0ZGbTZZTG1OR2JnbDM0Yko0VEJKUzVUKzNQckcvbUx3MVZB?=
 =?utf-8?B?T2JqaWdoM0xMSzRVSXJ1U2FHZ2k4VmtDekxzNkliZmIxWFhBQkVER2EyOEd0?=
 =?utf-8?B?cDJCeS9pUkFzR2R3N3RNZWdoL0tRUS9lci9XK1VaRDYxQk01MHJSU25ycnhk?=
 =?utf-8?B?Njk1eXVHVW1MWUI3RDIrOWNsWWI0M3djVmo4a2Y3cEZjYnZhcUZwYUtHL1Ro?=
 =?utf-8?B?QTlnWDFMRFVuWWRTUFpUQWhsL3h4UkxnVThJV3k0c1lWRXp4dk5VZnZqKzgz?=
 =?utf-8?B?ZFh6Z1RtQzZUSThuckVHaWxQdVRhQ3NVYm00QkQ4OGwwbGdEWmJkclZFb0R0?=
 =?utf-8?B?STYxTEVwNnA1YmpJQ0NtSG4xQjMrRElsd3NCeG0wMEhpeW9FRUd3NmRGU0Zz?=
 =?utf-8?B?RU50MCsrMnRBczVXVGVDZTlkWnJhUVY2K2NkaktBSmd5S3gwMXBJeUc5aUF3?=
 =?utf-8?B?Z1hVeDFHRWVkU1d3dndEeHliYWZ4VEhuT1ZqM3NDZ0xrakJTK2dpN21lakRX?=
 =?utf-8?B?VEg0R1FrbUQ5SkdJcW9JbU9Zc3JkY0dsbUFRWDI0ZGhpSnB6ZG5PVFNxQWdC?=
 =?utf-8?B?MTdUN3dFUVlFdzVIRjJnM1pDYTVnMXljSWxKU0t0NHZ6UHlTcjBndG9DVk14?=
 =?utf-8?B?ZG5UQTZvcEF0NWVGU25iR2ZHV2lYZDFhVjRqaEpHVkl0Z2VKMW9Hb1FyRjJR?=
 =?utf-8?B?SnVFRkRXMWdEdWY1d0FxQlN1bVc0N1lrelJYMW9vTWVnUmgrNFhSZUxqV1pw?=
 =?utf-8?B?OG54U0FyL1V5b3ZwenlERzBRcnBxZVZvSTA4ZWhtSFJQUVowSGhnNXRMY1Jq?=
 =?utf-8?B?d09tdW03NlhwWlMvamVmNjAwKytTMkVRRmxhY1FhSEdVNFU1eTdqaEl5WW9G?=
 =?utf-8?B?aWk1bDZFRk1Sbk1ZMFhCZmZ6NFJha0xnZVUwTCtzNUZpZmYxRitKcDJCNjVV?=
 =?utf-8?B?ZDhoLzZUTmt3S2MwVS94Qld5bVZrUU50a1RmRmJ2SnpZZGhwL0N4bzVSS3h5?=
 =?utf-8?B?NmJ1MTNUazJheVVXQlB0K1hHVHRZQlp3SnNyV3JmbytYZGpTQ3JZOXFSTTVI?=
 =?utf-8?B?U09mSWg5V2VIOUhUeDRUY1poRnZ5QnNLUHVhYktkOTJWRlQ3Q2FhWUVTTGsv?=
 =?utf-8?B?c29hVjE1SkFha0pnOWh1blhmZXdrUy9xNG5ZSG54aGMvR2dzamxkZFBkaGx6?=
 =?utf-8?B?VWVkbHZFS251V3RJY3labmtsc0FFZEg0NmdvTC82dGdUM1NYaDg0WFk5U1pR?=
 =?utf-8?B?dE1aTkxUT3BUMWR2elJRWTVJb3Y0Yncrc1BBcXdPWE5Db3dFTVV4MzVDM3JI?=
 =?utf-8?Q?o5tM7Y?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(1800799024)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:13:38.8034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ed181a-8001-400d-91de-08ddb940599d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5300


On 02/07/25 1:38 pm, Raghavendra K T wrote:
>
>
> On 7/2/2025 12:18 PM, Dev Jain wrote:
>>
>> On 02/07/25 12:13 pm, Raghavendra K T wrote:
>>> The test align_shift_alloc_test is expected to fail.
>>> Reporting the test as fail confuses to be a genuine failure.
>>> Introduce widely used xfail sematics to address the issue.
>>>
>>> Note: a warn_alloc dump similar to below is still expected:
>>>
>>>   Call Trace:
>>>    <TASK>
>>>    dump_stack_lvl+0x64/0x80
>>>    warn_alloc+0x137/0x1b0
>>>    ? __get_vm_area_node+0x134/0x140
>>>
>>> Snippet of dmesg after change:
>>>
>>> Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>>> Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
>>> Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>>>
>>> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
>>> ---
>>
>> Thanks for doing this, been thinking about this for so long but
>> I'm lazy : )
>
> :)
>
>>
>>>   lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
>>>   1 file changed, 21 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
>>> index 1b0b59549aaf..649f352e2046 100644
>>> --- a/lib/test_vmalloc.c
>>> +++ b/lib/test_vmalloc.c
>>> @@ -396,25 +396,27 @@ vm_map_ram_test(void)
>>>   struct test_case_desc {
>>>       const char *test_name;
>>>       int (*test_func)(void);
>>> +    bool xfail;
>>>   };
>>>   static struct test_case_desc test_case_array[] = {
>>> -    { "fix_size_alloc_test", fix_size_alloc_test },
>>> -    { "full_fit_alloc_test", full_fit_alloc_test },
>>> -    { "long_busy_list_alloc_test", long_busy_list_alloc_test },
>>> -    { "random_size_alloc_test", random_size_alloc_test },
>>> -    { "fix_align_alloc_test", fix_align_alloc_test },
>>> -    { "random_size_align_alloc_test", random_size_align_alloc_test },
>>> -    { "align_shift_alloc_test", align_shift_alloc_test },
>>> -    { "pcpu_alloc_test", pcpu_alloc_test },
>>> -    { "kvfree_rcu_1_arg_vmalloc_test", 
>>> kvfree_rcu_1_arg_vmalloc_test },
>>> -    { "kvfree_rcu_2_arg_vmalloc_test", 
>>> kvfree_rcu_2_arg_vmalloc_test },
>>> -    { "vm_map_ram_test", vm_map_ram_test },
>>> +    { "fix_size_alloc_test", fix_size_alloc_test, },
>>> +    { "full_fit_alloc_test", full_fit_alloc_test, },
>>> +    { "long_busy_list_alloc_test", long_busy_list_alloc_test, },
>>> +    { "random_size_alloc_test", random_size_alloc_test, },
>>> +    { "fix_align_alloc_test", fix_align_alloc_test, },
>>> +    { "random_size_align_alloc_test", random_size_align_alloc_test, },
>>> +    { "align_shift_alloc_test", align_shift_alloc_test, true },
>>> +    { "pcpu_alloc_test", pcpu_alloc_test, },
>>> +    { "kvfree_rcu_1_arg_vmalloc_test", 
>>> kvfree_rcu_1_arg_vmalloc_test, },
>>> +    { "kvfree_rcu_2_arg_vmalloc_test", 
>>> kvfree_rcu_2_arg_vmalloc_test, },
>>> +    { "vm_map_ram_test", vm_map_ram_test, },
>>>       /* Add a new test case here. */
>>>   };
>>
>> Why this change?
>
> Perhaps not entirely necessary except for align_shift_alloc_test line,
> still updated the field since one more bool field added. But let me know
> if you are okay with current state OR need a respin for that?

Oh now I saw the "true", I thought you were adding commas for no reason.

I think that's fine then, but will let Uladzislau decide.


>
> [...]

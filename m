Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B7217730
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673400; cv=fail; b=c6BKSfRacEQihBKA+hbzvNb90LeI4EOQ0Ofpda/63uzOvC+RftLtGj+Bp9qcE2oyqpVLCTf20kOnxqe5/sNFX/NCkxYIIybv96Avy3/DkK7t1/cPwZvx+DlALVr7iXWJeBsbsNls5Fja7H7jqF67URGS0NHO8awpWgblHIcbUcM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673400; c=relaxed/simple;
	bh=mHQWjFTn5sJD51k1RKTDF2otkzP+OqBjEWN7GrTQ0Fo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ifAtAiM80zjFGtcx80FE8AlFFnA3sX5U4oQT+SRZJG0vmrCq+Og/jXd5lv2dGQboC/sa+YLYhqeQfDoNwC8JpAOjWg2BtcCivkRUScDoHMm/lLMsMSFe5gzrCmqES8stnzH6yHnNwX96lywigy7K/wDGBDeJt0Wfb4RNVkXGv00=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TH192FJo; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TH192FJo; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TH192FJo";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TH192FJo"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QQPmbk1PBhu5bCydrZzf2MO1mZxqkQS3LpA/EGfZG57GNots8D/OZrZQQqn+GK40bwxFY6qacqVoVo018uqmoSU8u8w02UNeM7tUxTfK0GhXJunmZ66qK9ThO3B3j1Er66zKLeiXSt/cyNaattHftsQEA3TzNTW9n6+6iLzAk2q+QZTiUfvSBdb1YDH16ZvmpOvxrTGnPox6bYlqKAQG4277kDLj8vcxyRK6N952SfImufb7VIU1e/39HYFmhZEB9hPqr6rrCdCV6KRfl3CU7x7l57LnlOMGETJYAyflxelEwNBPLMgcxhDLmYUQNSibpOGg0SG23/EmIvQz/2MgWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HLnSYWOjkhE5iQPlVTumtkOkxw4ssBtFH3EkmOPoi8=;
 b=JsV/h6gbPBKuDacLos2eiJNDjRqrXT3Th8lG/Ot4zxkAdiTqG1lPmgKR5t7Gm3O4b5s5PnuE0L/NUMH5ZSnLEbKAhcNkxl8sWk3iIk5jIDNIL1grbUSbOEyrKcH4hPgKDfvihTPcaoDn9CBw5t/ZavJo25WNqJhYV330YpRVsHlBwBnhRp+TWxKMAErzj8T5hJphxMaAtBdtxulfANdWx70dcoidwh/9d1mPzXPDaBA5rI8muRS1oh9ngtfWlBHIs+c1ZuHhmAI6Gh1nA6UQozYQqsEERc3oqho+YhiA+4Tzw6aavrFYfXBds4adRNgnHSM/PMfCHpnORaB06xXDeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HLnSYWOjkhE5iQPlVTumtkOkxw4ssBtFH3EkmOPoi8=;
 b=TH192FJownE35ciVj2wa0kWGIiidSncqOeAwOdwHS3NwcCiwRcQ0Nl+ZR/ry1ryL7kOKsUXSvCVxXeluz/PTqSbsHcc7nRwf087n+HQd0AiIxzXT8MtArSVTTbETiAPpVxqyktCfkydd9OcPIkXvmjqmOYX+rhOphr3D2YrgMRI=
Received: from DU7P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::22)
 by DU5PR08MB10610.eurprd08.prod.outlook.com (2603:10a6:10:51a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 10:09:50 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::2f) by DU7P195CA0012.outlook.office365.com
 (2603:10a6:10:54d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 10:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 10:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kr3asqVXtnlGwY3QoFWRxDVSw1PqCHNrmK6lQHLHs90nQT3h9yHEUR9t1eyB0t/BlICKZBWxXnlUdTVlhdQZHc6Aus8DE+/jOqqwrs1FnFsNUkLGiYFg1jTViYm9XtQk4X16LvC61jkh3wPMWXNHVlNbeCqzG+H2hGTJd5eC682+7lgKdx/zjvi+LXkcWTE65CQHPKvV2VdRUAyk7GZ1wVtPzEMYdDitHYASAXd4deLMZVu8EsWvVpJwxZ2yt+M8rfxfQuWn0pVbDDQpURhCAig1b1KLUw1Ki9KrXq9uhRPNhgNLMoLv2oqYX06KYVeA28jCiI0uZvKI0QBZi5gD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HLnSYWOjkhE5iQPlVTumtkOkxw4ssBtFH3EkmOPoi8=;
 b=BeTkapHNDVYQ2PFwxLMr98ZlhLWxx8YUY8Z3lbrZg4sGkkePKO3KtORrf4Ll36DqB682LMq3q/qru0qER/VWfe/5Qh5FerGfWTqjHJB6G5gNwhwoXNoWoFxgF/hcCJrw5dOQBLLdg0IrK1NzSAT845WOOekd/r/41dhl5qRZ860NoNGFBNxpabCW+dzom6pVE03ftfW2kv4SKp1/G/E1HVMZrdgLs8/nC3oUqGqn5bSUmyfFKM973iM+ZwXlQS/nDhNoba9jL/H8iZAlpd7vU+ac9X4Xy1z7abXzegAUX9BaWQisAxuwlwYbLBrO0E2q0LCmZIrfuM8Vp/zSACjnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HLnSYWOjkhE5iQPlVTumtkOkxw4ssBtFH3EkmOPoi8=;
 b=TH192FJownE35ciVj2wa0kWGIiidSncqOeAwOdwHS3NwcCiwRcQ0Nl+ZR/ry1ryL7kOKsUXSvCVxXeluz/PTqSbsHcc7nRwf087n+HQd0AiIxzXT8MtArSVTTbETiAPpVxqyktCfkydd9OcPIkXvmjqmOYX+rhOphr3D2YrgMRI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB8405.eurprd08.prod.outlook.com (2603:10a6:20b:558::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 10:09:17 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 10:09:17 +0000
Message-ID: <f5c7ed26-b034-4600-ba29-26761eb1eef5@arm.com>
Date: Mon, 23 Jun 2025 15:39:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: move mask update out of the atomic context
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
 <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
 <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB8405:EE_|DB5PEPF00014B88:EE_|DU5PR08MB10610:EE_
X-MS-Office365-Filtering-Correlation-Id: 855a88ac-7980-4e0c-8423-08ddb23e171f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QUQ5UEViRTYvSUpWTElnd1VVQ2EwcSt3dy9heEVQVmFsajVtU3VGQ3E4VXMz?=
 =?utf-8?B?WkdHMjVuREpHWVZRUHZraGpUVlFOYVNhVGIzODhRZkRQOWtGeDJzQ0JNY3Qw?=
 =?utf-8?B?RkZ1djJJWVlLNXpOSE55dEFlUzRvQ21VN2RxRi9DaktwY05kckxlOGZnSFZm?=
 =?utf-8?B?R3FrOTQ3cWN0eGFabDB0Ymo3VkJQMTVib3lDYllNWGRPQ3oxYXpUa295WERl?=
 =?utf-8?B?ZVhpc1ZwTmZGQkRvdk5NQTBnaStJeHhLRDk4bDh6SFNxN05sbVJ3TytaOVBQ?=
 =?utf-8?B?K3lEK283UkFRSlcvSWJScVJ4KzhQT3FIeXl4U0tQMURETlpzdGN5aSt4VStH?=
 =?utf-8?B?WXVnQ1B5WHlqMStBQ2djSTZpVlNNQzRodUlTdDRjZ2FBcDgzcmVDalB5ekhj?=
 =?utf-8?B?WENFTUlFWVI0SERlSEtmOE5yK25WVzIxeEQ2djRlNzArVzBwVXEyS0JoNHZ1?=
 =?utf-8?B?VjUwYjZla01mZVJFbExtQ0dTeXlMajlLN0tmVno4ZHBRVzRPU2lJNUxJNE5y?=
 =?utf-8?B?dkhQS01hUFV4aVZ3QnlOZE5HdHBKbUpZY1lxT3o4WEs3dUorR3JocUt1VzBV?=
 =?utf-8?B?N2c2c0FxcmpLOHZDNXNJTXpWRHVEWXFVNkl1SldTaXRKUEV5ZEV4ak9DdWRW?=
 =?utf-8?B?YldzdGFLUXAvU0lUQlBLa3NjdGtWazB6N3l6SzZnZTdzN0JuSUVQZHI2SFNx?=
 =?utf-8?B?V3NuOHA5M0Ziajl3UkhxMEFpbzE2WUc2VzRUUTBBRmlkeUJiWnZ1a1M3cVBM?=
 =?utf-8?B?bGtMWDJYVWtKV2dqTG4vSVk4eVk5QWF3bjhZM2VKRGQ0RUNqV1lHK2UwUzUz?=
 =?utf-8?B?NmdzbGhzeVBOZW5ETmFHY3RycStWelFvcVQ2amRXcWV4VEM3ZVg2LzNkMDU2?=
 =?utf-8?B?cnVLMnZGZEd2OEp3VXZoUzFOZ2N3RCtRcHFNeVczMEJ6SE9sTEM1T1BtZS9D?=
 =?utf-8?B?c0h2OXZZMDRDakx6VjR5R2ducXY1b2JPaDJOQUV0djU1ekx5NHZXNmdtT2pS?=
 =?utf-8?B?MEtXY3hsbWRwWXNvQW9SNkNtYVJicmdSQ3Z3YUV3cmFPbXdOaWJLdm5sanJk?=
 =?utf-8?B?TFdBVitMbE93a1BSWFd1MW5mY1duRjkwZzBUaEFkWEJrcVAxbW0yZkY4OEZl?=
 =?utf-8?B?VUxHWktpdkRhSFArWVhPTWRZQmwzeXVQRlRrcEdWM2lOak0rb1JvVUwrbS9v?=
 =?utf-8?B?Uyt2QUJGV0xoMTJEaWNRemFEczYzQy9jQitNb0MrS01LaEhRWXdCcWNhRXdX?=
 =?utf-8?B?ZGkrSThSYXJxUDNJMGZFeFNQWEM4UWsrRmI2R1hWUC9OUzkxa1NzZ0tib0R0?=
 =?utf-8?B?MXFMM0tVSXEyVjlWNzcxTjhkdDBqOHp2bWpicGhPMlNxOTZSVStzYjlaMk92?=
 =?utf-8?B?cVVHS0FUN2MvWSt6VlN3eDBkZXRVYUxKay9UWmJxV0RMUHpYUWQxejM1b3F4?=
 =?utf-8?B?d2ROUzI1ZS8wNy9GTHhoKzRIeklZSERxY3pRemN3Ui96VDNGY3pLOStIN1cx?=
 =?utf-8?B?QUtJa1owUFZKNngvSUF5OU9QTjc5VDJVS1Z4Y3hyblNJT1RXc3Exc3QwaHhB?=
 =?utf-8?B?Vm1aL1BNTk1mVkhtSjZuUGphb1N5MjlucjVqcnNHRlRVbnN0VzByVlBtb0Q0?=
 =?utf-8?B?Tmx0cEQyOUpUdGdmYzh3aTI3bzRXMnRCalI5M0hTK3pwWnFQV3FEck5paUN6?=
 =?utf-8?B?cVNCSG5BL245UXhsakZ0SmZUWVZCNE0xdkVQQW1iVndsQVpFR0dXYzhMb3JG?=
 =?utf-8?B?Q2FSdlUrK2dZM0RJcHRjZ0tpYkFEdzA1emk2YWkzdW1hNlV6WXU5VGdkalE3?=
 =?utf-8?B?R2R6ZkpJd1NtK1JIdUtkTTVxUnFabnFCK1AzSkxEQ3pONjF3VTQ3dEN3SFgr?=
 =?utf-8?B?Z01uVEhNSnZqV0tLYnpyeGp6YlJScDkvOGlJUHFhSTBOL2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8405
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70aed484-68b6-49fb-16af-08ddb23e0382
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3Fualk0VFJwR2JjR1NNOXJjSlBZSVh0Ym51d041TmhsRm9yVHpnanp3ajdy?=
 =?utf-8?B?Tll6MDBJUy83R0lFVjJ3akVyNnBXMXpsdlpLWGVmTEtVMmh5VGFKc3dzcFlJ?=
 =?utf-8?B?dWhvL1BKcHlJR2lucGQ5aWpmRTREOWFyNXpnRm0wQUwzcm1NYkJRWTNxOHJP?=
 =?utf-8?B?Q0RtbHA1UWRMOUZJQzROVWxmNTFreWRHN3QyM0U3SkR6eTlYNWZ1Yzl3aE85?=
 =?utf-8?B?cFByckZXTHphY2RLbjZuOGV6aXl1UGZXb2tlNXBHaEZmTjZjakNpWGFFcDcy?=
 =?utf-8?B?Q3Nkc2JKUXB1d3VvODV3ai9xQlBaSGJCbGN4TnAwNG50RnNaL1ExOUprcHhx?=
 =?utf-8?B?QlBkMkQ2WVBaYUNFVDBiU3kxbnBrcVB0WUF3TEpIbjhhQlBZNVZFWCtOZzFH?=
 =?utf-8?B?WGU2SitTR2lwTkJhVUhhU0I5NDVqbmN1eVowOG1yV3h3WDYrUW1jM1NoUUc5?=
 =?utf-8?B?RUtaL3ViNjliVFN3TXV3MzVoSXRtN2h3NE04QWEzQUJ1VHN2WWxjdllFWmkr?=
 =?utf-8?B?TkJhOEp2QThuU3Axby9VQ2haOVZLTGNjRVp6ckI2ZHNsOU9lRE5iVmwwNTVI?=
 =?utf-8?B?eEViWEtjTDZsb2QxaGUybFNxS0dmSFRWNytPRzZGN0RMWUtDWFEzOUlwWHhi?=
 =?utf-8?B?TnVYLzRGR2IzWWwyMzlmb0E1WEQ1SkJhYlhVWGZOQ0RHTWEyV1kzZXlobHlJ?=
 =?utf-8?B?aGExLytUbTRBaW05R2VuY1ZvUnd0QUZwd1Y1K1NpTmxJbGNDY1dWR2NZY2FW?=
 =?utf-8?B?bUl2S0k3Zlc0d1hoNXFsQWlUTExuczBsUXo4Zm9vKzY4dHdMbUtUQXBYSFRq?=
 =?utf-8?B?bzc3VkthemVCcUtGVUsvNVcwNzMvcTFWTkpUemZ6ejlKY2V2cGFYV1RFSHJZ?=
 =?utf-8?B?T2E4R0xlMXQ4K25ZQ0FrRmFVK1dOQUlzYWVhUm1jVzZPN0x5RUxIVFFxL0po?=
 =?utf-8?B?RkdIOFlmRHNSSnVQT05ibjJSVVorSGkwSUM4WVhESnVoQVdrRlFOYVhJTVNs?=
 =?utf-8?B?UHVObUIwZ2NaMGphRzVERm1XaitnazVqU0thZjhOUlhjMjh1U285R1BLR0hr?=
 =?utf-8?B?MForTzZNSytsd0doeFhzMG13Uk1KRERORmxUVUovTUxxMmQzamNuUTduQ2Fx?=
 =?utf-8?B?bDZiUHVqVHhyNXdzVUFKY0NqaHVJNFVKNTJLN1llYUwrcXVyL0h3aHB3ZWdy?=
 =?utf-8?B?WVFoWmRva3pUZCtJS2dsbWFVcEQ5NHZkYnMwK2doZzM2eXZLYlVMVnluTU92?=
 =?utf-8?B?OXkvRnVENHVWRFdEMVhoTUxSR05VY3E1SVE4c1NTajVGS1BYV0l1ekdXY0N0?=
 =?utf-8?B?RzJreWRZWm44U2NBRk9CT2dWVjZrS3VNL0lVK25mdVcrT2FtQXI4Skl6cEVv?=
 =?utf-8?B?UkwxdVF1eDRQS3lQQ2ExMDFqNW44QmxOV013MVZnbWtsRmJwejk0dXF2TXd5?=
 =?utf-8?B?bmwxb095TkxFSS9GaUx0ZGI3SzBVU3ZBQUJ5ZExicjVDYnBPUGpnczc1L3U5?=
 =?utf-8?B?MEk2a3phK0tTcXA1VGtHV1ZoUnI0NVU0TkpQZ1dBRHB3NWc2QmlJTzNBS1NS?=
 =?utf-8?B?aTNMZm1yTVh4RTFnK2NqdktoSUlwenFpUjA4UVZOUmsrWFU2RWRwcGZsVkdH?=
 =?utf-8?B?L3hjbllUS2MxY2RhTGVpLzdlYnUzT3pkVnV1WWxnYTRwUkJXVVEvQWE2ZDE4?=
 =?utf-8?B?Q3BrVEhlVE4rS1Z5ell1a3V6RXZmcWorbjZkZEVwUVRvMlNFL3RXeTMwZXZN?=
 =?utf-8?B?OVFtYjlGWEVjUzlPSjJhRkg1WVdadmJ6bDNONFBVZFRCVmdRUTRpU0NzMEhS?=
 =?utf-8?B?cHAyU1IwMWE3ZnZsRzZ2ekpBZGZHbXZ3REVpcCtHS3JVdnFwdDBWMTUwZmlk?=
 =?utf-8?B?VXVMMHRVaUZiK05jNGR5R1hwSGxSbVlSa2FOQkJ6Y3lNdHNUZnpuVzFQSUdI?=
 =?utf-8?B?N0ZiK3FHa2FuVC8zejNPTmUwOXBJUVZ1eDREN0NmdGNUeXJvMUpaZVJkR1Jl?=
 =?utf-8?B?RjFzRkt6SDVRTzBvWjVKTDZnUkxDK0RUMFZEZWNVOUxHYU1sc1o1aS82d1BB?=
 =?utf-8?Q?75t5JZ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:09:50.1142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 855a88ac-7980-4e0c-8423-08ddb23e171f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10610


On 23/06/25 3:07 pm, Alexander Gordeev wrote:
> On Mon, Jun 23, 2025 at 02:26:29PM +0530, Dev Jain wrote:
>> On 23/06/25 1:34 pm, Alexander Gordeev wrote:
>>> There is not need to modify page table synchronization mask
>>> while apply_to_pte_range() holds user page tables spinlock.
>> I don't get you, what is the problem with the current code?
>> Are you just concerned about the duration of holding the
>> lock?
> Yes.

Doesn't really matter but still a correct change:

Reviewed-by: Dev Jain <dev.jain@arm.com>

>
>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>> ---
>>>    mm/memory.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index 8eba595056fe..6849ab4e44bf 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -3035,12 +3035,13 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>>    			}
>>>    		} while (pte++, addr += PAGE_SIZE, addr != end);
>>>    	}
>>> -	*mask |= PGTBL_PTE_MODIFIED;
>>>    	arch_leave_lazy_mmu_mode();
>>>    	if (mm != &init_mm)
>>>    		pte_unmap_unlock(mapped_pte, ptl);
>>> +	*mask |= PGTBL_PTE_MODIFIED;
>>> +
>>>    	return err;
>>>    }

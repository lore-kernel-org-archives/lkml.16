Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3BD1C2334
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599974; cv=fail; b=GFfOK5+NPxNxRyTCiZom+C4khYMz4D/jABLhrEkAH03OOQDyxpRuiMo86fLhQMHlGUka0t/7dkPVDGJsdASzl0XyCYV7Ndair5QqZGyfvJa3TQHC0LqHG33dHckC7uUNFDY/e9I749FlYG4ZVESVAH76YiWbY0ma3o+G5PKfqIE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599974; c=relaxed/simple;
	bh=bwgnbmrsVwsLXW/YryptlpyLHxg1hYWmnZgfBCLH7lM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XU5tXJoeK0CTdhuzuEJf4oI3GATuOdNg6dOfNj5SQgNYhg1NwBIL1Tvj3DwcejCaQOEQewsx2oSIKt+NIIO0Epf8lP9RxQkJEBBvdkS2ciTf+jhGiaajC/ZAyiwzzownMQIx0+pyhpmfjv0kQ5WPdfiGgaSxyaxiQSdQSDXdHSM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F1U7KgXl; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F1U7KgXl; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F1U7KgXl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F1U7KgXl"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ff6NHICRC0e4WQY9bmfQw16117j/ufICEGqaowexJrG76OartbjChKjPIwSSY3blfmSnnRzGRjMIuplVY4OSH0D7X+hpIJUcnMDpFvn+ZGRUXbzft4HXfLepFTp2ZkktJXZUnGCj7DVF4j5Qs3WSRnTVAOyvtg4vmdRFNsiH8M6zUQmJqEYtQ7BXsnfjHg3pHFtHxG9EsKbeJQqhsad/TMPDGi34LhZlTOyNZExOAUFkM85xkzD4Hd2YSWmcYkSkYHLeC1d3dTzbUBjTPLEAa8Yo8yE3obYB440e6epxfCgVJKAivDgKp/X3OAS13Zm4jkJfJCGW+ZUARiWshsJGxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlWrQiJNHbF2c/V7W1Y/PwVQX9zTGvMRAzi5NNuMdZY=;
 b=n+Z9MQNm24ZHSbkUEgQSPzxrEwbCy5FCrTIexJTwpby7LDG/OnuKJi4Vw26KMmzk0pBen+G5ENenKzNiVZDsjccIYpdtB/oU/8c1GytJyZGdmetIuOde/yMQl/tqLQMjRCwlVIRACfo/w4FJ/mOyAB9Ogc2tlrurB/GcMjbpVtiL9zGKxz/rn3MIA8AuGyKqHed5afgyCLkRdzBsx9s+9DyT1Q2pXlDhfUlrf+FbwhGXot/XI3cBUJyhYRkzLFHa/NtYZyrmEr48Rrh4ixZ4sUz5UGMl2IUsruYEDG9WOddwGg9U+4CVv46psKs2bUcDOOi14hoyszRW2qRTCR+VlA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bytedance.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlWrQiJNHbF2c/V7W1Y/PwVQX9zTGvMRAzi5NNuMdZY=;
 b=F1U7KgXlFq2hM5DKSZ9HGtUEV/I2f4uBikM2Q3jMX2jiklvycGViRFOOOZoP1stHw6AuPh150NS2udDR20OxZyvXZ8eNQaXYo6VdQkGcXyx2ETvQv7B/L4oJUu/b/s6l/ViqikeTC7XLPDj+twMUz0OS2msYQJ+MBmoPhq6ork4=
Received: from AM8P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::11)
 by PA4PR08MB6191.eurprd08.prod.outlook.com (2603:10a6:102:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 10:12:48 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::d4) by AM8P251CA0006.outlook.office365.com
 (2603:10a6:20b:21b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 30 May 2025 10:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 10:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h04bQjW5rcb90/zQGhlw3Ep6LVuJanQq/scWR+Ru+dV/IcJzbUFT+JATvh+5uA+9j5Hnfbe05iPUpUAkHwoQzew/5PVFcsAomPuQj0lufe3wn0BFK/tq3BPhjq1TPVS+uSXqT9/on6oXfqrPWwebK8BoFmcyUecM9vTax63psiyFG4HVD/rOZ6NrhfI7awqwLqyNZDSrv872UdJ4JgUOjXZyhlAIkVb0dBVj6crhw2OlFGJpCgbwjIVPAlxvs/tzpuXQscAKV6az5FdCUUQu/MWFbFYBBpSWoSzZAqRQYt1Ah/eXuvBGo4iMPPg2twlQtU4qoXqsbZhDW2rIwWLJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlWrQiJNHbF2c/V7W1Y/PwVQX9zTGvMRAzi5NNuMdZY=;
 b=hEE9JvZQ59BaA+77uggKSGl9laOAwwsjxsTLUkYMZfXNMXjmjnPYL3gYLUw0uzg70jQ+ygZkDUGIbx66Dtpx4XYusfiZjQVee1aCTC+eBU3J8LKKFAu4JMjH7UtB5AicqicvlTHZnqZak5ESKVf1Oz2OTUA7E+oqes7CBQmJ4DjG1d5haqJxg5U2AZCvoMHCf7LL7sFCNdX+DmMXB7hYfgLmJavklSiZE6+LMYTDSQu9x+TASymxu7/s3ByGXNMqr+FtBeTyM3yfiLdkkYtlKRFohgHarhf7kRDuW9sfJ2cYv4Z39FxN/yPIubfFK4juND0HdsU6Advt/eDoVeBQRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlWrQiJNHbF2c/V7W1Y/PwVQX9zTGvMRAzi5NNuMdZY=;
 b=F1U7KgXlFq2hM5DKSZ9HGtUEV/I2f4uBikM2Q3jMX2jiklvycGViRFOOOZoP1stHw6AuPh150NS2udDR20OxZyvXZ8eNQaXYo6VdQkGcXyx2ETvQv7B/L4oJUu/b/s6l/ViqikeTC7XLPDj+twMUz0OS2msYQJ+MBmoPhq6ork4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VI1PR08MB10276.eurprd08.prod.outlook.com (2603:10a6:800:1bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 10:12:16 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 10:12:16 +0000
Message-ID: <3678020c-8b67-4ad7-a859-59d301784883@arm.com>
Date: Fri, 30 May 2025 15:42:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gup: optimize longterm pin_user_pages() for large folio
To: lizhe.67@bytedance.com
Cc: akpm@linux-foundation.org, david@redhat.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 muchun.song@linux.dev, peterx@redhat.com, ryan.roberts@arm.com
References: <7684103b-8c06-4f6d-9e8c-da0267a83bf0@arm.com>
 <20250530100453.36028-1-lizhe.67@bytedance.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250530100453.36028-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VI1PR08MB10276:EE_|AM3PEPF00009B9C:EE_|PA4PR08MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4a9154-7b1b-4e36-0a25-08dd9f628737
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cjh4dWxSclp1dkJXeUV0RjNJY1poTGNMTUxFNEVtUXEyVHlvemVkelEwc0J2?=
 =?utf-8?B?endBVDZjYXlYa08wT1RGVlR0UFR2TElLMFNmcjJsZTQ4MTZZUHlvRUdzaG5H?=
 =?utf-8?B?bVFveCtFdlQ0QWhjUWhGT2wrOTVmZjdMdlJ2QTNrUkNaNFcyNW82dG9ENnVH?=
 =?utf-8?B?Wm9RY2plV09oeTVhV1hlVmhNNjcyTnRwYXMvQnQwd3Y0S3d5Q2JnUEpjYk5W?=
 =?utf-8?B?WkJYOTdwOUMxMFNuM0pPNk1RSHNkUmRBVm03S2pqaDgrdmJmTFBERUpzaXI3?=
 =?utf-8?B?TnVQaUxpcWYxb2ZCeWkwZ3hnd08ySDk5dGFSa3VCcGRZNG9UY3pPRkVWMGRG?=
 =?utf-8?B?QlQ4STF6SmFpZUtaQS9vZGM3RzdaZTN2d2V3MFJnL3pENXZCRnlOK1lMR0Q1?=
 =?utf-8?B?czROTTRyVW1Lb1BreEtzek95bXE1b3lvbkpjOTEyUFl4TEZkbFRpTlJRRHBN?=
 =?utf-8?B?YkRBSTVFbVhsK2twbHBqaWJBUHAwSGJ1MVVqekdxdGNySHg1NU9LaWhmMGRv?=
 =?utf-8?B?K05pT1JTRG51Mm1FUUsvbHFjOXlrcEFnak0yK2tRcFZxRGxJOEhpWkR1ODhp?=
 =?utf-8?B?TDdNTk1JWlJFaVRYQS9ZdGxoQ1hUdDFyZktBckFUejhMSTRpWVc4d29OUEdl?=
 =?utf-8?B?VWZBOWVYZ3JsN0VGK1RrWm5uYmVJMkxTVXgraWkyNkFpTlNxNG5mTDUwVmZ3?=
 =?utf-8?B?VzJ2MkRvUk91ZTdWWW92K1hRZ3Y5a2xHN1NRamJPc0g5YmNPN2plcFJTQWE4?=
 =?utf-8?B?Z2M3blBQSDQ3MkV2Mmk3UGdwdWFaQTZUSXRoT1NZNUo5U3l2S1JEbklkU0Ru?=
 =?utf-8?B?VXJqRVVDYjNnK2F0aDNDb3h1cVYyUnZkTjE0TGJxZDkzRy9UODAzbjZYNWFF?=
 =?utf-8?B?YVZ5bGdWcUxwOTVqWjk2ODVsbDJLcXdFci9sbklEVmd1TjNrRXZiNXpFcXYr?=
 =?utf-8?B?ejZQRDNOVmxDaWpwcVEyT245aHZTMEYwMHplcE04ZEhBRjhGYWFqSmNYMnJQ?=
 =?utf-8?B?WWlpR2hsREIwWHZPQ2RGd21ONXhSQVk2aHQrS1JiVFFGc3ZFZXNVODdLbTFy?=
 =?utf-8?B?VmE2Y2p1ZmVyajJhSVFtakRwOVFqOXpDblNpR2VHa0k5SXQ0WlhlRmZqMHJI?=
 =?utf-8?B?Q3llSXY3S0dDdkJxZ0EwTldUSVlGVy9hT1dZeGdSV1FaMzBjeXZ2M2FCd2JK?=
 =?utf-8?B?UGdFVjVmNm1GNlZvQVBHaGFYYzlKd2xacTJpZnhzNklsK2t5WjNRTk1QbjVE?=
 =?utf-8?B?aUtnaXFKdUxwdmZKcUozZnd0aFFmb0NTWU9EZDRUblFvemFDYm9TYjQ2MWt2?=
 =?utf-8?B?MWYxZ1VNenp3YmJaeTZuL0djL25HdGZidnBGVGNzWmVPS3JvdFROK2hPanpB?=
 =?utf-8?B?YWltSW5wYSsyeitxaEpsdWxYNThadkVQRWF1U29vQ25CbUMwdlVNNVZyTzVq?=
 =?utf-8?B?eFdCMmRSRC9ZRE9yL1dPODgzOXA4SjJYYVJQNjd4cnNYSHRLUFdEd213eVg2?=
 =?utf-8?B?d2FXb2pUSWhvcU81RGZHY2dTYTkvMW5HemdxZVFpVlJndG1ycFdXMWVUNlY4?=
 =?utf-8?B?VkNWeFREaEJMY3BNTFBiaW9LMFRnZDlnZUY2RS9ERExyYWZ2TEJDMGRBb1Bl?=
 =?utf-8?B?THl5MW5VODNJcWZYcWNla05VVWN3ODhlaEkrUGZQODNKTzhDYnhJcm43bG5Q?=
 =?utf-8?B?QkhGeGxTTWtYT2V1clBFbElnbWEzNWRVYW1nMWdSMkdobHJlMnFrQTQ4ekEx?=
 =?utf-8?B?cTVTMWF1cktWSkd5Sk1ud3VnYktKejBBdmc4Y0lTUFdiZVZQbkRGT3V4RkhJ?=
 =?utf-8?B?RnBoOWVTejlWR2xZNmd5NFlJR3FuajF2RlVpVUs1VFJPS3I4SlhCNEV3UGg2?=
 =?utf-8?B?T3RhZ09tYlBQMnI1K2FaNi84UUFCWmlTQWZ4TmhBL1RQb1lUUGgxUnhSMVh1?=
 =?utf-8?Q?NdteFnp3eL0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10276
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	216557f1-a2f6-4977-a248-08dd9f6273e8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|14060799003|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S29MdERYUWpXeXNYUTBHZkRGdDhkSlAwZWNHeThCalhsL3RxVHdTaGdGb1FU?=
 =?utf-8?B?U3U3c2pDcjhRVHpKaHU3SllCais2ODV6RkRTcS8ycVVYVjl0bXEzVTVSSUNk?=
 =?utf-8?B?K0U3dlY3aVh2WHFOTHNMZUxVcHRrdUgzajF4bGNERXE1OUU2WHEwQ1d5Ny93?=
 =?utf-8?B?TVUwVHNQYzZ5OWd2RHh2VldHTzkwaHJudW9PWlNRZ3RsVXpMdWV4NURETVZV?=
 =?utf-8?B?bWJmMmdDRjdpMDAxUSsrcklBU0trS0VHTkF4c3ZyNy9oWVF5ZUhndEU5aEJ0?=
 =?utf-8?B?NCtTY1E5UTJYdUpCaUdaRVVla1ZEaUlLSEZ5M0R0WEtyZ3ZTSlZnNnNEc2s4?=
 =?utf-8?B?WTdCaW9jeHlEcmtDVFB2T1YrbTRhc1B5U2Y5UTdSdnJsVlYzcUV6UEdZRXJo?=
 =?utf-8?B?OTZQTXNFbEVDTS9hd2NCeWFGanE2cC9LVmJNZGNpWEdZSHVnYkd2aUhkZkVh?=
 =?utf-8?B?N2RyNGsxRjhzclVTeHlMMm1oYVdMWUtZMXVTcDJqWktCSUIvSmtFSkF2RURI?=
 =?utf-8?B?dGRsckRRQ01HUURiWi8yMWxrbnNObHphellCYWcrdVJlcHcza0VHb3UxSGFU?=
 =?utf-8?B?dXFvcU1HTWNOU2tlWDM4amRaMVhabUgvOEladTlqYnBEcTJxMVQ3NjUwMmUw?=
 =?utf-8?B?Tm1rNHRvRlcrZngrQ2JidEVOaEdvYmR2cWlxTzNIeVZrQUNIVGc3NGpFWlRx?=
 =?utf-8?B?NmtOc0JRR21keG92MmQ2MmZVdUpJMmJ1UVF5UTNqaE9neTZVTzB4QStHSFdh?=
 =?utf-8?B?YzZRQ2E2NjVoSnhybzRkeDNyeVk4OVZORHlEQTBFZkxXZUM5M0FpVitZTjlh?=
 =?utf-8?B?djVNaEk0SzRvelVzS1ExdjlBdzNQV1FqcitIT0hRd24wdEovS3M2NmxpNExN?=
 =?utf-8?B?QnBkdTNKNXJ1SW5DUjVXeXo4NUZNNExvMWhmSXAvWWxXRkNzYzU4UTUyMXVR?=
 =?utf-8?B?YmtLYkZva0ZZYTVyZ0liQjBmbXJTR3lKa2hlaUF1Tk96dkNzczJVNXNlV0Jn?=
 =?utf-8?B?QnU2OUF6Q2MwR0JJanExUnlvMGFqL24xQW1NMzltQWo4djFVWlBoVW52Q2xp?=
 =?utf-8?B?VWJHaHFJWWFZMDA5RXdpTTZFbElCYXZwVS9TQURrbk5DWDNUVGZSdDJBTUJw?=
 =?utf-8?B?MEZzTzVDVHFaMk1vMjUyRi94YkpNWDBYclBDd3REOGFDOEx1UWFuaE1LNjg1?=
 =?utf-8?B?NkQ0Q1pkaHlOQUgxOEhGQWNmTVdpS0lzaHZTS2lkditoZ3NXRHQvTTd2c0Rz?=
 =?utf-8?B?aStha1M0VVRJZlV4WU9pbkthYU4rNllJM1hmVk53VVQ4MW1vVTZmRDhxekxP?=
 =?utf-8?B?aGVsMFdLdmNBcjFYM3hxRDcvZXFuT0Z2WTFKT0orMnp0TytpY0hjaVhBVVVp?=
 =?utf-8?B?ejNKVmsyYk05cERRUTZDUkxQTnI5QlVSUHJveGJERldjUFVNbHZlZnhYTlhX?=
 =?utf-8?B?c0NrcWpDYVo4K2IvUVdzNndOR1FLbkoxY3EzTExNWHZOSHdIZ0lUKzVlaDd0?=
 =?utf-8?B?NHREYS9WejZadmFEcGQzU3hQVWphaWJEeUl5Mkp4bmR0ckZ1NWJ6dVV2WFNN?=
 =?utf-8?B?MWd4dWJwT1VBVnhSNWZ6Wm10eC91V0JyVG9OV3k1cGdIS3hET3V6NCtGb2RJ?=
 =?utf-8?B?TEppeEV5U1JKZWhvOThINHZtTFVKT2VFY1dnY1B0enkrUWVVTEpJNDVTY3ov?=
 =?utf-8?B?YVRpUU9ReWkxNGJWMVhtbUZVTXAxSDQvdGRVYWxoYnFFTitGZU1uWUVQNitI?=
 =?utf-8?B?VElZZzJ2cjUwQWh3dzVncFFWcmRKK095UUx4TG5VWjhwNnRHUVlyb1l6RXhG?=
 =?utf-8?B?TzgwSjVHY3haZnZxRGZEL3FrSWgxaG9CMHBSL3RwUHFEVjFUWFdzNXNOaWoy?=
 =?utf-8?B?eWNBd2NKUkdiVjNIdnRLVUJaYWdyTS9YMEdpWVRudGFxUEM3aXU5VlRIUC9W?=
 =?utf-8?B?UGJERUhzRjRBZnBuTVJXY3BpYzdrbjVVMGNKaXBBWk9CVkNkblNYZUdPWXlR?=
 =?utf-8?B?bGFxd0xXWkcyWlFHT2I0UGdoZkNCU1dGZDVvaTdHdWN2TXB3ejBRMlBVNHdl?=
 =?utf-8?Q?PJy7EH?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(14060799003)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 10:12:47.9739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4a9154-7b1b-4e36-0a25-08dd9f628737
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6191


On 30/05/25 3:34 pm, lizhe.67@bytedance.com wrote:
> On Fri, 30 May 2025 15:23:49 +0530, dev.jain@arm.com wrote:
>
>> On 30/05/25 2:53 pm, lizhe.67@bytedance.com wrote:
>>> From: Li Zhe<lizhe.67@bytedance.com>
>>>
>>> In the current implementation of the longterm pin_user_pages() function,
>>> we invoke the collect_longterm_unpinnable_folios() function. This function
>>> iterates through the list to check whether each folio belongs to the
>>> "longterm_unpinnabled" category. The folios in this list essentially
>>> correspond to a contiguous region of user-space addresses, with each folio
>>> representing a physical address in increments of PAGESIZE. If this
>>> user-space address range is mapped with large folio, we can optimize the
>>> performance of function pin_user_pages() by reducing the number of if-else
>>> branches and the frequency of memory accesses using READ_ONCE. This patch
>>> leverages this approach to achieve performance improvements.
>>>
>>> The performance test results obtained through the gup_test tool from the
>>> kernel source tree are as follows. We achieve an improvement of over 75%
>>> for large folio with pagesize=2M. For normal page, we have only observed
>>> a very slight degradation in performance.
>>
>> Thanks for the patch! I have no idea on GUP but in my limited understanding
>> the patch looks fine, let's wait for more comments.
>>
>> [----]
>>
>>>    }
>>>    
>>> +static struct folio *pofs_next_folio(struct folio *folio,
>>> +				struct pages_or_folios *pofs, long *index_ptr)
>>> +{
>>> +	long i = *index_ptr + 1;
>>> +	unsigned long nr_pages = folio_nr_pages(folio);
>>> +
>>> +	if (!pofs->has_folios)
>>> +		while ((i < pofs->nr_entries) &&
>>> +			/* Is this page part of this folio? */
>>> +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
>>> +			i++;
>>> +
>>> +	if (unlikely(i == pofs->nr_entries))
>>> +		return NULL;
>>> +	*index_ptr = i;
>>> +
>>> +	return pofs_get_folio(pofs, i);
>>> +}
>>> +
>>>    /*
>>>     * Returns the number of collected folios. Return value is always >= 0.
>>>     */
>>> @@ -2324,16 +2343,12 @@ static void collect_longterm_unpinnable_folios(
>>>    		struct list_head *movable_folio_list,
>>>    		struct pages_or_folios *pofs)
>>>    {
>>> -	struct folio *prev_folio = NULL;
>>>    	bool drain_allow = true;
>>> -	unsigned long i;
>>> -
>>> -	for (i = 0; i < pofs->nr_entries; i++) {
>>> -		struct folio *folio = pofs_get_folio(pofs, i);
>>> +	long i = 0;
>>
>> Why not unsigned long?
> This is because I want to match the type of pages_or_folios->nr_entries.


Ah right, although I wonder why we are not using unsigned long in the first place...


>
> Thanks,
> Zhe

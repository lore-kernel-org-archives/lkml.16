Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B4101EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348773; cv=fail; b=MKroXebcjn6bhz+CE3EnY5/9CmqEPl5v8TpDe6b2LjgydLkf916FNgaKi/b93gX033RGUyoAwm+OYqGQs5nRA86vBaZ8iCIjHHLGBhooxuMSkPIoTncNMZzi/V32ZA2+Mu7XUL8GGtVsrOO9nA0lLT2BU6dslu8LTV0JyGyfmpk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348773; c=relaxed/simple;
	bh=jPjPVs4wUSR6o73HVhUAy8Ma9vBZffpWnsE6UqrIQbw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iCmbjg0UzK4QY7aN0aZgx4wGZKIMDAWniGiY61MbdS8A5Ic7WOB26Bo783Wbf+0yljAtsQoJFGWYZe1FffmL385s0gEXzXWhttniFmXUB+kjsusIqkOxB4tPGQTaIxmPFgaudjpgHZ4MLsWrPmzbdriLrGM6AafLQCi91qSxVpI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DA8XGcVS; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DA8XGcVS; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DA8XGcVS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DA8XGcVS"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UQQvtNslOsUejOuIxmN6IgEgNKz57jVzOP3TZ3OEeVqVO/JUhiHKZSSZ75pIKeWoMm0EbV5XuqoVPwStCrLzJ0jxTtCzohOnvv9e14ttfdZpW36EoapKKXEpQfeHenkRvqBM8E0E7OAMr0IfB7X6PqB9HBQiz46wmWvTAXgyRHhF5O5F9hpewGHdY/7BRYX48DhpErvyOzgrZHGzctCrBQ0N+5JHk0PSRe1bDpRNlmmrCqEVCpQ9Kv7JxtZvBtqKnbQLB5xLKum+rjAiX8GkL/PmXsjVHh4b5heFDEKhVUsAMWxMCiQavsz4LArda5QOz2Mp6dGEk7nz92o4b3ZqCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPjPVs4wUSR6o73HVhUAy8Ma9vBZffpWnsE6UqrIQbw=;
 b=vv1DDkJTVC7To9EbaBOGgvpZth9MiiPc8UOpKadUyeLtEJ5FjppPDNX2RZ8P4kAR2GImKkwjGwXXJul2b5r7wKRNRTGpcGCNdJVLL74Dh89VhDpwvkrq6krBZv0s97U9AUrt8qCEwTyeYbht0Xdp1O5SslzRiesF1Ip+daYLjoPw0oXLuaR+5b/YCUnMzM50n/KI3Az+hXekVDDRrnKv1jRBF//xKgCPCMbojEnd/UGILZTUkEgc6FqIeZeQl8UbMX2Im0YqB/5D1Yv/QVq6d5zsRg8ccn686czQl7+oCS4a0tB//p+aAjk+vIMKlesJyyhBww9hy1sFFbpWas109w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPjPVs4wUSR6o73HVhUAy8Ma9vBZffpWnsE6UqrIQbw=;
 b=DA8XGcVSm09lLPEJSX5zTJBeDXu6whK+KRXLltdy0ABKAGWxDDvGk1c9/0vliAchzjUh2uWPIC3lZKS5m7J61o8dhD6ynUP9RxXMFNrhHxD3nfk/QfU9+myhDAoxn7qt9ljsWZvVYka+soixiYxBkpMbH7TuIc3vmaq8D0KobX0=
Received: from DUZPR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::15) by AS1PR08MB7659.eurprd08.prod.outlook.com
 (2603:10a6:20b:47a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 05:46:04 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::4f) by DUZPR01CA0077.outlook.office365.com
 (2603:10a6:10:46a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 05:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 05:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU8cU9T9MMobUq2+4EL+xSa/z6zUJed4AYxEc7HsLJ/JCJvCOaI7bNStnBknDlVLtTFMs/lBv/CQj9zkqI8X3e3Qmwm33vacl/WCMt6mLxOhB1F9hxpsrvSJonA+pEvZZTFUoEfuxEc7f0AQyUlpSR9ipBXrZbQXDnGqph0ZOhIZzyD52f2aMgEmDWzhN6QIQ3F0Om3/uPLJnB++rNSv1DutB1gGmFyd4S+/y8O88qfuDQmlQEjELzXE564SQeKPsMPgu1ke1X8HTjLZ5OlHL3VUJVPMsQCTOsUG4KkQXnVEHh5NBG7aTKvlxFouvDTUtxbhOKSK0J8TwzYzk5JGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPjPVs4wUSR6o73HVhUAy8Ma9vBZffpWnsE6UqrIQbw=;
 b=a4t7gdv3YKGR44E+571aG1U144a3/IPiybpwtFqj7dEaU68RxWU81x9qJ0X3j+83YufaJKF2frxd8QKI4FGWhkvHS+N6OcaBrDDXV6LFKtxKUGPSqZHBMAoBHMhnFtK/s5rQ/wljzTdlCGEASziKOylfpx3JmgiAUi5CNdxRnvjg+c4HlNqmmRbmQYbZJj7WBCqvpp5m3v9mDSYALbCVg7bZttxK21C9tljCCgkOTvVZirnDfe9K1528C8ozdtPI+ZvFA6ziXuxyQKWHVT9hZAKEJdo+sAkYWznNcUdK8M84H14/MhwTc7eoUzmQtlm4MKHq5MukNII2MMODDjFSRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPjPVs4wUSR6o73HVhUAy8Ma9vBZffpWnsE6UqrIQbw=;
 b=DA8XGcVSm09lLPEJSX5zTJBeDXu6whK+KRXLltdy0ABKAGWxDDvGk1c9/0vliAchzjUh2uWPIC3lZKS5m7J61o8dhD6ynUP9RxXMFNrhHxD3nfk/QfU9+myhDAoxn7qt9ljsWZvVYka+soixiYxBkpMbH7TuIc3vmaq8D0KobX0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com (2603:10a6:20b:402::22)
 by AS8PR08MB7719.eurprd08.prod.outlook.com (2603:10a6:20b:524::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 05:45:30 +0000
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45]) by AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45%2]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:45:30 +0000
Message-ID: <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
Date: Tue, 1 Jul 2025 11:15:25 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To AS8PR08MB7111.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7111:EE_|AS8PR08MB7719:EE_|DB5PEPF00014B8E:EE_|AS1PR08MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: f5253cfb-27bb-4614-9fe7-08ddb86290cd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UktQVWpiM3Z4SFl3cjFTWlVraGs0TUVFWSt4M2JrVWxJREFnSkZwVU1XemlJ?=
 =?utf-8?B?THJCeG84eXRMVThtRXpGcXNHL0l3MVNXZnZaYUtkMjl2T0RmMUNkM2dHb2Q5?=
 =?utf-8?B?b04wN2Z4VFhvbU84bXZjOHoxRU9yZlRRa2F1NVovUnBQODJUZWNUUU1uY2ZL?=
 =?utf-8?B?T25zMk01MUV2Vyt5N3loQnpETFFucGZWaWduWGdaaVRnSFdPZWhSc2RFdDhR?=
 =?utf-8?B?cVVLdVNxV1lhZ3I1d0RvNVQ1WVQ4UmliRUNyK1llTlgzSXpqZmFwVGZNMVJE?=
 =?utf-8?B?em4vRTJsSXN1WS9GcnZLZ3lNQlkwMWV2Z0hjZzhTVW1EVXdmaXJtdmhCc1dp?=
 =?utf-8?B?OU9DUiszaEpaTVpKemFTNWdZMWRmQ296WVdneVk1T1lLd3FVQUsvTWp3Qm5L?=
 =?utf-8?B?dFdZaE1lUDFVMWhuc1RYOTRKU1Z1L21xUUs4WGwyWEthbmJXNU1xZDJHQlpn?=
 =?utf-8?B?Wi9TNjhkcCtEd0lvT3Y1eUxrWFBXbDVPT1pWNTcvdzRoVGFwSlQvMjBhclJh?=
 =?utf-8?B?SWZUdnhrL3pLRmxFQmZQOHI4OVViUDJLcG4yWHpJbmdBMEtjWHVIQ0pqanE1?=
 =?utf-8?B?elU0V0JXU0U4NVpGVGtpdFp2Rk53Qm9DS1k2ZGFzMEtNaFdoeENqTzFXZU92?=
 =?utf-8?B?MnlpQjFZTXVvVGlXRmJjb2c3UVVEZ0VRNEFjWkpQT2lKTUVUbng4SHZkSk0z?=
 =?utf-8?B?eFo1ZDMyZU1KcmJiNXFSQ1BqNUV4OXZUTXZXUC9nNXBuQ25mUTNLaDlQckRa?=
 =?utf-8?B?MmNNZVVRT21KSEVzVTh0eGMrcEx5bHc5MnJiYWVoOWNJdXM4ZWJUaXVNcFJt?=
 =?utf-8?B?bGlLVWNBNHQvZUlpdThrSnNBbjJuOFk4ekV6MUU0RUdtdS96T3MwdHJFWUFu?=
 =?utf-8?B?Q1ZUUXlsY25IMGJ6U3NlTlgxaXcyVjlIVlZZQXZtd1I5THE3TXdPTWhJenE5?=
 =?utf-8?B?VEg2cnRuNTRMSWdFWXg2NVhqZnNCTnNITUordjFvTCtPZWZBODgvc0o1bFF6?=
 =?utf-8?B?R1hZUWFnNzc5dzhNWjNTR241MXA5NmNPeEIrUGplSkFveEVEUldqQzZlUXF3?=
 =?utf-8?B?MStwNW14bDZ2NTN2bkhzOUczQ256TUdHL3htOVpRMncxbFk0b01pM1BhVFho?=
 =?utf-8?B?bzAxdTZZdk9iTERTbUwzM203KzJkYUpWRlFjb1JZemhkZHpWbTJqZDZkb2xC?=
 =?utf-8?B?cTJ3U1B5OTVPSHRPV0trck1CNVBkZHVsNjh4WHBQeHhkWHFRcUlFcVRqU2Mz?=
 =?utf-8?B?azJEYjJ4RW1qQUczczFPc240NUZjeHFCaW5ic0trS1VTZzZqRUtZaDVXNmd0?=
 =?utf-8?B?ZmtidldRRkxJaFlmMiszYUVQM0Ewd3NWclhqVVlRcEp1dlNVT3p6dFJXcURD?=
 =?utf-8?B?WlVFTmtlN2FaOG01RkxrVzhKUGJsVGF0NXYvSFBpZm1rT3dXcDRzME5Fbm12?=
 =?utf-8?B?b1ZtN1RBSGV5NGRrcy9RV2xZWHNZUFZtSFh0Vk5PM3c3Ymt4V0YvM2YwL3N3?=
 =?utf-8?B?UTR5cXJOZTkwa0JzQlVXb0lrTTZVS0dqZXZJU1VXRytJYXEvSDZsWHRYeHRG?=
 =?utf-8?B?THZZUjVWeU4xZkpyY1Y0T1ZXTGNWMERsb0VieURWMEpiWUQ5cmdGU1RsbEdy?=
 =?utf-8?B?R3RqWjcrbnVxamlPcUtVNjgwSzR0SytUY1lNajZVcHJCRmtydHNMOVR1MW8w?=
 =?utf-8?B?SjhuaEk3aVViTWgvNGgyUCtmQ2RtSUpMeUZrUWtydytDNktDTTJKKzA3TFF1?=
 =?utf-8?B?SFFwQWthbEpzSWI5QlBFcmdIUDE1d0FWbEdLNHdOWVU1M2c3ekV2cUoyTWRo?=
 =?utf-8?B?d2lnY2ZCei8xN0VBdHZueGh1Q2RaUExPc2RBTEw2MnFBRnBUV21VQUIwMkp0?=
 =?utf-8?B?UzNIRWhaM01lalMxTWwvQW9PTG9aSXhmUVM2S0hxL1V1UC9XVnlZNVkva0NH?=
 =?utf-8?Q?ado6VzC40kE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7111.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7719
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8de609ca-7dad-445e-9d4b-08ddb8627d0d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkcrR0VENDdxUzhsNjZNRURydHo1SzFNN2RPMm1PbzVoWk5sa0k5SGkyajl3?=
 =?utf-8?B?a1UwTW1GNDA4TmtURitQVGVxSHlkZjRJdDRGdnlScjBHdG10cUZYOGJZa0V3?=
 =?utf-8?B?RWVjMWFBRHRsRlF6YkEvTERyQ1dtbXRCODBlUzhZSnZYYTNxSGlyQUZBOVZz?=
 =?utf-8?B?bnkyTVdlQUV5T2NMd20xdlRmdXdtazF5Z2ZPZGMxL2tjMW41M0lQeEdqU09t?=
 =?utf-8?B?RFkxd0dWbWVINzFFMjF1Q1lkTzZpeHU1UzFWMHl1b0xaYmRabFBzLzk1SFFK?=
 =?utf-8?B?QjlOcmZsSUFKamtQMGExcVRrZHJnMUNpbk1lWGdkSDFQRW9IWHZLbjZBQzlx?=
 =?utf-8?B?VEllTWE5bUZDU0J0YjZYandxS3dNcWZ6Um41MndoQllSczZLZUhZUUpIV0RR?=
 =?utf-8?B?VGNtN2poRlJSWkJWTnRJZFVYeGNCbmpwNkhTbys4UVV1UytoRlZ3YWNtNTdu?=
 =?utf-8?B?dUVyQktmUkllV0hCanZMZ0E5VzU2WlN5Yi80bDhMSmh1bHhETXBrYmI0eU1F?=
 =?utf-8?B?NXp6YkdJTEVNNW90RjNtL1lKbm5yNC9kcmMxYkh6dHM2MTlKZHhJVzlYa21E?=
 =?utf-8?B?OUcveXB2d0hJbDdYbFJVT21MYkwzejhVVkNscVBMR3lCKzJpcDFnZjZaRFcx?=
 =?utf-8?B?WWR2NWMvaW1KbjljTzQwNmZtOE9FUUVEYWkxVXUrN2JxNjNZMlFNU2dQOG9H?=
 =?utf-8?B?aXd1dnR0Z2lGdW5sYmw1YUVCTFhSRGdrQzlUNm9OVXVPVW5VY0pUMHlQaDBu?=
 =?utf-8?B?YWdqZnpUdHdkMGVXT0VPVWdtb2dxMUNaRkkxdlZ4UkFoZE5ST1ZDRjdrbkFk?=
 =?utf-8?B?V2VNRE4xN1Q1TVJNUG5DMllIRCtUUE4wSFk4bEtCcW5pS0E5SlpOK1pUQno4?=
 =?utf-8?B?OFltNC9WVHRER0hIc2FlTS8vL2Q2WjBXRjRmV2pXMFNaR0Q1VjdFdXNFUTZV?=
 =?utf-8?B?a2FHWTF0anlpVTdOd0s3b2Y4U2lxOWNSU1FYYXIyS04zUkY0WThDc0NiWmdE?=
 =?utf-8?B?MHlNa3RwdkZtdWpNYkE4andNUHRyNjFSRW9zbVoyNmczVTlNeEZMVzNHdC9k?=
 =?utf-8?B?WEZzTGE3RlN3TEFleFU4TDgvVHpkV08rQzN4ZWsyaXcycDJhYUNMVnBsYW8r?=
 =?utf-8?B?UitZQ2prUjdUbjU2YkxxWjFpTWVXeUYyY1hCdFpSSGVhZFEzeW9kRzI2bWZ3?=
 =?utf-8?B?bXhRSmlKTkM1Q3pwdFhtVGNtdlRxMGIwWmpMRGtRSVNnbndRNFB3YXJnVnRU?=
 =?utf-8?B?dWtkL28zbUhGVFFpd3JQN1FJTXZXci8yNHB4a3cyTE9tV2lBY1VmSWFmaGtj?=
 =?utf-8?B?ZU81ZzUzSlBsQlgrYkovak1TUDE4MmtOeEF4SmsyN2YrZmRDbUpZRkNOeWRO?=
 =?utf-8?B?QzZPKzVQZFRoeXdvcWxhVXE2YXB2QWF5VEFZOVRuV29hMXlVY3oxMmI3b3FG?=
 =?utf-8?B?S0hmd3R2emZ5ZktzSW8wTjI0aGJIZStPQUhiWkdyUWdySDVvUlJ4UG9DMWlM?=
 =?utf-8?B?Nm5QMGM1Y3RoQmY1Tm9SWkFRYklQV2pjQmxTa2tIamNua1ZPbXFXMldmV2RT?=
 =?utf-8?B?VHFGdUJIazhMeTlCQjhrUHRRVzQ1SktLTFlVcWdPYjFacTQzbDMvYll0bEVm?=
 =?utf-8?B?b3lwK3kzUVRRNTVDZlZ4cGhrZldkTUNXc1Vxd0dvSWNIdDlRSy9yLzNrSklD?=
 =?utf-8?B?WXdOVGdSS3FIbHRxV3RwQkZXS2pxYzhET3VrRVVYVGUrWDF4bTZqQXZsVSs2?=
 =?utf-8?B?YXlOblRDS3FJalhld3dWbkNhcEsyTEtZRmRmRTMvUHoyUS9naGV5bnYra1Zk?=
 =?utf-8?B?VU4rOE5Mek93TFRuTHhkbUo0Yy83bjZHdjlEWElMRGgvRUxKbzVBaDZ4RzVX?=
 =?utf-8?B?aFE2V2kzOGNNM2IwWWJPM3gwK25oTXlwZGtwbHc2YnRTelNnWVlrbVYzdXVk?=
 =?utf-8?B?RUZYUXJqZnpBWmFkUEwxWmVRZGRFcHYrdVYwbGRqOGJrM1ZJdW5Ja0VtTUVa?=
 =?utf-8?B?Sm1CRUEyMlJFTTVTOUEyVG42LzlTdzMxQW96WlVUaWJlSWtVTFZzaTVZdnI0?=
 =?utf-8?Q?4L6tE7?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:46:03.1170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5253cfb-27bb-4614-9fe7-08ddb86290cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7659


On 01/07/25 10:58 am, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 10:53:09AM +0530, Dev Jain wrote:
>> On 30/06/25 4:24 pm, Lorenzo Stoakes wrote:
>>> +cc Vlastimil, please keep him cc'd on discussions here as the author of this
>>> fix in the conversation.
>>>
>>> On Mon, Jun 30, 2025 at 10:55:52AM +0530, Dev Jain wrote:
>>>> For this workload, do you enable mTHPs on your system? My plan is to make a
>>>> similar patch for
>>>>
>>>> the mTHP case and I'd be grateful if you can get me some results : )
>>> I'd urge caution here.
>>>
>>> The reason there was a big perf improvement is that, for certain workloads, the
>>> original patch by Rik caused issues with VMA fragmentation. So rather than
>>> getting adjacent VMAs that might later be khugepage'd, you'd get a bunch of VMAs
>>> that were auto-aligned and thus fragmented from one another.
>> How does getting two different adjacent VMAs allow them to be khugepage'd if
>> both are less than PMD size? khugepaged operates per vma, I'm missing something.
> (future) VMA merge
>
> Consider allocations that are >PMD but < 2*PMD for instance. Now you get
> fragmentation. For some workloads you would have previously eventually got PMD
> leaf mapping, PMD leaf mapping, PMD leaf mapping, etc. contiguouosly, with this
> arragenement you get PMD mapping, <bunch of PTE mappings>, PMD mapping, etc.

Sorry I am not following, don't know in detail about the VMA merge stuff.
Are you saying the after the patch, the VMAs will eventually get merged?
Is it possible in the kernel to get a merge in the "future"; as I understand
it only happens at mmap() time?

Suppose before the patch, you have two consecutive VMAs between (PMD, 2*PMD) size.
If they are able to get merged after the patch, why won't they be merged before the patch,
since the VMA characteristics are the same?


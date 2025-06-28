Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00EA13B5AE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751114441; cv=fail; b=kjJr6/cj6+uGpqbWc0FkIU08mVuTEq7MdvCA1dokD5daql4++HKc09hAE4xFewt3C89rViDOVsiy4++DH5K+o/z3kfLddED4wwXxLFqwaZjbXZVTZGkz2U5mdrL/T14QEsDQX7vwj0mnyjZBQA917h26gnCFCx7WqJC2LRsLXSs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751114441; c=relaxed/simple;
	bh=UEhgBPeHi79VjcmxBS2MGF79RPpi/F5HQcHKSBP3q7c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GACnU06lme0NzZCb7TrVLgsrfcFzE8OIJZnc7u0OL0UFfAm2ZXaAWSyVmKZzWMp2jmH7Uo4V1P9Yqa5sSQJ17ReZx/clZHYMzc8M/pGrIX+Huj1OUCRUdhZ6LHt/vBXUfZPc6Ohl7q37e+NARJO+XKKobsDJ3qx4exRqqDP5VqU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FSh/KcAD; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FSh/KcAD; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FSh/KcAD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FSh/KcAD"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IQbh3M0wl3xWYXqkxKeUmMQgNsTJK1MRGxrGyJRLH7jOoWdWWK9+XeFeCiBSDCVc7NX6C4g4aYFg93vDYx378S2Cg0aFSU1R1l4KVe81SzRZOITUPv857cjSaX1yQsXGrfsjI+g0u9j5aZyvNtvF5kPjwW+EW6PPMgibFFuuLY9OZaRKD3DRmlYsmf53jVic4Ac2bTp5TaRmko8d6Nsm+tokY6bTNNZYtepitoMmKWIkUmVLBWlT+kFDdfe5QLc/19Lm5eJH/JXnRlCENDvFRYqH49AalAGQOnBTxOENhGAxonc30biaNr9HQzRMYrmSzLbXBUlQ5XmvseEUev/fFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAjMm5/Xd7xgEjsvzSwEdiwh3lMcO0utv6gSUC8lsj8=;
 b=J+1jTLf5+f8nn8V3F+SjA7PQ6+XJ4BFRj9wAYPCaKkSZwmWR72R90/TDTH4E9K3PWMpCh3BwBQ9HJF6/wOiGw+xOEsCWxHJU3dMJHtm01C8ZToGJHQCbSOJJ5xsYngBG86TLT4ACKd1y3iB64Yso2USsK3rD31og9q68AkcnqYJpMXCxC/VQvv+hv9t0Dg5UM9ugdbkhOVQWu1P4Cnvg0MzaNixkoS+rXD2+mJqMTTH3LunpQ2ejg5OBT5+Q320LmA0IZhL6eCiRmrmgsYPJxpe5mvelvNVS5N44UE+w4FbjtB4nQPxovCYT50xaKx1IcqkeoCzLKM88LPJqFn78mQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAjMm5/Xd7xgEjsvzSwEdiwh3lMcO0utv6gSUC8lsj8=;
 b=FSh/KcADoRF/eQM4HHZoqB+Y+q35/X8SAefsW1trHw/iTGJjzEa5yizMbu5pDc1m7qDtZ3kxwcszhv7R+AXminEdrsF+WvbHu4x3gJtq2PycSjRzEFQrYUlTxMURnw5ysVK0lMZCVKbY9DOm8daTgSV4ixTibWcHLFaRnf2Q0zs=
Received: from CWLP265CA0518.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::6)
 by VE1PR08MB5711.eurprd08.prod.outlook.com (2603:10a6:800:1ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Sat, 28 Jun
 2025 12:40:31 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::42) by CWLP265CA0518.outlook.office365.com
 (2603:10a6:400:18c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Sat,
 28 Jun 2025 12:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Sat, 28 Jun 2025 12:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnyJZq7phi3R9ZxagmMsbWKTwp4P6ojuGAAjAhKQE4/pmlBoeCumF/WfOu8wlgKJZz1aPOiq65B6NmD0I9fgxUN98SOGzlk6xlhmQncjkirl61qn7HxE+R++WC8iy1kxS+KzKqu9QGsnEj6eSWeUGcOnPkipR9e3ttFOEA9W5QUBCnHvhIhT6kmHgTotOYuLr0NxHR9INOZ/wc4mC1xo2hdHfQ1qd6nvfI1tfYXIPLJmfzRi0CjYmzK8fCPnVP1evXBlFkxxiEKTdglbSwxSjlnrMap0I6gCb2htpRcYUKeQOBEGbXECjv4nY2dJ43ftzBk0DZ+4MK0yWEZdcziXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAjMm5/Xd7xgEjsvzSwEdiwh3lMcO0utv6gSUC8lsj8=;
 b=FwRHMa98aKjpjeZzmpGKaskG7zPLKq39rOCC/mbAVXPh2evfFrOzqBsNU6NqVhDuQxovlYbkLEWNx2M8CrL5+iQbF9h/T38VwB8QiuP0SsobklgmWrYj+DroPog1MsvblEeNs6s/5SyOq6eVjwk0BPASdlJZV0Bnc9uFfS/KG/g14LsUjzdPYT4J2IMiLqE/MdVKlPWjkY+BRXvSUSYiX3ZRBT2CnEYk203+qazRRzUYfbWiykH8K3oNfP2sOgvqStk4SGtegmMgSaPU0yUAK7EWbNjYJIqP4BMWOUdMyxmZ7lJJ4FWP9i2Fm9Piasy1++oBPzKfO2mrL/+ijgJUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAjMm5/Xd7xgEjsvzSwEdiwh3lMcO0utv6gSUC8lsj8=;
 b=FSh/KcADoRF/eQM4HHZoqB+Y+q35/X8SAefsW1trHw/iTGJjzEa5yizMbu5pDc1m7qDtZ3kxwcszhv7R+AXminEdrsF+WvbHu4x3gJtq2PycSjRzEFQrYUlTxMURnw5ysVK0lMZCVKbY9DOm8daTgSV4ixTibWcHLFaRnf2Q0zs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Sat, 28 Jun
 2025 12:39:55 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 12:39:54 +0000
Message-ID: <d968a24c-7e2c-40ca-a290-00b68222ac1c@arm.com>
Date: Sat, 28 Jun 2025 18:09:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250628113435.46678-4-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VI1PR08MB5360:EE_|AMS0EPF000001AB:EE_|VE1PR08MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 104f4e1f-3e9e-43cb-b6c9-08ddb640f734
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TjlSamJQaFNicDhiVzU4bjcrbzFIbEdEVGJFbmMzQ3llTmh1L1BUL1Z2SXJ0?=
 =?utf-8?B?UWdDWEl4blVqV0dNVTVTNmlPS1UySjA2V3c4WmdWcStsSHcrM0pSc09KUjJq?=
 =?utf-8?B?N2tUZHRXM3ZPdGd2NWtkZXlQZm9LL2U4QjZ4TjI3cXI5d3FiWitueHZvMWpK?=
 =?utf-8?B?N0ErLzRXdmFkY1dHWUE4OW9ZeGJtYVJIYWE5bllSd3ZaamNJVGlqTVd2RUhr?=
 =?utf-8?B?aGhyTThxNU9Sekg2RjJNR0I2VlVZSUhXN3A2aWZzL200SFhTbm9Odk1SUzBE?=
 =?utf-8?B?MzdZNjNNUUpxN3VrY01DWTkyTWdSU21GVGh0alR6YWZ6SXBrNFpVR0ZtaTRU?=
 =?utf-8?B?ZlZZZWRCR0sxVGU1SC9nNnlHcHBXYTAxclRhUnVxWUNlRnFlclcrS2pKdlVD?=
 =?utf-8?B?MWxTQmxPYThXeDF1VlU3U2t3d2lVb0FEcGpJdTF5R1R0K2swbVp1R29IYTQr?=
 =?utf-8?B?SmJrWEN0bHR3clNEdmo1MzBGeEF1SjFJeTlKRVF1aHNpN1pueGhXOG5pT3Zz?=
 =?utf-8?B?eE56cml5WlRBcGV0S1dQeTJmUXloNzd6TEw1amhVa1dhTkc4VzU5WURzZ01m?=
 =?utf-8?B?MEN4MUNUdU9wWUJRdmYwcEtXQTB0ZldLTjE5eDNpMW9ld281Vjd2K09tbWVF?=
 =?utf-8?B?NFQxQVhTSGRNMUsvT3pwdkFPQ0t4eGN0Vjl0SGRHTkxubUJzOVUvS3JTdmE4?=
 =?utf-8?B?MHl4b1dRSENiaEY4WkR0cHFodnY4ckU4OGNyTkxWZ2xYK0pXeFJSTWxiaWtl?=
 =?utf-8?B?UE1PREdWOWpNQWRvSk8ySG44dmFla21BZ2NVMDJ1b2pHaVgxc2d5enNJT0NR?=
 =?utf-8?B?WmpCYTIyZ1F3dkpyQW9yMU9QeENQUWx2WEFzWWFiWjV4RUliRUcvNXB0My9i?=
 =?utf-8?B?MndTZ1FKSS95QjdVWVJaSTlyRkZ5QUNTS2tzdUhySk5RV1Q5eXVQN254cTk0?=
 =?utf-8?B?aEhjNzNMVmlUTkRyczA3T1czOFM4OWt2ZGtWMHRBR0VrWkhxNFcyMmFORVBP?=
 =?utf-8?B?TzEwRzdCU2ZSeS8zazZaTHZLcThZVE9xcENSWjN0K3FHN1BVc25LQVhBcHJT?=
 =?utf-8?B?eWFEZEk1cFBLRm0ybEZCNUNGeG5Eellsc1JQNWZDREZVamRoNEVScHROVDBR?=
 =?utf-8?B?ODV5M1AwWmdRbk1BTVFPV29jWDZLQzNNR1BRRExnRXBWMVBRUzBuWS9FSmM1?=
 =?utf-8?B?dnpoOWF5bEVUZmxmem9zNHgvRU01OW5HMDRLdWNMNFlSbi9Idk1UOG5udlI1?=
 =?utf-8?B?ekk2SXFqaU94eGZibWlvN01DZG83OVRzdTBxWVpXcmNad0h5RHFQZzMxQ0Jm?=
 =?utf-8?B?MVg0SEpmMVcxdVF4dExaY3FVd1U0K2JoR3FsU0FqTG1IWEFkMEF1OUdlZGtR?=
 =?utf-8?B?YmxOdmwvYWgxUGJNMXByU3ZnUlp6a1NkSkdiTHcvRHp4WHg2NFlWQ3U4c1RP?=
 =?utf-8?B?b3dPeHFGZStxNlNGd1pPQ20yMFhWZzdtaE5ibFd2WjVZWWM5b2ltdCs2ZjJj?=
 =?utf-8?B?Z1g2ZGxNQ1ZkSWR2TTZnbHZSNjg4Y1NieEI1dWlmeHZ4ck5RbzNLaUl1bms4?=
 =?utf-8?B?d1FXNmlkWE40c2hyTG5sVTdWR1czU2RySXhydUFtNFlzVFBJQThTaUFodDlG?=
 =?utf-8?B?UGw0R1ZBakFjWTBiZ2xHbjFIMTBELzdodkhKUnJxbGsvb0djYmJaMFNFQTRK?=
 =?utf-8?B?QzJaNzExOWZlRGk0dER0eGtoN2FSTWFMWW9mZFd2UU5kUk9YYnJyVTZjNUlW?=
 =?utf-8?B?U1dldDU0R0tpMUdQem9kRDI0dENmV1NsaEZtTUQ2TXVsTzZ5QVR4MGkrb3FG?=
 =?utf-8?B?ZEhDeXlQS3ZMTUNhdlJXSzBLdU9INGJ6NDk5UVA2Yzl6Qi9PVVR3SUZodHJm?=
 =?utf-8?B?VHpocWdQVHpwSm9pSzZlSzNTa2JPV1Q4M3c1ZCtZcmFsK3dhZWlZWmlUWjBy?=
 =?utf-8?Q?9myCfwnOI1c=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94abfee8-cef1-4a96-8bac-08ddb640e239
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|35042699022|1800799024|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0tTR1VuOUtseStSa0VPaCtVZU1iZDFVTk9pUmlob3RyWTJ4UVU4WUdSbElr?=
 =?utf-8?B?NFJQTSt1MnRIYk5GbEorMCtmR29oUXZMK2VVZ1NLN05SRGgvWUtZZGQ0Z0ly?=
 =?utf-8?B?NWJRQWM0aE42ck9SdWJOWFBWK1NTd2oyYng5TmVhN3B1NWFwRHJRanFqY2lG?=
 =?utf-8?B?YytjbUt5cmEzaFY5RDVTem1IcEJkNjl3MStZMHF5d042VWM1Y0RJQnJHRVdV?=
 =?utf-8?B?eVFZY29FalJzajFKS1VQeVBTZSs0QUhIa2xObkxXeldPbjBhT3RCa0lvaCtB?=
 =?utf-8?B?NWhWOXFPL2RkemlCWXI2d2lkMDRrU0FLeGtYYXlXQmI1NnByREpaSXdlb3Ju?=
 =?utf-8?B?eWJCWk1vT2FqSXRMYXhnWUtTK0dOdkRsRnIxRWNoVGQwZExacUhRcXhOWnRh?=
 =?utf-8?B?T3laekZDUzlSV2J1SkpzRE5PQzFDSnFFNjBEWVFOK0lobGRyMTUwSXZoL1V5?=
 =?utf-8?B?bWhMZmEvTjcvK0dDZ2lpUENXNEFNLzkySjZtM0ExeHZGZUZSZnBNRjBuamdF?=
 =?utf-8?B?VjVxb3ZWYnpYcHR3cHo0QnJsU2VicTdCR2Z2VUhnMzBPNEk5eTd2TTRxeUZR?=
 =?utf-8?B?dTFCRjRVMkFyV0diWkFneWZYUk5Ga004TVI0cEUvdHZuK28wVXpJRlBIcnVS?=
 =?utf-8?B?bHVyNi80UnMxeXhIRGJaVndxRU9HMmJKNDVIQmZvakJWYzVseE5IWlU1bkQ1?=
 =?utf-8?B?bmRIZFdHekwvaWNjQjl4SzM1NFV2K2k4UGxYWmozYVBtVHB4UDhqekZnbzJU?=
 =?utf-8?B?NHlHa05kZ3ozdngwTUFudEg4UTJvNEMxWGM3MVNBd1ZVOUpGOGliaytxd1Bw?=
 =?utf-8?B?NEFZUUgzdmt1c2xLclJYUm1FNi9Jdk9uc2VLdjYxNVkxS0V2dVhtOTE5ZlJa?=
 =?utf-8?B?UGh4aHNqM1JZM1c0WjlwVk83dUh6QXdXcWJodUdZd096V2ZTYU4rZjRvTVhO?=
 =?utf-8?B?OFh3bVBJN04rcExzM0JBSXpreTMzZHYyc3JMUThvdWNCSHA0RHQ5d0tVdUkr?=
 =?utf-8?B?bDRQRG9IQlgxYks2aWk2NDRwd2E0QnhqRWVoRFFoY1ZibzlUMEFhUXFRUjBj?=
 =?utf-8?B?ckROTGNhK0x3VHZOVm9PTHYwZzAxcTFkVENBYnZXVTIrSmhyRHVqWkR0Wmpz?=
 =?utf-8?B?U1JLTm1NZks0bTZNQS9IL0pWSTFKbjVoRUU1Zm5PZmxMa1RKcjhleVl0ZjQ0?=
 =?utf-8?B?WkxaM3VWTWNzcHFZZDdnbTJORFVDd01yV2pkbFJjem5qWjR6K256U0p3TDJV?=
 =?utf-8?B?RXp4U3llQUluWlJuN2NSTUVNdmxYZXA3MkdrQkxhK3pFWVFYM29DVlhzdVli?=
 =?utf-8?B?WXBqRkRPTmhlcDJvdzRlSTl6MGMwTGd5bEVEcXBKTk9vcFFFNTNkOGZKTjdG?=
 =?utf-8?B?ekRxNnRZYlljcXYrQTZ1VVQxY0gwbGJtaE1zWmFkbkZnZERLbEFOd0Q5UDV1?=
 =?utf-8?B?VjV5TllUNjBKVmZVaGd1OGRGL0hKM3Bvb0IreFd5a2hzY1A4WWFaOFRBYUFh?=
 =?utf-8?B?cUVaa05paXFvVDVobjBFR0QrQ28rZ1pVcVVmVEgrajd3YVR1aWhvdm5NMzZ5?=
 =?utf-8?B?MnNvQ0w3U3owOXVEeUdTM2pBcnJtWmIxbnJnTVlseFNFV3huajIzeUsyb0tQ?=
 =?utf-8?B?TWxFVGhHcnB6Wk02QlN0Tm1lY2d6Sk1jMGYrV2k1bHJLdWg5WDNoU0h0Vnd5?=
 =?utf-8?B?Q1FtMVA0SFQwRXhiMHlBeEtMQm1NQzRBKzUyNS9FMmU5a3pHb0pCODN1SVhU?=
 =?utf-8?B?eHR6UXRpQ1RzTEI1bGJESXU5Ujd3eHdYbVJNT2FSeVpUbHg3TEY2ajdpa1VY?=
 =?utf-8?B?dkhWYzFGNUpuNWhQVkc4NCtRS0h0Z3Vac1JjZ3VxWUR3UHQyR2V6cSs1SE14?=
 =?utf-8?B?cXl3TS9zQitqbE9ORnE4QTJYL0pxVzBCMFNXMnVnUHFXUXE4WXEyOXFyN0hX?=
 =?utf-8?B?WmJqVG9DN01Zd1d3NGk2VWNyaWNacXVZeU1TZ3RhZW5Oc0xNMmlsRFMyVUhy?=
 =?utf-8?B?OVpLYU9tdnJ0czE4ZTJzNk54U3FpdFo3NldNc0ttbEwyMUEvTjQyNFJrZk1t?=
 =?utf-8?Q?fYtEHg?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(35042699022)(1800799024)(376014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 12:40:29.7126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104f4e1f-3e9e-43cb-b6c9-08ddb640f734
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5711


On 28/06/25 5:04 pm, Dev Jain wrote:
> Use folio_pte_batch to batch process a large folio. Reuse the folio from
> prot_numa case if possible.
>
> For all cases other than the PageAnonExclusive case, if the case holds true
> for one pte in the batch, one can confirm that that case will hold true for
> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
> and access bits across the batch, therefore batching across
> pte_dirty(): this is correct since the dirty bit on the PTE really is
> just an indication that the folio got written to, so even if the PTE is
> not actually dirty (but one of the PTEs in the batch is), the wp-fault
> optimization can be made.
>
> The crux now is how to batch around the PageAnonExclusive case; we must
> check the corresponding condition for every single page. Therefore, from
> the large folio batch, we process sub batches of ptes mapping pages with
> the same PageAnonExclusive condition, and process that sub batch, then
> determine and process the next sub batch, and so on. Note that this does
> not cause any extra overhead; if suppose the size of the folio batch
> is 512, then the sub batch processing in total will take 512 iterations,
> which is the same as what we would have done before.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   

Forgot to add:

Co-developed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

as this patch is almost identical to the diff Ryan had suggested.


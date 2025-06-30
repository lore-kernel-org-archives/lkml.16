Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654341E7C34
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271187; cv=fail; b=s6yC49h6Tsh28V+KRNTZ4U5B8cEWf0XKYyjdXzZPD5pGq1ZmXSeZelpUBfcWzKjc6Ah0Hw5IHcPr4vh/Hifq5HBVcQtv/NL5DujAkPr8lwP6nGZuywfoEtJXmsNKmoZCRBR23mXD4yEhVKIyCtaIpOXJOoRXr1BLu7HJyOc1674=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271187; c=relaxed/simple;
	bh=zW8fCYCFEOvSCLfvVp9+WKfj75FgwlBxDlN8B38SUFs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nQDNCAz4h/QGMqZ/nyGn3QtWM0wtIO9O5g3q/9oazTJY7ggJ62G1PtqAG+9qCuiJaN2Coj2OqN7/aXY8c5NaBPkc35QdSU2Vl1L0I0i1aGE/hi5eNFxNJP0rWAac1geUdmEb+LPGYMGkjkeMnb82lMhDPDdCLEyeGoPHq7wzTHI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l5bkInC1; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l5bkInC1; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l5bkInC1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l5bkInC1"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mV43UB6xTwgOWmOBDZc66Gm2Yqiz2DmevSwBG6YTRQAHPWNttnE3vFZpBQKX382GKLnuBY9wlWRJxOqFuJ7846VUs3vlbgyu9XryBRJVQ34+tBX+eiOqZqz8V88DNAfQAPsC52hBtF+WBdheAJZTfEH/bxpp/7ZZElKWOcYaX8EDuyYdVLCloHXXfLeCauLNOCJqRmUldV1fiOhZ3sZsbl+7L5leSGCEzca8eobQxterzx6bJf2z1vsNkgXepoBklW6Zy7FMNSdlQCiFc9EKxU9jfvvm1m5qhY2tBAm8ntZTVGO03x0tWyvcAXAQ534FTctOp/RmLOWDwECnOLGANw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r1sjBbf/v08BNJoNFOSfMCetAVcrPPKB07810CyK6A=;
 b=oDqXqLuH76MJk9YknW7KxJyZUzRkBljV/DROYJo9o2TuD6Cf24Jk3p0wC33myuks1hofyVMza/aef3TaO2MH65Ti14WkGiBPGlrVmOyhz6H+ntnIb9CBlTH3nuYMd+zabaQhtTKBmbUiWnwRYv5+DZh9kzEHAJquI0n1I/vBIo9hw8QTHBzT8JB5a+W8gck1OUEggt7fFgvZwhmh1wgtargBA/wFRffdt8u1nD6luVufmVKf0weL0dAH1iwqhQBdNFmUZjRSNsHbkjO7Wbf3fCMhpJuixJeKrxFAeI5aE9cttVmT4a+HqJbg4Igd/f/mJY7+OgTXU8b8TN948rwyAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r1sjBbf/v08BNJoNFOSfMCetAVcrPPKB07810CyK6A=;
 b=l5bkInC1peeI71UXlJzCu0FZ/phfDlhY+WhQgtjrS6m+j3VonKBIscMwdtO/5kFD+N+oAhz41na5UPTfDgeLQ4UNEmKsmJJAkBRY000YrM5jOF4tH5N6qlBu6n2mFGGzLEosRIS7zFE9Agco98VMWCSk4htWOxZWyy6OIk07kp0=
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by AS8PR08MB8828.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 08:13:00 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::66) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 08:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 08:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihvgsoKOcAWmzB7d+LVZ9vj70F5SGl+yUTqXfaKa865165M6awbjTaG5gdZ+E9PBdYEikyAGXhK1rMiXBHfnHUgSy3K/jMoH1T+wtgbj+ylUfncffbP3oneZ6SF4YeFO803f9kenMG5r+YB3KfIbdA5I8xaYyzcNmZDEXrMEAQec7NP/pnoSLgdxdtSivmLiz3lvNZtTnxGHWUnXD7EKZxlaUHRS08l2tPab8JnmC2XjuI8Siape3ohQppv5sMyRDhjJXN/4oWpBaYKtBzyc7lilmoLNmaOqV0SwZMzLld99efNJVdfj7VqHhl6L+FqAiyUqbi4yF0cRsa1pqB/3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r1sjBbf/v08BNJoNFOSfMCetAVcrPPKB07810CyK6A=;
 b=J/rk1Q/B7Xt7u3ZuUdtHHzmOZSqEpWCxSI+Pt0tYs2wfRrp5QwY7V2BPn5uwOc1fw3K7Ub5nggW7sgD0eD2TFuzwDfUp5YV+C7xDybdIAleDM1vDAGBeu4lfvWBKeS7ZWbuBGIGmB96Tgm1jdqoDnJTVGzLHZVk/zkF8FP55SMsYpk6LapI5YmZXPjwJEIzrKrAOpDIVUCNWz79VG7/stCrT/enCcTPAbOK10voPOQEkyiSq2UYz3grI8j9ZxWe1fURu0oNzmNL3/+/uY8TxkE706MKzl7CBt0SErnhLdogZibDftV/XuOh0RWNV4FK7oC35few3+OcIXTUUqiRbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r1sjBbf/v08BNJoNFOSfMCetAVcrPPKB07810CyK6A=;
 b=l5bkInC1peeI71UXlJzCu0FZ/phfDlhY+WhQgtjrS6m+j3VonKBIscMwdtO/5kFD+N+oAhz41na5UPTfDgeLQ4UNEmKsmJJAkBRY000YrM5jOF4tH5N6qlBu6n2mFGGzLEosRIS7zFE9Agco98VMWCSk4htWOxZWyy6OIk07kp0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB8825.eurprd08.prod.outlook.com (2603:10a6:20b:5bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 08:12:26 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:12:26 +0000
Message-ID: <28bc843d-615f-4848-988b-31a0a2921d14@arm.com>
Date: Mon, 30 Jun 2025 13:42:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org,
 david@redhat.com
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
 <786c83e0-d69f-4fa3-a39c-94c4dfc08a20@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <786c83e0-d69f-4fa3-a39c-94c4dfc08a20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB8825:EE_|DU2PEPF00028CFC:EE_|AS8PR08MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ed74c3-9841-4a06-3789-08ddb7aded85
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WHFraVFYUmQ3Yy9LbVpOTkswbGJiMUJLZnFLeXJXRkFqVy9iaHNSaUZGMk9r?=
 =?utf-8?B?a3hoUkNLUExnazFkUzIwcWVQLzFjeUN0ZXh2dTVjaFB6Z2I5Q05GdHowcFFO?=
 =?utf-8?B?Vk1OdVlnRit2OUJMWDJBM2hBVjVQd0JDbTgrd3B6bmRBcE9HNnJzaTY2K2F5?=
 =?utf-8?B?TEpNZVVERWNBOVl5ZXIrTHlYUFp5RHp3QkZKK0ErWXI1a2Q0WUdmVDBVK2g0?=
 =?utf-8?B?d3NkUm1EZ29hQXNOK3I4WGJ3MFBURkZKWjM0TE1aa21STFRuQ2E1dE1NN3h1?=
 =?utf-8?B?K2NQc2JOY0VqN1FsMmhLWEJ6RWV2YXdrN0ZCcjBRRTFGNDlhU1p0eVV4bURP?=
 =?utf-8?B?Zko2Y2gzdFlhYVNYbWY1dnZKdGV4cHRldDJBVEpVYXZ1azVzWXViQ3NCOTVB?=
 =?utf-8?B?dlF5S0JFS2F2QXc4RzFhZ2F3K0lFQjBrbE5Ud0RlcVB2bXFNRStTRkZSZUVD?=
 =?utf-8?B?RSsyUjcyY3hSTm1RYjA3S2swaU5TUE9QWFpXeHNJNUVzY1JHbTdsQm1MSFlk?=
 =?utf-8?B?TXBUdHBxYit6RzV3QnFtbEhPN3RJN09SYzhlV3lQWFRiN205Y2gvOXZDaTkz?=
 =?utf-8?B?cFBDd2YzZ1dQcUMwb1A0WDZ4Y001WGZFd05QSVM0NUcwaTFoL1V6SHBxeHFo?=
 =?utf-8?B?OGcwc01TSGkyMUNnVlU1VE40dCs3ekRKNGdyNWxKREQxMzZrVUVJMWcweE5N?=
 =?utf-8?B?VTd2RDBYTkpBdU9WQlh1T0g3c1Bpcnc1YVFDQzBjRFh4aDdQQW8wbDkrNlZS?=
 =?utf-8?B?ZDR5YWo0SzA1YVRpTjUwclZNN0RhOE80RWtoRlQ5bk11R2lBMlk2eDVsQlVn?=
 =?utf-8?B?US9LaHNFak8yYWRpY2M5TEttUGcyck1FcGx2VHM5MkFNc2pBVjFKeEVPY0t3?=
 =?utf-8?B?eEVLT1NmY1BBVzBwQ0lLZU1GK3RJbWprL3ZYaTlnRUFkdjRLa0tjb0hQaDhy?=
 =?utf-8?B?V0ZVN3JGTCs4T1NYTkYzRlRROEYybHlSOVRDOGl1UmZSRGpnSWduU1BuQ2w4?=
 =?utf-8?B?SitTYlBoL29LN3NaVGNEcE5hZ2ZsazVsVHVhQk04dWNvWGc5QnVVWERJYzB4?=
 =?utf-8?B?SFB5ZzZYV3liNlNkM0JMUnV3UkpVNFVIcm16MTJFNDBDd0RZRW1lVThYeWRE?=
 =?utf-8?B?cno3SDZLRG5CYTVhSXZPUVRaNTNodTUrQTdESHY3aGVaRWs2L2NrbDhFbHFj?=
 =?utf-8?B?ZHFieFlhUEY2aFlacnB3d3dpV2lYZmduU245SDV3cU1xS3JwK2lOU3hGR0JB?=
 =?utf-8?B?aGFDUWVseXRGaWxaVzlDalFsM0ZmdzJqUmpReWFibERFaldDQ05EUERiT0g3?=
 =?utf-8?B?RDUyOThlVitwL1BTYWxsbTltWVN4cXpxUU16THpjQmhxcWZtTjAyV1dnelJG?=
 =?utf-8?B?aHVlczU1U00vdGlaOU1IZ3UwVkdKVTdZb29ac1hyUzNIOTIvcERyS05iYUkx?=
 =?utf-8?B?eFBWTnFkTTZEcGNvS05NL2VRTERCRTM5clZQL2JENUE0ZEJrSGNoVXNVZkhG?=
 =?utf-8?B?N2srdnY4Zjhlb0xaZEdNMXVFbmJvREJYb2hac3FHejJkVXN2ZEJ5Z216bms3?=
 =?utf-8?B?bFd0dkRvbmlkcmZNTmFKT0xVTWJJcS9KK2ROSEwxcEdUZkRsdUw2eWVFMWJ0?=
 =?utf-8?B?Rll6a0VyaEZCNlVFOTVHMTcvRk1tLytMUGRWcFluSlgzUlBnVHdvM1JYWStU?=
 =?utf-8?B?UzRjOHB5M0ZMNUJDYWVGMkNZekdWSlp2SUZIbEprU01FcSsvcjBkdGovK1BP?=
 =?utf-8?B?WWhUN3ZkT1ZybWIxRXBWcHdvNUdFVk80d2pLL01JZUxsaHRJVmJKKzRtK1Zl?=
 =?utf-8?B?bWxtM0xQMTcyVVB5d3RTMUJwS3MzSExKNmNhbGtBcUk2WG5xNlQydHRsR3kv?=
 =?utf-8?B?TkJsKzdTT1JvSEhXRmxTSkRPU04wTTVGR0tneFlxUWlJN08ydFZJalh5N2Vm?=
 =?utf-8?Q?FGIwJKX1kMU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8825
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46ed76ee-6dfe-4f1b-8ed1-08ddb7add903
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1VRN0NVREI3K0ExbmxmWlNmRTIvdWs0U0tvSTVhd2tqelFVMis2VXg5OWhr?=
 =?utf-8?B?b2hQdkc0R3JHbkVlYWcyYTRLcEVGVllZdUdvenZXcllzUFRSdURUUk4yeGhp?=
 =?utf-8?B?UlU4QnByb1ZmbER6Z2dQUmtoTEdONnl2RGtyd1hjTWJ6R0tIRnM2di9XL2V3?=
 =?utf-8?B?QnVKaEd1SkNNZVFrRlZtdFl3OHhodUt3S1N3K0kzRWw5cW9FSFlzSExNZDEy?=
 =?utf-8?B?dnVUcXVBV1ZWaEZUemVGUE9VL0huV2hLckw5VXc1cGswZ1NPRXBkV3gxRHhJ?=
 =?utf-8?B?bTNhcWpwblZCa21WSTM4TS8rUnQ1L2NjUTAzdm5MRXFma21BZGZPbVRYcXFW?=
 =?utf-8?B?OFJNSEhPWUQ2N214b1JVZWw5MlNKVzF5em9CV0syOWxTR1RFYWtTYzJmeVM1?=
 =?utf-8?B?NTF4c1JFWjlhVzdRenVFcXN2NnNKM3RiVWZXZi9ITjdyTlEwMHc0NFpHUXc1?=
 =?utf-8?B?ODREdWhEOHMxUktqbjlPUCtmV1BDOGxiR2xQSHNNYzRKVHdyR1NKTXRQcW4y?=
 =?utf-8?B?YStWWjg3Yi9mMEdPYjFKOGIyWEQweW5MYy8vaENPcnFsM1FXbk1aMUxSL1Aw?=
 =?utf-8?B?ZVJ0UWdhQnVtaERZYms0NXh2S0VqSDJQamk3ODFEa05wWDFnWmlOaEYydGtR?=
 =?utf-8?B?cmN6QzJoL3FuT3cxK1l3QmRzbTJvVHVPRDV4ai9VUXlDZ01UMlhVZXRPd3pr?=
 =?utf-8?B?MGR0MmtSNFQ3NFFoenljcUVhVHRGblZDOG5sVWpXMVFHV3ArekxXRmJra3Yx?=
 =?utf-8?B?d1dVUjhocXFxc1U1NEV5QVkvNkVacHBqSGFEQ1BvK3UzcS8rNWZZYTNZc2Ra?=
 =?utf-8?B?SVNXQ05tdmJCNW4wbnZ3cnB0Y0VCUjV1UDFBUXdPK2RERzZGTWlLMWV1VHNl?=
 =?utf-8?B?SldMTDFkc0JiUDRZMDVtL0RPVitMU1V1MEFHVzYyN21NVXEwTzREck85Ylph?=
 =?utf-8?B?NjlWRVI0MjlFbG92cll1V1dkcUNEUDFYOXRzNUZXS08xTWxLa0FoT2Y1bjhN?=
 =?utf-8?B?TktBaERCR2VWemhDdmlBS1d5Tmg3cExLUnlIdlNDRmh1Tmt0QmdLRzBubEpH?=
 =?utf-8?B?dkNXMjRha0ViS0FmQjJ5SUE3alJucTI3Z3FmaUdsdEZHOXM1ZXVVcnZxK1RQ?=
 =?utf-8?B?T0laUVdCN2U1a3c0cEUrLzRHV0VrK1p4N294MXZNWTRPVW44RjZQdmZFOGkr?=
 =?utf-8?B?ZFU1TVNjTTVzMnovaUM1eHcrc2VSOEsyZklSVUF5ckpPdVhQSCtndndpRXpX?=
 =?utf-8?B?MzR6UjV0alJtRkExZ0hmMGh5WDFYUWJzOGNiV2tRTW5sZXpEaUtZT0hVb0Q1?=
 =?utf-8?B?QURhWnhOS041cHorQzE0bXdZTDg1ZEFzSDQ5a1ZHWktZdm1KSXpxMVhObmJk?=
 =?utf-8?B?Y3Qwa0FaTFNXZUZZc0l5M1dyVWp3cVBBelZxSGs4WmhENml4OHZTSTZMM3Zz?=
 =?utf-8?B?RG8yZFV5WDRxUjFxLzF5ZmVua2xuT1l0MzkxZE9KU2xEQkM4UnhiWWgwR0dH?=
 =?utf-8?B?RE1qYUl0REJodjhkR0wySnNxU0NhRktaRWNFOFFPODdPQ25SbUxEVERKWjBu?=
 =?utf-8?B?dzlFb0djMXhYWWNCVXUxS0N0ak5WVDh6STRGckFaT3RFaTB6ZTc2RXcramxK?=
 =?utf-8?B?SzNMNEM5OFVnWGkyRlRFa2lUelhvV1FHSkc4R1JVak5xUW5OcmVJL1JSWjNS?=
 =?utf-8?B?bUFaQVAzTk8wY2p1YlRMTjZhemIxRXNlYUZSeGZmUGhVN3lPY28xRlFYVVdo?=
 =?utf-8?B?VURla0QzTTJFazJidFRQRGdNZjBtMmZGM0lOSm1teXRmWDNsbkwxUHRhR0J3?=
 =?utf-8?B?VTdINkNYQzZHSHJNN1NRUVJadkFlOGxJanA2R00vMG9nYW5IcVRqdXJNMnA2?=
 =?utf-8?B?aFlTV3p2Ymp6RWpGdHdJNVQ3ZDZ5WDBiRHVhQnI5Y0RSLzllbVZ4NU9Ca2RT?=
 =?utf-8?B?bW5sT1hGNzFqbVVCT2NEZk16alFSenFPU0ZobWJNVGdPT1JVWVVYc1NFb1Az?=
 =?utf-8?B?dkxPNzVGbTJYaWVPclVjcUJaM2s5NDVvaW9QM2NGK0ZHblM1M1diQTdTL2xu?=
 =?utf-8?B?L29CcC9rRkR2ZFAza29GbWhxSEpPK1Mrank0QT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:12:59.7546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ed74c3-9841-4a06-3789-08ddb7aded85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8828


On 30/06/25 1:25 pm, Anshuman Khandual wrote:
> On 30/06/25 10:18 AM, Dev Jain wrote:
>> Suppose a folio is under migration, and khugepaged is also trying to
>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>> and sleeping on the folio lock, since the lock is held by the migration
>> path. Migration will then fail in
>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>> such a race happening (leading to migration failure) by bailing out
>> if we detect a PMD is marked with a migration entry.
> Could the migration be re-attempted after such failure ? Seems like
> the migration failure here is traded for a scan failure instead.

We already re-attempt migration. See NR_MAX_MIGRATE_PAGES_RETRY and
NR_MAX_MIGRATE_ASYNC_RETRY. Also just before freezing the refcount,
we do a suitable refcount check in folio_migrate_mapping(). So the
race happens after this and folio_ref_freeze() in __folio_migrate_mapping(),
therefore the window for the race is already very small in the migration
path, but large in the khugepaged path.
  

>
>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> Could you please provide some more context why this test case was
> failing earlier and how does this change here fixes the problem ?

IMHO the explanation I have given in the patch description is clear
and succinct: the testcase is failing due to the race. This patch
shortens the race window, and the test on this particular hardware
does not hit the race window again.

>
>> Note that, this is not a "fix" since it only reduces the chance of
>> interference of khugepaged with migration, wherein both the kernel
>> functionalities are deemed "best-effort".
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>
>> This patch was part of
>> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
>> but I have sent it separately on suggestion of Lorenzo, and also because
>> I plan to send the first two patches after David Hildenbrand's
>> folio_pte_batch series gets merged.
>>
>>   mm/khugepaged.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 1aa7ca67c756..99977bb9bf6a 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -31,6 +31,7 @@ enum scan_result {
>>   	SCAN_FAIL,
>>   	SCAN_SUCCEED,
>>   	SCAN_PMD_NULL,
>> +	SCAN_PMD_MIGRATION,
>>   	SCAN_PMD_NONE,
>>   	SCAN_PMD_MAPPED,
>>   	SCAN_EXCEED_NONE_PTE,
>> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>   
>>   	if (pmd_none(pmde))
>>   		return SCAN_PMD_NONE;
>> +	if (is_pmd_migration_entry(pmde))
>> +		return SCAN_PMD_MIGRATION;
>>   	if (!pmd_present(pmde))
>>   		return SCAN_PMD_NULL;
>>   	if (pmd_trans_huge(pmde))
>> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   	    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>>   		return SCAN_VMA_CHECK;
>>   
>> -	/* Fast check before locking page if already PMD-mapped */
>> +	/*
>> +	 * Fast check before locking folio if already PMD-mapped, or if the
>> +	 * folio is under migration
>> +	 */
>>   	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>> -	if (result == SCAN_PMD_MAPPED)
>> +	if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
> Should mapped PMD and migrating PMD be treated equally while scanning ?

SCAN_PMD_MAPPED is used as an indicator to change result to SCAN_SUCCEED
in khugepaged_scan_mm_slot: after the call to collapse_pte_mapped_thp. And,
it is also used in madvise_collapse() to do ++thps which is used to set the
return value of madvise_collapse. So I think this approach will be wrong.

>
>>   		return result;
>>   
>>   	/*
>> @@ -2716,6 +2722,7 @@ static int madvise_collapse_errno(enum scan_result r)
>>   	case SCAN_PAGE_LRU:
>>   	case SCAN_DEL_PAGE_LRU:
>>   	case SCAN_PAGE_FILLED:
>> +	case SCAN_PMD_MIGRATION:
>>   		return -EAGAIN;
>>   	/*
>>   	 * Other: Trying again likely not to succeed / error intrinsic to
>> @@ -2802,6 +2809,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>   			goto handle_result;
>>   		/* Whitelisted set of results where continuing OK */
>>   		case SCAN_PMD_NULL:
>> +		case SCAN_PMD_MIGRATION:
>>   		case SCAN_PTE_NON_PRESENT:
>>   		case SCAN_PTE_UFFD_WP:
>>   		case SCAN_PAGE_RO:

Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012058.outbound.protection.outlook.com [52.101.71.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B02D1905
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.58
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776188; cv=fail; b=ExS61sBqz7aRO6E7/E8dVsXey4spRIvZ0GXK20IQTO1VY4T7ptoOyz9rNXN1Lr4c5FQtIYq9cOw8z5h2QDN+Yd6B5qY2w29OZ9I2XPY7QHidKeeUfdE6iEan5xIYJijEkrzPjWrOIHspsCfO50XoxGbUWBAY0yoxUNrde+SdmBY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776188; c=relaxed/simple;
	bh=8mscoq8lFvTteuDJMyQhw+aplPEkJM9gwQP1WCwhM2A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rDtxPWm5/uJQHvL8HGmK7QsGqzduc6vAQUVEH5Sdb0wEYiIjWG2iYh5z8HsgR9+ZwlfZURd+NhyUpZ8aFyFIbMAVVIKyGHhuxcOaPN2Ejkj+cRPp6tXsNiUS9x7h+MHs8t1mbeb9SUkDY8aAjwRhuwfVWxd3IBxAdrrsjoO12So=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZYHdTVm8; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZYHdTVm8; arc=fail smtp.client-ip=52.101.71.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZYHdTVm8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZYHdTVm8"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g12N+ukOokTYP3Z3muJGF4mosC+fxCIzxfDIc/I1jnwYbbmN4JZVGAXPl9oJM1ZpffULnoKtq2mq8oYxI0KO/m/fWAvKnTPrN+H0q5DZdZYu28MDq2CSecL8rW/j1wvpITrQYJBi0cD+f2mipZ4KRqrN5UJ65iLZpY8mwzH64j1/tHQmWBKDik6AjFLdLpOK7jgzGqkE5wp8fIOUXXh3qcftm/GwNLsteFjCQjiORopKKSP08WV3RohxLIlARjsSUhSfc8R3q9r3E4b6J5Gxbi3Wph42IfOEEGmDpbgaMypnzWyVgmxmPDLu6cz33ugfdFm2ki/+xDYjHD3tI5nKpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/DcoOmAPIAfoS+jgouUn9M5BwoZlhDHJ5B2zu3j3fM=;
 b=MZzdm4h6PpjaEdX7PFWYZypHD58AL0jAI9pTf4He0OXTgWQFjaN254Dgu86jVUHd+tFNroa7PyAZzoKK/sbU6RAjH1CV4PQSlXZmjmFDh+x1sfBAyOqHpp3WWaOrRPNnaNdXypZtx61WjsK/iuuNkK8BZpW685oVToara9XT7Afj6hPZJYjxJgYCEfr0K8d+wRSrcYmxTsxM28Red0zvsFSMN78hwtyz1el5bw6mNsGb4McK9D4JQlAIJczSIPW3Vfqdl5FbqT2aeHJdDMHrmewzxiQi+boNko5d88+Hcdu/rbMIVhDyJR8B7dlKqC+qSnGdK09ENjlUjz5UYXfGyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/DcoOmAPIAfoS+jgouUn9M5BwoZlhDHJ5B2zu3j3fM=;
 b=ZYHdTVm817CxSFWDOxb59TuNnvQvUkMIPpAbfKAWxcemCWMVNtVeN9fi4GjI30Lc/TxCUZqKnSR0wO8Scl2Urft03PqFg2UdaWr8eRdOf9JlF157r05K2DuwDHozD5/ACUAKIexUkaYUjnvcY5I8VU5wkF1G/R42NgwDv7SCDs0=
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by AM8PR08MB6338.eurprd08.prod.outlook.com
 (2603:10a6:20b:369::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 14:43:02 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::2e) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 14:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 14:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6tb23odm2vrrgoRGSe5ogAS51zEG0OH1tlCjblGAxag9b+W1xTWKWRpUzaZUV5wIWfev9wmRbTgzHH5J8+rQktmxf6xXWDNjArbUstOrMOOdL4yVjLza3Rvva0rLX3xW7iQ3RGqP0RraIjP5Efm3Rl+HLYPAYupL7JAUgVnRKIknZe78QZ5wcKZJMPpnm7MhqN4iDBQhngW+NbQnhmrC0UFsS7almUyTk2IM31XlRQwtplrDVg0eNJrWY4Xb6T00HFMQbg184kyY6+s0iiojTig2qpANzNeCWu53iq+R+Xh7HABW6SBcsQGFBR9enCr6gl1tg7UytjStB/IM6FHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/DcoOmAPIAfoS+jgouUn9M5BwoZlhDHJ5B2zu3j3fM=;
 b=m9c7jD863xhyJQXzgYGpLrgjI+2e1xpWoxBV7bYKPhMro88BOZ5Y56Vs0UhtSWstzfxxvsvkjxl8leTnxiewdiRMkmIW00ODU8SmxfYga8xxgNXJ0b2kBffxtXoY6f+VYRp5umWW7jeoo2B2LukGyUq3BleQN/Uw4SqjefrMEuNMtCebSA5RyiZh1zy/d+mar5Dt84BaY69H1OiFtcwONqtAm5HpxSoI247MrSxb+0nLcrfBTU7O2CgRVPpYDMJKPrmF/L0pebFI4WBcuV1HJgit3VPb7f9yEifeyxKpRC11l/nOUlWcKx23GLk4XzABiV2+BOZsGgRc/NA4fMUYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/DcoOmAPIAfoS+jgouUn9M5BwoZlhDHJ5B2zu3j3fM=;
 b=ZYHdTVm817CxSFWDOxb59TuNnvQvUkMIPpAbfKAWxcemCWMVNtVeN9fi4GjI30Lc/TxCUZqKnSR0wO8Scl2Urft03PqFg2UdaWr8eRdOf9JlF157r05K2DuwDHozD5/ACUAKIexUkaYUjnvcY5I8VU5wkF1G/R42NgwDv7SCDs0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VI0PR08MB10619.eurprd08.prod.outlook.com (2603:10a6:800:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 14:42:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 14:42:28 +0000
Message-ID: <73ada74e-68b6-483c-b992-a6845ffc41b1@arm.com>
Date: Tue, 24 Jun 2025 20:12:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
 <8912e179-601a-4677-b2f6-14f40d488d98@arm.com>
 <e666835e-4c15-4f5a-bab1-f27e0c438f16@linux.alibaba.com>
 <6771bdca-b489-42f3-b2fe-5449879e8687@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <6771bdca-b489-42f3-b2fe-5449879e8687@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VI0PR08MB10619:EE_|DU6PEPF0000B620:EE_|AM8PR08MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 1816c587-6953-4ac0-f573-08ddb32d6b60
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bDJUdXlEVnVDRlo0eTdibDlvdkJmM2g4TW1MWXp0c3ROVjdrN1h2Q1RWU0Mx?=
 =?utf-8?B?eVAzZjh3V1N2Y2FEN3ZZb0wvZVIrazNHelZoY1NPSk5MdDVHM3ZOVW5tRkYv?=
 =?utf-8?B?bEN6dXNuTEJ1WE40UHF3dzhuNCtQR2Y2SE1OSHcvZXU1VWJlKzN6TVpUdEhP?=
 =?utf-8?B?OUU2YytKbTNxSGdmWjNuM1ZUTFBYNmRHUkxIYWN3QWp6cERIdWdRN0hSeGoy?=
 =?utf-8?B?dXJVa0UxMnpKTnBNb2hiV2FJK3RyNjhxdmltQ05yZTFXY1hrM0Z0WUZPWkp3?=
 =?utf-8?B?MDJBR2ZjMCt5SnNLdU1aZFNvbjhPRnVxMmw0K2ZYa1RpRUZnK1lOU24vT3pX?=
 =?utf-8?B?aEx0Q1NDSDUrNStUdXF0Q0VaSHB2clBLWjVOS1Z6elRGUUxjN21YclNoRVZF?=
 =?utf-8?B?bitZdXg0ZldtVE9obG5MQk9QandZeDY5b2NyL0VmWmg1RjJESVJvTi9DbXBl?=
 =?utf-8?B?NmR6TjZ0WDJPRFdPWFppTDNnelV1ckx0bWdJSWVteUxTMWJlQVcva3pVN3pC?=
 =?utf-8?B?a0dLbnIyaFB2TDJnL201QVdJQnNuYlJtVjZ5eDNCTHV2THByUzVzVllBb2Zk?=
 =?utf-8?B?MDgzQUlKSllmK2dXdHpMUGJEd1ZualFsZEJkWldVMEZjVHNrNFk0T3ppMjNj?=
 =?utf-8?B?Tm81STN6b3B2bEVGcjFMSi96YVhCWkJiS0I5a1Q3VjRXNkZBY3F6a2ppL0l4?=
 =?utf-8?B?UDJtWFVMbGI1VnFVd2lmZnhDREZuT1FSd0N4MlpQeHBRWWtiNFZOaGtPTkJ5?=
 =?utf-8?B?N0x3VVZjQVRSeGEvcDZDZGVYdjBETzNKc2FFM1JIQjdQL0JhZStFbEd4c0hO?=
 =?utf-8?B?aHptaExjTVZOSDJ2d3Rhb0xGYTAwbW1pVXJPck1OandkYm9kQ0V2b01UNC9p?=
 =?utf-8?B?Q2RHN09vdzgwek5VYzBUdG9CNXN5bXhhak1vWFhRd1RmbnpOcmQ2MXRmdEtQ?=
 =?utf-8?B?cHUrNXFURVYwNFZjSWFwYmNrWGdwZmFIR1pzQ1RabTVSYzFZY0swK0lCN3VR?=
 =?utf-8?B?bStuZlpsUGNtMyswNHZSZDJGUHVFWnJqblJEWnRwSUU4b3p4MCtiS0pSSDNy?=
 =?utf-8?B?cTFVclREdENlbmhjRGZUY3cwbjAyVmRueVZkRlNMVHhsZ2FSak95OE1sNENh?=
 =?utf-8?B?WS9uSE1PUHNvaEdOTFpzOWZsbWNPTWZSVHdweDBWdFQ5WHd4cjFaZGdZcnAv?=
 =?utf-8?B?WXRVNmpNbVFDMzFtS284allzUDkvVW5BejNndjFCbG5ocEFMdktJV3liMmFC?=
 =?utf-8?B?R21mM0JPMVE4U2JBajI5QzFWTmV1M1lVOFdocVlSYlJkSnN5NnVSUXdFY2VO?=
 =?utf-8?B?RXFRckZjcVVucldXbUl4ajA4NWhJYU16OFlqQkpkblpQSUpJenF4VzN4UUhE?=
 =?utf-8?B?d283cWRCMTZKZTVTajNNL2hhYVZwUE5CbEQweGNHWGNWNFVHV3BnMlNOVGlw?=
 =?utf-8?B?MjdiN29iTk1SL1BDU0VrV0ZqUm1vOFNCZkd5ZkZVb09HdUZHenJXdFQ0RG5G?=
 =?utf-8?B?Q1hRWFlNbmNjMVBoRWpQejFaYnhSc3BUVTFCY3lPUVNldlJWbkdFSzFaNTRo?=
 =?utf-8?B?andCKzI2TXZmQWZySUNnRXFIb1BqZStYZldvMk52bGM5ekNGTlQyUFF5S1Ny?=
 =?utf-8?B?ejFTaHpZRlB5amZDVWdQQTQ2NWVpaFNRNHplT1ZvOWlnZXhrOTlXbDdUY2Q5?=
 =?utf-8?B?eG9DQXl1eGNCNkdYOUVaTTJMTE12ZVdJOVRVSmlZaWVRb2pDYytmM1B6dFFo?=
 =?utf-8?B?emtUdlVWQjBCSjk0L1VVd3BudkpyR2VZTmpwT29pditYZ3ZJN1p1NEppK0Q5?=
 =?utf-8?B?UGdzeExaWWRFUTZDSWV3WnFLT0N1Rkw5QUpWWmNsR0xrVU1pWHFRUVRoeThx?=
 =?utf-8?B?cW04MzNnNzhLUmltWTY5a3UzUWRXZTFvc3dtTTIrNHJ2aCtVanQvT29QbjlE?=
 =?utf-8?Q?DTOh1/TEJmw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46d0f139-1104-4edb-c977-08ddb32d5752
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzJOZGNqdnN0ZHFJSjFNU1dtNW5HcFRBS1VHcWJqQW1XUUNnOE5MSVppMjMw?=
 =?utf-8?B?WWhDZzMvaTdlRWlzMTlMbncrZXpYdExBMlVyTjJINHJPOHhMRkIwcS8zTW5n?=
 =?utf-8?B?RGJWZEk3bFNHdTF0NFpBVlNWb1N5MlJuYUJGMXdONlpKczVKaStWT1hySnVw?=
 =?utf-8?B?MXptb0R3cUtZaUNZS3lpZmJvM0lmcnN2RjliMDF2UUhNOHlxZ2ozei9Lb3Ns?=
 =?utf-8?B?M3FqY0pVWFdaUmhlK1JHWjZ6c1Rlck0zYU9CV2lzNmFTeFlyVTNsWFF5WTNE?=
 =?utf-8?B?dE9hazE3SHZMaURWSHRkR1c3Zk41bTZEenRXeGlLRFBIWVRmU1M4Sklmbm00?=
 =?utf-8?B?RGk5Z2lPV0FXY0FTanFiNzBkeHdSQ2xpSlF1UUdBRVRKSTRoSGpma2ZpUnNW?=
 =?utf-8?B?Wks3OWpVZFRmUm1BUWVjWkxYV1EwY2ZWMkF0QjF4UjVIN1o0R2lPcDZKaDJF?=
 =?utf-8?B?R1JPQXNSNlFRSFRiY0krREYySTQ0WEFsTjhhTlRtaUR1TWVvMXBrUllWSys5?=
 =?utf-8?B?Qm1aM25ZMjBWaTJ6N1RsaTVVTG9FZXJSbEdkZEduWDNyd1gxV1hvdk9LdnZG?=
 =?utf-8?B?Z0FIWkxvbkdjOWlnSmErYUtFTjVHNTZVY3llMFdsRTI1Y2N2VjFieS9KQXYv?=
 =?utf-8?B?ZldoVnRKSFpjK0llSXIyNWRCREhxQUdXd0piQWE5VnMrV3U4S3IwRjhrZ2Y4?=
 =?utf-8?B?Uy9zZXZIR2dodUlmUUVUTnFFUHZXOFh2VGswOUJzM3gxb2tXeWovblZQOEZX?=
 =?utf-8?B?MS9aSlZaTjl0ZFM4T2RzUksyQVgxWWpyZE1Nenl6R3dNN3ZQZXNNMTRwN3Mv?=
 =?utf-8?B?U1k1WWQyZTdPbko3WkN4bEk5L2x1eGRGaU9KcTJKWlI3ZlE1U25CMXI2NWxY?=
 =?utf-8?B?YnJtZ0pHdmM2eUZYRDczS2pLa3hPQlM2RDlhQUhvR2FGc2JpZlR5M2JMZW9O?=
 =?utf-8?B?MUdSZU5kaHROSkhsdEQ1cnB0bmJ0T2sxT242Mk5MeE1ROHgvSVNyK20wOTgw?=
 =?utf-8?B?UWRHUWI2ZG4vTmYyUW82Y0loNGZRVkhmTVpaV28vNGYreGVaWVMwbzdmcU45?=
 =?utf-8?B?NWJoNDUvR0NwL1NHeEJSMXNrMHIvdkdJV0dod0FRYjlWYUIxWC9uNzg3NS9h?=
 =?utf-8?B?clBjelJFZU9wMnNLcW1TdnJJN3UwMFM2WWErN0dXRDdrVmRlYlN6R0FOdE1R?=
 =?utf-8?B?NloxeXJYTWNnZzA1b3hpUjl4T2lMMExOODUrK2d3ZjN6eVMydlZIME91UHBD?=
 =?utf-8?B?SG52UnEvdXluMWgybUt5OE5ucHYzdjBkTkNGRHJmM0gwc2xuVkNxNnVDVmda?=
 =?utf-8?B?NDVDcGxDRlZJM0dsd0lHWjNyZGxTN2NZTGRoVW9GQjlLWFZZTTl1M1ZZeFBl?=
 =?utf-8?B?ZWlCUndmdGtXRVRpZGJ0c2xGYWRRVmRKNnU2cmkydXpGWVNsOWxXYkdnSGdW?=
 =?utf-8?B?ZUUzMElCeWEzbFpTZm5uTlk0YkhETG1vR3ZPcVV5QitDeVRsenNUQWprT3BW?=
 =?utf-8?B?ZE8xZHFpTWpCUVNhNTNVblFoOVBZcXRDcDdVSVA3OUZidldDelk4Zmc4U0RY?=
 =?utf-8?B?OXVUOFgvUWcwYkoxSTV1VVFVRzNnUVNWOFIycVczT2FiNkZ6dlFNUitWNEgw?=
 =?utf-8?B?cDdvOXJid2FaMkwzY2JqR0tCU2trejNGSUh5WWxsVjI5VDVQM0FOSEJSYzNQ?=
 =?utf-8?B?SGsvYjNvMmxJRmEyR3lBWmxwaTJPWW1hdHFPa2VHRUNia1RBeW8rUEF5a2lU?=
 =?utf-8?B?TDJqcCtMV2dJZFVMV2ZPWGJtMXl5d0ZJTnZHL05oREREU2srUHliRloybmlq?=
 =?utf-8?B?bCt2RG9RdGNXRU96b1RvK2VRQWR3NG1HbFN2bXo2YnNMNHNIUmxWTXlWbFll?=
 =?utf-8?B?WVd0eEtQQUM3UjFQMEFVQ000NHlGTUtoUHpMbmVQOUVlalJXVGRRMlVjSXhr?=
 =?utf-8?B?TjB4MWlQMUVLbnVyeSswdGlPRWZJTWJtb3hGbFFLODU2UkpVVFkrSW5yVGlP?=
 =?utf-8?B?V25LaWp5ZVdTQmxhbjNjWmVyZkRiV0lnNklCN0oreklsTWdVaEg2S2NXOG9u?=
 =?utf-8?Q?bpeiRa?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:43:01.1910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1816c587-6953-4ac0-f573-08ddb32d6b60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6338


On 24/06/25 7:38 pm, Baolin Wang wrote:
>
>
> On 2025/6/24 17:57, Baolin Wang wrote:
>>
>>
>> On 2025/6/24 16:41, Dev Jain wrote:
>>>
>>> On 23/06/25 1:58 pm, Baolin Wang wrote:
>>>> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS 
>>>> flag is not
>>>> specified, we will ignore the THP sysfs settings. Whilst it makes 
>>>> sense for the
>>>> callers who do not specify this flag, it creates a odd and 
>>>> surprising situation
>>>> where a sysadmin specifying 'never' for all THP sizes still 
>>>> observing THP pages
>>>> being allocated and used on the system.
>>>>
>>>> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE 
>>>> will ignore
>>>> the system-wide Anon THP sysfs settings, which means that even 
>>>> though we have
>>>> disabled the Anon THP configuration, MADV_COLLAPSE will still 
>>>> attempt to collapse
>>>> into a Anon THP. This violates the rule we have agreed upon: never 
>>>> means never.
>>>>
>>>> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, 
>>>> there is only
>>>> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
>>>> collapse_pte_mapped_thp() function, but I believe this is 
>>>> reasonable from its
>>>> comments:
>>>>
>>>> "
>>>> /*
>>>>   * If we are here, we've succeeded in replacing all the native pages
>>>>   * in the page cache with a single hugepage. If a mm were to fault-in
>>>>   * this memory (mapped by a suitably aligned VMA), we'd get the 
>>>> hugepage
>>>>   * and map it by a PMD, regardless of sysfs THP settings. As such, 
>>>> let's
>>>>   * analogously elide sysfs THP settings here.
>>>>   */
>>>> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
>>>
>>> So the behaviour now is: First check whether THP settings converge 
>>> to never.
>>> Then, if enforce_sysfs is not set, return immediately. So in this 
>>> khugepaged
>>> code will it be better to call __thp_vma_allowable_orders()? If the 
>>> sysfs
>>> settings are changed to never before hitting collapse_pte_mapped_thp(),
>>> then right now we will return SCAN_VMA_CHECK from here, whereas, the 
>>> comment
>>> says "regardless of sysfs THP settings", which should include 
>>> "regardless
>>> of whether the sysfs settings say never".
>>
>> Sounds reasonable to me. Thanks.
>>
>> I will change thp_vma_allowable_order() to 
>> __thp_vma_allowable_orders() in the collapse_pte_mapped_thp() 
>> function to maintain consistency with the original logic.
>>
>> Lorenzo and David, how do you think? Thanks.
>
> After thinking more, since collapse_pte_mapped_thp() is only used for 
> file/shmem collapse, changing to __thp_vma_allowable_orders() has no 
> effect. So I prefer to leave it as is.


Oops my bad, thanks.


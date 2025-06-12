Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EC0225397
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718053; cv=fail; b=G+RGQd1MjA7Qwl/KCzBAQSnrlfRgUtSRSqYtN6oVEBmB2C5tIj7wLbRfwsSxURjwo7ZTR+CbtvvqgZMlphh+RqWLoNLFeVlymQCuuJx8+KaZSCqF/i/Icj4GJ70rdGghWg1HgYZ6lrqNfHVd6hfnntQN7oF7ZlMBjG3y+CpGMIk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718053; c=relaxed/simple;
	bh=XknkZWUj3fri0hWLqEnnp5iEiHTaBZv6tnhHQ5cJASw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VtwpPa9ScPaxmDxOVPSen+fUhG4XzgldzWk2pR7F6ASIVieod0pU0V5JHzbtysIrmuaoiUHXQZAcDX2woFrrS6U4WugOTMcZh6rtabtALD2nmiRivuNm1W0nQhWwFplDn42lhAP31YQzXVcHi7k4lUOq/cQACCWiR0VtYSg5yqM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V6A/zEuB; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V6A/zEuB; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V6A/zEuB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V6A/zEuB"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YVzJQyEOVD/m7AfMLOnveWYsU1g5MnaHDm0+dtaCCkcDrM9grTF6ZAXt3rTNf7EE9b19vBtl9z8vK+C93XAJlPKD9Ome9iEVF20yQTlW2FqVNxRUCKMztQdA0h8So9m083dzyk7VeDMVKVyEnz4vTEu1qVyRsDQZuYC0RsDdW2e4pVm4SWivqFZq6sh5Rmsa1lY3zYqF/opa/SomMwISHI1dA99ffmtUAXCz0VeaudeS2LN/mHCZS5LRZOygy6mJx+uO93b4pLaUBqF8VvMQFe2dRy88QqskgKtXvg1thbwMDqiuJceK25ZZfXOmD6V0MHqBvZiopV+3m/DKJ+F1dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVZr8ML+kH2624tROgtzAZFDLq8j4+hnbxI29cV1Ty8=;
 b=lV8dLHBNzdtWaHjkEYxEDuXESAVoqL1QBhXedK5y6Tk9wIoxjsUauKRZ4F5NtSSFM34ZhhcxXw/56CzbSQNf0BmTwXjjYGQcWwdIHyVey20Ck7YkGpwk9PMO5R6Ttq2HekVOT9yzjIh4tag3+XeH4c4D07HcRNtl6/3heBxfQDvJojS6kPX8B5zENqfJkEIPBH4SK9qYKK7XRHzE5DmFx4+pFWbzqTN0gwQvXjQPbMPN9g82fhyp9S+HC1I6vuMkzFJBnVm/WOIPqBE8B2tv5v26tFVqyhrohYd98B78AGSjV7XbZTW1tmn6hg1Zn0UuU8VHD/TfjoPcRgjFqDzAaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVZr8ML+kH2624tROgtzAZFDLq8j4+hnbxI29cV1Ty8=;
 b=V6A/zEuBgJ8P4/sKcwAVr+WdyrRexLaKEq/y6YA7LZMuCz3IBjj8NTr1oQLxQL4SIN3A5Bomu5h+hJkFogbn++em5MZC4DKt+01/VldQtEUdXwuy5MQwmVMD8g7AeVQ9W1l2NZ5WWJh9obUM4m4b8NRNeMO+MCjqpanjAA0XtU4=
Received: from CWLP265CA0439.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::9)
 by AS8PR08MB6373.eurprd08.prod.outlook.com (2603:10a6:20b:33a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 08:47:27 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:400:1b7:cafe::90) by CWLP265CA0439.outlook.office365.com
 (2603:10a6:400:1b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 08:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 08:47:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgiEW9meu0gpGlE7LWZSLee/KdWN3Ia19H+0fN1LmyKBbIwn2/d+NZv/z1LoEEb4tPA6C38FNTpW2c4VvYiWLtDQLRolKWeMy1MNr/TPUhmCeWCP9XD+cm95Q8sA0eUy8AThoCncZYa9Gdq/tOvRUoF28ZhrpPiT92UYyozgnbL1Wg5Rtj0Y+1KALOEXhPjj6s5UMReXX2MBKA35eyI/BhIWKivSVcyV95JZtmYMMOKXfkBg4mVqdi6cz1CPHQkZda/FASPSZxGTmpyMswxzy1gN87+lSGF/MUFmvvZ4xBIenn9AEBYgWjqM3wwTUlFmtuK850ijeEPKa4FIFnPSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVZr8ML+kH2624tROgtzAZFDLq8j4+hnbxI29cV1Ty8=;
 b=npuPNH0BCBLL4UiWEVBZkEV+nUV4kLWl6oH6R32y7ilVBrLRYS4q4kizDfL50TcHeSW8fuZS+sWIczaWdKwYSsxSpQkzUK6wrv9rsB7Vg6ujUjM0umFmBIcklfNKGiC67gDibO1BuHVV1pgtHouzI9vXdUlx6E9EXmholYW8hDc7y/TvniD20zfByPpCikFl8/gC0UxwlEu0azr29cuzLIbTh/UI8GmSbk5NEfsoRRKbMwK8ptQCkHgOyh/FHpYpCW317+Nwflji1LWb5jdp+h7Ym0ozmcSKCexc5pu8p5fxvrdKKEj8vpcCi7KWytXTwGzO4/37UHTu5LGgobvq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVZr8ML+kH2624tROgtzAZFDLq8j4+hnbxI29cV1Ty8=;
 b=V6A/zEuBgJ8P4/sKcwAVr+WdyrRexLaKEq/y6YA7LZMuCz3IBjj8NTr1oQLxQL4SIN3A5Bomu5h+hJkFogbn++em5MZC4DKt+01/VldQtEUdXwuy5MQwmVMD8g7AeVQ9W1l2NZ5WWJh9obUM4m4b8NRNeMO+MCjqpanjAA0XtU4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV2PR08MB7956.eurprd08.prod.outlook.com (2603:10a6:150:a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 08:46:53 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 08:46:52 +0000
Message-ID: <40d859c8-f083-4b25-8785-c1023da1c6d8@arm.com>
Date: Thu, 12 Jun 2025 14:16:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV2PR08MB7956:EE_|AMS0EPF0000019D:EE_|AS8PR08MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f916fe-8f2e-46e4-fe13-08dda98dc1f2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UzQwSjRRcU4zNU9rbGdET29OL2w1eTcvYURDLzhnQkJLZzFneExXQTRBUWRM?=
 =?utf-8?B?cjlndEFxRnNQRGpEb1RYb20vbytFTVEzSmpwZ3N5WlZhMVVBZDgwdUFRVVlr?=
 =?utf-8?B?Z01XTDZXZmo3YXFNdEFnNVdHZytkejczUmpKMmVCL0puR3VuNHhFWExoaGwr?=
 =?utf-8?B?eFJ6bW1nVnJFcWNNb1Q3ejNIQ1ZleExoRXk3clBPaUNJMjg3aEhVeTliVkFY?=
 =?utf-8?B?Tlhha3dEbFZOVEU4SFRuOVA2OTRMUWIzMXFQTnZrMGFzUDdEUVB5ZVVnTkcv?=
 =?utf-8?B?VXlCd2haUmVJaCt1dVA0dWs0TTVwaEJvZWFQK3BscVhqaDIzSFpueklxbStJ?=
 =?utf-8?B?L3ZRbU52WGRxUGticTZCcDRMclNNVTNLc1hlZFFLK2szTFE1VzRCQ0I1bzUr?=
 =?utf-8?B?aFJTYkVXeFlVL004ZGUyQTJSblZHV2NOSUJlT29yUUVCa3VmUU1hbFFCOG9F?=
 =?utf-8?B?WkV6alZKcEJOZG5GRnhha2tzNVVieGd6b0Y3SFlYbURGNm4xcC8yVHNCOWJk?=
 =?utf-8?B?VUw4T3NneVRVTFIxTG9HVWVsWE5rTndHMFVwUEhnenFCNzJUSzJ2RUpDd1px?=
 =?utf-8?B?RUxVeCs2UlMvelZIY1ZkNWcwS2d1TTFoRlhZWDdoTkJtTnZrYW13bHVHU0Nt?=
 =?utf-8?B?dlFtSzBsa0x1UWozS2JsU2RvUE91NXUzOGhtMGVKUFNVeHNFY3FocG1vMUFY?=
 =?utf-8?B?UHNBK2svUU5sUHJoNEQxZisxQVg3bUNWUnFCVFRlUHE3NXd2UUdtcGsrdSsv?=
 =?utf-8?B?WlQ3SExKSkZzM3VCTE91NFBteGFoREJEdmpqQ0xLbTBRRGpsdnpvY3EzYU1R?=
 =?utf-8?B?QThKeWRySEc4Y2NHYlRmQUE2MVB3OEJhY3pZbis3ZVhzYXEya0l1VlY2WjhH?=
 =?utf-8?B?UHhYeVN1VWFxZ2tpdGQ1clVzdmw2aEMyUWVtRkdRTEhkVDB3d2hiaCt2MEJw?=
 =?utf-8?B?bnFLWnBLOXg3aDU0ZkNWOUZ1cXpnSitzL041MjRBMEFSTEt1YW9kOWZuUXgx?=
 =?utf-8?B?QklneGo1OHJ0bktaM2g4d2haRzMvZFVPbk5PdUk3bjhPcVVuaWE0QmYvUVN1?=
 =?utf-8?B?Yk41b2hHaFBrcnZISXJ2MzJST0hVUjRxUTJwZHJtQWRONWY3ZGFnZFhGVlZn?=
 =?utf-8?B?b0EwTGJ1ZFhTR09DUVlxZkJLaXJwQzg5MzJjaDBxaGM3eDdCaGJJUGtLWlNT?=
 =?utf-8?B?WnVHUTNWb1U1MFY5WjFaWWo2WGg4QzVZMlV1a1VhOXBwZkQ4TzRhcDJsYlUz?=
 =?utf-8?B?dTY5R3BEalhWVjk5Rk8vV05aRXdTMWg1K0RSUVIxS0pycURuY1hPSmtOMjhs?=
 =?utf-8?B?dmthclkvaXpUd2lLZHRGZDNrdThkRi9pRkZ0bnFRK2VYenVrOHlvNncrditQ?=
 =?utf-8?B?d1R2YVRmcE9EWVg3QXBXdVIyL3hoYWl3ZVdvcWNJQ3YzL1UzcFRxa2t2cklB?=
 =?utf-8?B?eFZrRk9MYk8vSHpQOE45TVU4L3ZPaDYvSjlRQWl4SW9lSEdIVlpPZWc1amZR?=
 =?utf-8?B?OCt0bVIrWlVUcmpnOVlXVzcwajhRWnhmM2xkajRTUmFDcE5ONVp2aWtVUTBZ?=
 =?utf-8?B?R05lU3ZYUU9OUWhLc1VGMEVsY2hpU1U5MnRZWDRHNFE3bE5iS2d4cVNlSi96?=
 =?utf-8?B?SUhtUW51ckFPV1Bsa3Jja0cra2xvTFBiUDFtZGtOUWV4WWpPUmExODA2cDBu?=
 =?utf-8?B?Yzg1ZC9JRzhNRFVESGdja3VwSnpPMEMxc2VJdGdZTTZjcTM5cTFmYzNMVWxi?=
 =?utf-8?B?QWZSMlhycHJIdHJ2VSsyTHM2RVNKVHpTZi93eVZEZElsZjlraE9tcHpsT0I4?=
 =?utf-8?B?QmY0Z1JNeG9EY2VHbzBtcjVDb2VTNDRQQXR0WVhvKytZV2c0NGNHT0hOTXRr?=
 =?utf-8?B?RHZaemRESXdhN2ZweUtzc3lZVmJJaUJncGswYkNSMXdGdWR4ODNsMExacXJV?=
 =?utf-8?Q?CQDmxrjrqZw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7956
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3f4b4c2-c167-4228-5ff8-08dda98dad99
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|376014|7416014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWpFVGxjczZFSHlyRm0wTjczS2NMTU1nM0FnMnBsSEtmc2dYSHRZV2RTeDRI?=
 =?utf-8?B?dnFheitmSDRLeVpCcjh0SmJObnltMTQrdncvcTkwdGZFQUx5WlhyS1V5Zk52?=
 =?utf-8?B?MUlCeHVtSG1WSUM5NFB2Smc4M056UFZaTmtvOVNYYkFYS2pFVFliSjVuME5Z?=
 =?utf-8?B?VmlnOUhOcVZMaklEVWVmQ1hSM0xKZ05oMDREV1hzY2Fqc3pHZlhzTjNRNWRQ?=
 =?utf-8?B?Yzc5bmh5SjVMSU9iRkVvNGpQRXJGZXV1WEY5bzR5U1haSGVXL2dGa2k1VDEw?=
 =?utf-8?B?S1BhUytYVzY2eTNrNk12TUExT0J5M0c2L2hoaWg3WHdHVnhwMmJxaDZhb3FC?=
 =?utf-8?B?OG01R3BITEdqUkk3MnlTbHVCRlA0UE5nNU1IV0xhSWRDQXBudUhPdTl6aTZU?=
 =?utf-8?B?d1RDSWtBSWpxZ216aFpraE1aMkR6b2lJNHRaTE9pUUFKVDlyU2dPbUtuc091?=
 =?utf-8?B?RFVjK1JPMEp1ZGlHUitTUkhpKzVPeUdiVzZ6ZWVmWnF6Szl6eVlzT3hkaG9M?=
 =?utf-8?B?T2pwOHJwejhYYmpwOEVNWm1QdzcvMzNvaUMxci9NK201TGdudDZvc2JQVmdm?=
 =?utf-8?B?R0lwYWJYMk9Da1g4RWZUZnFaNC9DTHAwQ1VnOEF6cXM4a2RORHhXazdiRmpt?=
 =?utf-8?B?S0tuQjdPVkFLRlUrNFJ5WUtqWjE0WTU0QjJGK3FwWmFIODhUcTVsUDNkQXp4?=
 =?utf-8?B?ZCt0aDdYc214S2cvb0UxSFNXa3d2QXJuWjdGK1lLM0cwM2xqVk8yb1VETFBo?=
 =?utf-8?B?WFN4cWVkMlA0Vkp4cEVxVWVqV0RYR0dZaDVjK2dDeUVSS1hoUUZLck43Rndo?=
 =?utf-8?B?bGJwRkFkanRxREhFQ1cxWGdYWkE2OVI4QlFkeGVPOWRJTC9maW1nY2JRdlAy?=
 =?utf-8?B?K3BaUVBURExCTlpLRTRFajdiTHdoM1o1ZVZrU29qVVhmSjBiQXFRbC9MbUph?=
 =?utf-8?B?azZXZEJ6bkQ2c3lVbFVzbVJKeTVoVkZ6M0c1ZHBsMmMrZUtOMm1tOWRSazd0?=
 =?utf-8?B?VFRJd3h0MEpqUEd0eXUxZTIzK3hhL0NlOWNEcTlETFB3Wjl6ZWpWR3pYcTNM?=
 =?utf-8?B?K0Z5MGNhVUFBNVg5T3cvVnZORlYzZGVPMEhWRlpUcEhlWlhJNTFpVkZZZHIw?=
 =?utf-8?B?RDYwWEtqbS9lQS9LZ2lpQjRFajNRaXFqUmlGT2dPd0ZTeTdsZE5oelZaNSsx?=
 =?utf-8?B?VjV6V3FGejZQZ0t5SlBZOTBsQlRybjAzN3Z1eXZsb2dzbWduVUtLeWdRRE56?=
 =?utf-8?B?VU9jM0RmZE1tUWh6aEtjTGZzc1ZRREpESHpZWEpLQTlLdWl4NkxCa0NNM3Rz?=
 =?utf-8?B?S21MdThvQ2wvTGRxSnAyWUw0SDhaYzVEVzFzTktxZStZdjl3MW9wYWxhOFd1?=
 =?utf-8?B?bzVaWGFIQ25EQk92OVpBbmNHNzdQaWxZVzBOdXdXY2ZDRS9Yc3p2VkZxS2NZ?=
 =?utf-8?B?ZVV2QUkxdHVjU0V5Z0p2ZEV6VXRlbWVpK0JFU201eGNMcWQ4WXZsUWFGbC9U?=
 =?utf-8?B?TG5Mcm5UUThCRkQzanRHNTFKWFJVNjN2bHE5dUdXZmh5bENaMHRha1Z0cTdO?=
 =?utf-8?B?bzQ1SDVPaVZ2ZHBYT2lDRkFIZXVqMWJ3VExGbytRV3h6T3JEbUZnYWxNeEp6?=
 =?utf-8?B?ZUJqdDQwZ3FwZWg1MUZmbG1aMDJQUmdmSFc3TDMzaGdTbUdtYUFJR1Jmak9w?=
 =?utf-8?B?QjhDZnAwdUJja2J6Z3pXaDVKMisxc2NTNnRqd0R6VXJQaDlnNzN0VU1udUg2?=
 =?utf-8?B?VmV1QXJXZzlHYkN0QWdDdENkaFVlWkNKeGxTZjNHVXNYQng1aUhvSmZ1Nmx1?=
 =?utf-8?B?N05sR3F1bkJ0Rk1WSnFrZXdWR2VUWUY3TmlGVHJRMWtLcGdQWXJLR1BqZUtW?=
 =?utf-8?B?VTk1YzBZcmMvR1BvUVVmMnE0MFdIc05Rbnp2YmdTQ29oNHM3TzAzaFFnNlM2?=
 =?utf-8?B?dzAwZExwdXFQb0ZjNW5zK3g3eE5VR2dOUTRtd1drMzdpSktIWmZibnlSeVlF?=
 =?utf-8?B?VjZwZ3hCVDEzK2JvallXWVRYYzdEMnJVMVg5YTRRQzFFWWVNZHRGSTdKRVhF?=
 =?utf-8?Q?ZpWnah?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(376014)(7416014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 08:47:26.4777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f916fe-8f2e-46e4-fe13-08dda98dc1f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6373


On 12/06/25 1:21 pm, Baolin Wang wrote:
>
>
> On 2025/6/11 20:34, David Hildenbrand wrote:
>> On 05.06.25 10:00, Baolin Wang wrote:
>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs 
>>> settings, which
>>> means that even though we have disabled the Anon THP configuration, 
>>> MADV_COLLAPSE
>>> will still attempt to collapse into a Anon THP. This violates the 
>>> rule we have
>>> agreed upon: never means never.
>>>
>>> Another rule for madvise, referring to David's suggestion: “allowing 
>>> for collapsing
>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>
>>> To address this issue, should check whether the Anon THP 
>>> configuration is disabled
>>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag 
>>> is set.
>>>
>>> In summary, the current strategy is:
>>>
>>> 1. If always & orders == 0, and madvise & orders == 0, and 
>>> hugepage_global_enabled() == false
>>> (global THP settings are not enabled), it means mTHP of that orders 
>>> are prohibited
>>> from being used, then madvise_collapse() is forbidden for that orders.
>>>
>>> 2. If always & orders == 0, and madvise & orders == 0, and 
>>> hugepage_global_enabled() == true
>>> (global THP settings are enabled), and inherit & orders == 0, it 
>>> means mTHP of that
>>> orders are still prohibited from being used, thus madvise_collapse() 
>>> is not allowed
>>> for that orders.
>>>
>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> ---
>>>   include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index 2f190c90192d..199ddc9f04a1 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct 
>>> vm_area_struct *vma,
>>>                          unsigned long orders)
>>>   {
>>>       /* Optimization to check if required orders are enabled early. */
>>> -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>>> -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
>>> +    if (vma_is_anonymous(vma)) {
>>> +        unsigned long always = READ_ONCE(huge_anon_orders_always);
>>> +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>> +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>> +        unsigned long mask = always | madvise;
>>> +
>>> +        /*
>>> +         * If the system-wide THP/mTHP sysfs settings are disabled,
>>> +         * then we should never allow hugepages.
>>  > +         */> +        if (!(mask & orders) && 
>> !(hugepage_global_enabled() && (inherit & orders)))
>>> +            return 0;
>>
>> I'm still trying to digest that. Isn't there a way for us to work 
>> with the orders,
>> essentially masking off all orders that are forbidden globally. 
>> Similar to below, if !orders, then return 0?
>> /* Orders disabled directly. */
>> orders &= ~TODO;
>> /* Orders disabled by inheriting from the global toggle. */
>> if (!hugepage_global_enabled())
>>      orders &= ~READ_ONCE(huge_anon_orders_inherit);
>>
>> TODO is probably a -1ULL and then clearing always/madvise/inherit. 
>> Could add a simple helper for that
>>
>> huge_anon_orders_never
>
> I followed Lorenzo's suggestion to simplify the logic. Does that look 
> more readable?
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..3087ac7631e0 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -265,6 +265,43 @@ unsigned long __thp_vma_allowable_orders(struct 
> vm_area_struct *vma,
>                                          unsigned long tva_flags,
>                                          unsigned long orders);
>
> +/* Strictly mask requested anonymous orders according to sysfs 
> settings. */
> +static inline unsigned long __thp_mask_anon_orders(unsigned long 
> vm_flags,
> +                               unsigned long tva_flags, unsigned long 
> orders)
> +{
> +       unsigned long always = READ_ONCE(huge_anon_orders_always);
> +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +       bool inherit_enabled = hugepage_global_enabled();
> +       bool has_madvise =  vm_flags & VM_HUGEPAGE;

Let us name this honour_madvise to indicate that this VMA must honour 
the madvise setting.


> + unsigned long mask = always | madvise;
> +
> +       mask = always | madvise;
> +       if (inherit_enabled)
> +               mask |= inherit;
> +
> +       /* All set to/inherit NEVER - never means never globally, 
> abort. */
> +       if (!(mask & orders))
> +               return 0;
> +
> +       /*
> +        * Otherwise, we only enforce sysfs settings if asked. In 
> addition,
> +        * if the user sets a sysfs mode of madvise and if 
> TVA_ENFORCE_SYSFS
> +        * is not set, we don't bother checking whether the VMA has 
> VM_HUGEPAGE
> +        * set.
> +        */
> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +               return orders;
> +
> +       mask = always;
> +       if (has_madvise)
> +               mask |= madvise;
> +       if (hugepage_global_always() || (has_madvise && inherit_enabled))
> +               mask |= inherit;
> +
> +       return orders & mask;
> +}
> +
>  /**
>   * thp_vma_allowable_orders - determine hugepage orders that are 
> allowed for vma
>   * @vma:  the vm area to check
> @@ -287,19 +324,8 @@ unsigned long thp_vma_allowable_orders(struct 
> vm_area_struct *vma,
>                                        unsigned long orders)
>  {
>         /* Optimization to check if required orders are enabled early. */
> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> -
> -               if (vm_flags & VM_HUGEPAGE)
> -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> -               if (hugepage_global_always() ||
> -                   ((vm_flags & VM_HUGEPAGE) && 
> hugepage_global_enabled()))
> -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> -
> -               orders &= mask;
> -               if (!orders)
> -                       return 0;
> -       }
> +       if (vma_is_anonymous(vma))
> +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, 
> orders);
>
>         return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, 
> orders);
>  }
Overall this is very readable!

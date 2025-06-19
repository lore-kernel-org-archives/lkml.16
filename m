Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC702AF1C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750302850; cv=fail; b=RVefeU/Aq/aygZVvwQgi+4zM93COOA38kATEgSJwrY2e9YGtpZ0urra77kfw22ej35q9HuQUue0sjLepFE8ubb+Vo1yqURm8/F1EzjJ+gs5m1hLaTFFQlPCnZ+MJ+FQbLbTLg21gY0y8yMJrBsQ4coYfgnDJLKdyG0xljWYurnM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750302850; c=relaxed/simple;
	bh=9C4qkd6QETPG5OeJOgsdFZjC2ifqFKM3na5aUxODHzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z4RClRlwNb/JhkxJb0puTX8MLXa3kGeEcnF5a5kgc3qtfH09Zx6gnSKVSnQZmAxq2xv33rzunnW8DSQHxRe2Pp0cU/9gr9vqamOiqcObijV6riEbMU1+VUwYPVK9EnA0aueLJGW6hIjvYY5GCeMbA/AvmjzgS6aqhi7W3WPkJwo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kfrKP1Ru; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kfrKP1Ru; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kfrKP1Ru";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kfrKP1Ru"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HbDuW560LNEU1zhaiXFmxls518UIqRRJ+HYFsV5XW7Suil2Ks47vBFsQhJOGLe4869MYungPSiY5+j186XVZlDkYfExD+ZZMTqv7ApAx1l76yAqMVqVcVoM1YxVPU/uxexROAUCyyXQQQIgJh/f3aSVjupvZPCh4WPHIPeW0NsPjzcmZ/JfYxBrsbsSVFbE3eWlSRsoHY17Tq3I3CBov77jEpYFT8rOy/nGFrNJtQULU8+H/VBKOQNK6w9EPLXGCnCkDHIIEaTb36iNuYibCwHvHPBIz2+mAkxuUaQEt7tcuPtHZRmMVpCJbugP0/HA2b92tyxA6K0uNO7jQc5l4qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrYcn0haw6UhpHmvkoOcSxWnzgg6ZquyB8EsP1A6yys=;
 b=swj73BX5DZ2/hi+uhNEtW0SJ8XYrEiPkZPIY/aSvh7YeqlHjTjD5eaOPgUbCjZOuvXqqCwOHXpqp0dfL0QhNiKxSeMTqKcTTormypYa8uRo5JC/5L9gmKwaQGgjb0RHT5BPh+31Ch36kOIDzAkt6dPulrhkXKIqpAhzBrfdKn0NTpbDwm0RJoFP3lEuX22YuSecOtGmKHQEe6uRLQ1SZYjhm/R8sfn3Bwp0+Ow7pxNJAMQM2LGxEbp/auBjuhs7Y2/HxI8EzBe2DqSMQGZKKyiFT5tK9eqspx9PruRmdMEqV98V++cwJXty3eRIBEgkaNd1eoDdVQIiapJxfRt2uNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrYcn0haw6UhpHmvkoOcSxWnzgg6ZquyB8EsP1A6yys=;
 b=kfrKP1RuAQmaZPc8bAWJU0txR4zyDHPia9wGUKEdbTqt5ugIRfrLh+ORnADzHtzjZYIx5deN82mXmHe8vh0OFFXWboaK0QluF9yA2ONoUaGOR+q/dgCRBlPywjAwaXF+wNS0Y+sJhUaaiKaFqOL3FW22lbcMAubdY5Zo3mIi/nU=
Received: from AS4P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::14)
 by VI0PR08MB10893.eurprd08.prod.outlook.com (2603:10a6:800:253::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 03:14:01 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::fb) by AS4P195CA0005.outlook.office365.com
 (2603:10a6:20b:5e2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 03:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 03:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOiOoGeTZz++25IFKvdfHLshpnhKhnen7x/1jkktgYFtU7RbjBKdpt0NgYvfNRERS8hlc8vbwIpUvHnAyA+3zXBkNKpSRfm7w53enUjBNRbmk00cZiMEwV4DU6l+GTfpmsxySs2IGeKYvuB2DVpHj8xafzPs3bmh7JsLetVxWu7o6K8mZIF4dzTftsn5mfxf5E0bxVnwkaVNY13Qf7t86IG4CJZdI0TO6/bqgw1O4/9W96HsvwpDYwJst+XDbh/9wwO5QyGiASS9mtte3yBO8W+NJULljpNu6OGeHyDi66kTC6A3D9ph2I7ziMF4sPlVLsxZMYGK/r8mLvfU/PnHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrYcn0haw6UhpHmvkoOcSxWnzgg6ZquyB8EsP1A6yys=;
 b=ux8SjAJpbSbleCeOhNCeJ3zIzbYPHIfUK3UHUSCLC5jtTghFzwFC77MOvV1MdHMllMU3uM8EUIRyckznlDMvoyirWTr1g1EfdL2NUbecqLDCgSxPa91Bgupp5KL8Jm2R55xPPyFMNmVfupj3eTVcbGPSN6YouZ5EstJ0ACQOtvatkkdDXh/gQyU2kygftmB63ztsBR9PGY4Z4vyk74BZGElwpW9IvBYFlLoHueC+Ib872ibNfEUbChzbfrUse0D701s5WOcHc9CFAWbAPMFDnj7kx1pGpgTzfg68k/25jI/VwQtSkscmck5sBBBQWiK2pD9EXAWsAXYz+9wol8PW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrYcn0haw6UhpHmvkoOcSxWnzgg6ZquyB8EsP1A6yys=;
 b=kfrKP1RuAQmaZPc8bAWJU0txR4zyDHPia9wGUKEdbTqt5ugIRfrLh+ORnADzHtzjZYIx5deN82mXmHe8vh0OFFXWboaK0QluF9yA2ONoUaGOR+q/dgCRBlPywjAwaXF+wNS0Y+sJhUaaiKaFqOL3FW22lbcMAubdY5Zo3mIi/nU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV1PR08MB7850.eurprd08.prod.outlook.com (2603:10a6:150:5d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 03:13:23 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 03:13:23 +0000
Message-ID: <ad70363a-03c0-4904-a579-d25b3dc7b3f9@arm.com>
Date: Thu, 19 Jun 2025 08:43:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com> <aFFWw4O2PjOScWld@pc636>
 <910e8622-2755-4aca-b17e-0ec8a18a7f1a@arm.com> <aFL1G91dDtDtMMon@pc636>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aFL1G91dDtDtMMon@pc636>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV1PR08MB7850:EE_|AM1PEPF000252DC:EE_|VI0PR08MB10893:EE_
X-MS-Office365-Filtering-Correlation-Id: d85028cf-f49a-4bf0-d085-08ddaedf55ec
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OHNZUnB0SFVtRjFMem9Bd3lLbUlqSzZISk0rNUR1b3hqSWo1YmwxRGxBQm4y?=
 =?utf-8?B?UnlaUTVXdmdRQnpDKzdiTmNEcXE0emM1UElpblZJTFJGbGpiOXk4ZkFYSE01?=
 =?utf-8?B?bHBITHZjOGdLSUIyQStxZG9EbFBNdjByR3Q1MnZBSDh2OHc3RDZQTkVDYnMw?=
 =?utf-8?B?N0djT2Y0RVBkbUE5dG40d3NBMVFtSUFua0J4a01zMDV2Q2dKa1pHaTJKbXZz?=
 =?utf-8?B?NytaM2wvK1RTN1NkMzE3SWZwNDFNTE1qQlJSa0FQK0hGcnk2eEJBaFJBZkp5?=
 =?utf-8?B?QkV6OTFIM0RVeU52MTlWTG80WTRSUGVhK0lkQkhJdFBFRVdDalpDVFJyeXI2?=
 =?utf-8?B?M1FPcTFsMGlPcEhUc2dYcTJJYWpuOWwrQ3BKTnJYVE9hSERRY0NMd25xbzlZ?=
 =?utf-8?B?QWZXcE1yRVloN2czWldFOStqVzNCR0pOY3lPcnVsd0g5YndnUDNjUWh2bThj?=
 =?utf-8?B?SGZLbkZraEpuYzB1SXRYMzI2YXFLbWVzb0J4VTh4L2RVRXk0eG4vNklwTW81?=
 =?utf-8?B?VHFwZmNNTUR0dDY2SzBhRytaYnVSWnpIMFVTdGQ1V0xDV01ZeTFyNHNBRGNt?=
 =?utf-8?B?QXg3UnVkWFdhK0dYN0ZLV2YxZW1jODJoc1g5aDI3Z04xVUJLTXFOVXdGLzUz?=
 =?utf-8?B?a2FoeXl2L204SzBFS1N0endJcDFXUTdFUllPYlcvaTBHNjc2bXJmdHNNcFlz?=
 =?utf-8?B?Sk9wY0xFSW9XTHFyUVhLVmJua3FraDZJTTNCaWRFWWlteVVGNmNXelFPV0hR?=
 =?utf-8?B?bWdGYlNrVlpWOTA4bG1PNDBYc1hHYnR2R29OQ214TlUvTjhXM3dxV2pTbWIv?=
 =?utf-8?B?L0xlOGpSakEvUGU5bmF6ZHIxMmxEMjFsMHZIbUZhYXdLeHdFMmlIQWwxQnUr?=
 =?utf-8?B?ZFBLeE5vcXVGd2lMZnVZem9SVll5dnQxQXdRUXJXUVlOSTY5ditVY0dzcysx?=
 =?utf-8?B?cTNUMGpNRHJXQ0oyQUhYbW51UXFnRThLb3VQWDMrRkV1VDNjaW9lWW8wVGdx?=
 =?utf-8?B?SDRxVUFkdjBJdGZqVDVUVWZkVTU1NjNSazNGZG9oa1ArNXpPVTYxd0gzVkVE?=
 =?utf-8?B?Z2RNbWl3NXlVMHNsb2FBTlJXRHpMWVp4U1drU1NWa1pmODRWSW1CZjFLa1Z2?=
 =?utf-8?B?MEhNMHk0OGNFU0dnWWJkR05pdFRGVDZHUzhsZ29WZFd3bzMzc0x5Qm1kMGxS?=
 =?utf-8?B?Q1RiWUlNMXNKUkdraGNRTHQwcUUxNDkyWTI2YkcvSGljR0ZLOFZONjU5Z2Nv?=
 =?utf-8?B?eGQ3b1JqU09Zdkp5S0RyWlpWcWhMdHdEZHdoN1VlR1ZOY2tuUEZOVU5lUXNh?=
 =?utf-8?B?aGQyUVFjcjBmMVlVWHBud3VpdWRDZDFPTkF0WTczdFlhZlgvZXVydXdUdjVU?=
 =?utf-8?B?S1E3YnpoMkgzcUN6Z0pyOVZzNmxBVE1JU1JwcUI3NUdpV1pjaHQ5VzVGR2pP?=
 =?utf-8?B?ZlB1c3UrbnYreVRsdnBZWkNUTU9ZSkZhWVQ0dFhCQ2JkdTd3QzZoY2lZbG0z?=
 =?utf-8?B?ZDNQbUdoWHQ4bko5UFdXeENxVmZpUHFSb2FBamRaWnMxVVJSSUs3RmllbTlX?=
 =?utf-8?B?UjUxL0lqeGZnemVoU0xvWDNDb05HR0ZiU0c1SlZhTk05VEtaZWVlUHc5WkZG?=
 =?utf-8?B?ZStIZWhjK3JpbG1GM01rNm1xb3VyU3BnNU41aXFYY1Q1M2R0OXg3cTBXcnZ0?=
 =?utf-8?B?Tk9oenhvcVhnV2NkSGVqMFRyTTcyM2ZyNFh1NVZVbjFmM3kvYnNFQ1Z6SlJ0?=
 =?utf-8?B?WWI1emJhK2tnQ0dHWHpZTkp2Q0Voa0l5Q0QvMUV4L3ZadWYyTmVadlpvZXJH?=
 =?utf-8?B?YThXcUdpQ0w2QTlldDZFenhaamZ1eHdpN1RXaVpTK2h0MXo3TFp2MjJ5MjY0?=
 =?utf-8?B?eEFzd0c3TVRDT01mUEZSdkVURUl4enpES0YxQ2FWTWl4MDRFTXV1OXgyVVNz?=
 =?utf-8?Q?MkdHQrlQ3H0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7850
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fec9ade5-5138-4a63-d081-08ddaedf3fbc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|14060799003|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmUxQnM5QlNUWDFNTktHbHUvOFRqTEdrU3l1NW5zMVVValR1OUZVc25GOVRy?=
 =?utf-8?B?RkhtS0c4M2ZVYVFidTF6ZzRrMTlhSjZtTXhoaG9EODhJZThrMXA2YlpUWkVq?=
 =?utf-8?B?Y1pJNjFTelZySy82ajFrZ3lJQjB2SmVnZWNualNuNXhJV3ZPYTlQQ2FnWE8w?=
 =?utf-8?B?TmlPUm8rZVpUMkNqZEhJZWpGOHphSkRERWZ4V3lxSS9lUGh4WEduVzRSTzRK?=
 =?utf-8?B?MDlPdkxvZWFlYTdjU3ZKRHRYZ0VIbW5IQlRhbUxHaFVNSWNLOVVmemYxOGlK?=
 =?utf-8?B?QnovRlhXUEVoaHR1NTM0TlJXOUs5aXIrVkduNWpUS1cwbWZKYkZIZFQ3R3ZQ?=
 =?utf-8?B?emkwSmRLdEw2RlBYSHo2R25PUVJMVUI5Z1QwQzRKdVRLN2ZMSnZ5cWJCZUxo?=
 =?utf-8?B?OWdmczFXdk1wVmJXRExhZitPOW9MbFlXYjdabWxnUjhEZ2hVVXJzOHJMb3JI?=
 =?utf-8?B?NFgyOFJtaG1zR2p5dHNxeFJPT01RZnRYK2FiREEzVHRlOGdnMEhPT2I4MFNs?=
 =?utf-8?B?ZjR5cTUwRFoxNStJVFRXN2FhWHBBdUIvQ3djSEh1U29JdmVXQkFya0k2bFp5?=
 =?utf-8?B?UFNtT1dxWGtUZkdNTEtTRDZqWWFNSG56d1VIOTkyV1U2d0FKc05xbzdlLzJ1?=
 =?utf-8?B?REE2Wlp0bndHS1hMdndWUStINGhlSkpKQ1FvNHpwZkhTSkpmdnRadkJKNlhK?=
 =?utf-8?B?eGNPdlNlWm1WRFpLR09LVU5jdXRodEhGMm1Rc2xJbHYyaWpFek5hSU5Fa2t0?=
 =?utf-8?B?dkhuWCt0SlVINy8wcjlweCtRZ01YYlhlQmxPTWphYXRsMDEwRkpRaE1aNXVt?=
 =?utf-8?B?YXA3MFZiQUh4Mis4YndlZXFKWGw0c3luTXprVzl5NmgvT1FSd1lmWWVHc2xl?=
 =?utf-8?B?RUE1R1E4ZStJWU5PTm9PY0VieW9jNmxSenRRSWVLZllkbDlsY1loQ2VRRVBR?=
 =?utf-8?B?RXo5SnNJKzdkdHQ5RDFHSHRjT0JzeitHdEorQWNVR01WV0FrbzNOSGFna2V5?=
 =?utf-8?B?ZFRwZC9LZENVN2pIcFRCUlVUTnJ3LzJlWVViTGdFZkM2dStUSnZCTXo1K1Rz?=
 =?utf-8?B?bkdHR3hPRVBzeFZpTk5rL0oyUWUyRUQ4TmJmOEFHWndqK1RnZUdOdWpna2hL?=
 =?utf-8?B?Wis4bEkrQXZjVXVkVWNlRzFPeE5rMHpXM2szTU1QOFFMa1NXbjVqUWx3ZnlH?=
 =?utf-8?B?MGU4cHU1M0Fza0w5RWlCMUtaL1ptQUFFVXdMUy9CQWdkbE5nNDk0Z2F3TTZC?=
 =?utf-8?B?L1ZWMXdaQisyOXVRU01zeTJmcUZ4Y1RXUVJuRjBCMzcyVVU2eGhJcXRQcGMv?=
 =?utf-8?B?ZWw3Y3kwZHFFZlB5TzkrUjFrZlFlc05OMTVCeTZpQWhMa0dyd1M0dU02dnJD?=
 =?utf-8?B?UHg4ZVIzb2p2NHYxa25oUE1UMTI5RUhQNkNvNzZkaUoveUt1bm1qWHJyN1dh?=
 =?utf-8?B?RlBwVHJvR0FSaEVPaUpPa2YzMHB4MkJpRzRYbTFaandrSjlaUVMxZmIwSzg2?=
 =?utf-8?B?MHpXS2dFQWJqckJnNFdsbElPRytVZ21OREY2R3k5bnQ5OCt4amNIak4rRmZm?=
 =?utf-8?B?MXMvYkRaRks4dUlyOWYxeFBjUE1oQTFvdVdoMW0zUmhjYU9tVis3MndaM3NC?=
 =?utf-8?B?d3NObjJQL1o5NHViVHhDMHZRV0M4MXVtSDMzdFoySEVWMnIvb3VmMFpKbUR6?=
 =?utf-8?B?SzJhcmovRE5lRFdQUnJnNDZtTW5vQ0d5by8vMytwcVNkM0txaGoxQ0ZYM0Rx?=
 =?utf-8?B?WmpSUmZ6cWJpRnZMemJjVXVoSDd0WmtYcXZ4cnBHTXRYdWhrb0xXbWFjU256?=
 =?utf-8?B?UVhnS2dWejk0dVZXREFJTVZPODhCZlFRalp4V05leUI3NW92a3RJNThGdyt0?=
 =?utf-8?B?dSt0MEpFU2p4Z2tlM1lvamM3RlgyOGk5ZGNTOG4vTUh4Mi91N3hEZWdrZDgz?=
 =?utf-8?B?YUl4ODhWSFFXK241Vkw4NGR3TWNBV2RRYkxXc0VGc2UzazZldHpZd21qa0JJ?=
 =?utf-8?B?em1rNnpjWklrbTBmQUhNMkxGWkl4VUY0VmRSZHVKZmFrRXFjTnJTNCsxTUhi?=
 =?utf-8?Q?6xG50c?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:13:59.8043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d85028cf-f49a-4bf0-d085-08ddaedf55ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10893


On 18/06/25 10:49 pm, Uladzislau Rezki wrote:
> On Wed, Jun 18, 2025 at 08:41:36AM +0530, Dev Jain wrote:
>> On 17/06/25 5:21 pm, Uladzislau Rezki wrote:
>>> On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
>>>> On 16/06/2025 19:07, Ryan Roberts wrote:
>>>>> On 16/06/2025 11:33, Dev Jain wrote:
>>>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>>>> because an intermediate table may be removed, potentially causing the
>>>>>> ptdump code to dereference an invalid address. We want to be able to
>>>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>>>> between two different vm_structs; two vmalloc objects running this same
>>>>>> code path will point to different page tables, hence there is no race.
>>>>>>
>>>>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>>>>> 512 times again via pmd_free_pte_page().
>>>>>>
>>>>>> We implement the locking mechanism using static keys, since the chance
>>>>>> of a race is very small. Observe that the synchronization is needed
>>>>>> to avoid the following race:
>>>>>>
>>>>>> CPU1							CPU2
>>>>>> 						take reference of PMD table
>>>>>> pud_clear()
>>>>>> pte_free_kernel()
>>>>>> 						walk freed PMD table
>>>>>>
>>>>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>>>>
>>>>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>>>>> we are safe. If not, then the patched-in read and write locks help us
>>>>>> avoid the race.
>>>>>>
>>>>>> To implement the mechanism, we need the static key access from mmu.c and
>>>>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>>>>> target in the Makefile, therefore we cannot initialize the key there, as
>>>>>> is being done, for example, in the static key implementation of
>>>>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>>>>> the jump_label mechanism. Declare the key there and define the key to false
>>>>>> in mmu.c.
>>>>>>
>>>>>> No issues were observed with mm-selftests. No issues were observed while
>>>>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>>>>> sysfs in a loop.
>>>>>>
>>>>>> v2->v3:
>>>>>>    - Use static key mechanism
>>>>>>
>>>>>> v1->v2:
>>>>>>    - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>>>>    - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>>>>      the lock 512 times again via pmd_free_pte_page()
>>>>>>
>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>>> ---
>>>>>>    arch/arm64/include/asm/cpufeature.h |  1 +
>>>>>>    arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>>>>    arch/arm64/mm/ptdump.c              |  5 +++
>>>>>>    3 files changed, 53 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>>>>>> index c4326f1cb917..3e386563b587 100644
>>>>>> --- a/arch/arm64/include/asm/cpufeature.h
>>>>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>>>>> @@ -26,6 +26,7 @@
>>>>>>    #include <linux/kernel.h>
>>>>>>    #include <linux/cpumask.h>
>>>>>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>>>>>>    /*
>>>>>>     * CPU feature register tracking
>>>>>>     *
>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>> index 8fcf59ba39db..e242ba428820 100644
>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>> @@ -41,11 +41,14 @@
>>>>>>    #include <asm/tlbflush.h>
>>>>>>    #include <asm/pgalloc.h>
>>>>>>    #include <asm/kfence.h>
>>>>>> +#include <asm/cpufeature.h>
>>>>>>    #define NO_BLOCK_MAPPINGS	BIT(0)
>>>>>>    #define NO_CONT_MAPPINGS	BIT(1)
>>>>>>    #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>>>>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>>>>>> +
>>>>>>    enum pgtable_type {
>>>>>>    	TABLE_PTE,
>>>>>>    	TABLE_PMD,
>>>>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>>>>    	return 1;
>>>>>>    }
>>>>>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>>>>>    {
>>>>>> +	bool lock_taken = false;
>>>>>>    	pte_t *table;
>>>>>>    	pmd_t pmd;
>>>>>> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>>>    		return 1;
>>>>>>    	}
>>>>>> +	/* See comment in pud_free_pmd_page for static key logic */
>>>>>>    	table = pte_offset_kernel(pmdp, addr);
>>>>>>    	pmd_clear(pmdp);
>>>>>>    	__flush_tlb_kernel_pgtable(addr);
>>>>>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>>>>> +		mmap_read_lock(&init_mm);
>>>>>> +		lock_taken = true;
>>>>>> +	}
>>>>>> +	if (unlikely(lock_taken))
>>>>>> +		mmap_read_unlock(&init_mm);
>>>>>> +
>>>>>>    	pte_free_kernel(NULL, table);
>>>>>>    	return 1;
>>>>>>    }
>>>>>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>>> +{
>>>>>> +	return __pmd_free_pte_page(pmdp, addr, true);
>>>>>> +}
>>>>>> +
>>>>>>    int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>>>    {
>>>>>> +	bool lock_taken = false;
>>>>>>    	pmd_t *table;
>>>>>>    	pmd_t *pmdp;
>>>>>>    	pud_t pud;
>>>>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>>>    	}
>>>>>>    	table = pmd_offset(pudp, addr);
>>>>>> +	/*
>>>>>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>>>>>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>>>>>> +	 *
>>>>>> +	 * Static key logic:
>>>>>> +	 *
>>>>>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>>>>>> +	 * execute the if block, then this patches in the read lock, ptdump has
>>>>>> +	 * the write lock patched in, therefore ptdump will never read from
>>>>>> +	 * a potentially freed PMD table.
>>>>>> +	 *
>>>>>> +	 * Case 2: If the if block starts executing before ptdump's
>>>>>> +	 * static_branch_enable(), then no locking synchronization
>>>>>> +	 * will be done. However, pud_clear() + the dsb() in
>>>>>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>>>>>> +	 * empty PUD. Thus, it will never walk over a potentially freed
>>>>>> +	 * PMD table.
>>>>>> +	 */
>>>>>> +	pud_clear(pudp);
>>>>> How can this possibly be correct; you're clearing the pud without any
>>>>> synchronisation. So you could have this situation:
>>>>>
>>>>> CPU1 (vmalloc)			CPU2 (ptdump)
>>>>>
>>>>> 				static_branch_enable()
>>>>> 				  mmap_write_lock()
>>>>> 				    pud = pudp_get()
>>>>> pud_free_pmd_page()
>>>>>     pud_clear()
>>>>> 				    access the table pointed to by pud
>>>>> 				    BANG!
>>>>>
>>>>> Surely the logic needs to be:
>>>>>
>>>>> 	if (static_branch_unlikely(&ptdump_lock_key)) {
>>>>> 		mmap_read_lock(&init_mm);
>>>>> 		lock_taken = true;
>>>>> 	}
>>>>> 	pud_clear(pudp);
>>>>> 	if (unlikely(lock_taken))
>>>>> 		mmap_read_unlock(&init_mm);
>>>>>
>>>>> That fixes your first case, I think? But doesn't fix your second case. You could
>>>>> still have:
>>>>>
>>>>> CPU1 (vmalloc)			CPU2 (ptdump)
>>>>>
>>>>> pud_free_pmd_page()
>>>>>     <ptdump_lock_key=FALSE>
>>>>> 				static_branch_enable()
>>>>> 				  mmap_write_lock()
>>>>> 				    pud = pudp_get()
>>>>>     pud_clear()
>>>>> 				    access the table pointed to by pud
>>>>> 				    BANG!
>>>>>
>>>>> I think what you need is some sort of RCU read-size critical section in the
>>>>> vmalloc side that you can then synchonize on in the ptdump side. But you would
>>>>> need to be in the read side critical section when you sample the static key, but
>>>>> you can't sleep waiting for the mmap lock while in the critical section. This
>>>>> feels solvable, and there is almost certainly a well-used pattern, but I'm not
>>>>> quite sure what the answer is. Perhaps others can help...
>>>> Just taking a step back here, I found the "percpu rw semaphore". From the
>>>> documentation:
>>>>
>>>> """
>>>> Percpu rw semaphores is a new read-write semaphore design that is
>>>> optimized for locking for reading.
>>>>
>>>> The problem with traditional read-write semaphores is that when multiple
>>>> cores take the lock for reading, the cache line containing the semaphore
>>>> is bouncing between L1 caches of the cores, causing performance
>>>> degradation.
>>>>
>>>> Locking for reading is very fast, it uses RCU and it avoids any atomic
>>>> instruction in the lock and unlock path. On the other hand, locking for
>>>> writing is very expensive, it calls synchronize_rcu() that can take
>>>> hundreds of milliseconds.
>>>> """
>>>>
>>>> Perhaps this provides the properties we are looking for? Could just define one
>>>> of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
>>>> lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
>>>> static key or other hoops. Given its a dedicated lock, there is no risk of
>>>> accidental contention because no other code is using it.
>>>>
>>> Write-lock indeed is super expensive, as you noted it blocks on
>>> synchronize_rcu(). If that write-lock interferes with a critical
>>> vmalloc fast path, where a read-lock could be injected, then it
>>> is definitely a problem.
>> I have a question - is this pmd_free_pte_page/pud_free_pmd_page part of
>> a fast path?
>>
> <snip>
> vmalloc()
> __vmalloc_node_range_noprof()
>    __vmalloc_area_node()
>      vmap_pages_range();
>        vmap_pages_range_noflush()
>          __vmap_pages_range_noflush()
>            vmap_range_noflush()
>              vmap_p4d_range()
>                vmap_try_huge_p4d()
> 	            if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
> <snip>

I meant, how often is that we actually overwrite pagetables of an old vmalloc
object? pmd_free_pte_page and friends will be a hot path if this overwriting
happens frequently, that was my question.

>
> The point is, we would like to avoid any long-sleeping primitive or
> introduce any new bottle-necks which makes the vmalloc less scalable
> or slower.
>
> I reacted on the synchronize_rcu() and rw-semaphores because it makes
> the current context to enter into sleeping state, i.e. waiting on the
> wait_for_completion(). Also, we would like to exclude any sleeping if
> possible at all, for example GFP_ATOMIC and GFP_NOWAIT flags support,
> where i look at currently.
>
> --
> Uladzislau Rezki

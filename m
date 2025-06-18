Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084A2D600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216345; cv=fail; b=AwUKYxFq5uKlDjyzpkX31KGAFGanw16syojp+3JaVEjSswpsXV3k33yEUkLMg/onrTA5Zp2mo9pF4FVJjdb6E0//cJY3s7LD4sbaMX6GcvT0Bw2n1zBkND7nv6QQs0PxtnRQdjPTnRJHOYBHxlAErDCzQL40BfJfVlnJWA/kmX4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216345; c=relaxed/simple;
	bh=ag1IW0dVgbY3wlXQlH/vDqqWXf4fA7VDSEHcpg1g7vk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pbdXDtisDlDWH6ALIu3Me8BKnh00K4VN5PK7Ow+zxA1GklRC6VBiHHT0MBPHWC+tLQ3moQHuFsEPklkVAiYronXAN24I/j/tM3jOGq/VAYG6uY1ea8RUQcDlscM9M0gQghVTxSKzdulrI+yUYUd7yKaioTrMLVW2RDwUSvbwA6s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P55rgWYB; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P55rgWYB; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P55rgWYB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P55rgWYB"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EpGKpi02wL2wK5NuEIUtPHeXUfQmXImksNXTjtcTWLtX1qF7h7xBE8bhXP2LZhHqFymwGZedZi7Q33WimNNn3XUbcehzsoz+YnloogYpOyXk406mwcioB/roAkzwVhBkVBiS5+GnhkDdum4zHmCYsD2evhYnoHKs0jk85vrcOpd5qtJnN+qC0G2VM2dxR9owkQh3Bik1js8dq6jmaaMu0HAMQ3Ew/leuTN0wwOqAspR29qs1HBB0YoqnO4UDx44vxxjkSTSvufzGUum+7hFwkkmAk+tO3nhEL2EZTtdhXroyHfQKXy5HQ6YvKg3X0Yo6yPwPJs7Apkn/hGC+kekvWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUjKZYW+0qj2bplkM3un11DqJF3ufvuhRl8RZdp2/g4=;
 b=vqf7e7oMBP6M/uWgTdiQ1tNiia/+SaYhye7gFQPVtGS3UpxT9zM0IFg7GTgS3a3sym2judk6BPXiN0msfUOpjoRbciE00cDPB97xZyN2e72HVO95bOXs98Xvbi6tnH+MzLodxOtVmKBgKNAyN+h4a41474e8B3/GoqEGIGR9mbQ7Ss9MkHSke61i8UHimAKOTv9PLEBER2VT6YtQTZco1yVK6jCHJVFakcys0L6mHVw7GDLUDcrlz/Ij2voVvbu9pz7vj6tlSDv8lxrkxY88jWh4QOC/8jx1XPU8kmKq/tMJLsiYIVqNdaU6mhOupaYQOkcQOv0N8cnVm/RkKbtpfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUjKZYW+0qj2bplkM3un11DqJF3ufvuhRl8RZdp2/g4=;
 b=P55rgWYBQAQ04GNSwpSbOp/7rB8B7fIui+Dk37AyLxrJQbKRzfhCBDIhn8PUDhYtn7vtUdWJYTTg3oM3Z+PKvpd2b/VBFesSgOkQreGI7rBF1Osihl4uvZ9+jKfGlg7lV/jMmVsvFyrFmXiGLKI5DVeVCzE1M5WsNc2fpp+xmdU=
Received: from DUZPR01CA0257.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::29) by AS2PR08MB8928.eurprd08.prod.outlook.com
 (2603:10a6:20b:5fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 03:12:16 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::aa) by DUZPR01CA0257.outlook.office365.com
 (2603:10a6:10:4b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Wed,
 18 Jun 2025 03:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 03:12:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xotcBKiNeIEM5Lj3dx5Mc5lqR3pNWDm9x1nkN7L34Qq1xB+4uJqJD7rMfKO5kWYGJPxn3jZSF83Q06yiAlBRx5j2oDz/+JtbWwgaa28TQ38eYpD6Zi/Md9o4qpkgMcTQ+ylXcwZXrOwVNuvD6uZbj0fQEFJKYqZYkhejXMalZTX08rhtChcPRbkV5f2+Gu+WjTO1cNSecZTO3/qihI524PdPpkKKne5UPAAwp6+ER6oX0wP639DapSN2o+URDmdJAtQfCp7DRken0AtXQe4Ei73ImVhnmNVsSHJX8WQV6xNp/fGrGRdFixHs1cYrnwRnKamGqxAXRTwfOI5RNSKcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUjKZYW+0qj2bplkM3un11DqJF3ufvuhRl8RZdp2/g4=;
 b=U03Jg/+zHZOnLcwX9kZEK8wW2FlyBeeGofMJ8e3ueFdiNZUU59D0iUYT4H4u1kWXeg4W6vK19YD4vdGRhw9HorCbz4TY4J2jZDH1lymgAnHqIgjVf0TByQdEWhkumSWTOAGpPFiagQ7n9A45zKtfnKikP9FG7s5G2S6AHWCxUN8I6J6HMPtvpLRImO9HMqb2PwIBkrwFX1LZRspdOpcgDVkjAp3DABrFRy1/1FqyNOeJZhJSc8HeKZMOtc6ELRLEgaku0TQeN4UHmJ+jbPfToXylCpLUGeGuqZX/vTjDcJ6YFEpMJxbBmM2v18LNl5wugbPywaeJz2w4pb0X652NCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUjKZYW+0qj2bplkM3un11DqJF3ufvuhRl8RZdp2/g4=;
 b=P55rgWYBQAQ04GNSwpSbOp/7rB8B7fIui+Dk37AyLxrJQbKRzfhCBDIhn8PUDhYtn7vtUdWJYTTg3oM3Z+PKvpd2b/VBFesSgOkQreGI7rBF1Osihl4uvZ9+jKfGlg7lV/jMmVsvFyrFmXiGLKI5DVeVCzE1M5WsNc2fpp+xmdU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VE1PR08MB5710.eurprd08.prod.outlook.com (2603:10a6:800:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Wed, 18 Jun
 2025 03:11:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 03:11:42 +0000
Message-ID: <910e8622-2755-4aca-b17e-0ec8a18a7f1a@arm.com>
Date: Wed, 18 Jun 2025 08:41:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Uladzislau Rezki <urezki@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com> <aFFWw4O2PjOScWld@pc636>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aFFWw4O2PjOScWld@pc636>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VE1PR08MB5710:EE_|DB1PEPF000509F9:EE_|AS2PR08MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7591f0-ed84-4aaf-eead-08ddae15ed53
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?alpwRThURzZvVUxOZDNQVHhkbll4NkdoRUFIcE0rU1dHODVOQjdHQTFTSXNr?=
 =?utf-8?B?YmNhaUYwUWU4ZEdFU0p5bGkzbzhmUUM3VWNsQXl3R3lhOWRmMUtDR3BSRWZY?=
 =?utf-8?B?b3JjVzdhVmk5L0pWV2MxaldqZFIwMktqYno3RTFPTm9jTG1JNkdTVEI1anlV?=
 =?utf-8?B?eC9GWWYybVlJUDE5SHdGVWFoQzRDOGN4ay9IWkVxWGZFdEdNUmlEa085bWV6?=
 =?utf-8?B?V0R4UzFvQVM4ZVdQdlEzWk95OE5wR2d1dGtDRUhmTGZOS2RySzRBOXdhWi81?=
 =?utf-8?B?K3U4Q0pVcFgydmdFcHhMdml1VUV4dUFHYkV4YnBKVFRLQW84SFNqcGdNUW8y?=
 =?utf-8?B?QUthVjZtMmZsMS9QLzk3VGR3R1hFN2l4K21Kd2FxU1RVaHdHejBEOE16RUZE?=
 =?utf-8?B?RUlWcGlkS2lEYlFjMFptcFN6ZGZIYnhSUUY2ODdXclRSV1pyYUtCNjRUVmFz?=
 =?utf-8?B?Y2IrUkgxVkNScVh4V0g1aXBObUMxSTlqZFQ4eVpDM3pyYWdFODN5aEM3Z3Ay?=
 =?utf-8?B?RHRGN3p6ZFVyc0xuSDF1K0JmYk9PenZPWDJlWXUwak5YQTZ6MVdyL2x4RFY5?=
 =?utf-8?B?U2lEdWp2QWtGeDF4Y2YwVGJCbVdDTVhFTDRWVWFFL0hnSFJKTGVkR0dBRVNU?=
 =?utf-8?B?YXpiVTJaR0xweWRSeGtvQVdlaTR3d29ocXVWdGZQSjM4R0E1S1VtM0tMRkx3?=
 =?utf-8?B?NlVWZVlSVTR1ejZUK2JTbFBXQm9KQXpoeGhHZGZEVVNjakNVRzNrS242VVNy?=
 =?utf-8?B?V0kwTmJUYjgvRGNDazNURTd1VngyQXpiVDFKaEFKTzNaZFJIMTRsYWFIUnd0?=
 =?utf-8?B?V2Jkci9VdzlZbG1UcHptQWpSbEV2ZkFtSk04VDlqSHhHNFV1eGh6RjRFQVhi?=
 =?utf-8?B?UzhLVk9RWlFUUnE2M0krM2Y3UnY5VkFtMjVYaEFwS1JFS1ZZK0lHT2NaSHpT?=
 =?utf-8?B?T0s1SE13QWdFSVJhUE5qa0xIUG5Rc0loWHlOQTlxdklhb3FDY0RQT1BXNERU?=
 =?utf-8?B?dndTSERDdjc2bHVKUkFuSkViM29meHZFQm5sSlFIQnlYS2ZwRXlMbjY3WVZp?=
 =?utf-8?B?NWRGVkVVRzBuWW5ORnpLN21ONkRkNW9KZkR5a1hPdDdtcDByaXFVMFM5RG9r?=
 =?utf-8?B?RVFzL253UXd5ZFcvWjlRaTFTR2psYmhia0tFdUpRZExsTXdjM3hkMWszMnBx?=
 =?utf-8?B?dWI2NW9MU0JoUjlFL3l1V1BFakxQdUR1KzFhZC9iVlhxeUZGenYvZTNKUDBm?=
 =?utf-8?B?WGRueVpJWnJReHFYNjZGOWo1WFAxSkhPcDlZMVVOdkMwdnhmbWtWcXMyOGJI?=
 =?utf-8?B?TVZ0NldlNm1JVmtZWUZBRS93eHdUaFVJTDlkLzYyY0Z3U25sRUZXUTZwRkw2?=
 =?utf-8?B?N2xhWG1HajdNSHlqNU1yTGprWlNhZEE0N0thbk5renJtaGtFQ1RmK3hQeEYw?=
 =?utf-8?B?ZlhuYW1hbGsxYWFSdUpKTE5FQzZhS3pxQkRoektvT0QrbFhOd25KWHVST1JP?=
 =?utf-8?B?QW13aXhXWXM4b29qQ0djVHhkWWZDWGlncUxCNVVMUWZPNTNlUC9FcXc2aGk5?=
 =?utf-8?B?MEtBSzk1UzcvNFJJemI2WkhiazZja21pTGExZGR0RldoOE5jRzMrL0FwbTVX?=
 =?utf-8?B?bk9RaktNbzladjFsc1lXWlo1RkZyNWw5UWRmdjMvV1I0bDVYUGhxWHpIdGtP?=
 =?utf-8?B?WXBnVVFaTFk0NFN4a1pKckpIL0ZNZUlZZitKcXh3S2c0TG91RlloTUZIcHhn?=
 =?utf-8?B?dUtvSzczSWp4Qnh6VXBNSE5KRzlRMlVTQnRhNEtjOWdsR3lRNnlzZjZDVUtz?=
 =?utf-8?B?d2x0L0gxdTBLSjhDamVTQ2JMN09USlhvaGR0cGc4cHphWTBSZXlyTmZPK2RV?=
 =?utf-8?B?SVFkbUhseDJVMzNKN1lnZDlhcGxsdXRUMlVDaktUK1J3Uk1jSW1Ta0RsV2la?=
 =?utf-8?Q?qEesm/pDjI0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5710
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb58dbbe-400c-42b5-2b1e-08ddae15d971
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|30052699003|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0JjeXU2VHBWNUhxMU1BTEcrbUd0eTF4RVVuT0dqb1ZrM000dDU4ZWQrTHM4?=
 =?utf-8?B?Qk45Rm5uSGE2VnRaaG1zZWhacGhhVk9lZE0yR2hIYnhORVZpTzMwUENlTUJz?=
 =?utf-8?B?NnBwRnhDN1RoOWw1SW9jUWxVOGQ2ZGpabjdFWXZKcWZnVE4wY1JtU2tuT0hl?=
 =?utf-8?B?RzhPNjNlaGZ0NXF4dWtTVXhNVVlqTlRkVHFUZnhML0VVVHVNcEo0cGdZdExx?=
 =?utf-8?B?OUp4K1ovL3dLVXVqek5QM2NmaVFieFpPMnd6MHllbWlFM1hibGtIYlZnWnVa?=
 =?utf-8?B?MlNWZURDZi9XL1gxdkV4NytMdjZ4cG5JWG9FRVRMVnA0RUgwS0NmSkhHYldX?=
 =?utf-8?B?MDlWRWg3d2dvOTRLb2NEbjlFR0E3eDVWNDI3K3lUblRnNFk4bmp3Vk1WaEc3?=
 =?utf-8?B?T1NrQ0o2VjN4S1BoV3didjZJRnBhRW1IRkhYNHFuU0xPZWxIbHNZNTdNcmJh?=
 =?utf-8?B?RjJOVXRxd1MwQ2toYnZIYllkYktlakpOM01ibkFFQmhmVXZVWjZBN3JyMkow?=
 =?utf-8?B?MTFPK2lWaitjUHRRVGpwUHRLNnZHZXU2eEQ2WENtbUZYWVo3Skg2TkdqVlVD?=
 =?utf-8?B?amIvWVZFTEwxNkFlUzZGNTFKSGF4ZjVVc2lUem9sZEcrY2Niem1QRWhZRytk?=
 =?utf-8?B?UE9CUWo0MlU0ZVlQdnBBVFJZZUl0cVN1dXcvWTQzeENpbk9RZmM5NnJ2ZDZB?=
 =?utf-8?B?c3VJU2VnZ3BZUFNFNUp6SWtYSkhxQTVOVzBIdWhQQmZzZUFOSVVWYVAxWWRo?=
 =?utf-8?B?UWVrRnhxM3oxajUyZjMxTFpOWTE3SXdnZmpMaXF3aTY5S0IzNnpJTlloZ1Aw?=
 =?utf-8?B?bjI4WGlOTkZoTlNpczhwM0pBVml2Y0NqeG1iRHNCSzRmRHJTZ3p2ZTdUS0dX?=
 =?utf-8?B?VUwwVDNQNzF1R0ljdmEwMEFTUjNxUjA2OE90dkNsdW0yd3RjdUNpaXVENEU4?=
 =?utf-8?B?Q1JhSUJoRXRDQkY4N1JZVnN1WFJCOXF2S1NKMElOOWR3cjNBNTZLSExOd0hV?=
 =?utf-8?B?cWdPbVVhM2wrWmUzQjFrd0Jjekp5dTJmMTFybFJnZ2QrK1duM3I2UncyOFhQ?=
 =?utf-8?B?bEg1YlpLcGxsYWFmeXJrUkNmdmN4aFB2ZUFWa1B6RU5SaTErc0Y4d0oydEtJ?=
 =?utf-8?B?Q214YTFCQlI4WEM1S2NrY1VpUlVNd3EvWVNvcnNiNVNxalBzQzE0S1A2emFy?=
 =?utf-8?B?Z0tVais0UVBDZ2lja3dvU2pOYzZlazloRk1OdVRud21qSC9ERlNXWGNRTGhn?=
 =?utf-8?B?dTBSSlBQc0QwUzM3NG5sMzZsem1vQSsrOTlxR00rYnA5bzU4SWp1Y1AzQ0o0?=
 =?utf-8?B?Ums1d1BmMlhGSDBUT2ZiVHBMQ1FiZ3NYNWJYZmxoNy9FU1RKOGFmVUFlMnZV?=
 =?utf-8?B?RkpiOUpkTlphNWJQcmxZdWNzb1Z4SkdSZzFQQkF2TU11NVp0YTFCNnViZmJS?=
 =?utf-8?B?MVBqbHdyU2c5WVNVOVBWNHI4a1lNWU1xNTFGdmdIditJM0Q3THA0dkVlRkI3?=
 =?utf-8?B?SW9UL0R6YTFqZEhpbFRSUmRpMHMxL1dSQUg4SUVlSWlLVDRDUEQvNU4wQWE5?=
 =?utf-8?B?cFFtc0RrU0E5bm5VWXNvUnUzeDZyaUlrUXdGWGFlV0Z6T2k4YVRmVXRjUktm?=
 =?utf-8?B?MFFEaHIrWmM5WDZkeHVVOE5EcUJkV1NIamIzWFVWY0UzYmtVRDBHMkVSSFRP?=
 =?utf-8?B?bUZnbHhpcmtjK1ROdnRCRldyS3VxR3BNVVN2L1hEb1lQbGFuREVHNTZDaTdy?=
 =?utf-8?B?eTJFZHdPckl3YVdWb0wyQmFsQVAzNzZVaWppUFNKcm1qcVVSSTNOSUg1d3hG?=
 =?utf-8?B?VTZGeTlWajl6dVNQUTRFZ2M0UHVkeEJaSWY1VFhsUURnNVo0cVZPNHF1NHl6?=
 =?utf-8?B?YVV0RHd0c0c1Ny9MRnFTZU9RSXNaSDRYRm1yOE14cUxYd1lFL3VwZG5RN0NV?=
 =?utf-8?B?QmcxdFFSc29IWHFRUjRici9JVDY5TVROWW1FdHp4UzVGUlN1VTlVeGljS2tE?=
 =?utf-8?B?dFkybVhlQlJXOVBMUDVXeDFzWmpRUG9aMGJPZXRnWHpTS016cDhBU1J6clIr?=
 =?utf-8?Q?ElSprG?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(30052699003)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:12:15.4660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7591f0-ed84-4aaf-eead-08ddae15ed53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8928


On 17/06/25 5:21 pm, Uladzislau Rezki wrote:
> On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
>> On 16/06/2025 19:07, Ryan Roberts wrote:
>>> On 16/06/2025 11:33, Dev Jain wrote:
>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>> because an intermediate table may be removed, potentially causing the
>>>> ptdump code to dereference an invalid address. We want to be able to
>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>> between two different vm_structs; two vmalloc objects running this same
>>>> code path will point to different page tables, hence there is no race.
>>>>
>>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>>> 512 times again via pmd_free_pte_page().
>>>>
>>>> We implement the locking mechanism using static keys, since the chance
>>>> of a race is very small. Observe that the synchronization is needed
>>>> to avoid the following race:
>>>>
>>>> CPU1							CPU2
>>>> 						take reference of PMD table
>>>> pud_clear()
>>>> pte_free_kernel()
>>>> 						walk freed PMD table
>>>>
>>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>>
>>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>>> we are safe. If not, then the patched-in read and write locks help us
>>>> avoid the race.
>>>>
>>>> To implement the mechanism, we need the static key access from mmu.c and
>>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>>> target in the Makefile, therefore we cannot initialize the key there, as
>>>> is being done, for example, in the static key implementation of
>>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>>> the jump_label mechanism. Declare the key there and define the key to false
>>>> in mmu.c.
>>>>
>>>> No issues were observed with mm-selftests. No issues were observed while
>>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>>> sysfs in a loop.
>>>>
>>>> v2->v3:
>>>>   - Use static key mechanism
>>>>
>>>> v1->v2:
>>>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>>     the lock 512 times again via pmd_free_pte_page()
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>>   arch/arm64/mm/ptdump.c              |  5 +++
>>>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>>>> index c4326f1cb917..3e386563b587 100644
>>>> --- a/arch/arm64/include/asm/cpufeature.h
>>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>>> @@ -26,6 +26,7 @@
>>>>   #include <linux/kernel.h>
>>>>   #include <linux/cpumask.h>
>>>>   
>>>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>>>>   /*
>>>>    * CPU feature register tracking
>>>>    *
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index 8fcf59ba39db..e242ba428820 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -41,11 +41,14 @@
>>>>   #include <asm/tlbflush.h>
>>>>   #include <asm/pgalloc.h>
>>>>   #include <asm/kfence.h>
>>>> +#include <asm/cpufeature.h>
>>>>   
>>>>   #define NO_BLOCK_MAPPINGS	BIT(0)
>>>>   #define NO_CONT_MAPPINGS	BIT(1)
>>>>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>>>   
>>>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>>>> +
>>>>   enum pgtable_type {
>>>>   	TABLE_PTE,
>>>>   	TABLE_PMD,
>>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>>   	return 1;
>>>>   }
>>>>   
>>>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>>>   {
>>>> +	bool lock_taken = false;
>>>>   	pte_t *table;
>>>>   	pmd_t pmd;
>>>>   
>>>> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>   		return 1;
>>>>   	}
>>>>   
>>>> +	/* See comment in pud_free_pmd_page for static key logic */
>>>>   	table = pte_offset_kernel(pmdp, addr);
>>>>   	pmd_clear(pmdp);
>>>>   	__flush_tlb_kernel_pgtable(addr);
>>>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>>> +		mmap_read_lock(&init_mm);
>>>> +		lock_taken = true;
>>>> +	}
>>>> +	if (unlikely(lock_taken))
>>>> +		mmap_read_unlock(&init_mm);
>>>> +
>>>>   	pte_free_kernel(NULL, table);
>>>>   	return 1;
>>>>   }
>>>>   
>>>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>> +{
>>>> +	return __pmd_free_pte_page(pmdp, addr, true);
>>>> +}
>>>> +
>>>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>   {
>>>> +	bool lock_taken = false;
>>>>   	pmd_t *table;
>>>>   	pmd_t *pmdp;
>>>>   	pud_t pud;
>>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>   	}
>>>>   
>>>>   	table = pmd_offset(pudp, addr);
>>>> +	/*
>>>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>>>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>>>> +	 *
>>>> +	 * Static key logic:
>>>> +	 *
>>>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>>>> +	 * execute the if block, then this patches in the read lock, ptdump has
>>>> +	 * the write lock patched in, therefore ptdump will never read from
>>>> +	 * a potentially freed PMD table.
>>>> +	 *
>>>> +	 * Case 2: If the if block starts executing before ptdump's
>>>> +	 * static_branch_enable(), then no locking synchronization
>>>> +	 * will be done. However, pud_clear() + the dsb() in
>>>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>>>> +	 * empty PUD. Thus, it will never walk over a potentially freed
>>>> +	 * PMD table.
>>>> +	 */
>>>> +	pud_clear(pudp);
>>> How can this possibly be correct; you're clearing the pud without any
>>> synchronisation. So you could have this situation:
>>>
>>> CPU1 (vmalloc)			CPU2 (ptdump)
>>>
>>> 				static_branch_enable()
>>> 				  mmap_write_lock()
>>> 				    pud = pudp_get()
>>> pud_free_pmd_page()
>>>    pud_clear()
>>> 				    access the table pointed to by pud
>>> 				    BANG!
>>>
>>> Surely the logic needs to be:
>>>
>>> 	if (static_branch_unlikely(&ptdump_lock_key)) {
>>> 		mmap_read_lock(&init_mm);
>>> 		lock_taken = true;
>>> 	}
>>> 	pud_clear(pudp);
>>> 	if (unlikely(lock_taken))
>>> 		mmap_read_unlock(&init_mm);
>>>
>>> That fixes your first case, I think? But doesn't fix your second case. You could
>>> still have:
>>>
>>> CPU1 (vmalloc)			CPU2 (ptdump)
>>>
>>> pud_free_pmd_page()
>>>    <ptdump_lock_key=FALSE>
>>> 				static_branch_enable()
>>> 				  mmap_write_lock()
>>> 				    pud = pudp_get()
>>>    pud_clear()
>>> 				    access the table pointed to by pud
>>> 				    BANG!
>>>
>>> I think what you need is some sort of RCU read-size critical section in the
>>> vmalloc side that you can then synchonize on in the ptdump side. But you would
>>> need to be in the read side critical section when you sample the static key, but
>>> you can't sleep waiting for the mmap lock while in the critical section. This
>>> feels solvable, and there is almost certainly a well-used pattern, but I'm not
>>> quite sure what the answer is. Perhaps others can help...
>> Just taking a step back here, I found the "percpu rw semaphore". From the
>> documentation:
>>
>> """
>> Percpu rw semaphores is a new read-write semaphore design that is
>> optimized for locking for reading.
>>
>> The problem with traditional read-write semaphores is that when multiple
>> cores take the lock for reading, the cache line containing the semaphore
>> is bouncing between L1 caches of the cores, causing performance
>> degradation.
>>
>> Locking for reading is very fast, it uses RCU and it avoids any atomic
>> instruction in the lock and unlock path. On the other hand, locking for
>> writing is very expensive, it calls synchronize_rcu() that can take
>> hundreds of milliseconds.
>> """
>>
>> Perhaps this provides the properties we are looking for? Could just define one
>> of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
>> lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
>> static key or other hoops. Given its a dedicated lock, there is no risk of
>> accidental contention because no other code is using it.
>>
> Write-lock indeed is super expensive, as you noted it blocks on
> synchronize_rcu(). If that write-lock interferes with a critical
> vmalloc fast path, where a read-lock could be injected, then it
> is definitely a problem.

I have a question - is this pmd_free_pte_page/pud_free_pmd_page part of
a fast path?

>   
>
> I have not analysed this patch series. I need to have a look what
> "ptdump" does.
>
> --
> Uladzislau Rezki

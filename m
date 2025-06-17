Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C581624DD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128921; cv=fail; b=eXg6BLJq3WO4/9lMGpkC3oPUyuC9B902YR8Rb2pSQDubhj8ti/cDPc1Oq4z1hBIRjGuwc7ZmQkMpeCT9PEE8aMeml/hX3ZcdlT39Qq52IUKYPJavtVE8SpES4iAqKlQSesjYbbnKZGR6y4vWCMNEWRBWff6T1Nfz++ZMaDwLRMs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128921; c=relaxed/simple;
	bh=RS2bo9Vve/Ec1lxx5FJx2aw1VAtI7T7jbDJFCSMN4Jk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HMkTOLMyIy9mvdvpa6SntOIPBRvGM1whqwvJArOubel2xxPpIbGkr9NRxXSz8nOX4DjEcJRvNhIjNyOETD6jJjhwFqKGUgP/wlV+kodejq0CQmKqR7FAKv1cRaovTpGQZT8mbh4VcxBdS7piI1GKMG/LOijzd/zN6HK/TjcVTxk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NP3Ui0cU; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NP3Ui0cU; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NP3Ui0cU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NP3Ui0cU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HWZRYRDVAPnmiTf/hSGUcVDRqRbutRz14OES7tWDIM/h3Z4x6kNfvVl0WmGpBsEVc7tkqeko+1UrkVgWyQLDo8mJSlc1S0l/9PuNGWBlGHQE+N275VsVxQst+/Y3EMG0/NsLf7NKir5sG33xeMvnXKmLRjt2/NeSgRXJxG8Zcw53IwbZQhebSF2qSM1+0QyRMMVbCED7KZfPgzOyWfiaIcWkTqLSvfHX0OyXSAa0mH3I7WgYPM4qorAlGeE3ai6P+qNjbvt6f8KlZ1TWr3Oi52ok3Fau2xR4PtNngg2GC4imYnklSAye0JCCwsCjWAw5Wpxh0dNSfmBpNZl47Rox1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlqwgEzkYL4CQVqbvxkeA6fjP6rmZF3lT21ttocoQ5E=;
 b=Yka+fEdk+DRjmZyM229R0wrOteAW1ukQOKnOwMy9+7y8SYSROkTozP8Ye4RFL48R7KjnCTZJ+zEbYt2X3UDTJCuZvq//ip+WdxtHhTETrmygWckveFx3xl/6fsP928ujfP+0OWlqotmalrK3unnC8hUqGl+gXwCPC2iksTk81+FJj/xxfcQ0TPEpySVBQhPjgiaTa97bi9z/xDVUUA1LUMshg0Jc7OgOcrXg277EGi7KP8/+wGfjqSVM4fx0TLWyTT8cHyEAPxITa5CrfoRe5ueDrzqXWoXcFZZUAguMj9j2kY2qsr0H1+KDdTrGMCcP42PdLWWDHA5nXoBRKUpU9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlqwgEzkYL4CQVqbvxkeA6fjP6rmZF3lT21ttocoQ5E=;
 b=NP3Ui0cUAUk/vj7fptnCkipOwdibUCyG2KdmrB+bOkoAMofSzc1gRODOzIzduHexn+P/vwYDdGvP42eXpNncDRiZE3zXbqU1lA/fSjSFXPwQ0hbIqILzVMRuzbzKhrsZfhoLqrIHb+ue+MdhvAaXuezDuTcmXaenvqmY2dqDEKo=
Received: from DU7P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::18)
 by GVXPR08MB10431.eurprd08.prod.outlook.com (2603:10a6:150:15c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 02:55:04 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::21) by DU7P251CA0012.outlook.office365.com
 (2603:10a6:10:551::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 02:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15 via
 Frontend Transport; Tue, 17 Jun 2025 02:55:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5CiO1vwvAYZNdFXShN4WRuNhm5FUZw6DKr88+YNvszldd/jAgDzlIlcSCabMPkr5IDI0UbxLfyrrvma1rOWbKaSbyIxlRTogalQcstVVdLUQr1+bKGHmJp/iutgw+rz1Fr6GvjNQEOPNgwy4uYBiH5IFoAuUo3hcKHkk0h/+tSZX8dAj2qAbGWDP28LGlebPrxbANWo35e7vtUfO6yLIJr03RM49wkV0V66EFVX7B6NkXR96RxVP648muBHMDGGEpilWMIyjYMpfGdb1zSlvs2J+ZaqH1lu4NTm9rvpICZ0s1hUzfWLhdbdukbSFGarufIF/OgYAQKY+KWwT29p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlqwgEzkYL4CQVqbvxkeA6fjP6rmZF3lT21ttocoQ5E=;
 b=n4IthJjTFZeZLOW0tfRC++ZZtXr40WxjMIUPvCvIY0MsAyu5GcRDa34SltQXuD/IMvzFJQ789NhKzk1l7O+J5jk98iRnhfHKI4gmT3/sqzU3iFsKlkXCLhvIp7vjldub4BsQV4lDNN2DGrmpsiSrPLmFrPzLCa+jMC5J+jESbRw7qisqyQb9qpm4YPVeLJLZaMRUnm8RbDlcS0Z7txkFx2YkxH2+RlhUwsQgc6ymyd4Os3O8t2RWwbUgXpzbng3dXIBhi8qF6G9Qb8y8QxoJ2m1cdByLlIp72gCjPttWAooExA1V3gIf8jDAPVpZemODFI9ufhNvKI5PPEsC5OpgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlqwgEzkYL4CQVqbvxkeA6fjP6rmZF3lT21ttocoQ5E=;
 b=NP3Ui0cUAUk/vj7fptnCkipOwdibUCyG2KdmrB+bOkoAMofSzc1gRODOzIzduHexn+P/vwYDdGvP42eXpNncDRiZE3zXbqU1lA/fSjSFXPwQ0hbIqILzVMRuzbzKhrsZfhoLqrIHb+ue+MdhvAaXuezDuTcmXaenvqmY2dqDEKo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB5893.eurprd08.prod.outlook.com (2603:10a6:20b:23e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 02:54:29 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:54:28 +0000
Message-ID: <5f7b0a4d-fb3f-43bc-9f2a-3951222cfff2@arm.com>
Date: Tue, 17 Jun 2025 08:24:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB5893:EE_|DU6PEPF0000A7E1:EE_|GVXPR08MB10431:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a3f270-0421-4140-20cb-08ddad4a5b2f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MW1GSW1vZmcwdUV1RXY3ejJqc1hrOVVEK3RyelJpSDgrSlNKNW96N0xPVVlJ?=
 =?utf-8?B?SjRpamZLbTRoSGFJM0VtRXIwTzByVVJHcDkyVHlSVFZBSWhYL1RLZW9YL0pC?=
 =?utf-8?B?bDVMTTBoNk5ZOE1OZjd3NThJaUQ2RUZ3ZzB5MGFBV0ZyQlRDTmxEN25DYnkw?=
 =?utf-8?B?MEw3OXYzSmtGUVQ1RzZHVGRpVCtnWnZaZTlSeGFvVlhSL2pmU0dVWThQTVpj?=
 =?utf-8?B?QzB2UStnZW55cFJUMStlTG9vdkxDZWtRaXBUM0o4MjhFbmM1UE16N1kxWWkx?=
 =?utf-8?B?djN1eFhXMi84aUNpdm1SR2djQUZDYys1ZGZid2YxWWgwL0NPVm5aMzhXS1ph?=
 =?utf-8?B?SWs0VitwT21QTEpReHQxa003cERKWWRkbHpaTEJ4VkI3ZDZsbXFGV3BIbWxN?=
 =?utf-8?B?UnFYUTJramlVSnZMaFQzYzJKN2RLM2lvUnZCcEMxTHUweFZXTXcxWURIakhT?=
 =?utf-8?B?YUhtVVZVb0FxRnIxVXArZ2Z5UG1NbVk4OEtCV0FGY3prbnVkcWRxc2dNRFhs?=
 =?utf-8?B?YkhpVDV3OTRSMkd5eVRlRzdFUHZ5R2d4OVZMQmZVSStXeDdrdEZ0SUNNNC9R?=
 =?utf-8?B?TVQ4QjFta2crc2tkUXdGTmZSOUlaYkhFREVFdlV3THBCRG1CUVNUZG9KMFMr?=
 =?utf-8?B?ZWlIbFNUSnl0K1VQZEZVQ3lpU1JjNXhld3lRSTAwMHdnS2hieTJPOW1KVWtN?=
 =?utf-8?B?RStzamIza1NHbnJ3R2Fhc2Zab3JBdDlvZ01TeFVXcjRkWnRnd3FDYzJ3T2xX?=
 =?utf-8?B?dUwxS0J0a3VNUkMrK1lQMVR4TnRWcUgreEtwWEZRci9GODROWWVLeWdWandw?=
 =?utf-8?B?TWIwOGczTWwzQTRTQkVpL1hWUWN4M1hiV3M4WFJKdWJTYXZKTTZaM201Uk4w?=
 =?utf-8?B?N3pWQStVTXk1R0oxSDRNaVRKOVAxRTRJMEhaRzFIcE4rWkEyUmZ3WWJYSHhs?=
 =?utf-8?B?VTcrTnQwbzgwYmx0WVdhQWVVdWIxTFhqVGxFQUhSYXJVbm5aNEpuSWJ1V3lq?=
 =?utf-8?B?WUNYQ1EwR0RNN0FaemNWa0JkdXZlSVJUbDFyOU1UcGdLdXZLd0sxQ0RneklY?=
 =?utf-8?B?aitsUmJIcDd4V0FVUkVHV0NRNXRJZDZzWTl2WlNEeDBNU042SzUzWlcwL3di?=
 =?utf-8?B?MmNqNXZ1OFNnNFRrM0xZcUtwdGI2YUlmZkZCcTBMSWJ4OHZKazRVdUZwcFhx?=
 =?utf-8?B?WkYwWVA1NlE1QVQ4UFQrWkFCWHI2TUljNWR0bVYzaWhrWFRxZFhzYmdDcUFL?=
 =?utf-8?B?MTBnZ1h5T2QyQVVzYktibUwwQlBiQkthUlI2VHpZZzNiSGtjR1hYdGJtNW56?=
 =?utf-8?B?NnkyaVhONHBaZGY4Z3hBV0JVYVhEMm5BYXYxdUV6RkFGRURFZjJwSTR6c28z?=
 =?utf-8?B?VmY2YzNQNHY3TlRiMXliQTNDT016NEdnOHJyNlplTjBYSk1GeTVuaVpKQ2cx?=
 =?utf-8?B?enZ1UkhqL0dSL0Zva3BHNWtveE8ydXJKdDVOcENUc0FWQkFRVUpoZmlyVWp6?=
 =?utf-8?B?N3RhK09WY0N2TDZsR3NqMFJPMmNpQVRDTXNmMmFLTWJKelpJbXFTKysrZjVX?=
 =?utf-8?B?VFpVVXZ4MUt0ZkJIZXZVNmxwcHI3UXQxcmJ2Mk96QkdtOUhHV2NTYlo5YkIr?=
 =?utf-8?B?emgrQWtjQTV1N0pXaDh0U2QvLzU2eUtZdVZPKzlrbVRWaWcrQ25pamk1RjUw?=
 =?utf-8?B?eWlTazZZSkRHWE1BTjJzZ1hvZEo3NW5Iem9TRTRFRzNHTXNlODlvVlB4QTZz?=
 =?utf-8?B?dmp4S3dPTk5aRm85MTdVczhUb1hzTDRmaWJoY2Zhd3FnVGNFRmMxd0Jvczla?=
 =?utf-8?B?UExHNW12RXJwNG9xOHowMU0xOXZkM2h6U1J1Z2FvbVJNYmhSbkhLcmxlOThs?=
 =?utf-8?B?R1dRTmpBaFF3T05lYXZGdit1TkQ0V1haMnRCSUhvZ2VXbjlaNU9xZzBSSTNu?=
 =?utf-8?Q?m9W8TFUUdrs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5893
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0fbf80a-9491-4d66-35c3-08ddad4a46c5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|30052699003|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm16d1lHWTBRSUtnRkpqdkw3MnpZeFB5L3RjVmxuWWRURGJ1N2pyajdJN29l?=
 =?utf-8?B?VS9OYTdRSnhGeWxhc3hoMjNPT3VrS2x4YlBDNmVkVVV6SnRDK1lxeGZBRG9V?=
 =?utf-8?B?YWJJUEV3eHVWOUlSWFJLOFFlN2tEbWxPTHhUMTErQlRxbXJIaWJDYmZwSzA2?=
 =?utf-8?B?Rm8ydTg4Q0lpSTRjVUY3a2dPbDJ6YmlvdnBVaU1oS255OE5ybGp5Mm9HMWE2?=
 =?utf-8?B?cFJwWGRIRE5OcnZNNy9xM3F4bCtRL1orT3ovS0loaHljQTRHUXpGeVNDbEtm?=
 =?utf-8?B?ZTVwaUFnV2lMc3hMTlBoSDAza3NTQXRBL0Vkbk02SHBweDFVdW5JS1J4bDF3?=
 =?utf-8?B?SWljdjQxdENmY0wyQ1BSZk1KTXZuTDhLMXRGOWpnTWMyQkpONkV1cDZsVFNJ?=
 =?utf-8?B?dzhTSUMrUEZnTHBtVlhvdURVODUyaHpvWklEb1JhZm9DRFJ4c3ZFUFlRenU4?=
 =?utf-8?B?a2JEdHZlRmQyYjFpdFBhSlRiTE5UZGNZSkx4ZDdnQTgrWEdiN0VWYlpkeDBm?=
 =?utf-8?B?SkpwTVIxYmZsRlBzR3pmMFdObmVFSkdIZXEwOFRZVThGZEJuZko3Mk5xdDFN?=
 =?utf-8?B?ckV5ZlpIQmp3Z3Fja3NNN1V6VU54K1lsRWlURGJMbjA0dWVDUGJWMFYvRWpI?=
 =?utf-8?B?dDFqeWRNaWFxMjVYSkpXSHZzQlRRWTNHM1MxWjNpZS9iVVRMTkp5SU1IRjRl?=
 =?utf-8?B?UTlRU3FScGlSV1lTUU9pODlINGhRcVJkSVRJMTNSN2EycDcxTDJPMWpkSlEy?=
 =?utf-8?B?U0dQc05PbXVXbnVzYktNZVkrVnc3cmJPTExYZ2l6Zkc2bi9yL2dkMk1nNjJW?=
 =?utf-8?B?QUUwcW1KckpodGtzbit6TWkwVzgzODhjYUJLYzZxSlRIckU3RWVZb21IOE5U?=
 =?utf-8?B?RHJxSjNab2ZLdHByeFFLZ25temVYNFk0dWJtdlFmaHVyaVRyanp6enF3OUUr?=
 =?utf-8?B?NXhmNGVYb0NzazhvY1NXQS8wcWsxU1l2SGFlK00xb2RuTHpKempCZzc3WjNo?=
 =?utf-8?B?L3ArQ3pCWExJWjVIUmU5MCtxcmw2NEQ2cU1hU005SGFaMkdPRXlyRlNKNGgv?=
 =?utf-8?B?Uktmd3ZXWFMzQjFoaGU4dDVDMEpBNDlGdXlCOUdkMkdNUVNMMUZGblRnSkpz?=
 =?utf-8?B?TVE0ZEpEYWJ3VWdPNklVUitKL1RYaFQrblVFd2lxSGtYZEVWZVJRZ0laTSt3?=
 =?utf-8?B?THcyM1MrUmlzb3ZQSFluOXVUeldpd3J1YUFzWEJ2SC9zaDFGZ3Zid2RDdEpo?=
 =?utf-8?B?VlR6SWJ4cVpMTklmSnJaYytCZzE0RUhWTXV2bjJVa2lkYit0YkRrYzlhTk9j?=
 =?utf-8?B?M2NObnNwa09wMHRKd0dNT2x5bWtVV1h1VWszVmpzeHJtcU5xNFYzY2kxNndR?=
 =?utf-8?B?RzNKWGIzZk1mWE12WnQwb3F4emR4YWZ3akdzQng5ank5K1dBcnE1QVl0VFVE?=
 =?utf-8?B?V1czQ3gyWTNTeDBSaEpXRjdra2srMUJRUUQ5YXlWWTRyM0U4aDU3U0pVRXcz?=
 =?utf-8?B?VXhQZlJyVDlWZFg0SHIwTGhDUitRODRLMkc5ZzJQNnlKYzhURzRqcHV1aDBj?=
 =?utf-8?B?WGNqRjJ0eGtvdGoxd2liMDJJbFNVdjhJNkdhM2VUUW1WS3pERk1BUi9jQ3o3?=
 =?utf-8?B?MnpkY2V4MTRMbzNsMHJGaXYrRURaRHlhMENERWMvMUdqdUpUTUR6NUkvSE43?=
 =?utf-8?B?VXlHT0ZGSE9UR25HeUpZR3FrMURxWGg2dkRuK09TM281TlY4RWFFcmhMQTRJ?=
 =?utf-8?B?QktZWUVqNUp6WXN4bFpoVHlxRC9nWVhpVHFXdFAxVDhSTm9VSldycC91T1Ur?=
 =?utf-8?B?MW8zMmFvRVZ4ZE5jTnUrMFRyOWpSUHpxYUhwZkpZL3FWS3N4NmR6ekt1S3hU?=
 =?utf-8?B?bitKckNKMk96dXFlZlB6MTVXOUpuVFV6WTNObVlnZHJJZ2JxZ1IvamJJSDNW?=
 =?utf-8?B?eE54bUdNNGlaVXBjQlVpN2E3eXBZSm5kNDd0V3A0WmlGeEhWZU1EVG9CZm1G?=
 =?utf-8?B?UGFmNHZrWm82TldyUE55SDBJWi8yaUJzVFlqVnhoNW5FVC94T0hoZFlCMUw4?=
 =?utf-8?Q?yiQ13b?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(30052699003)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:55:02.4360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a3f270-0421-4140-20cb-08ddad4a5b2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10431


On 16/06/25 11:37 pm, Ryan Roberts wrote:
> On 16/06/2025 11:33, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race.
>>
>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>> 512 times again via pmd_free_pte_page().
>>
>> We implement the locking mechanism using static keys, since the chance
>> of a race is very small. Observe that the synchronization is needed
>> to avoid the following race:
>>
>> CPU1							CPU2
>> 						take reference of PMD table
>> pud_clear()
>> pte_free_kernel()
>> 						walk freed PMD table
>>
>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>
>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>> we are safe. If not, then the patched-in read and write locks help us
>> avoid the race.
>>
>> To implement the mechanism, we need the static key access from mmu.c and
>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>> target in the Makefile, therefore we cannot initialize the key there, as
>> is being done, for example, in the static key implementation of
>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>> the jump_label mechanism. Declare the key there and define the key to false
>> in mmu.c.
>>
>> No issues were observed with mm-selftests. No issues were observed while
>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>> sysfs in a loop.
>>
>> v2->v3:
>>   - Use static key mechanism
>>
>> v1->v2:
>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>     the lock 512 times again via pmd_free_pte_page()
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>   arch/arm64/mm/ptdump.c              |  5 +++
>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index c4326f1cb917..3e386563b587 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -26,6 +26,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/cpumask.h>
>>   
>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>>   /*
>>    * CPU feature register tracking
>>    *
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..e242ba428820 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -41,11 +41,14 @@
>>   #include <asm/tlbflush.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/kfence.h>
>> +#include <asm/cpufeature.h>
>>   
>>   #define NO_BLOCK_MAPPINGS	BIT(0)
>>   #define NO_CONT_MAPPINGS	BIT(1)
>>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>   
>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>> +
>>   enum pgtable_type {
>>   	TABLE_PTE,
>>   	TABLE_PMD,
>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>   	return 1;
>>   }
>>   
>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>   {
>> +	bool lock_taken = false;
>>   	pte_t *table;
>>   	pmd_t pmd;
>>   
>> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   		return 1;
>>   	}
>>   
>> +	/* See comment in pud_free_pmd_page for static key logic */
>>   	table = pte_offset_kernel(pmdp, addr);
>>   	pmd_clear(pmdp);
>>   	__flush_tlb_kernel_pgtable(addr);
>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>> +		mmap_read_lock(&init_mm);
>> +		lock_taken = true;
>> +	}
>> +	if (unlikely(lock_taken))
>> +		mmap_read_unlock(&init_mm);
>> +
>>   	pte_free_kernel(NULL, table);
>>   	return 1;
>>   }
>>   
>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +{
>> +	return __pmd_free_pte_page(pmdp, addr, true);
>> +}
>> +
>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   {
>> +	bool lock_taken = false;
>>   	pmd_t *table;
>>   	pmd_t *pmdp;
>>   	pud_t pud;
>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   	}
>>   
>>   	table = pmd_offset(pudp, addr);
>> +	/*
>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>> +	 *
>> +	 * Static key logic:
>> +	 *
>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>> +	 * execute the if block, then this patches in the read lock, ptdump has
>> +	 * the write lock patched in, therefore ptdump will never read from
>> +	 * a potentially freed PMD table.
>> +	 *
>> +	 * Case 2: If the if block starts executing before ptdump's
>> +	 * static_branch_enable(), then no locking synchronization
>> +	 * will be done. However, pud_clear() + the dsb() in
>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>> +	 * empty PUD. Thus, it will never walk over a potentially freed
>> +	 * PMD table.
>> +	 */
>> +	pud_clear(pudp);
> How can this possibly be correct; you're clearing the pud without any
> synchronisation. So you could have this situation:
>
> CPU1 (vmalloc)			CPU2 (ptdump)
>
> 				static_branch_enable()
> 				  mmap_write_lock()
> 				    pud = pudp_get()

When you do pudp_get(), you won't be dereferencing a NULL pointer.
pud_clear() will nullify the pud entry. So pudp_get() will boil
down to retrieving a NULL entry. Or, pudp_get() will retrieve an
entry pointing to the now isolated PMD table. Correct me if I am
wrong.

> pud_free_pmd_page()
>    pud_clear()
> 				    access the table pointed to by pud
> 				    BANG!
>
> Surely the logic needs to be:
>
> 	if (static_branch_unlikely(&ptdump_lock_key)) {
> 		mmap_read_lock(&init_mm);
> 		lock_taken = true;
> 	}
> 	pud_clear(pudp);
> 	if (unlikely(lock_taken))
> 		mmap_read_unlock(&init_mm);
>
> That fixes your first case, I think? But doesn't fix your second case. You could
> still have:
>
> CPU1 (vmalloc)			CPU2 (ptdump)
>
> pud_free_pmd_page()
>    <ptdump_lock_key=FALSE>
> 				static_branch_enable()
> 				  mmap_write_lock()
> 				    pud = pudp_get()
>    pud_clear()
> 				    access the table pointed to by pud
> 				    BANG!
>
> I think what you need is some sort of RCU read-size critical section in the
> vmalloc side that you can then synchonize on in the ptdump side. But you would
> need to be in the read side critical section when you sample the static key, but
> you can't sleep waiting for the mmap lock while in the critical section. This
> feels solvable, and there is almost certainly a well-used pattern, but I'm not
> quite sure what the answer is. Perhaps others can help...
>
> Thanks,
> Ryan
>
>
>> +	__flush_tlb_kernel_pgtable(addr);
>> +	if (static_branch_unlikely(&ptdump_lock_key)) {
>> +		mmap_read_lock(&init_mm);
>> +		lock_taken = true;
>> +	}
>> +	if (unlikely(lock_taken))
>> +		mmap_read_unlock(&init_mm);
>> +
>>   	pmdp = table;
>>   	next = addr;
>>   	end = addr + PUD_SIZE;
>>   	do {
>> -		pmd_free_pte_page(pmdp, next);
>> +		__pmd_free_pte_page(pmdp, next, false);
>>   	} while (pmdp++, next += PMD_SIZE, next != end);
>>   
>> -	pud_clear(pudp);
>> -	__flush_tlb_kernel_pgtable(addr);
>>   	pmd_free(NULL, table);
>>   	return 1;
>>   }
>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>> index 421a5de806c6..f75e12a1d068 100644
>> --- a/arch/arm64/mm/ptdump.c
>> +++ b/arch/arm64/mm/ptdump.c
>> @@ -25,6 +25,7 @@
>>   #include <asm/pgtable-hwdef.h>
>>   #include <asm/ptdump.h>
>>   
>> +#include <asm/cpufeature.h>
>>   
>>   #define pt_dump_seq_printf(m, fmt, args...)	\
>>   ({						\
>> @@ -311,7 +312,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>>   		}
>>   	};
>>   
>> +	static_branch_enable(&ptdump_lock_key);
>>   	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>> +	static_branch_disable(&ptdump_lock_key);
>>   }
>>   
>>   static void __init ptdump_initialize(void)
>> @@ -353,7 +356,9 @@ bool ptdump_check_wx(void)
>>   		}
>>   	};
>>   
>> +	static_branch_enable(&ptdump_lock_key);
>>   	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>> +	static_branch_disable(&ptdump_lock_key);
>>   
>>   	if (st.wx_pages || st.uxn_pages) {
>>   		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",

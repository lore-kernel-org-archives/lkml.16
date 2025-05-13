Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7596B383;
	Tue, 13 May 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147547; cv=fail; b=AJm1p0+JLOS6bsgagrHvQMa74uwXwiDyPHH/0nLC3JHuNSDSj788KqRFERAKIxtaBrm+cprGC7suyOw7dGwAb8iob6G2g43CwtAuaCCEuQ+CVWfUbPH/BhYX6D8qfKDrGNXQ1CadwUp1bjOorUqXMgFf2xEE+y2oqR90GoQBZh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147547; c=relaxed/simple;
	bh=3l+fBolq/IqsqGNQwNpadl8PWrWQVyczENtHaieSEkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NbR1XIincPqWe7nQLP3hw+arfLhIYUb9owf8Og1Za2gT4Y//HGghkZH/73DUTCTUP8KFunCEDfIXcO2WIhJBunmLbem7um6NoLLMnQdQ1Xarf89z5rCUDwnGqhAH9agEFy/OaSbdJsp+J2idnkeUp3ZPY9PNPY8xw8q5YHVUlbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OZrirE6G; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OZrirE6G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPxW241j1vG3DUIeMRxi76smUzyE+7WtRvdnoWFPEmpw9SZgLJVFIpxn3Oe3vvigGKoathrt10p0eFthvrJMscMrOmmRG/9ognm5nqjL5r6TYyoM+7ag0yDr0lPk2DfyYtmdipfFKq70+Fgqm3XJKXUxR6MB/mwF3EW7Ncg9UtfxCNjcSJSkb0Odq1vTz1gjysEx9U3Ew0hS5tD7Al5quVPmBryNgTv3Iyj3xPHws/qDfEvsN0aVQpHjumWXW4PN7ypZ5CiDeeZ1PVcYDS0JF6X0n4r2VBf2Ocjvw3hhtETOHpCr9YvbkI9hhduQF2uhwIIkGQL2rrMCZOdbd/QA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l+fBolq/IqsqGNQwNpadl8PWrWQVyczENtHaieSEkI=;
 b=Kyx1MmczIVml182for0g5WTIYAxZtP78NzFjWhwt/1m5JAFoS8OL9TxqgpbJ6KlLILo8GXlofIbAxcUb3r47Q2+6QqGkXeAhrkss2T5pwwXqb364RCjAPBwoRxcaHo5uwMl9bQrtYXvAbg6VvkPaMdWK4ZajN/58yEtZr8547jMYG/fBS5Rax2Mw3Dq+AaOGH0yeUfuHLxGYj00slewOozcE2QNoi0EGrClLO6aPTK/zlU8snkF3D5xxoH/xno7g/E2m24GZzvsyQaJLJxjom06Ox1sSAeLg9WqkWL4Qs8+kLvAEhOd7HMwHLOv5gdPLKrwCB8sjLY8PWCL6wpeNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l+fBolq/IqsqGNQwNpadl8PWrWQVyczENtHaieSEkI=;
 b=OZrirE6GK5k6JNLsIuinPwoRwZRRjMJEyfBhi2EjI3u2DtC2yRQ6KbI/xn8H2FOjBxNZfOxuwdTO9ltT1UFtwdowxMNLVs+w1PmOXcuS/maCr3il4Ralq4pXwpSEUBt9V7iku4IIWY9K0vUw58nToufekTC/TAnnrohScHhTuzk=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 14:45:39 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:45:39 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, "amitrkcian2002@gmail.com"
	<amitrkcian2002@gmail.com>, Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: RE: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Topic: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Index: AQHbd9MxLQsfHKHRn06jkLCPeMCORrN5TCNcgENn4yCAEqYgooABy4BA
Date: Tue, 13 May 2025 14:45:39 +0000
Message-ID:
 <IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
 <87o6vyjgfl.fsf@bootlin.com>
In-Reply-To: <87o6vyjgfl.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=1f49ceca-e445-4f9a-aed5-41a6bf275767;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-13T13:26:35Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|PH8PR12MB7278:EE_
x-ms-office365-filtering-correlation-id: 7228a602-4cc6-4e1d-438f-08dd922cd438
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDZiVTd2N0hKQ0dkckFHbFB6ZHNPT2xRbTFPaW5ib09FcktkU1B6ZHlXdEV5?=
 =?utf-8?B?RFY5cmpKQjZXcmRPUjJncXM0VndaclRCQ2JHaXdYcmRFRk9UdFVoc1pwSVA1?=
 =?utf-8?B?Q1VXQ1JyWDBNSCsrSTYzMFV2dmI2ay9OVEE3cWpCU2p4MnJ5aExzLzlPKzVG?=
 =?utf-8?B?ODlnVmlqd0FzNjk5OU9wZ0xDVjF3enpZSml1VUhxSlpOYUdFNzZRRFJybVNp?=
 =?utf-8?B?VUEwR1hoVDVmSVpwSUZSOTJYSkxHNXZvUDFiZVNPcHlGdFFHSTRvMWZaeGlM?=
 =?utf-8?B?SXB1Q0p4Tm5MQ2t0SzllRnJHN0RlUi9Zd1ExRW9CMUZTZC9xVXlRb3ZwZEpN?=
 =?utf-8?B?M3JLZlpPZlFEdC96Y0h6UXhlVTlkRHBrNS9oaEpacjVBZGROM2ZTVnFHVkRO?=
 =?utf-8?B?WmlualRrRFpzRVBneEJHd25zc1J5d3JFT0xkKytHVFhPUnNQYUxzekZtc2V2?=
 =?utf-8?B?UTZCWnQzdXpaZHpKS3BZZXN4cVdPbmVkejFPekE4ZzZRS0ZCYklWenNEUlQy?=
 =?utf-8?B?alpqK1E4SjZJNkRzRnd6RlF3V3NXaE1MRmFCeDdqRWRtaCtCYmtzckZSNFFk?=
 =?utf-8?B?V2l3M3ZaVk1qU0Y5cFpYeXNKUkdZaENBcXNwMkV2OTVUUDByUjhQL2NiQ1Nx?=
 =?utf-8?B?WGhPQmYvZHZtRnhISGJuWnNxZXRyMDUxMDJGSEtzSDRmclFvN1N1TUdCNzJm?=
 =?utf-8?B?NnJ6cWZTQlFiRTVFWklLdkhXRXBmM2p2UUJuYXRFVUp2SmhkOHQzdk84OXZG?=
 =?utf-8?B?NGs0anJjcUdVQmZ5THBMVWYyQjZyaXFxejNPcE5rK0ZsVWtCVUVINlY1NUFi?=
 =?utf-8?B?WG1IdUlJQXQ2QjU0blhzV0ZINnBNeXlyNlFtQ1lheGI0M0oveXdheWhMdVJt?=
 =?utf-8?B?ZDlwRCtBbWlaK1N5elNsMWt0T1dzdW5oY0plNjZaenVubkJQVlRGZldSMmVp?=
 =?utf-8?B?OGkyem5HSG8vTUVKTWF3OUorOEU5b2E2YjdvQUZRWElIdExQSklTTVhXVFZQ?=
 =?utf-8?B?T0psZWR5aHZrTDJ5MThwRktScVJCbnplaGRvWElHMks2OUJ1UXRidEN4NEZQ?=
 =?utf-8?B?WmVpTjdIQVB0dDdlc1VoNjluNE1ZRjBDaVlHVFJqRlg5N1FBU0FOSXFKbTcy?=
 =?utf-8?B?QytxQy9Oc1M4K0ZKQTZMVlVjVWJ5a1lRcmxFMzArVVk1bDBOTFltd0dtN0tH?=
 =?utf-8?B?ZWg2VHY3ME5IMnc2L1N5M0lDdTY5OHdzNXdVaGFlWUZTcmcyeGVuS0R6S3Nk?=
 =?utf-8?B?UmdmNElROFo4TUZhalhiVE54MUpJd25SZUpxTUpsSTFOSE1VRDd4TloyWERD?=
 =?utf-8?B?MERGdEZmTEg0azhyb3AybXhRY0YzcUY2UFdrRzAwVlZlM2NSWU9NS0ZWbGJ0?=
 =?utf-8?B?YVk0RHpOWDQzVityRkl6cHRYZ2lFSVlRajhHbHpnWjdaYXlUZ2U4cjRrQmZY?=
 =?utf-8?B?ZkxjT1pZc2kyVkRZRnpSazdkSnFFMVZxaGtScC82SnVJL2lyOHpybHpGSUZ0?=
 =?utf-8?B?MEdGVHhJb2pDKzdrOGw1NHNEcnIvUGh3WEQwRUk3cmoyeVRTNWM1VVZIT1Fp?=
 =?utf-8?B?eTZoU1hWQktXUFB4VVVodGhDU2p6MGxFYnI2dmdxakovSGpGOUl0c1VZT0hH?=
 =?utf-8?B?UnRjUmpuejdvWWxXZG5Iamcya280amZ6U2JmT0ZHKzkwWjFPMk5lRnpsUWdy?=
 =?utf-8?B?Uy8xSml0Uyt6U0pCQTFSYzlzN2xZd21MUHRiUVNXOVJ6em1sSDByS244VXBP?=
 =?utf-8?B?QTRickIwcU5QQmMwUjhsdHE1REhlTTk0TjhiOE5MQU04VG9kaGlYRU5yQ0w2?=
 =?utf-8?B?cDJMQWJJWk9YU3ZGbW1ZUER5NkR4UFpybUpKbWVJRWRRQ0p1dGNZUVVnTVJr?=
 =?utf-8?B?Y2JReFFDMGg2MXNiLzgzckN4ZnNTWDU0RmhvMHpvbDBMbDVLcll4QUlhVWlh?=
 =?utf-8?B?YWV3VnkvbmZRS3ZqUUd5cDI0ek9sdEdibnJLM0s1MTd0MTVwSGtZS1ViQTVN?=
 =?utf-8?Q?PsEm4c9TZ8dERqlqXLMC8paSRMQI18=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGxhWEoxVUVzZVZZYUZPN0lhWm5QVUhTVW8wRXpZekhmdmpWempoR3A3cU90?=
 =?utf-8?B?MWNLL3NRa2VPK1ZycWRIUWszNGZkY253cWl0SUVwcmFrVzhlRWxMNmtITTdH?=
 =?utf-8?B?UDFTMG9NRjdkNVNMT09iczZUV09xNVUraVphSW1GMXA3Qnhmam1nT0E2U25I?=
 =?utf-8?B?M1IrYVRGUHpSM1dET0hDZFg3dEIyazRSZ2M5RVVHWnJWQnJ5MVdZRHpQcmVG?=
 =?utf-8?B?STQ1blB0cTJmdjAzOWxFQWE3eUhYcmJQTjVuUHhpa3llSHYwZmZsbkpSRGJC?=
 =?utf-8?B?b0RyZTI5N1VuQURoT0w5VGVjc3NvREd5clQzb2cvUG91RGN3U2NrcEk3ck9E?=
 =?utf-8?B?bVJ5U21sWTI5STNvL0p0VWFEd2c1MXUzR2FWWDM1dS93cVhFNGxjU1VPS0xk?=
 =?utf-8?B?NXNkd3JuRUpacVRqejNzY1JiNnVDUWc4clF6M2Jyc1IyZ1JMb0M2VG5TM29z?=
 =?utf-8?B?eXVzczQ1b2I4VWwzZmRGdktHR0RRd3hMb2RiT2xNUXBKNndaZkh4a0h3S3Fo?=
 =?utf-8?B?R21jMnZiL1R5ZXU4clg2bFdIcXNXdCt0OEtFRzh1N1dicExRanlPdGJIcW82?=
 =?utf-8?B?NGZlSHF2TkN5MkZ1a1ZCRnhNZUIxbkl4R0k0TnNCMmszN3Z3dEZDWnAwNklw?=
 =?utf-8?B?K2s2KzJqaGZOSVpHUmluZm5mS3QwYVpxMFdyUHNvbFU3VG01M2hhWUZHM25R?=
 =?utf-8?B?NnJhVWpNcHZSSmp5RGZYUjFwQUZCcVFGcUlnQTFXOE1Ka0I3ZExNa1A2alR5?=
 =?utf-8?B?NGxZQVZGRFN1d1EyZW80N2hUWUFGSnBUbVFVdGkwNm55eGdhTms1R29xWnJV?=
 =?utf-8?B?QlRRcmE3QW40N1VMT214MjA4enk0NlkwVnVFMTIxdHNSNjgvaXNJRnlxNWlh?=
 =?utf-8?B?UU5hTGVxTjhudzF5cDN2VjZmWGtLNld5VWc3UVRCSXM0TUlUa3hRRmJnRWh3?=
 =?utf-8?B?eFE2TWlhN2NNbnRxNmdYNldPQWxRbUhhSDUzdlI3SGwrSUltZkYwZHcxR0pH?=
 =?utf-8?B?b0pPWVFpUVFvVHV5ZDJhbkJkVU1ZRzV0cGZpZGNBU1BUTHROaEhjRFdlcnk1?=
 =?utf-8?B?Z25xTy9jNVJFNUJFRW9ZZUVMQWRiMjM5cy95a3Z4Q0w0TjNxM0o4NnBsZ1VD?=
 =?utf-8?B?SEpsajNkdThkWjdQSHNuelBSSFlGTys2L0g5bkNNRkpnMWo1MXpDK0hCUTJX?=
 =?utf-8?B?SUp5SGY3dm8wazQ4S3BSSXBqQkRtZTl2R1VnYXd2Q1U0UWRUVXNhc3NnaHVr?=
 =?utf-8?B?MEtobnNSVWJhdWsydkI5UHNldmhlWlRCTWdjUzVzR2R2MTMyQ2ZRcUJCdWZl?=
 =?utf-8?B?SlRPUGM3ZUpkRXhDTHRLa2E2SlY1QjJMeVRISEJaTkZuV1RJNjhpa21wVWZL?=
 =?utf-8?B?Nk52ZTB6cEZ2dkdpQmt0R0NvUGFqbXRYS2xlNVQvZWkzTFM0NG1QWWo2aDJW?=
 =?utf-8?B?NTFjQ21UUXdWaGExYytGRCtUWHRCcHR5ZWlDdmtxVHhXcW80a2FjY2QzS1Vx?=
 =?utf-8?B?SDBGSisxNDFIbWI4d1JwSmFMaU5aMkJ3VG0waU81bmgvbE9ESWc3K1lCdFFR?=
 =?utf-8?B?b2U5TFdZRzZqTk0zdGV2NGk4NmRFYWR6NHJQN0FPQ3NUcDF6TW5XUWFpN3Fs?=
 =?utf-8?B?cEh3NHZ0U3BhWUhmYzVlTTh5NGQ3SXZ3TDFvK1VTaGNmdy9ham96Rk9WSjFL?=
 =?utf-8?B?SXZqL2hkRHNWOE5VRFpCaHZqczJtSnJSSHpNZzRMbjJ2NmVrSHpzSkpEWngx?=
 =?utf-8?B?YlB2YkNyVkNZT1ZpOWVsSVh1eERqaFJwREtWNzVtUGJ0N0JTMlFwSUN5ZG5U?=
 =?utf-8?B?RDVaZFY2bnJ2dlJXQ0xNQjIxbmZhbUFUaFU4RDJseWQvWU1Jbm85WCtyUDlR?=
 =?utf-8?B?dHlSMmRBSW4vWDRkTzVxMU0vVUpOYmtKa1Fac1l1WGVqbWdoQ2ZFckthaG5I?=
 =?utf-8?B?RWJVS0RaS2J5Q3VIaENRcEVReU0yVTVxcXJUaUFTMGExRHczMkdZMVRBRGR5?=
 =?utf-8?B?Y09rZTBPVkliNVVwYm9TVGhVM2F6djF0SlZrZitTb3NrYUlzb2NxZzBMQjhu?=
 =?utf-8?B?QUEyOFhJOEhjSHVxRHphbzUrc0tjT0V5TEk1N2s2WE1yM1VoNzVYSDdRc3Br?=
 =?utf-8?Q?ys9M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7228a602-4cc6-4e1d-438f-08dd922cd438
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 14:45:39.3083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHfSBwd6DyHz63UhDEB5sdNUjzHh4RMNq4smPRAFNapi8Jy5aL/mPHnJ0TerBhyscOfrZAcCic73jEuuUV+3+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGVsbG8gTWlxdWVsLA0KDQo+ID4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYucGFyZW50ID0g
Y29uY2F0LT5zdWJkZXZbMF0tPmRldi5wYXJlbnQ7DQo+ID4+ID4gKyAgICAgICAgICAgbXRkLT5k
ZXYgPSBjb25jYXQtPnN1YmRldlswXS0+ZGV2Ow0KPiA+PiA+ICsNCj4gPj4gPiArICAgICAgICAg
ICAvKiBSZWdpc3RlciB0aGUgcGxhdGZvcm0gZGV2aWNlICovDQo+ID4+ID4gKyAgICAgICAgICAg
cmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOw0KPiA+PiA+ICsgICAgICAg
ICAgIGlmIChyZXQpDQo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICBnb3RvIGRlc3Ryb3lfY29u
Y2F0Ow0KPiA+PiA+ICsgICB9DQo+ID4+ID4gKw0KPiA+PiA+ICsgICByZXR1cm4gMDsNCj4gPj4g
PiArDQo+ID4+ID4gK2Rlc3Ryb3lfY29uY2F0Og0KPiA+PiA+ICsgICBtdGRfY29uY2F0X2Rlc3Ry
b3kobXRkKTsNCj4gPj4gPiArDQo+ID4+ID4gKyAgIHJldHVybiByZXQ7DQo+ID4+ID4gK30NCj4g
Pj4gPiArDQo+ID4+ID4gK2xhdGVfaW5pdGNhbGwobXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9qb2lu
KTsNCj4gPj4NCj4gPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lcyBub3Qgc3VwcG9y
dCBwcm9iZSBkZWZlcnJhbHMsIEkNCj4gPj4gYmVsaWV2ZSBpdCBzaG91bGQgYmUgaGFuZGxlZC4N
Cj4gPg0KPiA+IEkgc2VlIHRoYXQgdGhlIHBhcnNlX210ZF9wYXJ0aXRpb25zKCkgQVBJIGNhbiBy
ZXR1cm4gLUVQUk9CRV9ERUZFUg0KPiA+IGR1cmluZyBNVEQgZGV2aWNlIHJlZ2lzdHJhdGlvbiwg
YnV0IHRoaXMgYmVoYXZpb3IgaXMgc3BlY2lmaWMgdG8gdGhlDQo+ID4gcGFyc2VfcWNvbXNtZW1f
cGFydCBwYXJzZXIuIE5vbmUgb2YgdGhlIG90aGVyIHBhcnNlcnMgYXBwZWFyIHRvDQo+ID4gc3Vw
cG9ydCBwcm9iZSBkZWZlcnJhbC4gQXMgZGlzY3Vzc2VkIGluIFJGQyBbMV0sIHRoZSB2aXJ0dWFs
IGNvbmNhdA0KPiA+IGZlYXR1cmUgaXMgcHVyZWx5IGEgZml4ZWQtcGFydGl0aW9uIGNhcGFiaWxp
dHksIGFuZCBiYXNlZCBvbiBteQ0KPiA+IHVuZGVyc3RhbmRpbmcsIHRoZSBmaXhlZC1wYXJ0aXRp
b24gcGFyc2VyIGRvZXMgbm90IHN1cHBvcnQgcHJvYmUgZGVmZXJyYWwuDQo+ID4gUGxlYXNlIGxl
dCBtZSBrbm93IGlmIHlvdSBjYW4gdGhpbmsgb2YgYW55IG90aGVyIHByb2JlIGRlZmVycmFsDQo+
ID4gc2NlbmFyaW9zIHRoYXQgbWlnaHQgaW1wYWN0IHRoZSB2aXJ0dWFsIGNvbmNhdCBkcml2ZXIu
DQo+DQo+IFRoYXQncyB0cnVlLCBidXQgSSBraW5kIG9mIGRpc2xpa2UgdGhlIGxhdGVfaW5pdGNh
bGwsIEkgZmVhciBpdCBtaWdodCBicmVhayBpbiBjcmVhdGl2ZSB3YXlzLg0KDQpJIHVuZGVyc3Rh
bmQsIGJ1dCBzaW5jZSB3ZSByZXF1aXJlIHRoZSBwYXJ0aXRpb24gaW5mb3JtYXRpb24gdG8gYmUN
CmF2YWlsYWJsZSwgbGF0ZV9pbml0Y2FsbCBzZWVtcyB0byBiZSB0aGUgbW9zdCBzdWl0YWJsZSBj
aG9pY2UgYW1vbmcgdGhlDQppbml0Y2FsbCBsZXZlbHPigJRpZiB3ZSBkZWNpZGUgdG8gcHJvY2Vl
ZCB3aXRoIHVzaW5nIGFuIGluaXRjYWxsLg0KUmVnYXJkaW5nIHBvdGVudGlhbCBmYWlsdXJlcywg
YXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZSBvcGVyYXRpb24gd291bGQNCmZhaWwgaWYsIGF0IHRo
ZSB0aW1lIG9mIGNvbmNhdGVuYXRpb24sIG9uZSBvciBtb3JlIG9mIHRoZSBNVEQgZGV2aWNlcw0K
aW52b2x2ZWQgaW4gdGhlIGNvbmNhdCBhcmUgbm90IHlldCBhdmFpbGFibGUuIEluIHN1Y2ggYSBz
Y2VuYXJpbywgd2UgY2FuDQppc3N1ZSBhIGtlcm5lbCB3YXJuaW5nIGFuZCBleGl0IGdyYWNlZnVs
bHkuIEJ1dCwgSG93ZXZlciwgaWYgeW91IHByZWZlcg0KdG8gbW92ZSBhd2F5IGZyb20gdXNpbmcg
aW5pdGNhbGxzIGFuZCBoYXZlIGFuIGFsdGVybmF0aXZlDQppbXBsZW1lbnRhdGlvbiBhcHByb2Fj
aCBpbiBtaW5kLCBwbGVhc2UgbGV0IHVzIGtub3cuDQoNClJlZ2FyZHMsDQpBbWl0DQo+DQo+IFRo
YW5rcywNCj4gTWlxdcOobA0K

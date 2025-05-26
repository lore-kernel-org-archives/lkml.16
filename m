Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0C21423F;
	Mon, 26 May 2025 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271714; cv=fail; b=ic4tw0QBbjYCCPCCat6wdouPpRDTUk2a2qw9Ggo2lHneQfhtzinlibfZWZdQGNHU4uHdPxDbhZKCbyLeZjixfpOCFx1xoF/k4TRZTjWnFllXgnAwqnqptjSmmq+Zz9I5RtxOetPikZKh+7ot4sQUtMpoxIx4QEt4Ld+PBTVMap0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271714; c=relaxed/simple;
	bh=KfIyjJyB5boKfnopXyVSlaVnqD9d8kzBFhd3sCRDyYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DPQVJ7qLsVo6CwESE+4hAv3RvFbi/FCuxXl6k3GGxXPRcqZW6HhrmVj5lihr4ObyVZYaa1+cFpg8ogoEjNibg3wKHzw7r+6UUoawZJUZ3/8m+y2Z4ilgiqCNisRHdXrSLxj7NePWwT/LvIo9GHwWrtxpq9R85iny75m8OxLiiZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4OROEm+8; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4OROEm+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSIP/IFBYoD5sQOBw5V6EXrKviAQaSsk/2Fhm85osoGrntLc9kWEjAEQLFPEFpL8jd5rv6lsYH1y3To+bT+gxC+8A/vYAsYGVkNWcjM0V3KVu44K+IvKrEdPXvIRjM5RRPYg2gJJ48JfHXtaR8qVNpxf2HQpGOZ11+1wtbSDkXBM2MEec/LcMR6uc7xSIjYB6kV8HGWCrn48vHYCprsH7aKVKbOwaUvpWdrzmvWiQUKCy/m4hx50Qi0Ui2sZV2Cf4LaAfoUS3qLRUA6bQ58YKSO7z6SGIOaQ/TFs4mFc9dH58afob3FllXSfaroxFm8nffyNWwzYIG0HVx7Z4q3jzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfIyjJyB5boKfnopXyVSlaVnqD9d8kzBFhd3sCRDyYo=;
 b=kbgLz0Ma2Cq5MMcH+yvjNb7wNFDwdgUmn3rMzn8au+BsuJTsZ3Nkj/W5u06wB7XMK+V43+lzSTMJ+BByGj9YKS+gVjaag7g8+N7AZwJA7d/CHU7fWhaem8IxT8rSuKROpMhzSU2c6fNsYO6zRTPJ5xjJ5vN+6Eq96oVpWFQXIFcpteh+tUMpCFvdsQ/6zSPKAeIu9XMfLfXF03susgVx513QGc7GJ79rxNZQqfmcN7by6eMK9y3grx5c/AvqRfIeO7EPboQg7fdeWW8YFJZBiWrdJeOt4gFtzkzZP/eMLHYr9DbnXqQPlmU7yqKSY61oDkZdOXPEINCm0sdP05AK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfIyjJyB5boKfnopXyVSlaVnqD9d8kzBFhd3sCRDyYo=;
 b=4OROEm+89nqDSsvWqMEzHFYsQh4tkbRtjJwEE17VbUhSutWX9XC3G5V3zK3NPM42b8Hcf4j6mFxBCkoBKIJiLMew1hMyxaj2bub2TnpXc5xlkCZ6i9XhcEkejt4T3MF/djMCNrydroQ2gFjSq+UeKcCI8PLsl/17W253JT6pWrI=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by LV8PR12MB9208.namprd12.prod.outlook.com (2603:10b6:408:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 15:01:48 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 15:01:47 +0000
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
Thread-Index:
 AQHbd9MxLQsfHKHRn06jkLCPeMCORrN5TCNcgENn4yCAEqYgooABy4BAgATCa2yAB0dpsIAIDELQgAArZ/CAAEEZkYAAAO8g
Date: Mon, 26 May 2025 15:01:47 +0000
Message-ID:
 <IA0PR12MB76994AAD2E2D48932C2141C9DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87ecwb3i80.fsf@bootlin.com>
	<IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
 <87msazv3ln.fsf@bootlin.com>
In-Reply-To: <87msazv3ln.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=de676651-81a8-4d9e-8325-33043c2b0123;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-26T14:42:31Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|LV8PR12MB9208:EE_
x-ms-office365-filtering-correlation-id: 351f813e-14b5-423e-822f-08dd9c663cd6
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTMrUzhnTFhaQ2FNcHVHcFIyaHR0QlVuRktaWENrVWdKU3pUTUFSdmYzTnV2?=
 =?utf-8?B?NU1iRjZFTWhRQk1aVVQ2cnlOMzFZcEQvWGhpbFNuMEZnUWFWZFdZMlpCNkdV?=
 =?utf-8?B?WkRWdllPVGZmR291amc1eUEzVXpXNFZwN2VWV1RZVC9xZ05IK1FlemJaSE12?=
 =?utf-8?B?dGVNaU9LMHZWZjlUQ3RVK0FZYWJtUTI4ck1GckpHWHEzb08vUGtwN25jU0hI?=
 =?utf-8?B?NkRVajljVWhpM3dlN05CMFZYamtoNm9iUmI4cDNaTm9TOU1VcW5taFN1WFI4?=
 =?utf-8?B?ZExweTEyM3NSRUFNck52YUdaVXVWaTVUY1NOTWdzWjNpR0FTTWNXb2tYT1JC?=
 =?utf-8?B?RzJpUHJpRDFkUC8vVEE3RjlMeENmSGZoeFVZQ0NSRWtjcmNhMjk1WHUweXlF?=
 =?utf-8?B?cmdtbUhFa0dqNFpTeUZTUkZHdFEvaWR0T3VWRDBQNlRMbnRHczl4Rm9VclI0?=
 =?utf-8?B?OE1QV1ZoSjNKZTBnYjFmREVlTXZVWDJiQWNPUkdpNG9leFM5aktteWl1ZHZF?=
 =?utf-8?B?VGo2NmQwSGpaS1JZaHU1R1ZYb3ZPUkRRNFMrSnZwT2Z5R2pPaFg2TFcyWS9M?=
 =?utf-8?B?YWV4Vk5PTC9pWCt1OU1uUHlYbjgwSXVRemw1UngvUjVueG9JYi9RaXdYby9s?=
 =?utf-8?B?NURORThFVGg2Y20yeVRTVGdKTXFhVVozMXNQcTZPaVJEVzFJTG80UXZOQlR1?=
 =?utf-8?B?VGRib1JoQUhyVkppQVhWaThqR29tcVBodFdncGxkK1AyNHg4NkNWSVJySlQx?=
 =?utf-8?B?NmREZ3hDUjFBOVo0LytxNm5EVGZNTVdVeUg3b0lCbVpzdmtOQzNsKytocDRQ?=
 =?utf-8?B?UEZwV2JXNXhZTjZIRHh1cldlL2ptd3RyRnFIaHBqeDJwbmt0KzhGaktRWW1F?=
 =?utf-8?B?M3VxYjVpL2pWSkgycWtnODJHSWQ3My9jQ3VQM29lY1JGcjM3aVNCQXQ5RzhT?=
 =?utf-8?B?SGVndkhUZklXNTdKUUVaT0s0Mm93QmptKzFOc2M3SFMxanA5K2NsUDRtSkZX?=
 =?utf-8?B?SWFPeG5UcnRpVG1ORk9IcXZQY3U3clRYWk1KUXhTQ2lUTk9xSFVzUjVYN2Mv?=
 =?utf-8?B?ZmNaZDUzTnJFdEJhNUZyYTJLNDJqTHJCTU9ocmxkMW0vQlJVZ3p4NXVHZmNt?=
 =?utf-8?B?b3BvbE1OWFFCcEoyQ3AwVk52cFc3cThXYU0yZHhFcTZZUDFuejlLRldtdWUw?=
 =?utf-8?B?aW1tdFpJbUN3NFRETkJ5dk5YUGtXL0NGT291Mk5PcDFRaHVDTWRtcVFHNWVW?=
 =?utf-8?B?NlpRRUxWK1Q2WnQyeU9HcUpoZTdHZVp6aFdPVFl2UVBKL0F1TkZyUkhKNGJN?=
 =?utf-8?B?bEYrQmRJZUJYQUxDai9KbVBaSHhUSjJjdmFPUUlVS3F4cW9aZ1BiNnByZEVE?=
 =?utf-8?B?Z29WRVF6R0JEY1NQV3k2SDExY2pScTVRNEhuTVNweWx5SG41dUwyL09GUjlI?=
 =?utf-8?B?OEVsUlhYM2FGWnMxK1JaOFlrL2FaTFRFdTk3R1Z3YzlMRE9TWGdUVGd4TnRx?=
 =?utf-8?B?Nld6Sk42T1ZnczAzdmxPL1lFeGlPWU1XcE5qM0tsWVo5MFBEYThTeUVmTml4?=
 =?utf-8?B?ejVKUDJIWCs2Y0x4eEFMNUE4V0N6QTNsNXN2QU5Na3dRb1pIcUYxU3dIajlz?=
 =?utf-8?B?M3BpNWwzSjFaZFFIMzBZWk04TWVldTFESDE1UTVZd3RWSVBNUlc0RGdjMDFs?=
 =?utf-8?B?ZDJMbkFhUVNDSFNKbjBjUzZwR3BjV3ljTXRoOEQ5Wk9WNlQrWlVScW56SXIr?=
 =?utf-8?B?UWxGbkVYKzdZSUJySHF4RFZCcXRsblhTWmxBK3IxajNzcGdlMExiOVlVdmVC?=
 =?utf-8?B?UlVwSkdyeXRQdXNGRXk0S05jQjlPdko1SFU4cWxzMldlUWNEbitTd2JicWZv?=
 =?utf-8?B?M1JzSWIyS3RhNURrWTVsT0VZZmRBR0Z5eGZSU0ZBT3doOExiOGpncGZGK25C?=
 =?utf-8?Q?gub/vMv8qeQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU4wVloyS2ZJZVkza1FuemxpRldOSHRzRGhDa3ZWcE9KZXBzMGMxM3c3YVBy?=
 =?utf-8?B?N3FZT3gvOFNqcDRsakdEQ2o3M1JxRU9JWjVZakxNWDQrRkdDalNpalgxWk5i?=
 =?utf-8?B?UzBVMHlmN0I2YU44YlJPT1VJTUJESDBld2dPTHg3QjdPWElETG1hQ01PU3NT?=
 =?utf-8?B?THcrNGpaaEJqdVdvRUpNNVR1dEluZWlaVFJ0YlB6MHNNd3dPOWV1V1VPY0dN?=
 =?utf-8?B?cjRJck1oeEt1MGJ0VDM3VUN5RTJESGhBSFE1UHpYM3J5ZWZka2ovZnFKRlRY?=
 =?utf-8?B?UGtHdEliNzd6WXY3dGdQR250NlVWVzN1dWZHNjY1eUEwREdVUDUrZEhQQ2tk?=
 =?utf-8?B?L3BMZkhHMEhRV3A3QW1saTlORFRtZDJReCt2NEJGZU16R05aK2huaTErbllu?=
 =?utf-8?B?MllVTitja2FlVTd3V0htYUNzY2hHZThMcy94V3h4d0N6bGxPeUN3TE1qUGhW?=
 =?utf-8?B?S05Gc1FEbTNOazRVUjRYVERUT1B2amVmMTcrY014TXkzSFNiSHorUlJkcDFV?=
 =?utf-8?B?dERUL0JTN045b0VBTXZPZlpRamZ4MktNUS9ZR1NkN0ZkZHlZbU0xZjB1ZGZE?=
 =?utf-8?B?MTdIcllEaXVtRTlhaXBWT01VaU1zQlpnN0I1R0JobVlPdytPYk9lVDV4SzFY?=
 =?utf-8?B?My9adFpNcmNDV0s4aG5lckpRMjYrdGdYWGpkUVh1Q0c5TUZlbHFKK1Z5YUxi?=
 =?utf-8?B?UnFGMmFIWVdkTnh2b2E3eEdCTWNpSzUzdWZUTGIzZ3k5UmV1NXl5L0UvczZo?=
 =?utf-8?B?aHpQSU83WDk3SEgvd3pvNWp3TjE3cm01UGdoRGM2bklVaHZURlI5SGcwNy83?=
 =?utf-8?B?dmpkb1ErQmJrZ2YybzAzcExSZmx5ckNRQXFpeWVLRk8wOE5yUmRNZlZMczFZ?=
 =?utf-8?B?RG9iUDZ4UFVyZldiSmc1TUt0YXJKaUo2MzJGM3hoVEtoQlVlOWtuWkpPT3hu?=
 =?utf-8?B?b1NQTDFRZHZ4R0xyU0pNWkZNM1ptQ056L3VHRmRzQXlzbjVScEo3US9NWGEv?=
 =?utf-8?B?OGdodDFVcW9jQ2hrWkRRSDRvWHloU05CU01JMDBBZ3U0eVFEM0VMbE1uSWM2?=
 =?utf-8?B?TUxnS3ArbUkwakpXZFRJVGVoS1FYOE1XaE5ab1J5VzhBUjJTMDB6NHZZZ1I1?=
 =?utf-8?B?SldiQlFvV2VrZ3pqU1huVE11YUdLN05EYjNranNPWm9OZmN6WVlVNytQZ3hP?=
 =?utf-8?B?NERXREppREovSFgxdGp5WUFFZTVWN3c1c1VDQjVkb1pPM0t4OENJVWhMU1Z4?=
 =?utf-8?B?U2g3YkZXMjhtVjhtR3dBY2lCSmNoT1gyL3c5emZIMGxTa2k1VERHMC92b0Va?=
 =?utf-8?B?bFAwYVVReCsvNUR3d2JROXBjU3ViV2RZWlY0VWtqU1FuV29CN3R4WEZ2WEsv?=
 =?utf-8?B?YVFLZmpoaGZjczIyK1ZxNWFXTmJ0MjY5ZHhmb29oMW90VHdwVStJanNPRlpS?=
 =?utf-8?B?ODEzK280QVNVTHErdzJ1ZHRlV3hRdUdDbXZRN3NmNllUWFBCY3JUbG1RZkRX?=
 =?utf-8?B?cmFjWU95a0FFL3FUSnhwalNSbkhySnJXVmNsVCtVUnEvRG5kdjFwRzY0T1dM?=
 =?utf-8?B?bXVOTEdZTU10ZWVhQkpjQW83RkxreThzVy9kbnRqR21jTGhsOTh4NE5XanJC?=
 =?utf-8?B?TFhXN1k0S3lLYS9rbDl5OEI2TWVNbVcxTW1zMU9BbzBqY04wdVFPTEVXcW9u?=
 =?utf-8?B?SFZnYUpyWjcvUm5mTnQ4ZkNJRi9lbTJPYWt6NEY1OTFxMERxbkY4QWtkeGFl?=
 =?utf-8?B?aHpXTnZBdzcwMmthZTZtMFYrQjV2YkNFdDAvUUNtYUN1aEwrZzVSV0h1Nmdz?=
 =?utf-8?B?ZHJXdHlzWUFQVDU3SXFjOTRQZDYybklFM2Z6ZzlxbmsxV0tOSHFYeW1USHlD?=
 =?utf-8?B?T1pVTkN4MjIxaDliOWE1dWlCdWxuV0I5VFZGTDByelBOb0lYQmh2NE83cWpJ?=
 =?utf-8?B?NXZNd0U4OHlYTVR0L3ZqNC9jNnJvT2FYQ085eVl2dm5md3pucThNSWQ4Sy9H?=
 =?utf-8?B?V01rRVlQUklueHRBd1VMS2NLbU1mbFdPengvTWFBRWhKRmd3NHg3VUFWSTFZ?=
 =?utf-8?B?a1RISm9yNjFQcG5WMXBxY3B2Z2VBSjdYbzZNQ3pKb0hGRTZIQUJkeFIzaDZ3?=
 =?utf-8?Q?ALqc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 351f813e-14b5-423e-822f-08dd9c663cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 15:01:47.7314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jJlR3F8lpB4l3RHqaZPr2dGsP2T9uhAPAdieccGgePR11S9tgJr1qZRXjur5ThwHFOcaaTLP4mrcB98EYND5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9208

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiBPbiAyNi8wNS8yMDI1IGF0IDE0OjI3OjM3IEdNVCwgIk1haGFwYXRyYSwgQW1pdCBLdW1h
ciIgPGFtaXQua3VtYXItDQo+IG1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToNCj4NCj4gPiBbQU1E
IE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiA+
DQo+ID4+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRp
b24gT25seV0NCj4gPj4gPg0KPiA+PiA+PiBPbiAxMy8wNS8yMDI1IGF0IDE0OjQ1OjM5IEdNVCwg
Ik1haGFwYXRyYSwgQW1pdCBLdW1hciINCj4gPj4gPj4gPGFtaXQua3VtYXItIG1haGFwYXRyYUBh
bWQuY29tPiB3cm90ZToNCj4gPj4gPj4NCj4gPj4gPj4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5
IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiA+PiA+PiA+DQo+ID4+ID4+ID4g
SGVsbG8gTWlxdWVsLA0KPiA+PiA+PiA+DQo+ID4+ID4+ID4+ID4+ID4gKyAgICAgICAgICAgbXRk
LT5kZXYucGFyZW50ID0gY29uY2F0LT5zdWJkZXZbMF0tPmRldi5wYXJlbnQ7DQo+ID4+ID4+ID4+
ID4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYgPSBjb25jYXQtPnN1YmRldlswXS0+ZGV2Ow0KPiA+
PiA+PiA+PiA+PiA+ICsNCj4gPj4gPj4gPj4gPj4gPiArICAgICAgICAgICAvKiBSZWdpc3RlciB0
aGUgcGxhdGZvcm0gZGV2aWNlICovDQo+ID4+ID4+ID4+ID4+ID4gKyAgICAgICAgICAgcmV0ID0g
bXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOw0KPiA+PiA+PiA+PiA+PiA+ICsgICAg
ICAgICAgIGlmIChyZXQpDQo+ID4+ID4+ID4+ID4+ID4gKyAgICAgICAgICAgICAgICAgICBnb3Rv
IGRlc3Ryb3lfY29uY2F0Ow0KPiA+PiA+PiA+PiA+PiA+ICsgICB9DQo+ID4+ID4+ID4+ID4+ID4g
Kw0KPiA+PiA+PiA+PiA+PiA+ICsgICByZXR1cm4gMDsNCj4gPj4gPj4gPj4gPj4gPiArDQo+ID4+
ID4+ID4+ID4+ID4gK2Rlc3Ryb3lfY29uY2F0Og0KPiA+PiA+PiA+PiA+PiA+ICsgICBtdGRfY29u
Y2F0X2Rlc3Ryb3kobXRkKTsNCj4gPj4gPj4gPj4gPj4gPiArDQo+ID4+ID4+ID4+ID4+ID4gKyAg
IHJldHVybiByZXQ7DQo+ID4+ID4+ID4+ID4+ID4gK30NCj4gPj4gPj4gPj4gPj4gPiArDQo+ID4+
ID4+ID4+ID4+ID4gK2xhdGVfaW5pdGNhbGwobXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9qb2luKTsN
Cj4gPj4gPj4gPj4gPj4NCj4gPj4gPj4gPj4gPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
ZG9lcyBub3Qgc3VwcG9ydCBwcm9iZSBkZWZlcnJhbHMsDQo+ID4+ID4+ID4+ID4+IEkgYmVsaWV2
ZSBpdCBzaG91bGQgYmUgaGFuZGxlZC4NCj4gPj4gPj4gPj4gPg0KPiA+PiA+PiA+PiA+IEkgc2Vl
IHRoYXQgdGhlIHBhcnNlX210ZF9wYXJ0aXRpb25zKCkgQVBJIGNhbiByZXR1cm4NCj4gPj4gPj4g
Pj4gPiAtRVBST0JFX0RFRkVSIGR1cmluZyBNVEQgZGV2aWNlIHJlZ2lzdHJhdGlvbiwgYnV0IHRo
aXMNCj4gPj4gPj4gPj4gPiBiZWhhdmlvciBpcyBzcGVjaWZpYyB0byB0aGUgcGFyc2VfcWNvbXNt
ZW1fcGFydCBwYXJzZXIuIE5vbmUNCj4gPj4gPj4gPj4gPiBvZiB0aGUgb3RoZXIgcGFyc2VycyBh
cHBlYXIgdG8gc3VwcG9ydCBwcm9iZSBkZWZlcnJhbC4gQXMNCj4gPj4gPj4gPj4gPiBkaXNjdXNz
ZWQgaW4gUkZDIFsxXSwgdGhlIHZpcnR1YWwgY29uY2F0IGZlYXR1cmUgaXMgcHVyZWx5IGENCj4g
Pj4gPj4gPj4gPiBmaXhlZC1wYXJ0aXRpb24gY2FwYWJpbGl0eSwgYW5kIGJhc2VkIG9uIG15IHVu
ZGVyc3RhbmRpbmcsDQo+ID4+ID4+ID4+ID4gdGhlIGZpeGVkLXBhcnRpdGlvbiBwYXJzZXIgZG9l
cw0KPiA+PiBub3Qgc3VwcG9ydCBwcm9iZSBkZWZlcnJhbC4NCj4gPj4gPj4gPj4gPiBQbGVhc2Ug
bGV0IG1lIGtub3cgaWYgeW91IGNhbiB0aGluayBvZiBhbnkgb3RoZXIgcHJvYmUNCj4gPj4gPj4g
Pj4gPiBkZWZlcnJhbCBzY2VuYXJpb3MgdGhhdCBtaWdodCBpbXBhY3QgdGhlIHZpcnR1YWwgY29u
Y2F0IGRyaXZlci4NCj4gPj4gPj4gPj4NCj4gPj4gPj4gPj4gVGhhdCdzIHRydWUsIGJ1dCBJIGtp
bmQgb2YgZGlzbGlrZSB0aGUgbGF0ZV9pbml0Y2FsbCwgSSBmZWFyIGl0DQo+ID4+ID4+ID4+IG1p
Z2h0IGJyZWFrIGluIGNyZWF0aXZlDQo+ID4+ID4+IHdheXMuDQo+ID4+ID4+ID4NCj4gPj4gPj4g
PiBJIHVuZGVyc3RhbmQsIGJ1dCBzaW5jZSB3ZSByZXF1aXJlIHRoZSBwYXJ0aXRpb24gaW5mb3Jt
YXRpb24gdG8NCj4gPj4gPj4gPiBiZSBhdmFpbGFibGUsIGxhdGVfaW5pdGNhbGwgc2VlbXMgdG8g
YmUgdGhlIG1vc3Qgc3VpdGFibGUgY2hvaWNlDQo+ID4+ID4+ID4gYW1vbmcgdGhlIGluaXRjYWxs
IGxldmVsc+KAlGlmIHdlIGRlY2lkZSB0byBwcm9jZWVkIHdpdGggdXNpbmcgYW4gaW5pdGNhbGwu
DQo+ID4+ID4+ID4gUmVnYXJkaW5nIHBvdGVudGlhbCBmYWlsdXJlcywgYXMgZmFyIGFzIEkgY2Fu
IHRlbGwsIHRoZQ0KPiA+PiA+PiA+IG9wZXJhdGlvbiB3b3VsZCBmYWlsIGlmLCBhdCB0aGUgdGlt
ZSBvZiBjb25jYXRlbmF0aW9uLCBvbmUgb3INCj4gPj4gPj4gPiBtb3JlIG9mIHRoZSBNVEQgZGV2
aWNlcyBpbnZvbHZlZCBpbiB0aGUgY29uY2F0IGFyZSBub3QgeWV0DQo+ID4+ID4+ID4gYXZhaWxh
YmxlLiBJbiBzdWNoIGEgc2NlbmFyaW8sIHdlIGNhbiBpc3N1ZSBhIGtlcm5lbCB3YXJuaW5nIGFu
ZA0KPiA+PiA+PiA+IGV4aXQgZ3JhY2VmdWxseS4gQnV0LCBIb3dldmVyLCBpZiB5b3UgcHJlZmVy
IHRvIG1vdmUgYXdheSBmcm9tDQo+ID4+ID4+ID4gdXNpbmcgaW5pdGNhbGxzIGFuZCBoYXZlIGFu
IGFsdGVybmF0aXZlIGltcGxlbWVudGF0aW9uIGFwcHJvYWNoIGluIG1pbmQsDQo+IHBsZWFzZSBs
ZXQgdXMga25vdy4NCj4gPj4gPj4NCj4gPj4gPj4gSSBhbSBzb3JyeSBidXQgdGhpcyBkb2VzIG5v
dCB3b3JrIHdpdGggbW9kdWxlcywgYW5kIHdlIGNhbm5vdA0KPiA+PiA+PiBpZ25vcmUgdGhpcyBj
YXNlIEkgYmVsaWV2ZS4gTW9yZSBzcGVjaWZpY2FsbHksIGlmIGEgY29udHJvbGxlcg0KPiA+PiA+
PiBwcm9iZSBpcyBkZWZlcnJlZCAod2l0aCBFUFJPQkVfREVGRVIgb3IganVzdCBwcmV2ZW50ZWQg
YmVjYXVzZQ0KPiA+PiA+PiBzb21lIGRlcGVuZGVuY2llcyBhcmUgbm90IHlldCBzYXRpc2ZpZWQp
LCB5b3UnbGwgZ2V0IGluY29ycmVjdGx5IGRlZmluZWQgbXRkDQo+IGRldmljZXMuDQo+ID4+ID4N
Cj4gPj4gPiBPaywgYW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gY291bGQgYmUgdG8gcmVtb3ZlIHRo
ZSBpbml0Y2FsbA0KPiA+PiA+IHJlZ2lzdHJhdGlvbiBhbmQgaW5zdGVhZCBpbnZva2UgbXRkX3Zp
cnRfY29uY2F0X2NyZWF0ZV9qb2luKCnigJR3aGljaA0KPiA+PiA+IHdhcyBwcmV2aW91c2x5IHJl
Z2lzdGVyZWQgYXMgYSBsYXRlX2luaXRjYWxs4oCUZGlyZWN0bHkgZnJvbQ0KPiA+PiBtdGRfZGV2
aWNlX3BhcnNlX3JlZ2lzdGVyKCkuDQo+ID4+ID4gSSBiZWxpZXZlIHRoaXMgYXBwcm9hY2ggd291
bGQgYWRkcmVzcyBib3RoIG9mIHlvdXIgY29uY2VybnMNCj4gPj4gPiByZWdhcmRpbmcgbW9kdWxl
IHN1cHBvcnQgYW5kIHByb2JlIGRlZmVycmFsLiBBZGRpdGlvbmFsbHksIHdlIGNvdWxkDQo+ID4+
ID4gY29uc2lkZXIgbW92aW5nIHRoZSBlbnRpcmUgY29kZSBmcm9tIG10ZF92aXJ0X2NvbmNhdC5j
IGludG8gbXRkY29uY2F0LmMuDQo+ID4+ID4gUGxlYXNlIGxldCB1cyBrbm93IHlvdXIgdGFrZSBv
biB0aGlzLg0KPiA+Pg0KPiA+PiBXaGF0IHdvdWxkIHRoaXMgYnJpbmc/DQo+ID4+DQo+ID4+IE1h
eWJlIHdlIHNob3VsZCB0cmlnZ2VyIHNvbWUga2luZCBvZiBub3RpZmllciBhZnRlciByZWdpc3Rl
cmluZyBhbg0KPiA+PiBtdGQgZGV2aWNlIGFuZCBpbiB0aGVyZSBhdHRlbXB0IHRvIGdhdGhlciBh
bGwgbXRkIGRldmljZXMgcmVxdWlyZWQNCj4gPj4gZm9yIHRoZSBjb25jYXRlbmF0aW9uLiBDYW4g
eW91IHBsZWFzZSBwcm9wb3NlIHNvbWV0aGluZyBsaWtlIHRoYXQ/DQo+ID4NCj4gPiBJbiB0aGUg
Y3VycmVudCBwYXRjaCwgZHVyaW5nIE1URCByZWdpc3RyYXRpb24sIGlmIGEgZGV2aWNlIGlzIHBh
cnQgb2YNCj4gPiBhIGNvbmNhdGVuYXRlZCAoY29uY2F0KSBkZXZpY2UsIGl0IGlzIG5vdCByZWdp
c3RlcmVkIGluZGl2aWR1YWxseS4NCj4gPiBJbnN0ZWFkLCBpdHMgaW5mb3JtYXRpb24gaXMgc3Rv
cmVkIGluIGEgY29uY2F0LXNwZWNpZmljIGRhdGENCj4gPiBzdHJ1Y3R1cmUsIGFzIGl0IGlzIG5v
dCBtZWFudCB0byBiZSBleHBvc2VkIGFzIGEgc3RhbmRhbG9uZSBNVEQNCj4gPiBkZXZpY2UuIEFz
IHBlciBteSBlYXJsaWVyIHByb3Bvc2FsLCBvbmNlIGFsbCBpbmRpdmlkdWFsIE1URCBkZXZpY2Vz
DQo+ID4gYXJlIHJlZ2lzdGVyZWQsDQo+ID4gbXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9qb2luKCkg
aXMgY2FsbGVkIGZyb20NCj4gPiBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyKCkgdG8gc2NhbiB0
aGlzIGRhdGEgc3RydWN0dXJlIGFuZCBjcmVhdGUgdGhlDQo+ID4gY29ycmVzcG9uZGluZyBjb25j
YXQgZGV2aWNlcy4gSnVzdCB0byBjb25maXJtLCBhcmUgeW91IHN1Z2dlc3RpbmcgdGhhdA0KPiA+
IG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9pbigpIHNob3VsZCBiZSB0cmlnZ2VyZWQgdGhyb3Vn
aCBhIG5vdGlmaWVyDQo+ID4gaW5zdGVhZD8gQXQgdGhlIHBvaW50IHdoZW4gYWxsIGluZGl2aWR1
YWwgTVREIGRldmljZXMgYXJlIHJlZ2lzdGVyZWQsDQo+ID4gd2UgYWxyZWFkeSBoYXZlIHRoZSBj
b21wbGV0ZSBpbmZvcm1hdGlvbiByZXF1aXJlZCBmb3IgY29uY2F0ZW5hdGlvbi4NCj4gPiBTbywg
cmF0aGVyIHRoYW4gcmVseWluZyBvbiBhIGxpc3RlbmVyIG5vdGlmaWNhdGlvbiwgd2UgY2FjIGRp
cmVjdGx5DQo+ID4gY2FsbCB0aGUgQVBJLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBhbSBtaXNz
aW5nIGFueXRoaW5nIGhlcmUuDQo+DQo+IFRoaXMgYXBwcm9hY2ggZG9lcyBub3Qgc3RhbmQgYmVj
YXVzZSwgYWZhaXIsIGl0IHJlbGllcyBvbiBhIHNpbmdsZQ0KPiBsYXRlX2luaXRjYWxsKCkgd2hp
Y2ggaXMgdG9vIGVhcmx5LiBXZSB3YW50IGNvbmNhdGVuYXRpb24gdG8gd29yayByZWdhcmRsZXNz
IG9mIHRoZQ0KPiBLY29uZmlnIHNlbGVjdGlvbiA9eSBvciA9bS4NCg0KSW4gdGhpcyBhcHByb2Fj
aCwgbGF0ZV9pbml0Y2FsbCgpIGhhcyBiZWVuIHJlbW92ZWQuIEluc3RlYWQsIHdlIGV4cGxpY2l0
bHkNCmNhbGwgdGhlIEFQSSBhdCBbMV0gdG8gY3JlYXRlIHRoZSBjb25jYXQgZGV2aWNlLCBhcyBi
eSB0aGlzIHN0YWdlIGFsbA0KcGFydGl0aW9ucyBoYXZlIGJlZW4gcGFyc2VkLCBpbmRpdmlkdWFs
IE1URCBkZXZpY2VzIHJlZ2lzdGVyZWQsIGFuZCB0aGUNCm5lY2Vzc2FyeSBpbmZvcm1hdGlvbiBm
b3IgY3JlYXRpbmcgdGhlIGNvbmNhdCBkZXZpY2UgaGFzIGJlZW4gZ2F0aGVyZWQuDQoNClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi8wZmY0MWRmMWNiMjY4ZmM2OWU3
MDNhMDhhNTdlZTE0YWU5NjdkMGNhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyNMMTA4OQ0KDQpSZWdh
cmRzLA0KQW1pdA0KPg0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCg==

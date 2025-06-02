Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC846B8;
	Mon,  2 Jun 2025 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860929; cv=fail; b=T73JXytMAtxEAyXiunZ0uy7pbF5U9rWOMafWakLhXKL3ptnEaCqRLx1ruM+NA2ZSd52tN1hVh8xHUes84EvsrRLfaBRBIwJA9JyYC4nJanJhghEmp/yxWsRfpXtQYVN/f+RwUwq5m0MTJc4THsJ39KhDEcGqhu5F198EL/X1M/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860929; c=relaxed/simple;
	bh=I8qlcVgnTeWADIebbfSGdzm8v69krgV3cFnlwETW6YE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjIl26TFIUIhLP49qa03if1JFXwZL387gqrLGNRTdyN4B4dnIE5l455zgqGaMH+8TzrAcM1zGCbBMP2ylGX9drHx4OUmDFBwR0cK6guaIoHJL1568+8sSv+spvh6XOoFJalyUZ3khXcDXIxLJ4Mrg9V475QaOrKCnQnz9qlFVdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=TkwPhmwS; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="TkwPhmwS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6doYKaJhfXSDJzlZjXwn2IzDSUxVqAPL90xHg3SEwAE/Vi3Yzb6XkLVc1KbL3QCzXTmogYugbSn0d9EEF+vftK5UN9PFfekoqc/I4LwhCcNBA4rd6snJl6saYeP1X6pSHztxBnJJQ7i/8NxXMxqGvXGaWZSXqiDOH38owgUBPDX4JzPJIcu/iUESwkJOs+/kb/7ZrYQcvToygeJvz+hIYK0+d/70BLiN87FqsOE/iHsFqNwTGw9GX9pSnDbUpo70E/RvO+GirRKmz35slp+QjnoYz7Au45xXO6QLf0O5rdNP0x61kbXdOWAV0hnwCKUliGVs8UEitrtOxkPRj1EpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8qlcVgnTeWADIebbfSGdzm8v69krgV3cFnlwETW6YE=;
 b=DHoRWUE/Ic9WcEufzdxvQmQx397KB8HSWm1NNjMJ9r8ougMQxlF5oWWjIyh8k4VrLF1yq5U1ottn1uhTMOpx0UjA5pekuu1/7wv4OmhQPzvMMFjbNB7AEP/F9GAT55qwhWCrGKGgtvQhHaKxK19cEpQyVauHiG0OUgxXTs67RzhVvRYlhHPzD8KYVlQJDsd1zO58wIm1bKCshSoP/EjH/XKiWZe38SZlgWmQtinLYdbjlwhY808qZno4ApcLOL/hpoxjVyWwpZ5AhNOf8AO+NEB+X4Pz7WfIH2bqyBinAGHVs/Y8n0JhNiaEtRvblf6D4xFVaWtdoIpCj/GQVJA8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8qlcVgnTeWADIebbfSGdzm8v69krgV3cFnlwETW6YE=;
 b=TkwPhmwSNIF4VuSja979sgP46OP+zpGkusR6dMocjZ2+5fZTWMu1CkJuDVRfNXIG0RPk/UpEbgy1HGzb1s7bACp57VaK0f7wYt5v/1mE/Jt4hJMfriDzWO48uCVBG0WuE5WPCwzWgpSR0yR1xTk9BRFRISoR3hw4YqCIvpnd9mwwkudfTDOrikArRrQxlSlUKUxDtooCwMGZb2brIwXzdOCPOrvnz5eASM8xPR78GENWhQ0MJYBjtDhYNtcC0IQr/EkhCnbBiliZcQSoSAzxTFjUz84qYHre++thdQlDj6qBoUgvWu1UQoSCg0VN/YSyGZ/Yo3eX433bkyoG7Nd8pg==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH7PR11MB8479.namprd11.prod.outlook.com (2603:10b6:510:30c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 10:42:03 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 10:42:03 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <krzk@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: mtd: atmel-nand: add legacy nand
 controllers
Thread-Topic: [PATCH v3 3/4] dt-bindings: mtd: atmel-nand: add legacy nand
 controllers
Thread-Index: AQHb04A92Evi9Vu3TkaCH/PnsrYBo7Pvd5WAgAAa1ACAAATPgIAAF7mA
Date: Mon, 2 Jun 2025 10:42:03 +0000
Message-ID: <0b255dd9-9922-497c-b3ff-9a850a1478fe@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-4-balamanikandan.gunasundar@microchip.com>
 <3825dcb6-00b1-4e03-ab1a-258bcd3265ba@kernel.org>
 <e457c167-59d2-45c9-8da8-e9fbd1f5e17e@microchip.com>
 <34288beb-a00a-4b17-a893-87d569a440ef@kernel.org>
In-Reply-To: <34288beb-a00a-4b17-a893-87d569a440ef@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|PH7PR11MB8479:EE_
x-ms-office365-filtering-correlation-id: 067bf9c9-88a0-43f0-6f21-08dda1c21ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUwzSTB6d3NTOWd0NHFWR2VOc2s3YzE4a0ZWYXNJM1BCQ28zNnFRYjdmaFkz?=
 =?utf-8?B?L1U5MmxBd3RLVXhidG8xQWRSRzFRZXJORlc5RnhXMWh2SG1ubUtubXdPakY0?=
 =?utf-8?B?RjdOcU1GWnFvQ0tJTTRYMXh0ZHFBclIyNW1tTEExRm9YSU9SbjRwdi9kKzVH?=
 =?utf-8?B?NGFKZGhWcGt1OGx2WXdrdkJRRGNlSURLNGNCSWJMU0s0d1dTbU11TDJwYWRl?=
 =?utf-8?B?SkxOd0E4ZHpPNVVLZ2kvTTJhY1JqaHJGcEhvbnZiWVpJVGtkRVVUZk5qWHBz?=
 =?utf-8?B?UGlSKzVsbnVhNVdUT2VrS2IzbzhlUjZEM1NVOVFDOWRhR244SzhrUE5oL0Zu?=
 =?utf-8?B?UWZpc1RjMXJleHVleTAwZ3pudWk5VzhWK3lUL1pkVEZQME1QL2lySnNLYTYv?=
 =?utf-8?B?cE5oaWNya05nTWc4UkJ4S3M4V0pWMUsrSHBZSnRRdUNDMGxTR0xTaGc5SDkx?=
 =?utf-8?B?L3ZBVWdEbUlYMnZqQ3I3OVpYNXZPaTVkMTVEQUpvMkVkRVl6VGFOK0wzWmNI?=
 =?utf-8?B?ZUtyVkZsV3hQa0FWUE9qR3h0Y0ZmaW0ybWd2RS9yQWNCblpUdG1SZHBpUTBB?=
 =?utf-8?B?Tmwyb2tjd2dFclNwUE1OWE01OVh4TVU0VEdXOVo3SzVVT3o0c1lDaFZ6NmtW?=
 =?utf-8?B?dGJOWGRablcrNmVCQm1LUnBsQ1FhQ2RvOGlmYytkaGJnNmMxT0hYTVV5MWtj?=
 =?utf-8?B?STFaSmVuMDVDSkh0WDcxNzVGa3M1c3pBTWFtakhOR1lTYlk3bElhaWV6RDVl?=
 =?utf-8?B?QTZHSGl3TnZnZzJNc1dybkpSVTVYU1UxVE5wQXlvcWZvU1ZYeHMzdnEwSkhy?=
 =?utf-8?B?d1k4YnA3OWljMlJqVHFrRTNsVXp4QTVXMVJDZEt5NnhHT0Q3dHlMTHBudTdo?=
 =?utf-8?B?OUtWQmxmQnlsOExLVThPU1lEVVZoa1luaDFSVGhhZlVrT3VEcENEZmoxWXlZ?=
 =?utf-8?B?cXNORjU1WCt6RGJiaHNoWGdHVTdrUFBablJBaVFRWTZ5NlgySGQ2bnRXSFpo?=
 =?utf-8?B?NFNKZWk2a0JQSytTcXRtaEJ5Q2VuMEpscVowQjJqc0M2MFNOL0J6RGsycDRL?=
 =?utf-8?B?V1NEaGEvY1hoWWxweVZXYm9wQmdqRm0zUzlkWHVjcWl2VncrTWZMdFNVL2g5?=
 =?utf-8?B?Z1dZWWNuaDdQT0R1VmJkaVlYSlY1NnczZzFsRlIvR1czYUUwWUxheEluVERn?=
 =?utf-8?B?ZnF6Tm1qdUVLV2hKTU1iZklISVduKzFXM0JGTWFjSitsVDU5cFlweG54aGRy?=
 =?utf-8?B?ZkU1ZGpYOS9NZjRuNHBNU2wvdVYybTVNVXdyWVZBdEFJYXVvVXBMUHhJc2dr?=
 =?utf-8?B?b1FJOGhxeEJtUHpYYWc4b3lkbXdnYjhuUDg4dWhWVHVadndmVmhYRDJlZnhR?=
 =?utf-8?B?N2ZBM1h0YUgwWFJDZWpJM2tnN0swMWQrNndSTWFYbU5kMndkdlZPdktrbk5H?=
 =?utf-8?B?Y2JQTUdGT3BVbXg3K3ZPVHB2RW0zbFpCYTk1a2pINzR2bWovckZWMmhrd2JQ?=
 =?utf-8?B?eTJrL2RGK2h1eE5IdjVXRHBGZHFHQkFjL3NSMTVEWTVNNWtDRGNuNGRrS3Bl?=
 =?utf-8?B?ZjJ5d3RIWFNhOHZpdHNreVVmMHlFbVEvTDdkZ25iQWw4U3pHekF1YkFmcElG?=
 =?utf-8?B?bUIyVWFGbnJHclpPQlZXcGpXTXgxeTlraVRNWUFISFRycmVjbDJuTTJKaVJP?=
 =?utf-8?B?dWVROEVoR25JSXNuVnlPTXZtY1Nhck5VdUQ5eXBXQ090SXVXbUFxR1ZLamhU?=
 =?utf-8?B?d0RkeExVaUU1dXB4WElHV1dlUEFNQzV3ZWpHeUZpeXl4K3JUeklkTUhncFBh?=
 =?utf-8?B?R3RIZjFua21rc1dLYUxrVlZ3L2FQalRSbUxjVUNDTHJNQ3lOZnhlSmNvT3FD?=
 =?utf-8?B?RWhSUWlkbHpSSy9zdnZXYzZpdjFvWXhjVDRoU1AxditmSnpzeDNIck1nSE9o?=
 =?utf-8?B?RGd4SDFSV2ZieHZ4ekNwQ1l6eDFsdTczSTdCMHNnV0gvbjBEU1dKcFJQcW5i?=
 =?utf-8?Q?w6TZFctnuCXoz1W1fUpH6WYQcfiNmE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWFSZyt0emZsYmtTK1VrbVFybWJJdWJiU2FHdzE1aFVwMjErdVJ5N2dpQmgv?=
 =?utf-8?B?SWZkWVF3RG5lZjZ3aXVBMFM5ckJWQStLK0QrSzZVMTJ6S3lKZ3RWWmxNRlZG?=
 =?utf-8?B?VTBkaENJeVNpNDV1T21xOHB2ZUdSMFp1cWJsTjY3QVBQODcwbWFkeVVDUDlw?=
 =?utf-8?B?OVFnR2tBbVBXM3BxU1UzS1RMSXNmb0VGVll0dWhaUDJvRUJLSzk1aTdHZThW?=
 =?utf-8?B?VlRSMFU4MFB3RTN5bURUd3dLc0ZZcnBUOHJsNGE1eXd5TzllL2kxTS9Sa0o1?=
 =?utf-8?B?WEpnYW9pWjZQclorSUk4d2ErbDJaSHF2ZVlwRmpnV2hiK0tsL2J0ZkV3QmZF?=
 =?utf-8?B?cnJTU0YvU2NDWVIzVW9RVzJMdWZ5QWxwVVVxaXdCaWtUNUJEQWxHRTd1UUgw?=
 =?utf-8?B?UWFINjJmQS9yWFF1Z0ZkU2xieWxFdTRjcThIbU82b0tMNEhNZ2lQQnJCMjZu?=
 =?utf-8?B?c0pXMExDZ2xEOExCUE5mbm1ReWdFbTZRM1hIY2Y3WVZVdFhZT2Jid1JRUC9z?=
 =?utf-8?B?RWh6TXIyQ3dBNGNuSlpoMVVIMk5Nc1RqbUZTM3EyU1VEZWRKYk04Z2ZFSUZC?=
 =?utf-8?B?R2RtUWxYLzJhY2FEYUFDK0RTd0h6d0M1Z3IzVzJuby9ZVkhrT3ZpUkE1RDRF?=
 =?utf-8?B?VjFMQWZzQWpQRG1HMDF0eFlyVEs4SlUvbFpMazExek1zYVVRMmpWenlzQWQ2?=
 =?utf-8?B?UDJEY2dRQUlEREMxTWVBMEdnTkdsanRKcGd6RS8rNUI2cFpha0dwMXZIM2Vq?=
 =?utf-8?B?YnNTTVc1Z3ZnUVEzM3RkV01COTJZOXdibUZLaHdjaGwyWUh4R0s3cVM0QXE1?=
 =?utf-8?B?dElIc1g3S2tLRFZEb1luRHdOMU5FZms5SW9jdUNFQ0VDQW50eVh6MitISnVD?=
 =?utf-8?B?cWlCejFvR3ZMUFlDMGZ1azNrV0VJb1U4a2g1enVJT3NNSnQyWjVFbGFhZWVp?=
 =?utf-8?B?dnZocUZoTlJXNGZ5VnphUEQvVkVRN3R0Ni80NWlXSktUWmRJci9RNXNVdHJo?=
 =?utf-8?B?Z2ZwNENsR1hya1VrZ2VoTDEvbVlmb25EeGt6QVZSajJPeW82eGRudm9tVng2?=
 =?utf-8?B?U0pyWVpkOXh5RERDdHBIQjNacW5UbVNSRjl6a0oxR1V0N0R1QkFSTXNVRTY1?=
 =?utf-8?B?bXhOODF2SzZXZ2wzNklScUVGR2FzNGJ1N1hDa245TkVncUczK3ZMOFVOb283?=
 =?utf-8?B?SFYzUnFjT2xhbzNqWE8xcFNsZU80TllCZjVQcDhHVVpwM2hYSy9ORHo2cy9t?=
 =?utf-8?B?ZFNOeWZXeTMrSGN5OTI2ck1FMTJ0bmc4Rlh4ekkxYnRrMGVVbGhMRWpsR0tW?=
 =?utf-8?B?L3JkU0ZPRDBDTGJVY2p4cjJxNmszOFNtTnlad3VPVnZCZnozRU81eVo4USsx?=
 =?utf-8?B?OVZOY000dE1IVlJ3RHJkSGhJRENTN0U1TStaM3BzUEN3NnpEUFBoN2lBVUkz?=
 =?utf-8?B?cFdJZU8vallacUNXSzF0UkJQMk1PUjZTR2NlQi9rQnlhVWpyWEdmVksyZ29z?=
 =?utf-8?B?RGxDd1BnTEdGdVhFekdMTjFKS2dWejBMMlFWK3dIeDV6bFJWaEwxMTVGczlj?=
 =?utf-8?B?Q2IyQWxLU0YvNGV1OGJJMGFLbmxpL24wT2FjR1hVS2JHNUFlTVRYZXRUSGNH?=
 =?utf-8?B?K096WXJXRkcwaFZHK1l6V3FtemNZTXlyNmIvL1FMNGRSUXF6R0tTamxTVXYv?=
 =?utf-8?B?dC9uTS9nWFNqaWd4OCttVFhxNFFqZVJHUGxZT2wzTVdySTNuL2o3ajdzck9P?=
 =?utf-8?B?TFZ3MXlaY2xNSkxhb2hDbGlHZXo2Ukl2SlNTVHo1ZlpPYzNFc1VOQ1c0a0Fw?=
 =?utf-8?B?K1p4aHZIOUdwcnNxcWtUOTI5R1NhVEhhYy82dVhBaktQUWJKVGY5VzByZUx3?=
 =?utf-8?B?bVZpT0QvRjhsWVpxMWN2UGZPdDE1WkUwMndRTitLazhpdVNrcFZ6S0xOclpG?=
 =?utf-8?B?VlpudDM0VjdRcVBkYUR4RmVKNFRUNCt4UTZOVXJGb3M2QTVUdmJqZHRXeDg1?=
 =?utf-8?B?RzBWbzRVMTBTUW5obDFwVTJVeUhwNW52SDRGNEZBMUZWWkdRZzY2R2ZKYjQz?=
 =?utf-8?B?NVVWR1NFMVRObXhVa0F2cEtMaG82WUxlMFlCQ0FnNGtsUkxVZVhpWGlsZU1w?=
 =?utf-8?B?bkQ0aHUzcXQ4dmRxUHMwQmVseWl5eUZENDM3SW5mNU1nUHkwUFh0Q2htUStF?=
 =?utf-8?Q?zhyWsNWVA3SCTIt/KhDS2Ik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5138EA05FB9D214A88A55B1E1537345A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067bf9c9-88a0-43f0-6f21-08dda1c21ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 10:42:03.2115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKsLRSqmiwBXg4yKnloICmNkjjGcD74zH4qYocjYO/wl1N5nZZ8xJXQL4BLw6YonFoMHpQp2NYTzBg2Tns2gGG+/72C4C9oKiPH//7Tj6xCStfKTAYhYQ+G8JztnDvax
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8479

T24gMDIvMDYvMjUgMjo0NyBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwMi8wNi8yMDI1IDEwOjU5LCBC
YWxhbWFuaWthbmRhbi5HdW5hc3VuZGFyQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAwMi8w
Ni8yNSAxMjo1MyBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIDAyLzA2LzIwMjUgMDc6MzUsIEJh
bGFtYW5pa2FuZGFuIEd1bmFzdW5kYXIgd3JvdGU6DQo+Pj4+IEFkZCBzdXBwb3J0IGZvciBhdG1l
bCBsZWdhY3kgbmFuZCBjb250cm9sbGVycy4gVGhlc2UgYmluZGluZ3Mgc2hvdWxkIG5vdCBiZQ0K
Pj4+DQo+Pj4gTm8gbmV3IHN1cHBvcnQgZm9yIGxlZ2FjeSBiaW5kaW5ncy4gQm90aCB5b3VyIGNv
bW1pdCBtc2cgYW5kIHN1YmplY3QgZG8NCj4+PiBub3QgZGVzY3JpYmUgd2hhdCB5b3UgZG8gaGVy
ZS4gSSBzZWUgeW91IGNvbnZlcnQgRVhJU1RJTkcgYmluZGluZ3MNCj4+PiBpbnN0ZWFkIG9mIGFk
ZGluZyBzdXBwb3J0LiBCdXQgaWYgeW91IGluc2lzdCBvbiBhZGRpbmcsIHRoYXQgd291bGQgYmUN
Cj4+PiBOQUtlZCBiZWNhdXNlIHdoeSB3b3VsZCB3ZSB3YW50IHRvIGFjY2VwdCBuZXcgc3R1ZmYg
d2hpY2ggaXMgYWxyZWFkeQ0KPj4+IGRlcHJlY2F0ZWQ/DQo+Pg0KPj4gWWVzLiBJIGFtIGp1c3Qg
Y29udmVydGluZyB0aGUgZXhpdGluZyBiaW5kaW5ncy4gSG9wZSByZXBocmFzaW5nIHRoZQ0KPj4g
Y29tbWl0IG1lc3NhZ2UgaXMgc3VmZmljaWVudCBlbm91Z2guDQo+IEFuZCB5b3UganVzdCBpZ25v
cmVkIGV2ZXJ5dGhpbmcgZWxzZT8gUGxlYXNlIGtpbmRseSB0cmltIHRoZSByZXBsaWVzDQo+IGZy
b20gdW5uZWNlc3NhcnkgY29udGV4dC4gSXQgbWFrZXMgaXQgbXVjaCBlYXNpZXIgdG8gZmluZCBu
ZXcgY29udGVudC4NCj4gDQoNClNvcnJ5LiBJIG1pc3NlZCBub3RpY2luZyB0aGUgcmVtYWluaW5n
IHBhcnQgb2YgdGhlIGVtYWlsLiBOb3Qgc3VyZSBpZiBpdCANCmlzIGEgcHJvYmxlbSB3aXRoIG15
IGVtYWlsIGNsaWVudC4gSSB3aWxsIGFkZHJlc3MgdGhlIHJlbWFpbmluZyANCmNvbW1lbnRzLiBU
aGFua3MgZm9yIHJldmlld2luZy4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

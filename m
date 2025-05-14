Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021095.outbound.protection.outlook.com [52.101.65.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E619341F;
	Wed, 14 May 2025 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234976; cv=fail; b=pgqaE+8/SodfjitT0vv4HP8msbuVSQeIyPhBLaNnH0aXp0MoTBwxOfcC3arRzJuN4jrNT53IZBEo3sNeQ5DyHsJOsKPUGaFyZK2M8W8DhBGeeR7D404cb+LTrBRJS6Mm6HanhDlkdGtKhRLDd7m07/wEzHiiK7GQQx6c52PwXHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234976; c=relaxed/simple;
	bh=MWTNsWsONHS9P+TZtcWaMAJnluk61TLE4XNR3peqmrQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dv2YIM4kP4N/AEHd5c8gkXg+6Xv8lsVLaPykyx2nzPwvjU3/iD5sDRBPhSdOdC+ldPKvsR78aaHobqA9d0Q6BWZ+75nhtjnYoGtaLlTLKWwGOHXLHP8EC6cRfAeaWq/aGcYCqb8qGZPaQNNq7lWacC5DmGkB+uUDXkTs/L0H9R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=Q8HKOy56; arc=fail smtp.client-ip=52.101.65.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="Q8HKOy56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkqJNbqjw8B5I2F0BthsFe4GckuhxZAJ37o9N3h++jul3J8N1hAagy1fXIVAVtGluEqZ0dFoSsT4oHE1HRqN3iP2f+V47nYfIEwa2F3Z2rc98InnPbRe8llAO1aHrKCl11LPzkk/6CuWupoouvJlNa9xfK/evCz2DX67VbitqATEYRsPbxkctjNPjqTnpve2rnCOTaA1bS0yJSnHw+TVNYJVPZ8FKxv8orQoNJwoXWDRETjows9h9Kby0xJt/8L07R1CYN8+ditb3XBU7tm4+Xmpf1YSALrHNHMdl2FxQB9BpK4IXkKtLyzrcva+ICU6XUCPdnwLdy01cTcwDjeAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWTNsWsONHS9P+TZtcWaMAJnluk61TLE4XNR3peqmrQ=;
 b=CVHLaQyNhM0s4TkLTgdeziQl5yGQt/Zv7+5xRphEp1WiLzOI9De0KoTfQbfsSvUH+Nw1K2OGyhJZOI8SSg/YqHvTuv11fls2Yn/BL0k/0QRua7+wocMZK7ZJUmEX6pPJbs6T+yBbM5E5q2NHC9LeF9D7KNRDcuNOxQ6DTGgK8PHUC3aaZqmAeYqP6iEjGcH97B3MNFQCgQvab0FxHe89x7NmAdvfUftnKS4J1ql3h1sNxnmEciqulrBxPsDKngwiTMlpJRV+gXVcB6GBA+AkY632hlVz1Xy56QDYszwJ7jQq5P+ZQ+h0i+rfY+xIGTQU90MDVY+7SfdkHDWmph1Ohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWTNsWsONHS9P+TZtcWaMAJnluk61TLE4XNR3peqmrQ=;
 b=Q8HKOy56imX5eilGmrniAW0YeVGY63GRLTVBFut95I/bwMkUtcLEBhwVraf/eipYlNi9z4Y73EIKtEcslHCGdPb18br6iPQsUX3juHWbBjm4uI7c9RbF8fozhqU8XSOeksesGLCJdZVbjLdVFFVqg3NApbLeuIJyOh4La0nV4lZh+12n/jIsmSGeqTbGB+6VKQIKyZjidOZz0rmw9wXV+EVWqlJ9LqDzXMA1lhEXjRsTqw67NehqNT91jW52L9nt3pp/J+QEJW/Egendh0f6ij7BRzir/+OjnXAGxke+ozw6X9x9kzBghBth2LxJ1sYccXbHhAetCib5TdRwVpL3ew==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by AM7PR09MB3831.eurprd09.prod.outlook.com (2603:10a6:20b:105::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 15:02:51 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 15:02:51 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "arikalo@gmail.com" <arikalo@gmail.com>,
	"conor@kernel.org" <conor@kernel.org>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Thread-Topic: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Thread-Index: AQHbtElBfdhbNmzjHUemgxt7b8uhI7OyWnYAgB//fAA=
Date: Wed, 14 May 2025 15:02:50 +0000
Message-ID: <3a73625c-63d7-4ed4-98a3-84d7d26e8484@htecgroup.com>
References: <1b72b68a-ad20-48b9-9a8e-c58ad6b15017@kernel.org>
In-Reply-To: <1b72b68a-ad20-48b9-9a8e-c58ad6b15017@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|AM7PR09MB3831:EE_
x-ms-office365-filtering-correlation-id: 4117f52b-ae35-46a5-ae50-08dd92f8659d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkErY2ZtNm9tU1pVUG84OG80V1dzYVRUMUduUm1pa1RCbE9MekozT1Aybjgv?=
 =?utf-8?B?TVN4Z3IxYno3YTJOUFRKNDFNTGR3cTNVQzJGakEveHdBVHB0YVYyaHlXRk1Q?=
 =?utf-8?B?Z1dKTXVLd0h3djhQYXJjL1RPSTQ5YjVNTWxNdmRMcEdadXkyMVdZL1JIMCtv?=
 =?utf-8?B?SndTS2NjN3M2NTBrZUVURjJmUmVtRFAwdGt0ajJTalJkUjRLRjQ3R1NLRnBh?=
 =?utf-8?B?OGZBR2swNHY5K1JyWTlIeTZDaElFcFZDWVJ0RnhaZUk5UFlVQnZFUUFMNFp0?=
 =?utf-8?B?d2FLcGgzT09RSnJkc1dSNzNsNFNjSkJ1UTl5ZTdHa3ZWemVBbVRKaWRNRUp2?=
 =?utf-8?B?RE9iNXY2ZHBVQ3kyZXJYdGNUQWhrckhzV3dLQkxrUGxCdVZkcGVtNEU2SWps?=
 =?utf-8?B?REhPWWI4R242dnFSYld2WHhoTUtCYjdFSGFQdW45dmFnd1FCMkVkeUJWaEM1?=
 =?utf-8?B?bUMwQVdMUTBJbmFGUGl1dGhjenVpK1JSWGE0L1dLVVNnMVJMYnZtWjZCa1Fu?=
 =?utf-8?B?cFlEWGNPcWxZTjFqaWI1YzRkUU1oYlFVQldUZm9TQmp2TExtUlJKc085VmdF?=
 =?utf-8?B?b3M5bHlPdnVyWjJsUjlwanJNV05weGZqWjhYbnQxS0JKdG5QM2dxWUpsODJT?=
 =?utf-8?B?dXdhdFY1bC9HV09zQjhzUTlOR2wyUkVGYUwyRU1LMktucGFvQ0ZqaEE5dlg1?=
 =?utf-8?B?YzRXd0hqL0psUjAwZjVuazlqMi8zc05Ua3J1cUNvRm9XRmhaNEQ2VmZGSlla?=
 =?utf-8?B?VWwvTGhVajhYMWxiSGIyVnBtMzl0WjlGOU9McldPeFYvbXA0VWhmdmZPVDU3?=
 =?utf-8?B?cGh2Q3lGSXUvR2QyWDBQTEM2dWE2R1J3WklNVnVVZ2s5RlYwd21tL3QvdnEv?=
 =?utf-8?B?M1ROK21rQmJyOVBsUkV0OGFqTUc2L1V6S1ZtaDc5Z1lhSysyTEdab0twNm9v?=
 =?utf-8?B?bzRoTm9JWnZwSWdOT2M2WHlCV3ExWUR3VSt0akRTNEtOTzZBYUZ0bDJyTDY1?=
 =?utf-8?B?NU1ZRFhqa2czU1pYa21NeUdMREN2SW0yUlZwU0ZHRUYrb0lBWVN5SEZKZU9R?=
 =?utf-8?B?VXBBYVpyZ1BueGxEVDJmdUpHODBjL2JSb1J4ZVZUMjB1OW1hU2hTWE9HdXh1?=
 =?utf-8?B?RmRFK1dod1JmamR1czJVRmtMM2l3T1NGamduaXRXNzl1M1E0aU1zd081MkVz?=
 =?utf-8?B?a3FMaWZGQzhkWmdoNVpLNlpKV1YzQlkzd2ZrQnl2NFdpbHNJZWlrLzFhMndw?=
 =?utf-8?B?WktncnhuT2pzK0pERU00Z3Z3SXlyYzZoTEUxR1Y2TlM2aWdvR0h2dEJCalpx?=
 =?utf-8?B?dWxKWDRFWGNqWldSYnUyTFA0UWpGTkEvY3Bxa2t5cFFSemZ0TW5mVU1YMFcr?=
 =?utf-8?B?bnEvaDR1VVRUKzlUTFpncVpIT09mc2FoajRmZGRwVmVHSDYvNEQ4M1pkM2NY?=
 =?utf-8?B?eWZ4QzNuc0NsUUJReFZ3eFkyTUZaSm9SdzNVK3ZXWGZJZFRQY2dnZFh2T1Np?=
 =?utf-8?B?Sk9BU1RTamdBSXMrSHdjSW8xSGhPd1BwOElYM0xuWnVPdHhtamJZejRCMk9B?=
 =?utf-8?B?MjFzVStXdXhVclBWM2FNdXZiSlZmeTRiem55ZVdPWTRhVi84NjhYVjg4TFhu?=
 =?utf-8?B?WERRMmtldmVVdEtTNnA4empWR2pISi9PRk9QM28rOGJ1WFFCSEd4R0x1WnRF?=
 =?utf-8?B?aUQ4dmNjdVBXeGJIdURvbC9tSDloZWhVZDNFVGg4c2VQNnlMbTBmRzFlcU5T?=
 =?utf-8?B?UEZCVlBaN3VrRlI3SlgyK1FvSERidGNWU2ZmMVRyenJkbFRYbXdaK2k2djBM?=
 =?utf-8?B?UFhVWXNvblpVWlJhWUtlMExCU0JkeGYrMFN0MXA5K0dqa0xFZHdaeHlBVDVE?=
 =?utf-8?B?TTZRbUQyclNqL2gzNW93QmwxWHUvTEJCTmp4SXE5ekROK3c3VTdwaVpwOFRY?=
 =?utf-8?Q?q3T+PHpi+ic=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjdvREEvSWZQajR4TEZtZ1crYlk4azU0dmx2bjBuZ2RPWTlGQkZRWFVzbWt4?=
 =?utf-8?B?eEJpUnlxdG9zd3VRaEtDbWhmTXJvN3BXcys5Slo4ZjhkMzhRZ05rc1ZRNmZh?=
 =?utf-8?B?aThjQ1M4SS95SVRxNFNMSGNQSWlrQ1c3elJMSWpXWGpEblhRa1JhZk03ZEJp?=
 =?utf-8?B?R3dUMkpTTExKektHZE4xa0hrOTJDQ3N1VkR5bytjQWR3b1VlWlRRN0owVk5I?=
 =?utf-8?B?NzZUTzRrYmpkbkZwb0pMYW9Na1g0RC9zYW9NMlVEdWEybVhHaVIxaXVZV2xk?=
 =?utf-8?B?Z0s3aTNkQkdlT2VveElwKzhNVmdRSDdjQURLMTVZR3FaT0F4VzMvT1dObU9o?=
 =?utf-8?B?MmJZdjR5MUZKS2Y2QzZVRW12YmNKY1R3VE0zV0VuZElMLzlQNEpQTzROZTg0?=
 =?utf-8?B?V1dBd3Q4SnhkeXV3NFVRK245Ylc0T2xkU0FEQ1ArZndrNGo1dVVkWTRLQ1I3?=
 =?utf-8?B?aFdNaEV4Qk8xVkJQbGRNU2pKT2J3RXA4K0hRTjVVUHVDY2lLM2h1dHNMdnZi?=
 =?utf-8?B?YkJtRWhEd2lRL044eFBPUW44VTA0THZLQmVkemY3QzlPRk1EZzFLTUlTdE8v?=
 =?utf-8?B?TTlDQndQVEc5aTc5Y0NZRVdSVHBMMlVaNlc0dmdqUUpndVBraWNuTU4yb3M1?=
 =?utf-8?B?WG5nbHJ4VHIwQmV2alBENU1Ra3NmUmVtRS9tYTU0MVFRWDRNbzByaTloV2tS?=
 =?utf-8?B?QzgyMUVmMXdiZWpHZnBudDl2S3NweTNnRmJjS0JiZjFOckFRVXhMWk03NjFy?=
 =?utf-8?B?NWpmVzNhcUNWNGswSzdINWkyNFI2blZWVlRwL3o0YWtERnF5ODVTKzF3cmxP?=
 =?utf-8?B?SVVtUW5hSU4zeHBKTFdUWExXRTB0L2VLSUxRSlJtTEF5UzE3YUpiZVI4TU0v?=
 =?utf-8?B?MTZROG4rVzA1S3NLanJWNUVFQTdWT3Q4ZUpSSnEvQ2JxN3lrVUJsd3VzNHZC?=
 =?utf-8?B?R3poNWVjcS9DWGptWUU5Tm1mUTgxeEdYc0NsRUYrODZYb2Fwb2hFdE56R3kr?=
 =?utf-8?B?ZWwrTDJmNko3UzcvWElrcTdKcGU5T2JOdWJGOGdVY2l3eTJjRDVVOEUza1l2?=
 =?utf-8?B?WnR2aUNOUVNVNDVRbWVKTHgvdHRCVGtlVWxBWElRbGxUZm5GWDk3V1ZRVXNH?=
 =?utf-8?B?TUdHRkxHZHViRmNta2ZnVTErT0ZlRUdlblM3Vk5RdzNybUk4bkxWVm5nbFVm?=
 =?utf-8?B?cWpOMVpmd2ZzcVNTSEpNeFp2eUdGQTlQWDJIRzNzQ3JWdDBDdE0vTWp2QXhR?=
 =?utf-8?B?RjNiSytBM3N2VTNONFFGNG5oS3VoSkdiODMwbzBjSXVFbjFwSmNpVDgvVUhI?=
 =?utf-8?B?M2hmb3oyOWo0SGhiL3hIVDFzQ2xpZ2M5c2kzUXh4M2dsMUtxY3hLdXpzYk9y?=
 =?utf-8?B?WXI5cEg2SE15NnpwVzNSd2hrTll4NEd0RzdXZnF0NzlReDZLVzBPdFgzSDll?=
 =?utf-8?B?alV4RDVORDJPaE5CeUhTNjhVMXk5SVVwMTRvZU9pV0czNW1ZUDM2bFRiYUVz?=
 =?utf-8?B?MC8wWkdDclpld0RDSmZPUkNFVjd3L095c0p3MFBVWnUrbytTZ3F4MVhKUmxw?=
 =?utf-8?B?Q2xhcThxMHVPbncxVis1dCtQeFVxY1hhNGFNRXU5cG8vQnpyaHNUaVFvM1Jv?=
 =?utf-8?B?WExFOVFjcEFkMWJwL25GeTlOQmpESnlacmpOeHhmdEt5cG5pbEFWaDBiMjR2?=
 =?utf-8?B?UXpiTHlqamE5UUV0WmJhbzA5T0hJTTZpb1h1Y25QZjhUYTRzTGI3cklEMUJW?=
 =?utf-8?B?REhDekEvZ29BWjl0N3c2eEE2aWVUc1o4RVhPc3AyR1gyVG52VmNPVG84aGZP?=
 =?utf-8?B?dHJMZGJQb1VlQkZ1L1FGQm9kTnhpYXRFWmpoWXVNOVo3UzlnYVBjWXI4YkRJ?=
 =?utf-8?B?YzgzRmp0cFJibmVRYXZsOHVIT01vbzZ1ZlE5MGZyOVk1aDZKS3E4bVByREk1?=
 =?utf-8?B?S0I0U2ZwVGhXMW1rZjllWkRyQy80SHYzU25hQThBdURUZlFKcU82Ky9Zb3Nt?=
 =?utf-8?B?clMycERHREh6R1lXbG11N1VHUWpnV3hGU0lmRVUrNk4wZWs3V2VTU0VvZFcz?=
 =?utf-8?B?eWpXQjJ0cDUxN1VLb21OSDczTU5PQ05pR0JpT1pJT2V1L0pjMnd3YXlDWGwz?=
 =?utf-8?B?M0h4cW5PTTVSMVRLUjVBdnBkNmpoa05qQVN1ZTZ6U0JaTERBSTBTK0hCY0NS?=
 =?utf-8?Q?IRvXi5p2nUfnZTQQ7GxZzdQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19166B662D9A594983119A86A6C906B2@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4117f52b-ae35-46a5-ae50-08dd92f8659d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 15:02:51.0440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILNcuwW0l8p8BdVpMSHKTBDEP0tptvXyCi6qrueMuhPERtD/06M3UAw13HtyXXA032aCDX2TJKQrbBa2uu3BBU/RcbKJ4Dpn1uf8nucQ1Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3831

T24gMjQuIDQuIDI1LiAwODoyNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gW1lvdSBk
b24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBrcnprQGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlz
IGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQ0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lk
ZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUuDQo+IA0KPiANCj4gT24gMjMvMDQvMjAyNSAxNDoxNCwgQWxla3NhIFBhdW5vdmlj
IHdyb3RlOg0KPj4gSFRFQyBQdWJsaWMNCj4gDQo+IEZpeCB5b3VyIGVtYWlsIHN5c3RlbXMgb3Ig
dXNlIGI0IHJlbGF5Lg0KPiANCj4gDQo+IDxmb3JtIGxldHRlcj4NCj4gUGxlYXNlIHVzZSBzY3Jp
cHRzL2dldF9tYWludGFpbmVycy5wbCB0byBnZXQgYSBsaXN0IG9mIG5lY2Vzc2FyeSBwZW9wbGUN
Cj4gYW5kIGxpc3RzIHRvIENDIChhbmQgY29uc2lkZXIgLS1uby1naXQtZmFsbGJhY2sgYXJndW1l
bnQsIHNvIHlvdSB3aWxsDQo+IG5vdCBDQyBwZW9wbGUganVzdCBiZWNhdXNlIHRoZXkgbWFkZSBv
bmUgY29tbWl0IHllYXJzIGFnbykuIEl0IG1pZ2h0DQo+IGhhcHBlbiwgdGhhdCBjb21tYW5kIHdo
ZW4gcnVuIG9uIGFuIG9sZGVyIGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkDQo+IGVudHJpZXMu
IFRoZXJlZm9yZSBwbGVhc2UgYmUgc3VyZSB5b3UgYmFzZSB5b3VyIHBhdGNoZXMgb24gcmVjZW50
IExpbnV4DQo+IGtlcm5lbC4NCj4gDQo+IFRvb2xzIGxpa2UgYjQgb3Igc2NyaXB0cy9nZXRfbWFp
bnRhaW5lci5wbCBwcm92aWRlIHlvdSBwcm9wZXIgbGlzdCBvZg0KPiBwZW9wbGUsIHNvIGZpeCB5
b3VyIHdvcmtmbG93LiBUb29scyBtaWdodCBhbHNvIGZhaWwgaWYgeW91IHdvcmsgb24gc29tZQ0K
PiBhbmNpZW50IHRyZWUgKGRvbid0LCBpbnN0ZWFkIHVzZSBtYWlubGluZSkgb3Igd29yayBvbiBm
b3JrIG9mIGtlcm5lbA0KPiAoZG9uJ3QsIGluc3RlYWQgdXNlIG1haW5saW5lKS4gSnVzdCB1c2Ug
YjQgYW5kIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlDQo+IGZpbmUsIGFsdGhvdWdoIHJlbWVtYmVyIGFi
b3V0IGBiNCBwcmVwIC0tYXV0by10by1jY2AgaWYgeW91IGFkZGVkIG5ldw0KPiBwYXRjaGVzIHRv
IHRoZSBwYXRjaHNldC4NCj4gPC9mb3JtIGxldHRlcj4NCj4gIA0KVGhhbmsgeW91IGZvciB0aGUg
dGlwcy4gV2lsbCBiZSB1c2luZyBiNCByZWxheSBpbiB0aGUgZnV0dXJlLCBzdGFydGluZyB3aXRo
IHY0IGxpbmtlZCBhdCBbMV0uDQoNClsxXQ0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyNTA1MTQtcmlzY3YtdGltZS1tbWlvLXY0LTAtY2IwY2YyOTIyZDY2QGh0ZWNncm91
cC5jb20vDQoNCkJlc3QgcmVnYXJkcywNCkFsZWtzYSBQYXVub3ZpYw0KPj4NCj4+IEFkZCBkdC1i
aW5kaW5ncyBmb3IgdGhlIEdDUi5VIG1lbW9yeSBtYXBwZWQgdGltZXIgZGV2aWNlIGZvciBSSVND
LVYNCj4+IHBsYXRmb3Jtcy4gVGhlIEdDUi5VIG1lbW9yeSByZWdpb24gY29udGFpbnMgc2hhZG93
IGNvcGllcyBvZiB0aGUgUklTQy1WDQo+PiBtdGltZSByZWdpc3RlciBhbmQgdGhlIGhydGltZSBH
bG9iYWwgQ29uZmlndXJhdGlvbiBSZWdpc3Rlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGVr
c2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4gLS0tDQo+PiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvbXRpLGdjcnUueWFtbCAgIHwgNDcgKysrKysr
KysrKysrKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspDQo+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1l
ci9tdGksZ2NydS55YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aW1lci9tdGksZ2NydS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RpbWVyL210aSxnY3J1LnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjY1NTVkYmFiNDAyZQ0KPj4gLS0tIC9kZXYvbnVsbA0K
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL210aSxnY3J1
LnlhbWwNCj4+IEBAIC0wLDAgKzEsNDcgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0N
Cj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3RpbWVyL210aSxnY3J1Lnlh
bWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IEdDUi5VIHRpbWVyIGRldmljZSBmb3IgUklTQy1WIHBs
YXRmb3Jtcw0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBBbGVrc2EgUGF1bm92aWMg
PGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4gKw0KPj4gK2Rlc2NyaXB0aW9uOg0K
Pj4gKyAgVGhlIEdDUi5VIG1lbW9yeSByZWdpb24gY29udGFpbnMgbWVtb3J5IG1hcHBlZCBzaGFk
b3cgY29waWVzIG9mDQo+PiArICBtdGltZSBhbmQgaHJ0aW1lIEdsb2JhbCBDb25maWd1cmF0aW9u
IFJlZ2lzdGVycywNCj4+ICsgIHdoaWNoIHNvZnR3YXJlIGNhbiBjaG9vc2UgdG8gbWFrZSBhY2Nl
c3NpYmxlIGZyb20gdXNlciBtb2RlLg0KPj4gKw0KPj4gK3NlbGVjdDoNCj4+ICsgIHByb3BlcnRp
ZXM6DQo+PiArICAgIGNvbXBhdGlibGU6DQo+PiArICAgICAgY29udGFpbnM6DQo+PiArICAgICAg
ICBjb25zdDogbXRpLGdjcnUNCj4+ICsNCj4+ICsgIHJlcXVpcmVkOg0KPj4gKyAgICAtIGNvbXBh
dGlibGUNCj4gDQo+IERyb3Agc2VsZWN0LCB3aHkgZG8geW91IG5lZWQgaXQ/DQo+IA0KPj4gKw0K
Pj4gK3Byb3BlcnRpZXM6DQo+PiArICBjb21wYXRpYmxlOg0KPj4gKyAgICBjb25zdDogbXRpLGdj
cnUNCj4+ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgaXRlbXM6DQo+PiArICAgICAgLSBkZXNjcmlw
dGlvbjogUmVhZC1vbmx5IHNoYWRvdyBjb3B5IG9mIHRoZSBSSVNDLVYgbXRpbWUgcmVnaXN0ZXIu
DQo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogUmVhZC1vbmx5IHNoYWRvdyBjb3B5IG9mIHRoZSBo
aWdoIHJlc29sdXRpb24gdGltZXIgcmVnaXN0ZXIuDQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiAr
ICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gcmVnDQo+PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiArICAtIHwNCj4+ICsgICAgZ2NydTog
dGltZXJAMTYxN0YwMDAgew0KPiANCj4gTG93ZXItY2FzZSBoZXggaW4gRFRTLCBhbHdheXMuIFNl
ZSBEVFMgY29kaW5nIHN0eWxlLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

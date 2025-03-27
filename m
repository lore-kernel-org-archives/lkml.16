Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D481E25771;
	Thu, 27 Mar 2025 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743055393; cv=fail; b=o1RO5RnX3O3PcQ09Pq7uEarDHIBBJ0kG6OSztbnph5WmBsh/J9P2ekLMKuZbOpogXEt8PRsZvdW1tVsyWBLjVEfUoSYFsfooiykTdl1SNSRn1mZn0Wu4fheb+E4bp46MgXrrLN4GxUi0/hjo93MzC/ynNNxD2ROYEkiQGph5JHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743055393; c=relaxed/simple;
	bh=FziOdw5oM6H5EeW6bMJTXAE6EwXH01GLKqdh0SFxXBI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CPi9IKvlDFpoKWStcEjxrOJHT1HpvIDfaSut23vpeIVJxz/szne/RAiPYw8bYqc3grQTEu112RRiynbmdugB5yjgaw3QRpGmrWRMXn3LFvtPMNWxOGoPcA4J1iQNAUacgXLKwni752XyncLG/P1mHIM7B3cj3PouyT2IZpgXIIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Lz78j1fr; arc=fail smtp.client-ip=40.107.100.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Lz78j1fr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzmiXBqOJqFMf3Evp+uhoZW5MLeSUyL8f3uWSoBFpOHeat58Gj82ExpY48WTpSk0XJc5KhpgVrmusl32YuSh9emsw9SMp40pZEh1ZB/EURGr0+J1d7LSt5QVFCeUjljguoToJFCifUK4eoyXZxRkWfVnkzhFbtLlQPgzWv73T3KqNOSX7m3A578zmTqscpnzxr0DWa8TjhsqmUu6FRuy5ujiyDzSkdM7HMefLd9t4ZiuIVMhgAk5TRCQqrkDEtDAr3VGANqLvs5GAGsnZXMqMKwriwAkbx8ns5f3Y33FZy6I+yL77CivVl49mvXsJJTfZt77B+zD9YWi3XQ6gquWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FziOdw5oM6H5EeW6bMJTXAE6EwXH01GLKqdh0SFxXBI=;
 b=LdacFzwv1fkH4c5ebn25S2TI2n0qAtzFEfKkYOBZqUPje9udYtbL0jmxGhAG59pZxN1gkzTjyChdF/9r1xy3OVJx9/rfwNGiOeMRoAJm0bZvN1f1GUmU//TH5QzmY+n8vUvFEckWBDc7lJVCrgEUTZxgyWJkMmNCRFoDeQvarIfnnG8iYij5BusXBwZYY/T9jUrTJhs9N7RKyxq3a/KyOE/42xR+Lba/7mDI7wJ57uJgOYyAkc0IdRKLWDCL1/AnTrlFIJEIY1WalqPFFD0aiIWUktYm/26Yx7+1vNuLlrwWq1VKTTcFjWVreFMTtNTVn+j2/+Ejh6ly1OJ8ahZtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FziOdw5oM6H5EeW6bMJTXAE6EwXH01GLKqdh0SFxXBI=;
 b=Lz78j1frVP9GtAPTwT5DlLBHr+zsUbWd4NXODQmOVxFuAR9SH30diHC8lQXQuWdvSaRHrPZ/YmXsZXu+98VusQm9NP0hz1TL1ZSP1Hh5dFuLnl3uPRkIJQpq9j+mMM4qChPa15KqoWXXnHadOUeyMph4LVyyTTdoveSLhNprFPwe4KaoIPupAb99cKSnSPW51lTwLuTmhgQv3ZLZJfdw0E2lUxiHrO60U3iwkLTEvTPXuFaJ3xCSUVNgnZo2lT6YqYGaCe11jmo/aU89zFJX379sN29/+A8HYc53zSpJxqhteltwTbUwBwJfOhC5/v/Oklxhcij1NP6QGxJRx6PLIw==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:03:06 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 06:03:05 +0000
From: <Manikandan.M@microchip.com>
To: <andrew@lunn.ch>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Topic: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Index: AQHbnh/pyJiWvGpgIEmzvnvLJ7gCCrOFZusAgAEYowA=
Date: Thu, 27 Mar 2025 06:03:05 +0000
Message-ID: <906d596b-391b-43ec-8654-38de64f043f1@microchip.com>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
 <20250326072140.172244-4-manikandan.m@microchip.com>
 <eed1531a-353a-4244-a10a-95e67c8416ae@lunn.ch>
In-Reply-To: <eed1531a-353a-4244-a10a-95e67c8416ae@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SJ0PR11MB6669:EE_
x-ms-office365-filtering-correlation-id: cf153442-147a-4567-c4ff-08dd6cf50ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eEZhY0dFcTgxaFhRVVNMclpvN3lBN05oMzVqK2VYV2Z1ZE5wUXRDYlJoQmc3?=
 =?utf-8?B?cG9WVlN1L2hSTzkrRnQ1WWlFQXFCZ3h3TUh6VFh3QWtKQ1RXSEx6R29YLzRX?=
 =?utf-8?B?d3YvL2xndzR3WEhvekRRMUhQTXltVmZ2dUJ2ZDRueW1oMDBvWXRibkdaMTRI?=
 =?utf-8?B?L3BpVXFwNkNFTXVrSXZ6SUx1V3o4b0JSYmJPSDZkblZNWTV0cGRxN3d5STFH?=
 =?utf-8?B?ZGM0QmduWG03a0JXRmZYcWtDVFkzVGxOOVFwZktPR2p4enlWOEhPemQrdHZR?=
 =?utf-8?B?aHIyazRsNktETWlJVVgvYmJrRGVGaGtxQXd3ZmdJMkwyV05FRGp0cEhEcHN6?=
 =?utf-8?B?RjlyQklPMHZJdWk2cVVxZjFpRHdNcmZaSlphdHBoa1lWdW44Q2dNc2pvdWVW?=
 =?utf-8?B?bUxZZTBHd1ZkeG5sTWlFWCt4WGIxYTQwTDM5RURrcjI0NDBra2IrbzBxQzQ2?=
 =?utf-8?B?Y2g2SGdqUDgzSktDbVNabEZ0QktTZE0xZnNsZWtCRXp3Yk1POFB1M3pYT285?=
 =?utf-8?B?M3dDS2d2eGJTUkdMR0JuNUEzbmRCS21qbCtIOFEvaFdrMXc0dHlSK1h4VUg2?=
 =?utf-8?B?MG1PQ3ZUZmNkMW43U0FNdzVuQnh1cWFHR29HaVZ5eHBJRnVkSkhReHM4VmxC?=
 =?utf-8?B?ZlkrMGxLSUo1MS9DUXdMM3craFFJeTE5OHJSR2pEMjFZTzIrbXZvZzlHNkdY?=
 =?utf-8?B?cHBmMkxjRE56RVp0a1BSRzN6VXRmQW9Kc3JvK2lLeEdXMTV2ZXdWOTF1ZHFp?=
 =?utf-8?B?Smw5NDNFVHJ5NEVOMnNWeUluT3JPczZzV0R4OWRrMk12UUx6RlB3SW5CbUdH?=
 =?utf-8?B?ckdzV0E2NGlPME51bE1MWlE1cnJvMGx1MU90Y1FXK25mTHU5ZHBNRXV5bi81?=
 =?utf-8?B?cmFrMGxwZXlyRllrVk9pdGlwc1lVRVdEd2M1N1RwLzFGbjBKVEJTc1I3dFpz?=
 =?utf-8?B?TzZCcE5lKzNCU0dpOTRjcUJFbXQwOEU1eU4ySTBYTDNnb0xEU25tbk5uKzhj?=
 =?utf-8?B?a2JGT3hUMTJVU3BkdlJTTExodWoyc1pBZDJGQkxITGhhNDFuQ2lhRElSUkVQ?=
 =?utf-8?B?K3ZTWFZWdG1tTjZqeXB3SnppR21qY2F0NjFWZnRYSGZVZVFGSnpRMVl6Q0xR?=
 =?utf-8?B?T2NrWlhsWnA3NWU1dTRzRXZKNEo2d3FvQTdNTDlRQmY4N0VIM0hpaHREdS85?=
 =?utf-8?B?TXJHdzVlazB6aUZLZElKeTB6bmJFYk5hdGJpRkszZHpDLzRBUjR1eEdVU3FB?=
 =?utf-8?B?cjhtYmJDRDZYWUFSbno2WFFONlpKcCtFSERhcDg2RkFpSS8zaGZhY2VnZ2o5?=
 =?utf-8?B?R1M5SEsxTVhnMGlEamY3V0ZVM0VHcUs2UXRsek9LSnNtL0JJSzZNeGxJeHMz?=
 =?utf-8?B?T2VuTTdRbHR1TEhHWjkzOFBjcnRZSDJJalBMc05RNmg2eENnYVBWYUFENTZk?=
 =?utf-8?B?bk9hTHBWYlkrTzMyUGpUcTBUemJEUHlVWjZMVEIzdEppY1hxMWFEWEMwUW5Q?=
 =?utf-8?B?TGVRa2J6K1lUS1dUeTVVWkppcGV0Z1RPK2tXa09IS3NWbXp6c0NrMU51cU42?=
 =?utf-8?B?enIrVGhNbzIxRjV5bEJxWXNHYStCQ3JJUGlLTVF1c0NhYU8rWWlYZVJqNE05?=
 =?utf-8?B?MXZFQThIK05zOFpWdFVubm5LcHFLUXVocEVEcGpsd0RGTGJSeXJtRTUrSmE5?=
 =?utf-8?B?YVF5UEIwOFExLzdvcjJVTVp2cEtnU1VsUGJDQVBNZ1o0OXlOL2I5d0JUaFpr?=
 =?utf-8?B?UW1kMXV1V2VLb25DR0pEaUJEU05KaTNSTEFxWGJ5d0FhTXA1bzFkOC9lRm5o?=
 =?utf-8?B?WUxTZ1JMclVXck1DQitUbmtpNDBFWWI3aUR0UHM1aWt3U1NZNTI5MUdqa0VU?=
 =?utf-8?B?ci9yNGY3K0VCbTZBc200R1E5OUdXUnoyenNIbHhOeWNCZ2FzdVFzZUxScG8r?=
 =?utf-8?Q?7KstjmZEGPdPtKz6/jca2KyRx8xIOADK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6609.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzhYa0tscE5PemdlWk1WaFBlcjZlK0JqNXlOb0twWndTSmhCTmZoYXNPdGxQ?=
 =?utf-8?B?UkNFNWVLZGpPLzEzNTl3RDllbVYyaG5RVkhMODM5eVZHbG1aSGhlb2tzMThW?=
 =?utf-8?B?ME5ocTM0RGRPQVk3VGF1ZjFWcFZwdVRhSVcxUXhPelRnaUVNWnFKM1RBMzdp?=
 =?utf-8?B?QWN3emhPaUw2RE8wUlFRZEk4WVpzRDBLUXNudWN1eGwwK0g0U2Fnc3FWcE41?=
 =?utf-8?B?U0d6ZTNTVCtGUHc2am1SZG1xTU90VFZMQmRBaGVCbjgvQkd6aThUb2tRS0NK?=
 =?utf-8?B?WWY0SlZtOWtkRlZNSWVyeTVqR2hFbzRqQUhZUCs3TUlsWXNEZG5ndHppbFl4?=
 =?utf-8?B?UlVON0tmZ2hSV0tGZzNnOWoreUhIMVMxU0tjUHFKZWdTMDBhVmNuTkJrUVhm?=
 =?utf-8?B?SUVMMHVEUUMrY293Si9QRDR1RkU0Nk0zU1drR0hBTTJ1NXUyVlpWY2FWUThX?=
 =?utf-8?B?b1o1dTFJNldkTjFmSGoxTmJRb0JCR2Jyc05kY1lIaVBONHllMEVBbUFnVWh5?=
 =?utf-8?B?R3RNeVVGK1RITFYrZXdSb1diUXdySzkzRFZFdDNDM0swZlFsMjd4Y2tvNU11?=
 =?utf-8?B?SHZURmFnUUxkdDlnajZ3dUZsTW5XdE44cEhkQkFTMEQ3eUJsVEhBRXVqVkZV?=
 =?utf-8?B?bU9VOHV2WUVWSHl1WjlGbEhXMmFkZUhuUjZqWEE4RXhmb1EzRXM4c0Raejhr?=
 =?utf-8?B?NnRYL2haVU5lNHJEd1RaWEpmSWlhUEJuejl4UG1Kb21zZlk1WHN6MkFMVHJJ?=
 =?utf-8?B?dmRBRHpEeFFLbjhjQlRVdk8zUStGTkFDWDk5L0x5YkxWa0VlcDZUUTBlbVFr?=
 =?utf-8?B?RWZMQ1NPZW9JZUpoeVk0Q0k0d3BVNHB3bVN0b3haSjZEMHkwUml3SHZrVVZq?=
 =?utf-8?B?K0h6MWxHRXlINGRuMFhRQVF6Si93cjRib2lnUmhBS2padVdvbTU0alV0djZE?=
 =?utf-8?B?OGhXQ1prV0dDOXNFUUtaK1hOK01BWUszckcwRWJyRHJUWThUVE9RWmU5OHJt?=
 =?utf-8?B?YUVWTi8vaU13aE0rKzJKbEQ2L3RxQjYxSlN5eWhMTThKYlh4UTNDT244Y3R0?=
 =?utf-8?B?UjdGY1o1QTd0YUt0bDh5QnBzdG1TZUZZOVZLZDZTQ054SjhSbmR2QkY0TTRD?=
 =?utf-8?B?VW9xeHArL3FYbHhVZ2dNQU5hUmZlMG1hWFhHWVovR0hZRkhadXQ5TWZkZlR2?=
 =?utf-8?B?dUp3WVU1cXdSdm53MlRGbVl1Y0pCVjkwbDFmY0xZNzV2Mlc3U21Ha1NzeVov?=
 =?utf-8?B?YmZwTFBHUzRQdG1ZMFpGaE93WDdVeGpZSnA1VWpvbmF5cE55dkFvckFjcTU5?=
 =?utf-8?B?eHpaSU9weXhxc25kYzFSTzdDZmxZZXRiTXBOZm42TGVsR2E3WkhTWkRQRXFM?=
 =?utf-8?B?dGVJS3p3MWhTK3hSZm1UL3MwTW5ibVUxTUtLcFU1VE9OTEZVaTJZL25iRVZk?=
 =?utf-8?B?VllGUTIwQ240QTZRR214SFJMNHp2R1RlYU9ibGQxdDZJejhwenBoQk12SnBu?=
 =?utf-8?B?YzJXYlYvaVZiZXFnL3RXbW5FU3ZIQjR3NjZxUTdhaFAxWmtya1VEYXpVZHpl?=
 =?utf-8?B?UFJia2ZIMlJUT3ROSjhxRVUwME1JVE5iMTQ2a255bEtvRkhJVldsbGI3MEN5?=
 =?utf-8?B?T3Rxa1JJMWFvbVZxZHB6dFpFZ3ZFOS9BUFRtandtR21vdWxVcnl4MDB1UGVj?=
 =?utf-8?B?anIvcWtVUlpHdG9vNzZNMWk5aThWZjgrSmxKTTZSSWE2azJOTW96TENnSWdj?=
 =?utf-8?B?QUJLaTNVdmQ4Q09DU0k2OFZZOUhQSUJLWVJwY0ppcG9WdlpQRDczVlhtZ2NF?=
 =?utf-8?B?OUwyUjl3RVdvclBnS0RzTzJUbS9TUjVTZmlpNVM4bERKTXhNbzhrTFNFckxj?=
 =?utf-8?B?OXJ1YjNid05uazRPTDV0QWxQNVUvUTZ0WTFKT2w1S1ZCNlZwNXYvOVI5SlN6?=
 =?utf-8?B?WmdYNU9CM0xnN3E2ZUQzY3ZIbmZrT05tbk0xWnRaVWRoVlJ0TnJDTXJvS0sr?=
 =?utf-8?B?ZmFTaHFycFlNQVlOajhxd0xIVUhCSXB4c000c0Jrbks1bFNGZHlEY1V3VzlK?=
 =?utf-8?B?Yk1CTUxMb3pCL2VRRUQzbzBaell4SUU1T2Y2T1AzYlhsbkJZR0xTcG1XS0sw?=
 =?utf-8?Q?mwu0uL+pH7DuuLzAI91THtoCp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1B162E09F21744787513D8F78F32C34@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf153442-147a-4567-c4ff-08dd6cf50ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 06:03:05.8636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hr+AKtYICzWmbzlaHRvNUuK1cuKvGMzH7BmWcQby8eTEH8moZkZGmFaKdu2aBkTpjs2hnT7Z7izI16XqT4vfcUoCUU2uVDbesqbJRCBxQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669

SGkgQW5kcmV3IEx1bm4sDQoNCk9uIDI2LzAzLzI1IDY6NDggcG0sIEFuZHJldyBMdW5uIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFdlZCwgTWFy
IDI2LCAyMDI1IGF0IDEyOjUxOjQwUE0gKzA1MzAsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdy
b3RlOg0KPj4gQWRkIG52bWVtLWxheW91dCBpbiBRU1BJIHRvIHJlYWQgdGhlIEVVSTQ4IE1hYyBh
ZGRyZXNzIGJ5IHRoZQ0KPj4gbmV0IGRyaXZlcnMgdXNpbmcgdGhlIG52bWVtIHByb3BlcnR5LlRo
ZSBvZmZzZXQgaXMgc2V0IHRvIDB4MA0KPj4gc2luY2UgdGhlIGZhY3RvcnkgcHJvZ3JhbW1lZCBh
ZGRyZXNzIGlzIGF2YWlsYWJsZSBpbiB0aGUNCj4+IHJlc291cmNlIG1hbmFnZWQgc3BhY2UgYW5k
IHRoZSBzaXplIGRldGVybWluZSBpZiB0aGUgcmVxdWVzdGVkDQo+PiBhZGRyZXNzIGlzIG9mIEVV
STQ4ICgweDYpIG9yIEVVSS02NCAoMHg4KSB0eXBlLg0KPj4gVGhpcyBpcyB1c2VmdWwgZm9yIGNh
c2VzIHdoZXJlIFUtQm9vdCBpcyBza2lwcGVkIGFuZCB0aGUgRXRoZXJuZXQNCj4+IE1BQyBhZGRy
ZXNzIGlzIG5lZWRlZCB0byBiZSBjb25maWd1cmVkIGJ5IHRoZSBrZXJuZWwNCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hp
cC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1h
NWQyOV9jdXJpb3NpdHkuZHRzIHwgMTAgKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9t
aWNyb2NoaXAvYXQ5MS1zYW1hNWQyOV9jdXJpb3NpdHkuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMv
bWljcm9jaGlwL2F0OTEtc2FtYTVkMjlfY3VyaW9zaXR5LmR0cw0KPj4gaW5kZXggMzU3NTZjYzAx
ZTY4Li42YzVmZjA4ZjBiM2YgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNy
b2NoaXAvYXQ5MS1zYW1hNWQyOV9jdXJpb3NpdHkuZHRzDQo+PiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQyOV9jdXJpb3NpdHkuZHRzDQo+PiBAQCAtNDc4LDYg
KzQ3OCwxNiBAQCBmbGFzaEAwIHsNCj4+ICAgICAgICAgICAgICAgIGxhYmVsID0gImF0bWVsX3Fz
cGkxIjsNCj4+ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+DQo+PiArICAgICAg
ICAgICAgIG52bWVtLWxheW91dCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJmaXhlZC1sYXlvdXQiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Ow0K
Pj4gKw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIG1hY19hZGRyZXNzX2V1aTQ4OiBtYWMtYWRk
cmVzc0AwIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg2
PjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICB9Ow0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4g
Kw0KPiANCj4gSSd2ZSBub3QgbG9va2VkIHRvbyBkZWVwbHkgaG93IHRoaXMgYWxsIHdvcmtzLiBE
b24ndCB5b3UgbmVlZCBhDQo+IHJlZmVyZW5jZSBpbiB0aGUgZXRoZXJuZXQgbm9kZSBwb2ludGlu
ZyB0byB0aGlzPw0KWWVzIHdlIG5lZWQgYSByZWZlcmVuY2UgdG8gJ21hY19hZGRyZXNzX2V1aTQ4
JyB1c2luZyBudm1lbS1jZWxscyBpbiB0aGUgDQpFdGhlcm5ldCBub2RlLCBzaW5jZSB0aGUgc2Ft
YTVkMjlfY3VyaW9zaXR5IHVzZXMgYSBkYXVnaHRlciBjYXJkIGZvciBQSFkgDQpbMV0sIHRoZSBE
VFMgcHJvcGVydGllcyBhcmUgZGVmaW5lZCBpbiBvdmVybGF5IGZpbGVzLiBIZXJlIGlzIHRoZSBx
dWljayANCnVzYWdlIG9mIHRoZSBudm1lbSByZWYgaW4gdGhlIGV0aGVybmV0IG5vZGU6DQoJbWFj
YjAgew0KCQludm1lbS1jZWxscyA9IDwmbWFjX2FkZHJlc3NfZXVpNDg+Ow0KCQludm1lbS1jZWxs
LW5hbWVzID0gIm1hYy1hZGRyZXNzIjsNCgkJDQoJCXBoeSB7DQoNCgkJfTsNCgl9Ow0KDQpbMV0g
LS0+IGh0dHBzOi8vd3d3Lm1pY3JvY2hpcC5jb20vZW4tdXMvZGV2ZWxvcG1lbnQtdG9vbC9ldjkw
ajA0YQ0KPiANCj4gQW5kIGFyZSB0aGVyZSBvcmRlcmluZyBpc3N1ZXM/IEJvYXJkcyB1c2VkIHRv
IHVzZSB0aGUgTUFDIGFkZHJlc3MgZnJvbQ0KPiBzb21ld2hlcmUgZWxzZSBub3cgc3RhcnQgdXNp
bmcgdGhpcyBhZGRyZXNzLCBjYXVzaW5nIGEgY2hhbmdlIGluDQo+IGJlaGF2aW91ci4gSSB3b3Vs
ZCBleHBlY3Qgc29tZXdoZXJlIGEgY29tbWVudCB0aGF0IHRoaXMgTUFDIGFkZHJlc3MNCj4gd2ls
bCBiZSB1c2VkIGxhc3QsIGFmdGVyIGFsbCBvdGhlciBvcHRpb25zIGhhdmUgYmVlbiB0cmllZCwg
aW4gb3JkZXINCj4gdG8gYXZvaWQgcmVncmVzc2lvbnMuDQo+IA0KVGhlIG9yZGVyIG9mIHNlYXJj
aCBpcyBkb2N1bWVudGVkIGluIG9mX2dldF9tYWNfYWRkcmVzcygpIGluIA0KbmV0L2NvcmUvb2Zf
bmV0LmMgZmlsZQ0KDQpUaGUgZHJpdmVyIGF0dGVtcHRzIHRvIHJldHJpZXZlIHRoZSBNQUMgYWRk
cmVzcyB0aHJvdWdoIGEgaGllcmFyY2hpY2FsIA0KYXBwcm9hY2g6IGZpcnN0IGNoZWNraW5nIGRl
dmljZSB0cmVlIHByb3BlcnRpZXMsIHRoZW4gZXhwbG9yaW5nIE5WTUVNIA0KY2VsbHMsIGZvbGxv
d2VkIGJ5IHRoZSBVLUJvb3QgJ2V0aGFkZHInIGVudmlyb25tZW50IHZhcmlhYmxlLiBJZiBubyAN
CnZhbGlkIE1BQyBhZGRyZXNzIGlzIGZvdW5kIHRocm91Z2ggdGhlc2UgbWV0aG9kcywgdGhlIGRy
aXZlciB3aWxsIA0KZ2VuZXJhdGUgYSByYW5kb20gYnV0IHZhbGlkIE1BQyBhZGRyZXNzIGFzIGEg
ZmluYWwgZmFsbGJhY2sgbWVjaGFuaXNtLg0KPiAgICAgQW5kcmV3DQoNCi0tIA0KVGhhbmtzIGFu
ZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=

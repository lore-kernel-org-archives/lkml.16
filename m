Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD959239E7C;
	Thu, 19 Jun 2025 03:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750304690; cv=fail; b=Ng7WEtEgjDt2wCxXmgJI7tJbEMiJ0wPWYQTb0wenxVrJus4dic4RajvX74ZOtcsesDrH7kSacdjb9cyaJi9wzgz3b6QSd77GTlmg1Io2NUSuiZpbbBy65h6z+jQY2NIigbM0LZa+mnWMqQpczVC3eiYuQh+7cg21iNtrAM3GyC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750304690; c=relaxed/simple;
	bh=ZQ+HJA75jxXflOFl5U3BGfrn2ROiQyJKtBnB0tvxakY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qJueSkAfGnRs5Eb+HoW7HqhaESKV2IJvCA3v359Z4PFE/AYXosMCZMj70BKCF6jwZANj6SJOncFL9CWA7AJKATSwDSPJUE7J5PM91/3NDZo/BAiw/3lEVS3YTNZ1kOizMKJ4B3MEkV18JhN2c6XakMSsdVqFnBva7i+UWqvFnwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=szls7Wko; arc=fail smtp.client-ip=40.107.95.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="szls7Wko"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFctGJyjvybJ06dPkI6+2cFu1kI+5uYlnRjRSuO42qrwyCCZc3YN4HVqpV3+HKVWAlLt17JXOjCZYnqIFW4cYrVZyTbMfqHxK9EUcd3LHxqMwscaXHxJkl5Bf/GsjDgaf9tocG0iRSmi8rUdLl/VddoDnNfFS0BlXiaXpjfh0abcXep7P+JditdAjJv0sD6CueZjzrxYonPmL0I42Bj9wk2AwT9zyTXzvPnF4G+6Kl7KB3l0rpzJ+c4mPF8YU1o3J5kbb+iSKC32NqRVcE4/JQZYyQJD2QksT/gAaiDly+8fBicifHjuR2/qv+Z6AP67t4I2J1Z514aAJATHwsTlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ+HJA75jxXflOFl5U3BGfrn2ROiQyJKtBnB0tvxakY=;
 b=cHC1j3rNzvVqzM+upeBFRWASsnl0L/1Zn21sj6Pk8UycXo6vjCv5H9ufBQ3Te9x+JOzRFSUO7w6hHWz9CjO5/FJLbBwNXqUUxsQy9gmaU6Ghd62GWMUg4iOn9rOG6lkgr4Az5F0slk5E6qgk+q0bxMckGvbo3KXvluU4x41iUGYzf+HcIcqF9XFtDWQKbB9G6CnTBzFUqKzIxf4tS4MxxCQBV4ayoCY4QxoZfwZvO3JL102A/hGwh6Kk02yRwda3TtGO8doyvHKMtSXJ28i3I9uQ8hvQrJymmUB1PAjLgHui/tAEbDQ9V4+ZjajfQeWBbma9CX1Lg7ZJh7Isem3h+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ+HJA75jxXflOFl5U3BGfrn2ROiQyJKtBnB0tvxakY=;
 b=szls7WkoGESZ5JGVYPCpNeZ5Xo/W9uTNAJvSloYNp/YS5trcQiXhiITbiAIywmI44T0qPL82J4fw6MH6ZXOsNHX9BU8FBR/WKXwLK5yt+BZc3wxhK7+KhQAl6OfZ0IZOsoF0pIljTKhG30YXQa3+SVYIwufj2zVKp6Gf0Pnlg0ctafOKevBVizodH1hqOwS2x0MqRCRys/MPckNIOHw8bCz7zKTPkdUvN02bvFhkLijmhys4u4PgZztt8y7B9Tc5nNSXtm+uYhgstt+11g+jchSrhemSku/8p4iuMan8MeAdiKXWJwBO6eQFVXXPT/EfdecouM1jJW04ZRI/IlZBQQ==
Received: from IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 03:44:45 +0000
Received: from IA1PR11MB8804.namprd11.prod.outlook.com
 ([fe80::fa56:fac3:2d22:311f]) by IA1PR11MB8804.namprd11.prod.outlook.com
 ([fe80::fa56:fac3:2d22:311f%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 03:44:45 +0000
From: <Thangaraj.S@microchip.com>
To: <ewhk9887@gmail.com>, <miguel.ojeda.sandonis@gmail.com>
CC: <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] spi: spi-pci1xxxx: Drop MSI-X usage as unsupported by
 DMA engine
Thread-Topic: [PATCH 1/2] spi: spi-pci1xxxx: Drop MSI-X usage as unsupported
 by DMA engine
Thread-Index: AQHb3QRTKB7psO4Ba0SPl+psv7l26rQHAyCAgALawYA=
Date: Thu, 19 Jun 2025 03:44:45 +0000
Message-ID: <965a9fcd6bba9915b4e0cdc442067c7479477b84.camel@microchip.com>
References: <20250614081312.763606-1-ewhk9887@gmail.com>
	 <20250614081312.763606-2-ewhk9887@gmail.com>
	 <CANiq72=QUbe-koU-BEhEJ1-7AafC0kGcG6HOhiVaR1TWqPoLFg@mail.gmail.com>
In-Reply-To:
 <CANiq72=QUbe-koU-BEhEJ1-7AafC0kGcG6HOhiVaR1TWqPoLFg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8804:EE_|SJ2PR11MB7546:EE_
x-ms-office365-filtering-correlation-id: f0e7a434-1da3-4d54-c72f-08ddaee3a1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NHhadDkwY2NEOGVodDdhWUMrdEZwYjd1OTJvbVVLVG9oSjd5N1FySWR0Rmpm?=
 =?utf-8?B?emJEaC9ld0NlRjhadnI0eHpvM280b3J6YXNtUTBtMVJ2Vm9yNjloRHVxd3F5?=
 =?utf-8?B?ZjdzZFcxQTBGUnJKWWFOQnhIWmFwYWN1SHF4aVQ5REl4VU1JUTNudDVUbytu?=
 =?utf-8?B?QWM2RjdiMmpQUWJmT2lLc1V0RjVTdnpOMVBqd3B1K01MQzBLM1krVTc0SXZM?=
 =?utf-8?B?eDAwOTh1RmlPWWM4V3ArL2xxZDRLUFpjUXNvZTNTZzBiQkkvUnpIMjVaaTVP?=
 =?utf-8?B?TkI4aE5kQ1BKUHFpc2xzeHNlQ1BSVXpyczF3T1JlNFIzdXNhUUNhbTlLNkF4?=
 =?utf-8?B?ajRkd2pCd0d3bEFseEE2V04zMTFUWHAzRFgrNFJrTGlKS1pkenJkQ1JKSnpp?=
 =?utf-8?B?UHBkUnFsbG8wNllnQm9naEhsOUFZMmFGM3lzUlh1VytjZkpvRUpIVS9zcDcr?=
 =?utf-8?B?TTdaZzJYZmw4OG1hOWU0enZWM2FIKzVEMUNQVmtoRER2dUQ2S3duMkFPanVi?=
 =?utf-8?B?NlhxZFpNR0hHMmNPbkhZSVQycU1lQThmamJLVWtBR3JERm1rdG01b0kvb3VM?=
 =?utf-8?B?RGcvdlRsVE1HZ2k2YWZvMjFXZmlUYXFYSkMxc05lUUlWdXJqblVFVnVwRkMy?=
 =?utf-8?B?cU9GK0JXU0h2TWdZWXRhN29UWnRMM2FtdUdlS0xMYkhINGZRdmlTbGR4NGVn?=
 =?utf-8?B?b3VOalJDMlJFdFVsbUxsQnFsUXNsSzJXOUdaLy8yOTRVN2plVktIdzEydFF5?=
 =?utf-8?B?ajdsdW1jRTNvZEswOXdzdTRzMTc1NXQwVkIzZEdVVmhpa3BwYzdTRUhsMFFi?=
 =?utf-8?B?RVVRL1AyR1JQcVE0d1V3eFh1UDcyS2hSM09Lc0tBVmlXMVI4ZWRZdjh2RmlP?=
 =?utf-8?B?bmFsWGg1THI0dFdGYkxvWTdTbmdhTzZEdTRENkhYSkIyU2krN2J6ZFZJZW9n?=
 =?utf-8?B?NStsdmpzNldUUVVFZjFnL0I1eFJkV2dQOVB3eWg5OVl0clByYkR1WlkraE9D?=
 =?utf-8?B?dTUrejBHNEpwQUxpaHBTbDIyZ2ZBRjc4OWc0TkU0MGFGRmFRN0hJbDBPU3U1?=
 =?utf-8?B?bitUQ1Z3T0p3b01lZjNhdmJxN1ZmYXZYUGp1aVRzVlFlNDc1dTNLaUJpdWV1?=
 =?utf-8?B?ek9wRVRvTjNocEZCVUdxdExMQjVxUjBXek9zdUhCQlBrSkRXVVVhTjE3Rnhz?=
 =?utf-8?B?R1NEcG1PbTVrbzd6STRhN3lvN1U5NXJNZm9TWlhZNVJNdUU0SFI0cUVqMUJ5?=
 =?utf-8?B?eVdsSHNIdjRWMGQwaU9EcHJOcVBZSllyTFB3WGFQWTM0cEt4bzNOemxCaGdV?=
 =?utf-8?B?dkQ1QUVKcFFBbmtZZWU0WFpRaVdyR2JqbFBiaWR5aEFqQ2FmZDA5UE1Wa0Rj?=
 =?utf-8?B?ODR1WG1KNHZqd2N4LzlJZ2pNU0RaamhGNDZtbGp5ZVRyOWxpUUN0bWNXVkg3?=
 =?utf-8?B?TUxnR3lnTDY3RjZpbW1RZFNNSENhaDVwRnN4aFBEZmV6QlpHa1dHaFNrSnJl?=
 =?utf-8?B?T0RQdGtHNnRJQ29PN1R2MTM4elp1UlBHUFEwV1NHSERTallSVXlNN2ZRUDBF?=
 =?utf-8?B?QWF2emNQQVR3RkhPSmxUbnBHc0dxaksySjB5UE5JZW9lVWFJa2pvQStDWUh3?=
 =?utf-8?B?ZEoxczBjbDRLM1V6Y1VuMHVpMUhqUDdhbkFHWHJNcVFhbG1LNFNjRnlLcW5E?=
 =?utf-8?B?ampLZ1lMNWRmTUNOVnRyKzR3ck1qUVc0Snk5cTRRSjMxR1NvS21HQTM5SFFy?=
 =?utf-8?B?K1hZaTFUYjFRVkxmU2dXdk0yVThsV1diREcrbzVkbVJPbTNEN3lmd3hhUUpJ?=
 =?utf-8?B?R0YzNDZyREloVzB2OWV3cVdGaTJMOVdFYWh4WjdESVZ5cG8vcHQ3Q1FsdDIw?=
 =?utf-8?B?OFhsbEN3QlpXeHZ2MWk2YUZwVFhlT3N5S2JXRVYrYlBQbURIa0VaWmZGZGdJ?=
 =?utf-8?Q?2dY6+XBlMEE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8804.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTFGUGdUem9rQThzZ1RxTjkwK3lsNVFJY214Nk9nZm1LUFdkVHcrMEE0NnhS?=
 =?utf-8?B?cU5uS2ZLS3QxQ2N4RjhDcUloQitnNnAzY3lnL0k5dENlMDB0bVVlbWVBQ08z?=
 =?utf-8?B?RG5ldmQzV2o0aERtOW1NUmt4Y05lQURySWhTdk0vbjlBcU5mOWU5N3dNMzA5?=
 =?utf-8?B?eWQ4dmFWSmZYZHRyK0V6bjdGQTJ6d3F2eXBJU0xLelBya05qUTcyOXBCVGcx?=
 =?utf-8?B?TzBHZmlGcm1yYzM3YlpBNlZ2Rk50aDFEWHRPRWhzT2JUTWtZWTE5Qm81a3Ax?=
 =?utf-8?B?dWdmeVhXM0ZLT2ZrcmFXNmFXVWliNXN4dDV1VGVKc3dTcVdjQlhjZEhrU1NU?=
 =?utf-8?B?dEhpaW0xOEdwK1h1djNWa1RkOWNTMDJmZ2N2TGtnZnFicEd1RFczL0YwQllm?=
 =?utf-8?B?bW1IaGpvOHQ4Y214Rlp1dTlIaFQwTXVKUi9pYnFFL3lKTDNMWVF2bUNkckUx?=
 =?utf-8?B?bzM0M2RoZUNxeTZLS2NaNVpSaGx0REozZTdTODdML2s1KzBaZUlhZy9Ybi83?=
 =?utf-8?B?OVkzMzJESDVlUU15dlZpVWpZQzVHTUxHaFV2d3hPU3RjVmhkRHVkZGd5WWV6?=
 =?utf-8?B?UnZpcUlqWU1lMktRY2NEMkVUYmRNei9iQ01xWDlTb29NQ1FHd1I4dnZVNW9Y?=
 =?utf-8?B?aXNCdzZnSGpUMElOd2tHbEhURENoNnVEWVhDQ1ZuV1JKMTM0dDQyWWZpSW53?=
 =?utf-8?B?cVlGSHN4Q3ZoelVLM3kzYUxQMlAyYngwcHp6ZkZqM1I0QlIzSGdCQTBrZ0hG?=
 =?utf-8?B?dkQzQ2IxN1hvdGVMS1ZPdGh3VFJSRUt1UzAwdVBDY2lYajJ6VjljUzBYUjlu?=
 =?utf-8?B?ankyMUFBSWIvNk1HOHdhUjFoUUZ0OVR3SDlZUTcyZUQvaEkxNFRoV2djRjBw?=
 =?utf-8?B?dVBuOGF4TC9PK3dkT21OaXE2V1FKa2t4TWN2bWVld1FvQ2JLZjMrVUNNL2RY?=
 =?utf-8?B?Q3R3VjBxQzFrWmVSak0vc0lzYWpvci9sLzg5WnF0Y3F6YTZhb0NyblR1RWFk?=
 =?utf-8?B?d2JIREVPWGwzYjJhMURzaXFIM0UwQ3FKS0IrdVBNc3dDNDFLRFIvNjZ3cDV6?=
 =?utf-8?B?V3dZcjZ1WHFFQVU0S1A1d3R3eHRqQkRPNktCSHROcGxRNXVlNkhyNkpvN0pW?=
 =?utf-8?B?YzhsNzZLMXNXdTFFU0g3Y3F6ZHdYaFVXRjZwbHQ1ODJNY0UyKzhwK0hYcEhV?=
 =?utf-8?B?S1Bta3BkajNsNTRiSFdYZkk2QUc2eU5MQ3dGQ0x0djdlRVhaNmlRcXZicERC?=
 =?utf-8?B?ZFJqcU01a001WCtWZ0thdnBUdm5HcFFXMTViRkRDMy9TODZlQVQyMFk4bVFJ?=
 =?utf-8?B?RXMzWjErZjZTZENCSXFrTFFpTHhqVW1oUWNiWE5iT3M2VGJmMGp4UFo2dHJK?=
 =?utf-8?B?ZGZ3MktTMWpiOS82aCs3eUN5U1FlbGJTK2Vtayt5OWNERElLeTBUK2ZPTkFl?=
 =?utf-8?B?Q1JucUkyRTFFQ0Qrei9wa3hibGVXWTdPMWtjb21nb0NoRklITkRVOWhySzVj?=
 =?utf-8?B?clUyQkdBYmZDditsTlRoWlBnMXk0bTZLc2xDaVVVVkgzcGxwTSt4L3A4dGRK?=
 =?utf-8?B?YytSTWJmREVCcjhzb2ZRUnFJVWxyQ3BtTkpidHplRG4zU055VWEzQ0ZrQWVB?=
 =?utf-8?B?TlIvMzFNZlJMUHpwZ0ZyNnAzd2QxeDdsdnJVamJvRUxCRVhCSDVMREc1c2py?=
 =?utf-8?B?VlVxL1F4dUN4YitBaGVtQVZxaTNQcytBdzRwRWh5MVB5NkNMZ2g1aEIvcXA2?=
 =?utf-8?B?dzdURmQ0d0lMbWg5MTZUcEFpU1NrVTVTcENNQUhtVVdxYUUwalh6Q3BHMHB1?=
 =?utf-8?B?SXVWZFhTM2ZMdmNCemxQYkRJdE5qSDAwS3dJUUhjdW9kMjRzbkU2ajYzUHlF?=
 =?utf-8?B?TktUVVdiQkZhNnhkU2QrWGVFL25ucHc1VTlaQXliRmJqZmxHK0Z0b0wra1lC?=
 =?utf-8?B?TERqbGlOeUJaK1ZLMjNmUmJmaHRqTllZTnJsckVsWW5ydjh1MGhWOUpMb3hT?=
 =?utf-8?B?bzlIZ0FqbGNUYnlCWUJKdVpESTN5NXJCTlRhcW1VMHFaNGx5amIrMGhaNU1X?=
 =?utf-8?B?SlhKR25vQWZLaGN6b2RuTEtUd250ZWRvdDFPdFk0RUg1cWtQTXhYNmx0Vi9W?=
 =?utf-8?B?R0prOUtreWZMTEhtenRIWFdFaXB2MlVDcHB1MWxKMXFkOFowalMxU2poLzdX?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B0B3E0911E0DE4FA99FE1982B915066@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8804.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e7a434-1da3-4d54-c72f-08ddaee3a1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 03:44:45.2369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNlQm4+4jH0pS1ajBKkxHmXHowo90a/3B4o7uN8ft9kPnTOuTztgkUdW0grmB3j9gmFc5WLxhJn2gAOpt0b4DxkBM+3+C1LfdLidy+mhIwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546

SGkgTWlndWVsLA0KT24gVHVlLCAyMDI1LTA2LTE3IGF0IDEwOjA1ICswMjAwLCBNaWd1ZWwgT2pl
ZGEgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4g
T24gU2F0LCBKdW4gMTQsIDIwMjUgYXQgMTA6MTTigK9BTSBFdW5zb28gRXVuIDxld2hrOTg4N0Bn
bWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+IEZyb206IFRoYW5nYXJhaiBTYW15bmF0aGFuIDx0aGFu
Z2FyYWouc0BtaWNyb2NoaXAuY29tPg0KPiA+IA0KPiA+IFJlbW92ZXMgTVNJLVggZnJvbSB0aGUg
aW50ZXJydXB0IHJlcXVlc3QgcGF0aCwgYXMgdGhlIERNQSBlbmdpbmUNCj4gPiB1c2VkIGJ5DQo+
ID4gdGhlIFNQSSBjb250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgTVNJLVggaW50ZXJydXB0cy4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaGFuZ2FyYWogU2FteW5hdGhhbiA8dGhhbmdhcmFq
LnNAbWljcm9jaGlwLmNvbT4NCj4gPiBMaW5rOiANCj4gPiBodHRwczovL3BhdGNoLm1zZ2lkLmxp
bmsvMjAyNTA2MTIwMjMwNTkuNzE3MjYtMS10aGFuZ2FyYWouc0BtaWNyb2NoaXAuY29tDQo+ID4g
U2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiANCj4gRm9y
IHNvbWUgcmVhc29uIHRoaXMgY2FtZSBhcyBhICIxLzIiIHBhdGNoIGluIHRoZSBzYW1lIGVtYWls
IHRocmVhZA0KPiBhcw0KPiBhIFJ1c3Qgb25lLCBhbmQgdGhhdCBnb3QgdGhpbmdzIGNvbmZ1c2lu
Zy4gVGhpcyBwYXRjaCBsb29rcw0KPiBzcHVyaW91cy9ib2d1cywgaS5lLiBpdCBpcyBhbHJlYWR5
IGluIG1haW5saW5lLCBhbmQgaXQgaXMgbm90DQo+IGF1dGhvcmVkDQo+IG5vciBzaWduZWQgYnkg
eW91LCBhbmQgaXQgaXMgbm90IGV2ZW4gbnVtYmVyZWQgYXMgIjIvMiIuDQo+IA0KPiBEbyB5b3Ug
a25vdyB3aGF0IGhhcHBlbmVkPw0KPiANCg0KVGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQuIFRo
ZXJlIHdhcyBhIG1pc3Rha2Ugb24gbXkgZW5kIGR1cmluZyBwYXRjaA0KZ2VuZXJhdGlvbiAtIHRo
ZSBwYXRjaCBpc24ndCBwYXJ0IG9mIGEgc2VyaWVzLCBidXQgaXQgd2FzIG1pc3Rha2VubHkNCmNy
ZWF0ZWQgd2l0aCBhbiBpbmNvcnJlY3QgaGVhZGVyLiBBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNp
b24sIGFuZCBJJ2xsDQptYWtlIHN1cmUgdG8gYXZvaWQgdGhpcyBpbiB0aGUgZnV0dXJlLg0KDQpU
aGFua3MsDQpUaGFubmdhcmFqIFNhbXluYXRoYW4NCj4gVGhhbmtzIQ0KPiANCj4gQ2hlZXJzLA0K
PiBNaWd1ZWwNCg==

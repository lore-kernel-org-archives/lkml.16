Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B542C3240;
	Mon,  2 Jun 2025 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854610; cv=fail; b=iw3wkRuZicBsza/iOoN1YovdVc6d0CgT0x5gBKQOt5b2ztt7LHjMCpkhJU5huhDw+nlV09GhPb0A5dvDD4SKJOqcV/8yvDrZhgHbSHRhSfy3VFIC0AXJxY+hcXRH0hzIaogty7s9oc1rezYQFpvWOgQyfdpUPylq0RjDirMNLPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854610; c=relaxed/simple;
	bh=YYZVaEOi58oICeZCFIeo7NfGwQzTzYOkpI+iucUBVao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uJkGmG3oH0jGV8W84z7wnPe7/ez5mNyUyFbHqJX4hAX3l6MDZhp85CYsD5dgy9K6kypeFMDYYobaoCIB7dHxv7vX+FAbj7THJTC70X8sYZ1ntCQ0RgQ+7sRKr3j9oTXhUidHIY17dvGw9jlnWDpNbEKFk1Jp4QmBuEikcT7nwW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=IVFTBJ2L; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IVFTBJ2L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGUU16C5C7mxgQwK2YLW1S1UkSm2ulJ+31NlMz03IWe2KjorDfsXFt49oBx19bS+KE0jxFzCjXNPOw+pcsGAyrHCwl6THJQ6AKiX5XqL0/ZHJyLuSllnufoc5OX6gbgKffjYPPUtD4n97RcirlQ3DlErbHhOTNQNkVEqmsVEt6fW358GE4fE1YObUG6mgk8mHhJ3JDYTTS8YF4M3m52LnrlFf+2NnliieGgKxbt3EtqS9dYP8QYrGneqF7uZbSWLaMNfdt3qIxEYlPs7013LJcqmLZ4rE18GoAOJykwdvcDWg9KSdJd90XBTniOMUjej8+/2fPRCm/aFH64hGR5bMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYZVaEOi58oICeZCFIeo7NfGwQzTzYOkpI+iucUBVao=;
 b=O/e8erdgCvUAbMRxm602q3IlsF3WV8A6OvppHyuXi1W79bwOq0YDt4QASBMFXAPlw/AaO42S9PQyRw4r8U4C8Pss2ahrt7/vfy8SUMn4f4SPaMzndP9DOB8At7sodpVD7OCA42QS7A+sx+uGUhpjP3G1eWMrdbZJVwlMfIdEauY9yg83AfmvYpJUaPZPrHULp9/S1xTX30BLBKVPY/zG5RTPFV2ObL5ZAAlwBrQU/SfN9WS64XZ4Ns/2laVRcnWZIqMlKujYVWUmXyXydAFV4T4btbAqVrAW3BU4Su1oZrQ9hx0PQgpc0aR8caqTXR3GnURvW6pYWdlm8vwUUuU8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYZVaEOi58oICeZCFIeo7NfGwQzTzYOkpI+iucUBVao=;
 b=IVFTBJ2Lu6Eb4YVtnrJatp5TdMXQ8Cgyz6Nbkha22VpX8Z+2ZfqYasHNI0mJhxFy9RXbbjhWO2MKrVZirehmhHTEbSOC21KiwElSq97nOt5H6hz6MkisP8b7Zcim9npZmjdUkMCLHiezA/NNdnnQY63AqemkfYeH85zVsO2zVeVk9EI7KOHnZJMaFXjE8B4mPKYFLn1K/OuJcsQi2a6hUujVCoX7H7SmIVle78uLA+IzCE8ab7K7DKz1MQKdKt7OSHxDORm3qAKqfeh5vta+16icyMhXuyCTOfg5KHUVO5o0jhq+EWxai8JSmljS0ITH83Fnuxx7+1gszTogcS2Mhg==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 08:56:45 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 08:56:44 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <krzk@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: add entry for microchip nand
 controller
Thread-Topic: [PATCH v3 4/4] MAINTAINERS: add entry for microchip nand
 controller
Thread-Index: AQHb04BSRuU7/ZdO4kCu8yVU80L2frPvdecAgAAbnQA=
Date: Mon, 2 Jun 2025 08:56:44 +0000
Message-ID: <50ec0069-2341-4ebb-a0a3-f503f0149fed@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-5-balamanikandan.gunasundar@microchip.com>
 <b17ff2df-aed1-42b0-9061-2f2e6655b958@kernel.org>
In-Reply-To: <b17ff2df-aed1-42b0-9061-2f2e6655b958@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|CYXPR11MB8710:EE_
x-ms-office365-filtering-correlation-id: 34c4d17e-6bfd-4a7a-17a6-08dda1b3669c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MVlQNUZXd0wyV2xsUHp6d1VYb3hzV2hVaHN2Z1hSREQyL2UrRG1LRGo0TDV1?=
 =?utf-8?B?a01iZlZtL1ZQbDd0OXVDRVBLcVMrUWg2TmZ2cDNPV3RTOWRWeDVKQjE2RU1s?=
 =?utf-8?B?ZHN0NEczcnJZSit4WEFUL0pTcitqNnRIcEhBWmp1cy9oWXQwNDJXMDZvM2x0?=
 =?utf-8?B?RThyYnVhWldrTUxnMTdrbnRhVGlMTDZLUVRrVFRVd1AyU3VCcUFIcDlMNWdJ?=
 =?utf-8?B?dGpFRHlIdmhjR0ZOMkJJVkZwUG1XL3VKMVNDYVlMeGlvTVlPYU5PcTcyUS9w?=
 =?utf-8?B?eXFjdHFUOHZTSm5Pb25FSGFGd2RjdGNJN25JWjUvTWZZWCtNenA0bkl0WEQ4?=
 =?utf-8?B?SDFlL2ZhbC90T09KQW83bDB5NEplcFhOT0JaSTNpb2tMWHJuWi9EMXRKY0ZN?=
 =?utf-8?B?MTVlOVFjRVU4Q0JmbkZaWFN0SjFYRWlIZG1MRzcza1hGZXprNWpiU3RhNmp0?=
 =?utf-8?B?OUhlczdTelpZS09RS25vTlNRam9jYjFxRVo3UlZkYW9kR1RkVEwwNVBlejhT?=
 =?utf-8?B?YWFJTHpYbUlicXhDMzM1VVFwaU1sZTZhK3FlV2ZQd1MvUnJqdTA3emZRR2pD?=
 =?utf-8?B?SGRTVXJkSjJldmliRmhTcW41RnV2OTRKbDZSZENCaGtvOW5ON2JvUFNHaXZL?=
 =?utf-8?B?OE1WcllML29qTmtUK01HSm9KVWtJS2pWOTZWK0lTeDZoWUh1SjFxYnBGYTcx?=
 =?utf-8?B?VkFJOEVsNnZwYTZiUnhWQ1RrMVRCRWRIeUVIREFUd1ZQeTZPa21xQkNUcy9P?=
 =?utf-8?B?QkNBS25EVnlVQjRHVENVSVdrbWZOUGl3VFlveUg3TVZPdVhJdm5YVXVYRlFq?=
 =?utf-8?B?MFZiOU56WEdsbWlmdFdoZEpja3VaMmdoT3VyTUFzYWp2UDk5ZTZrRVFBOW1s?=
 =?utf-8?B?L1M1dTkyTlhKNENURitBTXVubmIvL1RCa0NMWStRQkU2b2w3V2dkcG9hQng0?=
 =?utf-8?B?QTIxMk9uVjdqZDdZSEYvZy80RE5EMy9Qd1dqQWN3d2h0UVJKeDBXV1pyR1hx?=
 =?utf-8?B?bWtLNTZtUTNyM2pIOTlFMDlLWGNHU0dESmZXOU1XeFlqV1JJSGZlUUI1SGRk?=
 =?utf-8?B?am5Mak0xRk54TjFBeUUzQ3hKbnNWcDcyTnM5VFQvRm5VQjV4SzJXaFZnMERV?=
 =?utf-8?B?NSt5NDhOSi9idzc5clJTZXZhZS91OGhJcDY2MWs1K1lyL0NpL0FYR3dzeVJL?=
 =?utf-8?B?ZzhNL3h5eUp1ZGVLcEEveDE3Rkk1NHVoMU5TMU44YTI0MVpzTnNkYXdEQ3ZN?=
 =?utf-8?B?YUxlQzNqYjg1SWxZWEdmd3pQVW5BWUEwMHFjcktmWDMyejNDQk5NQzAyRlow?=
 =?utf-8?B?eU1jNHFrNlR0UkkxNHBxQWxkeG1HY050QzlONkgrbjZoWTVGeEdORTFuYk1O?=
 =?utf-8?B?WEttc3JsbDZvMWlaYXBPelhYY3d6bFo1WHllWXZQK2xzY3luTVFZbU85Qzhu?=
 =?utf-8?B?MmRPQjVVQUVNV0ljeStrWkNiR0MrUUdpaGx2YzI5QUltS2pBOExuODA4SXZ5?=
 =?utf-8?B?bHg5OEhrVlRzdUlTWXJtcTRlS0Y3NEVXd3Rac1laUTdhUCtGQng3clAydCtw?=
 =?utf-8?B?a2kybS9tUGJqQnZyQUZKVTkyU0lTMWk4Yk5lSU5WWlNUSmwzRGRHejh6NWxz?=
 =?utf-8?B?Zk9DQUNCblhnSmg0S3JxTkp6UGg5QWpES3dEc2VrRytuNGhpaFFOWHROYldT?=
 =?utf-8?B?eWxHMGRtMlZYWVhwZG5WVUlhaTRqeHpGbm5FYTBLbHYyYjRCcDFHaERFU3JT?=
 =?utf-8?B?YWtReEl4aEkyYUNzSWpDL09uY0hLaVk0RVJPVjMrQm81N1g1T2hoYloyTEJD?=
 =?utf-8?B?QnFQUWxFWjdJSnNZVU9NRTcrclNFa1hDYU9BeG9vc3lrTEU3Y25ldzRwYnpW?=
 =?utf-8?B?dkJIdnhaWmsxMVdQckhLVnFwaFE4ZDcxVk91SGhZU050bExjMlcxVjBwcEZQ?=
 =?utf-8?B?aUtJaTFEZVhxb2ppeHdMM1BzR1NkSGxiVWd0UXEyOHQ5NEE3K2hta1JBcTBp?=
 =?utf-8?Q?1z+G/0eXHsof/8SEe6Axef57LKan3g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ak9sN0dJU0hZZE5QV1ZCOFVMYW5SSHhYZ2dpR0J0cE9vMkRkUTVDWHJqK3JK?=
 =?utf-8?B?TjdBVk8xMFB4bzdBaFdkd2xVTXI3UmtwV2huaUdXWUFlU1hvNUxRM2NaREdF?=
 =?utf-8?B?cGJXY0o3SnY0bEZNM1VXTFVNUkkxZ3lwK1FML2M1clhTY1N2bG55aGNCZXdv?=
 =?utf-8?B?MUNLckpaMGRGU1JPYWdXYmNqSHFTeFprckZieEJEM1JINjRrZnBGc3JTZ2lF?=
 =?utf-8?B?cmtmL1VCM1p6RUNGYVVKZHA1cXpQdTVlR3FFUW16a1ZBdjU2WUcrU1JMTE5r?=
 =?utf-8?B?MnA2ZVFUbGF6Wng4OEFqTmZqMzVlYWV6N3lYbUxCOHlTSmE2dnpHZ0d2RG1D?=
 =?utf-8?B?U2xMVVV0alpETVBMR3gvaERaN3lRak5iaU8rRS92K3FycmNqencvVHFPREhl?=
 =?utf-8?B?dHY5SThRbmRQVkNwUlNmZWlFUnJGUjgrNWszTzU4WEc0NlFIMWlDQURYSkJa?=
 =?utf-8?B?V2ZKSzhIMzRXM0owSHptMFY4S1hxYjJ6aXFtSzFPZ2NYaVlJb2dSa3lldTZR?=
 =?utf-8?B?V2tJNUxrV1duOUE2ZTA2eFovY0VXa0htRUo1dUMxc3d1QXBoR0ZwRXVWUzB6?=
 =?utf-8?B?ZW5hK0xGQ0wyUndKa1VYK1hqaitCSFdHdVk2aHN1K21aNHhqY0xhSjNUaWFL?=
 =?utf-8?B?T1MxeU5nbVZ2S2NzRkN3YkZJM2FSQ1oyZmlqODlqdjJIU2xXaUJXa1BldWph?=
 =?utf-8?B?RzdPRmFkNEdjWjFOK3AzNlZPRzA4a25tWm9yc3dkNGhjK1N6OStmMythb244?=
 =?utf-8?B?ZjBTd2dmTmpFWitNVVpGaThUWEprVldJWWhOS2RXZUk0cFY3UlhpQVJRN2Yy?=
 =?utf-8?B?VFlCeDEwa3dZS2ZXVVJYditQdERxaG8vQ21xT3dYa1dLUUNhdVZOd2FDVEVU?=
 =?utf-8?B?cFc4cTRYMmEzNXF5aExxa3VadE85c29Oakp6azFoTHd4UXgrb2JNbjBUc25N?=
 =?utf-8?B?VlMrbjhOSFUxKzgwVXlnVkZoTGMwM2NyV0VkdWRtbGZCT3h4aWg3VXd3RWsw?=
 =?utf-8?B?RFE0dHFDZ2ZaZmxjRTlEYzQ2ckNsRjlGUklwMXg5bVF4bWtybk4yOHRudWdz?=
 =?utf-8?B?RlhIR1czSlV3Y2g2Tnh3VUJsQy9SRWsweGliRU9kV0xiMUN1QjhwVE8vVU1Q?=
 =?utf-8?B?aXVWSWljMzRwRzZGQVhnYXZsaitJd0VQeEtwN0dtL3NZUjJpd2Q3OFFlS1ZS?=
 =?utf-8?B?SVc0Z0R1UmZSWDNURE9MNitONnZaZmROc0Zzekg1OHpyamwrUjhpZGxERllk?=
 =?utf-8?B?ZlU2Rk1ic1dGZm14Z2RMMDRrZGk1ZCsxYVl4WnBHUGhaTlI1ODdMbWxUbTAw?=
 =?utf-8?B?V0w0RVNvaHh0YVg2czFUZWY3cmRCSnpud00yTHlOQWpub1VydGdKV3Z1ekZ1?=
 =?utf-8?B?bU9ub2FDRkhzYkpVQVV6VStUelNDbnkwMmh0cHhPbXF6ak9kdG8yUmNaZDA0?=
 =?utf-8?B?QmRqUndqdkZSVDI4ekJINDFDRUhscjVzZlpYc1BWZHBrU3ZKWFJHOENtMVNI?=
 =?utf-8?B?akpvMmtEdmZHYnY4ckg4Z3REZjNLbHlxUkMxYnU2bmtyK1ZUSm1jTlAraXF3?=
 =?utf-8?B?WE4wRlBRTThaZEpqbnIwcnpQSkZjcWRPb3oydnpSUXlRYThlR3VNNXpaNTZh?=
 =?utf-8?B?YWorNjF0aDRoOVgzdEJRbjU4OENNWGd4a0R3OE43ME9FUTIwL1kya0xUNVNG?=
 =?utf-8?B?MEZHbU1aZjRlTXN4eHdsRUtIb2loQkNBT0pOVFVxMlhPd2F1M3JyajVERmxz?=
 =?utf-8?B?L29KZ2xJc2R5L2kwV3dFWjRQTmRlMkRvVjcvbktZckxwTndHSmlPQXpyZnFm?=
 =?utf-8?B?Znd5OXRjOXBtcUZ2d3gwR0xJRHhNLzZ6elNpQUFaaFg0OFh1aW1LZG1VRThX?=
 =?utf-8?B?NjNWR3FRblVEaE1kRlI1ZjRkQnBBZGhjMTl3S25pK1pKUjVlUG9jazNwL3FZ?=
 =?utf-8?B?cWkzN1hUaWt3djdMMm4zdE12dWJPcWFEWmJkNENlSXh4eTBscXA0NmYwUzFz?=
 =?utf-8?B?ZFJiRldpejIzVEFOa25tV3R1V3dLczU3OCtqcGZqbGI3NEg1VVRERnpVaU5L?=
 =?utf-8?B?Y1lLbW9RWmVjOFZ5a0lTWlZoL0xtMmQ2MGR6SHBiNlZ1akxLQzhROFpuY250?=
 =?utf-8?B?WUdPdjI0M1pZUU5SODhNSk9na0J1ZG5kS2Zya2J4eUlYZEpLdUJJbXNRZ3dG?=
 =?utf-8?Q?NHuv8d/ATb+ncRkYBZr51OA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BB32AF212EEDA46A93DA0A2F8322C8D@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c4d17e-6bfd-4a7a-17a6-08dda1b3669c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 08:56:44.9173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2hgknqE7g5TC8sF0WmZIOt42MEeN9Qu1fcvkk3pMMt8OUn8aaidmIJQXMJN+r/SDNl58WYVb5ZSdrN0TQpuBuMr50ba7TawFHI5Du6PqtYS7bjg2fcZFpoifI5FXmf+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710

T24gMDIvMDYvMjUgMTI6NDcgcG0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMDIvMDYvMjAyNSAwNzozNSwg
QmFsYW1hbmlrYW5kYW4gR3VuYXN1bmRhciB3cm90ZToNCj4+IEFkZCBteXNlbGYgYXMgbWFpbnRh
aW5lciBmb3IgbWljcm9jaGlwIG5hbmQgY29udHJvbGxlciBkcml2ZXINCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBCYWxhbWFuaWthbmRhbiBHdW5hc3VuZGFyIDxiYWxhbWFuaWthbmRhbi5ndW5hc3Vu
ZGFyQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgTUFJTlRBSU5FUlMgfCA1ICsrKy0tDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4+IGluZGV4IGRkODQ0
YWM4ZDkxMC4uNTNjYzMyN2I4OTg1IDEwMDY0NA0KPj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4+ICsr
KyBiL01BSU5UQUlORVJTDQo+PiBAQCAtMTYwNjQsOSArMTYwNjQsMTAgQEAgUzogICBNYWludGFp
bmVkDQo+PiAgIEY6ICAgZHJpdmVycy9tbWMvaG9zdC9hdG1lbC1tY2kuYw0KPj4NCj4+ICAgTUlD
Uk9DSElQIE5BTkQgRFJJVkVSDQo+PiArTTogICBCYWxhbWFuaWthbmRhbiBHdW5hc3VuZGFyIDxi
YWxhbWFuaWthbmRhbi5ndW5hc3VuZGFyQG1pY3JvY2hpcC5jb20+DQo+PiAgIEw6ICAgbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4+IC1TOiAgIE9ycGhhbg0KPj4gLUY6ICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hdG1lbC1uYW5kLnR4dA0KPiANCj4gWW91
ciBwYXRjaHNldCBpcyBub3QgYmlzZWN0YWJsZS4gVGhpcyBiZWxvbmdzIHRvIHRoZSBwYXRjaCBy
ZW1vdmluZyB0aGUNCj4gZmlsZS4NCj4gDQoNClllcy4gSSB3aWxsIHNxdWFzaCBpdCBhcHByb3By
aWF0ZWx5IGFuZCByZXNlbmQgdGhpcy4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0
b2YNCg0K

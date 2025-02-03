Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10077200118
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579009; cv=fail; b=CXmNALngTvppCSi0PpcDJvDNlsqfktU83OCC4AWNM7cn3vqFmJno8mBloe25FJ7Gxp9gccnWhU0APRN1CmyFarpzurhvP6xXgT1cxqPEn2EbYiN29hj1WjgL6/xHdL+4/buOPrNZK5u2ZJu42FO4HiGrtxi6kiOBDwx9BsMPg6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579009; c=relaxed/simple;
	bh=+tDlDcAxlJBdvFSR8aT6X2Z/7ZOaByMZozfHo8JsmNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QaWyw5XNURHxiseppFA/PCxxExMBuQ6Ti2vzF7FtvLyrkKHNr6vRe9PHESmtHjfKDUaPg9c7LalXZf3Cc5eaY+1vY4fTsS2Aii/1eZyi5naDrFBtEDtrxmscaPuruQTsqMAwgv9lUYullZitFSNYysi/hgR3DW/4s8GndidJ9I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=niRrVzw7; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="niRrVzw7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M81We2EOhWWNsb6jEMZpZhVQOoNKEXjmvz1gDADHD1X70oE1jsLmg+pd/6sExbUFPt+XnhnLKv4fmM0JCvw9NPAgbyZYeE8E0n3NuoWBCW/4nataHHDQ8W1KIKT0BOIDVM4sOaT4o3CbERS+JfjVU2+tVuDTE9Fr3RyrIK80ckPFj5SI5czb2otMl+n+qkcQpTDWU9pi6yo8LDioXz570K5D95MKYK0UBX9ClgqmqnNvInDe3TkSJy03OEQQCCQtK1u+zvnHhfYQYZrNjWdvoY/+EJIdNIsAjKRjpJy9bu0WhFfY/gQFyd1poO5CQv1VuwX3rYGG3VzoL5m/oUaABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tDlDcAxlJBdvFSR8aT6X2Z/7ZOaByMZozfHo8JsmNk=;
 b=kowetmiWyXZzZJWDAYkVR1HP1NQ8J54o2TiaAmGPkBF20TMUHgs1oRCGB8+VpEc1eAxWURim5OfUqYMhlKcf2lyw7ktgKZWQoeoWfG45yc9WjdrE4O4UDVq/EKJhcfEMmjzMltS6C3J4JgZdauj61gR1zlfvrOu0NtW+hFcikZjvE2HWkU3brjmUNfjk67a2oFbxA1Sbsb/++RPGnGHy+MUto1kcmApLuJxYmT3NowweXYiLRw6jzJqagcMw0ilyaJdH67uMZZ+3YChWU2eGEjUNo8ak/R1noFSbpEYAcQZFriTcABbgZyQbXn61H5cg01JtLavJc9KUgWWfNK9kHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tDlDcAxlJBdvFSR8aT6X2Z/7ZOaByMZozfHo8JsmNk=;
 b=niRrVzw7SmBR8+dqVmmJFS62c3kwZWe9Y6HLvR3Pkk9ZKL9ryKWAkPr9whE/h+xj/Om4/bgtp8rsQKEDSTCeJpSti1xnyw6orMK3eWfcQneAl+FHbobwiv3frrr/ycMHsqeKTPtKcN3F0FkvUCNcxrsFLQMDhG2+y8Rll/BNDj1OCyIRt8jJNFSKYEDFw9K4UlxNAcgWQZH3OcR6sktfOVbmpvYmWR9cqWVh+/ILO4OUswt2xKNhUfTOdxeZntrfb62iBQDN95yKP0UMM5tMDYVoMkoM5qZ1ooXhAXzAm0WPC/eDdSZgLufrcS7+d5XeJ98kThsEdrGDqb+khn1dPQ==
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Mon, 3 Feb
 2025 10:36:44 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::5303:b2dc:d84b:f3b2]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::5303:b2dc:d84b:f3b2%7]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 10:36:44 +0000
From: <Varshini.Rajendran@microchip.com>
To: <Dharma.B@microchip.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: soc: atmel: fix the args passed to AT91_SOC
Thread-Topic: [PATCH] drivers: soc: atmel: fix the args passed to AT91_SOC
Thread-Index: AQHbZKw6UD51arkMRUWjb1Nu/zBLgbM1ha+A
Date: Mon, 3 Feb 2025 10:36:44 +0000
Message-ID: <c43fae08-6db1-4c72-b6f0-0c5d41325f6b@microchip.com>
References: <20250112-atmel-soc-v1-1-822937f1dd5a@microchip.com>
In-Reply-To: <20250112-atmel-soc-v1-1-822937f1dd5a@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR11MB4719:EE_|BY1PR11MB8005:EE_
x-ms-office365-filtering-correlation-id: c99b0962-5375-4d26-8cde-08dd443ea759
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RVpaM1owaUFkSGs2WXF5Uzd2N2htcHFqbGJlKzUxUlcraTg1ZDZJMlIwcEhw?=
 =?utf-8?B?cy9kUDVUalFHSHRGR0lzdDNnMy9mZWQvbW5Ka0xGMXNIYlZ1NUJIeUJPajFO?=
 =?utf-8?B?cnBhcHpvcEo2SWYvWHQxMGdLSmZGSjNGZ0NhcEYveCtuK2NseFpJblBVM2RE?=
 =?utf-8?B?ZDh1MHRVZWVydVhMclQ3dnBOUmhWREI0NFVwRGFSamxLT0taWjNqMlRYNjYw?=
 =?utf-8?B?VWVzbEJMWnp2ZUlKU0JlL2U4Z3p3Q1k0Q0pHM3JOb2h3aVFpVlFqUFVFekFz?=
 =?utf-8?B?b0xHdlNneGhTOGgzQlZqODFsaXo4SU81TUZ2ekkycGF5MGphRUkvRWhYT3BX?=
 =?utf-8?B?eG8zZmNPR0ZwbVVZNE81cXpmaWQ2WWMyZ3RTWWlEUXRHU3F3bDFPQjY0YTAz?=
 =?utf-8?B?eSs3Z3hQL05FNWZrVGR6MTRlSG5wS2FraThnK0dSY09leWwvbWNLWDhkdEpW?=
 =?utf-8?B?RytVUUlvMk9uVmZYOTNmMlpBVENUbzZyQmZJNjdyY0NIWGxhZ3NMUC9vTmh2?=
 =?utf-8?B?cmxjUzNua0xYdFduejZuVTVnTnNGbzVMNUlVbEZQQWdYVk5PNHpNSC9JUUdo?=
 =?utf-8?B?eWlUYU9qQlY0T2FVMHdpUXcrbnpGa2YvaGIwN3hNcXdLdzRScDNVVlc2SmJJ?=
 =?utf-8?B?QmZuZ2s3WTVYdGJZcEpkcGRGWk54V2NVeU1ZWmNkVkRDVDY1OVZ3a2lqQitU?=
 =?utf-8?B?NE1WRjRIUUNEQlptZ1p6YXZoQzc5TUc1empwYWczOFJYUVdvUEtZTW5HNkVU?=
 =?utf-8?B?V1h0MFRIUktxSjJQYXBIME1nTGJpTUN5QThwTkhIODR4Vlgwb0h4UEFkWXZy?=
 =?utf-8?B?SGhvQ2VDSCtJRExMRVlKZC8xN3pISDYxaXIzeE1lNzBrWTFSVzhsNWFUZUNQ?=
 =?utf-8?B?QWw5UkNVRnozQ3VjMkJIZXpxL2lCeHBQYVBMY1k5b3ZHN1pwY0VTcHFCeWVD?=
 =?utf-8?B?bm0wam5NTm5sYWRKRHJ3UjNEV29oS0xtRyt4WHEwRWdCcUFFYjBrZTh5MmUx?=
 =?utf-8?B?Lzd3cnB4YlV3UXVVdC90blloK1Q3K1ovcjRQT1RrdkFqWlJLNmdGYmdVN3kr?=
 =?utf-8?B?anBWOHZwczdNZ3RlZC9tR0NrYjBESm9aUks5MDg3Sk1PTmFHKzhVK256MEtH?=
 =?utf-8?B?cHA1bnRKakZINERLbTR1L1lqdHNtejVFZ2dKbFMwNC9YMzNtOTlkdDk5T0Nn?=
 =?utf-8?B?V01DRXFUVTA5cXZXanVPQ3lBbE5kaTRuODdMR1JvY2VhSUJFMHV0SmNRYXd0?=
 =?utf-8?B?WUcyWTJOM2xtZHgrcHloT2U5S3B3TjhLMXVYaDdQVEdHZTFwQS9yb3RLcGZk?=
 =?utf-8?B?Mk5ES2NuUFRBUjdCdDBzc0huZW5zcGl1ZURGWFhVL0VheEJiV1VCN01sNmRT?=
 =?utf-8?B?QzBIRUxUcUhHV3VPRi9wYzZYZngvekVKeFphdHZjSi8wU0NubXk3OFoyOFFI?=
 =?utf-8?B?R3N1SjRZSlhnYmc3YWRBeTRHNU1MaHd4M2ZydG9wR2lPWng4VmxhZmpOL09r?=
 =?utf-8?B?ak5qbUs0MHdjcVU0Z0p1ZWpCSTRtaGNiTnNaQzAzSko0OUVFbFJOTU9hUEJS?=
 =?utf-8?B?MWFUb3NkSlJRSDZIUmVIcmVEbmZ4cFhBUFcrZzM3YlFhR3ZYWDNKNlZURzFm?=
 =?utf-8?B?T1U2eEhWUVhETjA3RUVwTzhDQ3p0UXpyY0RuR2M2dGpQMDhGVm9XREYwTFF2?=
 =?utf-8?B?bW1ZQWZHdXhKbDZlNllCL1poL2RuamtZOHFlRFczUnN0K29mMWZFUXlVVi9L?=
 =?utf-8?B?K1BOQmF5aG9PbVc5Y1NjeXp5bjNlTklsdjJCSWFFSGtXMFN5Q2FvaWpXUk5V?=
 =?utf-8?B?YXNqY2pmcTgxWXYxSXhJcW5KNmd1eFRGdUFObk10UHVjK2MvdkFkNWN4N2Zr?=
 =?utf-8?B?WkhpYno4S09jYmtBSFc5QkN6eHdqYm45dlY1VVZXVmplLzF1TmZJRnlCWHZE?=
 =?utf-8?Q?FlmDfCfvqilrLStIsU/j/wPHfl2DEa1w?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDc0NGFZVTdrZkpUYzZOejA3YUkzcEFocUMwSXRxeW5TdUQrbzl1OVh5M0FK?=
 =?utf-8?B?K09UZm1xNHhBNXBKZnpocGNNUzBTam5JdGVrRU9qUC9QWnRyODJRSjVEbUJN?=
 =?utf-8?B?MnNXaDhTRmo3S2Y2VnF3VldrM29yaHhFS3ZSbzV5bEhHMjRJNTdxL2oxRDBy?=
 =?utf-8?B?T0VKWFJWa1Rla29KR2FuNHhzbmU2S3cycWpiTmV5NEhWZ01SUFNGU2hVSWFF?=
 =?utf-8?B?R0dONEltc3N2ZTR1NThxMVJ1aFhVUzk4VFJCVWF5MnJnRnQzSWJQbmdjRE9J?=
 =?utf-8?B?WERNYjBuNVZJejNpRGpSS1R2Vmh3bk51djFCZDhmOFlGT3JoQVBtUWxRQ1FB?=
 =?utf-8?B?elNBelNnaDJJMkdFRURsRGhrMXc5THJ0Qi9uZkNWek56NW9XY1pZek9ISmY2?=
 =?utf-8?B?NVA4Uk9YM2orbzcvNVRmKzlucVRUbDFjMjI5aFlnZmRKeGdYSFRuZ0xOTEJa?=
 =?utf-8?B?cDRhTEZacGZzS2hhQ3VmaFAyUlJCRStZeWFxYnBtb2VWWCtUQkpOT1JrczJs?=
 =?utf-8?B?NTZXSmNaczMyZ3ZXOWtOcUtBek04Q3JCWlRnNk12bEExK0FlWUlCbUVpMEVC?=
 =?utf-8?B?QmNKcEt3NXo2bEpaeStHZTZONWVmZ2I3VTNsejdYTUJCOVZHTHJNaFFaK1Uw?=
 =?utf-8?B?N2xNLzBMc2ZyTDF2NE80T0dsVGNTQlNkSUtJYThqUTlqaEdGS3plTUw2WW8x?=
 =?utf-8?B?YUUrbk11Y0dBcnlpTW80ajJZTU9PY25RTytFZ1hsejJweCtMMEowbEJUNjNT?=
 =?utf-8?B?MXcrd1E1TVJOc0JjdFJIQ3lQU0llRFNHaWlUWW9Qa2ZrWWZUQjh4bXhTZzIw?=
 =?utf-8?B?aXluaml3K2dZdWhKZnRkbUt4MTQyWHBKU2U1UEVVbTlzVWNLTVJWT3ppeEw4?=
 =?utf-8?B?OWtqQVBFa0p4VExJOHRiSldtempsQzVxT095aENBOHhJNDNwejhSQ1dxWk5W?=
 =?utf-8?B?cEZQMTYySlBLQmtXZVNvQ05xRWpzYUdmOU5IRE9FcEc4eUNGL3MyMi9YbFho?=
 =?utf-8?B?K0hvTE02cVRjT2N0K2x6czR4RldsNjYwdnZvMktKOFZhdm96UTVZYkpJczRH?=
 =?utf-8?B?YzBnc2NVb2RpN0lYd1FXZ295VWR3Ty8zOTFyVFRrWWdZWEtWZ0Rxa0ZJL20r?=
 =?utf-8?B?MDB1clA5WXZsWTlxL0RvRHpTOEt3MzRFVFh4azRranV2cmNMWmFGN0Z6ekF6?=
 =?utf-8?B?NkFyT3dJRUF5QjFjMVE4dlY4eXAxRk9tNTd6YitTU3FEWDkvVllRVC9kelJL?=
 =?utf-8?B?d0t0T3RwMU9NbHFnNWR2MHN6TU1LcjZkVjZwUVFqUFFZR3k1OXYxcVZCcExt?=
 =?utf-8?B?NEo5N1hnRE11cVdOMUk5Mkc2a3gyR2hmZVZjdzdmSlZZWHRHd3U5bThhS2lH?=
 =?utf-8?B?QjZHN2xiM3g3aTZodnZtNzVCMFlWak1jQktBdkFzZnZVUURGckIxbzlTdzYy?=
 =?utf-8?B?N3Vmd1ZwZUkwUTNxc1VjNm5TMDdvOUFGZnhJeWpwWW5MaStOUCtzY1pRZFor?=
 =?utf-8?B?RDdRSTJBOVlIN2dtUzBVVkh3UnY3S2JkTE5TeTRxQWl0S1A5YVpyWlIzVFFD?=
 =?utf-8?B?a0xVbjVVQXBJcWVENzhxZlJkMVZzZEJ5bUR1cXNwL2lJdE9IT3YwOXpaNlVK?=
 =?utf-8?B?d3J6clNaYnNHamk3a1Y2blA4cEhZSGhiMDFJeUUvTVFkeVRKRm9CcUVCdndu?=
 =?utf-8?B?eWt3anZZYWdKUzMxN1NFc20rZkhTOENaaHUwbkVHOU9DcGN2dHN1RnVIZjJP?=
 =?utf-8?B?dFFoL0FMU21QSUpEa2VFekNyNVRoaTdtUHFlZGVHd1VJVGN0empnRjVmNGds?=
 =?utf-8?B?YlJSYjJhNFFRVXZCdWs4KzMzc1pld3RpTzBudkZ1T1pLVWJTNHlIK1BjYWRB?=
 =?utf-8?B?SEgrYjhGVDIxUkN5eU5Iclk5NkxLVEFXdGVsQ21maHlVYVBUMVNHaDlmWmNl?=
 =?utf-8?B?QmhxZ2FyRGNJeUNjK0hJbXBrd2hDNmJuVnlJaVkxWm92NXhqWnhHT2prV0dz?=
 =?utf-8?B?WnF2UFYxKzZsb3B6dTJqMmdRaWtNQU1nTGNzdUtjNHJhcnR4NFRPdzAzZk1k?=
 =?utf-8?B?QW5GZHVOaW8zRkFaa1crZ2xLYkZUUWlXOUVtZlUxV2tuS0NvT0MwTXNFaHhm?=
 =?utf-8?B?YXIxcnZtZWJIUWJRdDF3MDNFa05yVmlhejRsVDg5RGtnNnQvRUJqUTArRU5y?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4C64F5D43D7F241A8CE658A1CAC1735@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99b0962-5375-4d26-8cde-08dd443ea759
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 10:36:44.2263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jS9anUXcTMHEH+Ex8F/MAyNXbXBMLBj5kUr2jWInpOFBR8zt2bWxSHZ0ZsOjwdnCy5N1NU7YJXPxnIuIFG6qFYLNwNfN8iatsnmlI+dggiACuYXStjKwP17NpM44PU7F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005

SGkgRGhhcm1hLA0KDQpPbiAxMi8wMS8yNSAxMDoxMSBhbSwgRGhhcm1hIEJhbGFzdWJpcmFtYW5p
IHdyb3RlOg0KPiBmaXggdGhlIGFyZ3VtZW50cyBwYXNzZWQgdG8gdGhlIEFUOTFfU09DIGZvciBT
QU05WDc1IFNpUC4NCj4gDQo+IEZpeGVzOiA1ZWI2NGYyYjM2OGYgKCJBUk06IGF0OTE6IGFkZCBz
dXBwb3J0IGluIFNvQyBkcml2ZXIgZm9yIG5ldyBzYW05eDciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBE
aGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KDQpS
ZXZpZXdlZC1ieTogVmFyc2hpbmkgUmFqZW5kcmFuIDx2YXJzaGluaS5yYWplbmRyYW5AbWljcm9j
aGlwLmNvbT4NCg0KPiAgIGRyaXZlcnMvc29jL2F0bWVsL3NvYy5jIHwgMTYgKysrKysrKystLS0t
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvYXRtZWwvc29jLmMgYi9kcml2ZXJzL3Nv
Yy9hdG1lbC9zb2MuYw0KPiBpbmRleCAyOThiNTQyZGQxYzAuLjI3M2MxNDIwZmQ0MCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9zb2MvYXRtZWwvc29jLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvYXRt
ZWwvc29jLmMNCj4gQEAgLTExMSwxNyArMTExLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXQ5
MV9zb2Mgc29jc1tdIF9faW5pdGNvbnN0ID0gew0KPiAgIAlBVDkxX1NPQyhTQU05WDdfQ0lEUl9N
QVRDSCwgQVQ5MV9DSURSX01BVENIX01BU0ssDQo+ICAgCQkgQVQ5MV9DSURSX1ZFUlNJT05fTUFT
SywgU0FNOVg3NV9FWElEX01BVENILA0KPiAgIAkJICJzYW05eDc1IiwgInNhbTl4NyIpLA0KPiAt
CUFUOTFfU09DKFNBTTlYN19DSURSX01BVENILCBTQU05WDc1X0QxTV9FWElEX01BVENILA0KPiAt
CQkgQVQ5MV9DSURSX1ZFUlNJT05fTUFTSywgU0FNOVg3NV9FWElEX01BVENILA0KPiArCUFUOTFf
U09DKFNBTTlYN19DSURSX01BVENILCBBVDkxX0NJRFJfTUFUQ0hfTUFTSywNCj4gKwkJIEFUOTFf
Q0lEUl9WRVJTSU9OX01BU0ssIFNBTTlYNzVfRDFNX0VYSURfTUFUQ0gsDQo+ICAgCQkgInNhbTl4
NzUgMTZNQiBERFIyIFNpUCIsICJzYW05eDciKSwNCj4gLQlBVDkxX1NPQyhTQU05WDdfQ0lEUl9N
QVRDSCwgU0FNOVg3NV9ENU1fRVhJRF9NQVRDSCwNCj4gLQkJIEFUOTFfQ0lEUl9WRVJTSU9OX01B
U0ssIFNBTTlYNzVfRVhJRF9NQVRDSCwNCj4gKwlBVDkxX1NPQyhTQU05WDdfQ0lEUl9NQVRDSCwg
QVQ5MV9DSURSX01BVENIX01BU0ssDQo+ICsJCSBBVDkxX0NJRFJfVkVSU0lPTl9NQVNLLCBTQU05
WDc1X0Q1TV9FWElEX01BVENILA0KPiAgIAkJICJzYW05eDc1IDY0TUIgRERSMiBTaVAiLCAic2Ft
OXg3IiksDQo+IC0JQVQ5MV9TT0MoU0FNOVg3X0NJRFJfTUFUQ0gsIFNBTTlYNzVfRDFHX0VYSURf
TUFUQ0gsDQo+IC0JCSBBVDkxX0NJRFJfVkVSU0lPTl9NQVNLLCBTQU05WDc1X0VYSURfTUFUQ0gs
DQo+ICsJQVQ5MV9TT0MoU0FNOVg3X0NJRFJfTUFUQ0gsIEFUOTFfQ0lEUl9NQVRDSF9NQVNLLA0K
PiArCQkgQVQ5MV9DSURSX1ZFUlNJT05fTUFTSywgU0FNOVg3NV9EMUdfRVhJRF9NQVRDSCwNCj4g
ICAJCSAic2FtOXg3NSAxMjVNQiBERFIzTCBTaVAgIiwgInNhbTl4NyIpLA0KPiAtCUFUOTFfU09D
KFNBTTlYN19DSURSX01BVENILCBTQU05WDc1X0QyR19FWElEX01BVENILA0KPiAtCQkgQVQ5MV9D
SURSX1ZFUlNJT05fTUFTSywgU0FNOVg3NV9FWElEX01BVENILA0KPiArCUFUOTFfU09DKFNBTTlY
N19DSURSX01BVENILCBBVDkxX0NJRFJfTUFUQ0hfTUFTSywNCj4gKwkJIEFUOTFfQ0lEUl9WRVJT
SU9OX01BU0ssIFNBTTlYNzVfRDJHX0VYSURfTUFUQ0gsDQo+ICAgCQkgInNhbTl4NzUgMjUwTUIg
RERSM0wgU2lQIiwgInNhbTl4NyIpLA0KPiAgICNlbmRpZg0KPiAgICNpZmRlZiBDT05GSUdfU09D
X1NBTUE1DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDJiODg4NTFmNTgzZDNjNGU0MGJjZDQw
Y2ZlMTk2NTI0MWVjMjI5ZGQNCj4gY2hhbmdlLWlkOiAyMDI1MDExMi1hdG1lbC1zb2MtNDBjNGI0
MGM5YjY4DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0K
VmFyc2hpbmkgUmFqZW5kcmFuLg0KDQo=

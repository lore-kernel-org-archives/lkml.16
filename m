Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E61D1DE2DC;
	Wed, 29 Jan 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738174994; cv=fail; b=tkcgiSWkYPwzKyq8m0sP4ueblh43v6PIe45Dn0C2imd1kqAwBLXuyTAV0T20i6wSeC5ex4oQ86NQBmvyB9cTn0WiY7w0VPObLlE+vCxf8iKggTmqwIQH144bW1Lj/nk0H+M+7ah1n9hUeVU5dSj6Yt8ArPelWBGGrE7jylTdeEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738174994; c=relaxed/simple;
	bh=gzmiY5Orp0v9TRx5nI5DaEkwIH3ab9fA7wSfWrWQBAA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WDs1ZfTTwnoJQVI43YVO5KO4YPJI0OWzkiI2bcBw8g0iWRb0E31gvqNRT2f+0CIjFjRRaIbK9XQ/Xg67pQy9jlVEhlsepciAef3NnHNOnV8+8uCX1zXRIayxcnQ3Mx8jrqpTmhxFLfx0t7ve/JfIyCYli4ykKxAs8Z8NTakSsLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=oHG707Jh; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="oHG707Jh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2TWfGtPu8ZOFM6WhZDcSkPXfCw7vcTVR8Ba8bOyLywXkaolWV7vCogS+dwqsXG4jvof0q235pH8OC8xY2OFcPWvXbcdgDaBARNon0g9a3/STD2KuYy63KYpzjkPyqhCl+YaNx84GQSA3Nz5cvGIqqtbLx2bzRRXs/q/SHsRTqZrwUz2QapKX/Ga7wqVO1pABJv6HQExepoH7T9YtnfgoXdJeQtiA77gy+RH1crOSRmYAcZD8F+9l/eLFBg5Sq1QDXI9g+tnbPjp7V0rC1DvIEBjEsAVv5UqgpVCF05PYJbpv+5PT8Lm9Y9aNYFw4KwWyQblEpl/kix8ggRgxFlEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzmiY5Orp0v9TRx5nI5DaEkwIH3ab9fA7wSfWrWQBAA=;
 b=qAYjiU98Mi5X46ToIbu+Wr/OQObxGUnU0nmG1kc2vj3+bIlV7+i4nVtQhJdy1ovYalbIwuUATuV23GtALgTwfq+YsGfXBq4e1uU+bbat4whMXQjZR1WkKpKME2AgOp6Qzhsjxo6rWWRzl6NNE+i5TXK0j5dAgm/G02o/Bb3ZOQKwzAWF0w2lEMrAgbRCwUlBaKR3nkbe3TDgfk7JU2zWDA3STmQV81ZZp9qpuHKWNoea3Aybe/Bv/DQxihJwIA1c+7hC6Fpq0YA6uyvMz9sitaV420vzwHNMOC/mLEIemnrztzqyrhO1mr8eMvKEuWa5nN8f7Pd0Z5ILnQiNYjD6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzmiY5Orp0v9TRx5nI5DaEkwIH3ab9fA7wSfWrWQBAA=;
 b=oHG707Jh0yurFF0ojsxLZXdSqqiFc8ReYApKXUiqGY/uV7Fokt/9iQcn2FBdF/DY4rcYnLCU3YtBtAudnFhaUowhixd0m4yvzLtWfkmCYOb0Bkb4kt2tD3kDGH8L0rylD35NyxTw5+FjhIJfDLIEDgx0TCVCl5PAB/Q9vwOPz8HwmOAaqA8mg/EMhGn3XB6AlUOhzv4djxDfCXpj+izYbX3nmvB2tGjn3XsZvgb/Ww6FbQiPnArGm1b8WW3jRSKPYKYRbGf9VnpJ377cFam1Jeha+eJuNCJJpXvOjX9ub5oHbJTsFODt2dCwm5X8dIO9/aFufq3xohcBvXjw9Ba2gw==
Received: from BMXPR01MB2552.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3e::18)
 by PNXPR01MB6785.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 18:23:05 +0000
Received: from BMXPR01MB2552.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::496a:9f36:b4f3:3661]) by BMXPR01MB2552.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::496a:9f36:b4f3:3661%6]) with mapi id 15.20.8398.018; Wed, 29 Jan 2025
 18:22:59 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Atharva Tiwari <evepolonium@gmail.com>, Henrik Rydberg
	<rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: Re: [PATCH v2] hwmom/applesmc: add imacpro
Thread-Topic: [PATCH v2] hwmom/applesmc: add imacpro
Thread-Index: AQHbcnrTFqceRmhJl0yj0+n5oqKJlA==
Date: Wed, 29 Jan 2025 18:22:59 +0000
Message-ID: <7D2F2DB0-E94C-4372-9285-A91C4C856934@live.com>
References: <20250123121728.1383-1-evepolonium@gmail.com>
 <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
In-Reply-To: <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BMXPR01MB2552:EE_|PNXPR01MB6785:EE_
x-ms-office365-filtering-correlation-id: d552f73e-7fb0-42ed-f8c6-08dd4091f59f
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8060799006|7092599003|8022599003|461199028|19110799003|8062599003|12121999004|102099032|10035399004|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?utf-8?B?Wnpabmsxdm12SlBDc0VIY3FUU3lrNmcxb3FBQk9xdWlPZ2dMcFByTkZvejVO?=
 =?utf-8?B?RjUwcndTK2RtVjVaaUVpUFluTng4cUx5elo4SVl0Yk5TZ2FMV2MzWWpYbTc5?=
 =?utf-8?B?dkN6Vm9reEhwUUtObGlwZ3hidjJLQ3FXS3lkT1BvUGI5dzZncEc4bVZETVZz?=
 =?utf-8?B?TXhJcWw1UzF2eXBlbytnS3YzbWdpRVd4SXNXVmRxODFkQ1JpRmJFSitZaHQ1?=
 =?utf-8?B?SDg5YkdzOVFHTy8yWmRRZTh3bWdkRWROc1MvNnFRbzJSMXZxL25xWVRUUUdm?=
 =?utf-8?B?Q0FtVkx0OGU3eGFWS21haDV6a1c3RzZXQ0VuOVN4MUswWC9EaTQ0K2d4dUdk?=
 =?utf-8?B?c05NMWp0am9obUFQb3k3TWdZKzE3ZjFxNzJaU29DRXEwK05EUE1kVnViMjRE?=
 =?utf-8?B?ZVJ6N2UxNWlqOFl3S1BTRzRaOEkweXBkMi9rQ200Zzl5THdQeURrWGpjbm5E?=
 =?utf-8?B?OWFERlY5Z3ZhRlo4TUVTR1FhcmRDdnFwb1ZMMWdiaUVwSEZnblBlRDRJZ2dw?=
 =?utf-8?B?Q3dJL1dQWi8rRS9FcHB2SU5qK3NRczRoYXRjZXFlWDdzOEZlR0cyRlRVcENr?=
 =?utf-8?B?MWJqYXVjTW1yV0FKNlRqSmk2eU4za2V5YVZ5NkQyZ3NCcHJOTEk1djRDOTRz?=
 =?utf-8?B?L0FFdGxpZ1hNWVZ1TXZ0d3ExdHA0Yzd5Y2s5SWJDbTZjQmtyVDJvSXVtZWd2?=
 =?utf-8?B?a1F6cHNmUWcrKzh2RXZYa2ZYRkRaS04rTlRDd1ZFNEZ4a0wvSFgvU1h6eTla?=
 =?utf-8?B?WXRpeWJ0M0lkdmxXZXo5bGw1d3N2TVFnUjNHQ1JScWlVdGgyUitJSFJnZ2Rt?=
 =?utf-8?B?ZzYxamRzRnVVU1pPMlFpVDIxTEN4RVorbUQzWjcwSHZZMmFjcjJiQ1luaU1x?=
 =?utf-8?B?RFhpVzU5a2JvRkJGV21oeEpQWm9qbWduM0N5UGVreXN1L2hkc2dMd0I0TFR3?=
 =?utf-8?B?RENEU0tXdW1QK2FZNVYyNVl3M1RmbzMrT1ZoUkszZlh5UUcyeDV6Q1Fkbk9y?=
 =?utf-8?B?cjd1NUs1WkE0c2NVaDRENTJhNW1TbEk1dDVmV0U0K2lSeFFxUkhqb284V2Nu?=
 =?utf-8?B?eTlqVm5NVXNPUjNHN3ZQTGhyRk1EdHBCUXNVcTZFWktIZjFVZ3BOalFuUmZP?=
 =?utf-8?B?aFJ1cHpkZk9EQkp6T3VVQnd4OTVwMHhnYU5kL2tTaGNNb0ozczdtWEg5YUYx?=
 =?utf-8?B?LzBzR1FXbHh5cEhqam5ra0EyOUtmQ2FuNUd3UG9JMC92SGZlQkZuMlFuZ2Uz?=
 =?utf-8?B?Ykd2THdNdmkwcGwyS1M5TkpOcE1QTm1ZUFIxMFNsaVRIVUxDQ3RDL3pXNVFr?=
 =?utf-8?B?emJKU2JFSVhLRzJsN3phZ0RkNk9hajFhaFVhRnVQOFZrcEpqRWorSnJBZ3Jw?=
 =?utf-8?B?bEUrcXQ1SDI2cHRrSWNwSE9ndlcwaEM4TzZkVHlTYkhzWDJuSVNLSzJvOTBD?=
 =?utf-8?B?UU9Odnc1eGM1NENvMC9sWU92WGI1WkRTOHhYdmxZbTdmbHdOaW4vWHRld09P?=
 =?utf-8?B?RjVaMWg2NnQzWFZjeXZ4R1pMT1ltdmVVOTI1WmNpWGxTTC9NNkxhZ2NXY3N5?=
 =?utf-8?B?eVZxSnkwdmZaY2dXczBRaTFWWUJTY3Y1djYrRzcva0lremJyUDZSR0dtOXRj?=
 =?utf-8?B?bW1GaUtWeHQzbVJZamJobUlOWVhWcEp6YUxRMmNPdlZWWk5LZEdDalVvNWhE?=
 =?utf-8?Q?VNXnb8QdVivKvAXxHBxp?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1J0OU9BREJZdDR0dkQ5UTlaR010UGRUaTFrblE4cVFWSDRkMnpiTFpHKzlw?=
 =?utf-8?B?dTNaSVNWZzZ0UUNMV1BLQ2tuVjQ0dzRQb3I0QzdvNVNlbUpSd0FrbW9XTVJZ?=
 =?utf-8?B?aTBoK0loeStONUQ2c0hHVEs2LzZCWGk1VmkxUXRqZ1oxeXo1OFRWUkpjLzEx?=
 =?utf-8?B?bmpoWXc2SEFzSzY0d0V5blI4Zzk4eFUyL0VmNEw0QWx2dHFYS0liVU1peXRX?=
 =?utf-8?B?d1IyRE4yYWI4SDRlczlOR2IvMm1CcVRRM3VXaEJ2UmhOM0pCVnliMEVka2Jk?=
 =?utf-8?B?TnBSb1UyMVpyaFhPQXpjR1oycTkzMUJPNnIwa0YzRXF6TVZVVnR4cnhxeUR5?=
 =?utf-8?B?ZzdwRkVSMGFLUVZwNW1YbWpCays1aEs3ZzBtVEVndWdZUGhqeDAzODZPbmRI?=
 =?utf-8?B?ZjdKS3NBdnhNS2xkSzNHcUl0Sk5KcW1wWXE4SGE1U3AwNzdzSmNLOUxUMzR6?=
 =?utf-8?B?UzFFNEMyVUszR1c4M2RBUFpCRStpM3V3Uytrd01ERkdmNm1pdTdXYU81dmFt?=
 =?utf-8?B?YVVmWWt6WXBVb2pBdngrTkZXR3pRZzdrK3IrRmpaU3Qzb1Y4b05wa0JZQ3ZI?=
 =?utf-8?B?d1J2Y2ZNa3JRZktNVzIzS3JGZGRrRVlhNnlHRGxFY1gyb281dGJ0WGgwS3gy?=
 =?utf-8?B?eDhaRmgvemVpbDVzVFdWKzlsWnluVFUyLzlVaXR1NTFNSTFTWVpjUmNlUTBa?=
 =?utf-8?B?dWgyaFhwR0NzUjEyb2ovcWRYODhoOHlQRVQ2MHovTS8rdW1vK3NpZ2I1SmNY?=
 =?utf-8?B?ODl0alJleVpHZSt2L0dWQ1B4QW85endrU2hZY1Z4RTJEUWVvZGdySXJVMEpl?=
 =?utf-8?B?NTUwVVNKR09FdlFDOWQzdURvNFBySEQydU8rdWVHZHNaa1lwbUJ4aWZDR0lz?=
 =?utf-8?B?UVh3d2hBcW9DU2pBTlRtRjhMbGd5enliWVZvUjF2WURZemVTM3VhS0VCMVQv?=
 =?utf-8?B?TmpsYXh4ZzNpK21nRnhQZTBDblBFeFF6Y2RSTGhZK1dmdEtLaU9JdTBUdFRH?=
 =?utf-8?B?U2NvNjBwV2NTcDJLYVpxQldkalA4MWhveVBBUmIwd2YvZ1VZdi83Z1FmMG9t?=
 =?utf-8?B?WDkydVAybXJCWUhWZmVhVG81OXFzTnJsanQxZnZRbW1kRCtaSm5kMTkwTFRB?=
 =?utf-8?B?OVRDdEZ4QWpRQVdkdS9TdGZhMi9FTThnTE4vaVJ5d1VPQjRzNlZ3cWJZcEZu?=
 =?utf-8?B?SHhiTE96N081UWlhZUN2TWRqT1IyOEtMK2Yrajl6SWF6SkhwYVcwYVNTaVUz?=
 =?utf-8?B?ZmRhWVBRRkFiM0wrbE5YVDUxWGNpL3ZkVjk3dUlobWt2Tklqa2lFQUpxSXpN?=
 =?utf-8?B?ZmlpK2F1MGVrcUw0VklqY3REU3ZRSksxaEhjcG1lazNjQ0oweS9NZFluZm43?=
 =?utf-8?B?V2ZtbDlJSms5N2NCV1AySVJTbVJYNVdqS282MStXL05sQXlmNzVqMm9CRzZL?=
 =?utf-8?B?M0Z2RWM2RXJMb0kydkkyQ29BK0hoR0hkK3BnTDNCME5Ba0xUN1hsSlBJVFZn?=
 =?utf-8?B?cVJra1V4eFh5TWdBcTNQbkVLQXU3dVFjSmFRdFFZcHppeFdLUWpFWk95dlln?=
 =?utf-8?B?M1AzdlZDY0d6TlAzY2hlRmZjNUVEV09uWjBSalA1dnErSVNOUW1nZjBZNURG?=
 =?utf-8?B?VTVXaVkrKzRvc3M3ZGVhb2lDMm13V0lUYWJLc2N3ZG5qdnNJMHByVUhqMTM3?=
 =?utf-8?B?bmNYTEdDejJreE5wSUswVnFOdWt2di9tSnFiNTFWUTVSZy9najE5bk0xTU5P?=
 =?utf-8?Q?3XC0WSktyua7Zyhh9+TDLYPaEQtaAiMwBPQc1o2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <515C6DB2B21C344ABA1CF5A36119030F@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2552.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d552f73e-7fb0-42ed-f8c6-08dd4091f59f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 18:22:59.1232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB6785

SGkgR3VlbnRlcg0KDQpTb3JyeSB0byBiYXJnZSBpbiBsaWtlIHRoYXQgYnV0IEkgaGF2ZSBzb21l
IGlzc3VlcyB3aXRoIHRoaXMgaGVyZS4NCg0KMS4gVGhlIGlNYWNQcm8xLDEgaXMgYSBUMiBNYWMg
YW5kIHRoZSBhcHBsZXNtYyBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBUMiBNYWNzIHVwc3RyZWFt
LCB0aHVzIG1ha2luZyBubyBwb2ludCBvZiBhZGRpbmcgdGhpcy4gV2UgYXQgdDJsaW51eCBoYXZl
IGRvd25zdHJlYW0gcGF0Y2hlcyB0byBzdXBwb3J0IFQyIE1hY3MsIGJ1dCB3ZSBkbyBub3QgYWlt
IHRvIHVwc3RyZWFtIHRoZW0gc2luY2Ugd2Ugd2lzaCB0byB1c2UgYSBzZXBhcmF0ZSwgYW5kIGJl
dHRlciBkcml2ZXIgZm9yIHRoZSBTTUMgb24gVDIgTWFjcy4NCg0KMi4gVGhlIHBlcnNvbiB3aG8g
c3VibWl0dGVkIHRoZSBwYXRjaCB0b29rIGl0IGZyb20gdGhlIHQybGludXggcHJvamVjdCwgb2Yg
d2hpY2ggSSBhbSBhIHBhcnQgb2YsIGJ1dCBkaWRuJ3QgY2FyZSB0byBldmVuIGNyZWRpdCB0aGUg
b3JpZ2luYWwgYXV0aG9yIG9mIHRoZSBwYXRjaC4gSeKAmW0gbm90IHN1cmUgaG93IGxlZ2FsIGl0
IGlzIHRvIHJlZGlzdHJpYnV0ZSB0aGUgY29kZSBpbiBoaXMgb3duIG5hbWUgYW5kIHJlbW92aW5n
IHRoZSBvcmlnaW5hbCBhdXRob3LigJlzIG5hbWUgd2l0aG91dCB0YWtpbmcgcGVybWlzc2lvbiBm
cm9tIHRoZSBhdXRob3IgYXMgcGVyIHRoZSBHUEwyIGxpY2Vuc2UsIGJ1dCBJIHRoaW5rIHRoZSBh
dXRob3Igc2hvdWxkIGJlIGNyZWRpdGVkLiBJbiBmYWN0IHRoZSBvcmlnaW5hbCBwYXRjaCB3YXMg
U2lnbmVkLW9mZi1ieSB0aGUgb3JpZ2luYWwgYXV0aG9yLg0KDQpGb3IgcmVmZXJlbmNlLCB0aGUg
b3JpZ2luYWwgcGF0Y2gsIHdoaWNoIHdlIG5ldmVyIGludGVuZGVkIHRvIGJlIHNlbnQgdXBzdHJl
YW0sIGlzIGdpdmVuIG92ZXIgaGVyZToNCg0KaHR0cHM6Ly9naXRodWIuY29tL3QybGludXgvbGlu
dXgtdDItcGF0Y2hlcy9ibG9iL21haW4vMzAwNy1hcHBsZXNtYy1BZGQtaU1hY1Byby10by1hcHBs
ZXNtY193aGl0ZWxpc3QucGF0Y2gNCg0KSSBsZWF2ZSB0aGUgZmF0ZSBvZiB0aGlzIHRvIHlvdSBu
b3cuDQoNClJlZ2FyZHMNCkFkaXR5YQ0KDQoNCj4gT24gMjkgSmFuIDIwMjUsIGF0IDk6MzbigK9Q
TSwgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToNCj4gDQo+IE9uIFRo
dSwgSmFuIDIzLCAyMDI1IGF0IDA1OjQ3OjI4UE0gKzA1MzAsIEF0aGFydmEgVGl3YXJpIHdyb3Rl
Og0KPj4gQWRkIGlNYWNQcm8gdG8gd2hpdGVsaXN0IGFzIG9uZSBpTWFjUHJvIGlzIHJlbGVhc2Vk
Lg0KPj4gVGhlIGlNYWNQcm8gMSwxDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEF0aGFydmEgVGl3
YXJpIDxldmVwb2xvbml1bUBnbWFpbC5jb20+DQo+IA0KPiBBcHBsaWVkIHRvIGh3bW9uLW5leHQu
DQo+IA0KPiBOb3RlIHRoYXQgdGhlIGJyYW5jaCB3aWxsIG9ubHkgYmUgcHVzaGVkIHRvIGxpbnV4
LW5leHQgYWZ0ZXIgdGhlIGNvbW1pdA0KPiB3aW5kb3cgY2xvc2VkLg0KPiANCj4gVGhhbmtzLA0K
PiBHdWVudGVyDQo+IA0KDQo=

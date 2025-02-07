Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2090.outbound.protection.outlook.com [40.92.41.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379EE23C8C5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945070; cv=fail; b=qOQfXKw6tCFCxqdd+b10F3FvxOZ3X64d33bQt7SiCZXkLQRkj2nVc21uayaxMEVSOOmmDdCiBANKTeYLPCo6i46M3xV0fxJGc82JN/p0q27clqGt/NxydnfgEctj0WDVMPouvLJ7FmqoVHcR4LMOUYF7n9LcotS+4eEcYY6SYsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945070; c=relaxed/simple;
	bh=FrutDERJBpv0i63Ay4mzoIvOoj2gAjwqNRBeLhweGMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QPC6UmMj9C3dFYrzsGcdTi3mIrqaqrhWWZNr5RWmLXkyfsSJNg55NHHlZOM4GyZ9YDJqYZieL/5raZBk69qzXmJTN0IkPrYGcOj1bSB05qGHHPRYBRl2bBm6JG8jfdG5MSdALdL8XV1Qmi3PratiCxxm+M0Uaj2vht+i2pvx3eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=C9OeAE4h; arc=fail smtp.client-ip=40.92.41.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="C9OeAE4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8cC+nbI1tt10YZBdRIE7z7KymKoGViYcYelDOcTiHcaHFgtxtCaWNTKbKLZN5Rl0OpsFRvI05nBIkXoznct92jBoKpPiDWOnbc+dND4SDyk4LPVtvYjDLQF/of5UTx8F1STZARaHBUqWTuYQDXtwZrc983Dj9H2bnitSavsaLbvkJ/uESTeHffzLqpBVfbKiFusihCiZpfM4x7e3HMeyvORSSHbD7c+YcAkrTyoILc6UcFbwacHLiry+TZHnmqro3W75wGV03Ox8B6223Ky7Dp3USloknVKg1mVVGDRv5qNklsZx+/n/hrKuHwJn9OS1XENWT7I7/y1EUaGI1JYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrutDERJBpv0i63Ay4mzoIvOoj2gAjwqNRBeLhweGMk=;
 b=E+qeNsetXgGfDnnO4xkKrGxwt2qsh5zQy+9Cp5oqHSeJ09ibdOYEQ0b/zMECeL+yPmROE2FwrR4+gWqMcRO8teeEl8yuRgoPvNogK8DEx1c4jQRw0xAa7X+UJUaDVyH8u3WksWTMdCRQaS3zzB/giKc0XEnz0JJV+iswUj8D5OQsUTLPzNE3ADVb1o3N9gpnhlaWDa+cD4RFgeukB6cqzq9Og9NzMZyySuuMBEBiEu+q+icTbNSb5Spi4UftF+Z/v4dRBRc5IoOe7cV0Otlb3DUs+mJPi2272YXjRk94cYtz2SWJsxoHCZWO5Ef+5AiEjoMZads2Z7i+tafKPHgutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrutDERJBpv0i63Ay4mzoIvOoj2gAjwqNRBeLhweGMk=;
 b=C9OeAE4hZFF90xVf0wMXgA04jiFIayvL0oTiU7pUSGil/8kp4lPb3EtS5QQGgXTsjkZASVOe1P4fojvldO7LfYw+Z162OdZSWmQPhb4pKU93AiEmn6DlUDwPN9X8A8IKcD7SoQu/ysF1I87h3M0G/DBnltRwxlo6NUYHn3ZQJmjR4CvlyHOXgtnJR444T5Ge3Wbw7/wld5SZ9FWMWIm4an1Fq8xgFD+GOUQ9fXPCggqhOpJfGvG+BQdZKzmh6D1q8VjGgKue00Bvglce1j+NmOvglxhXOZBbRjVXWiC5RK2q9mNVk3FZd4u2zjCl50ejPRvsJK/J38rljOFnY5Xkpw==
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 16:17:47 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991%5]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 16:17:47 +0000
From: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
To: Mike Rapoport <rppt@kernel.org>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIG1tOiBvcHRpbWl6ZSBtZW1ibG9ja19hZGRfcmFu?=
 =?utf-8?Q?ge()_for_improved_performance?=
Thread-Topic: [PATCH] mm: optimize memblock_add_range() for improved
 performance
Thread-Index: AQHbd5I+MclXFgUVVk6Vm36iiqWOEbM78nGAgAAViEA=
Date: Fri, 7 Feb 2025 16:17:47 +0000
Message-ID:
 <BYAPR12MB3205BBBA409669D9721673E5D5F12@BYAPR12MB3205.namprd12.prod.outlook.com>
References:
 <BYAPR12MB32059CFEB36A5FC7D859B69FD5F72@BYAPR12MB3205.namprd12.prod.outlook.com>
 <Z6YfqcOx5FACtvae@kernel.org>
In-Reply-To: <Z6YfqcOx5FACtvae@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3205:EE_|SJ2PR12MB9007:EE_
x-ms-office365-filtering-correlation-id: 249120e3-30dc-4d23-faba-08dd4792f5e2
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8060799006|12121999004|19110799003|15080799006|461199028|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mk5lME9KeEdncG9YQk9zdCtKTkhNS1Rna1NyWEthTmk0dTJIOFhsMnFXbnlv?=
 =?utf-8?B?bmg2MGFkSElIbld5cHhSc2tUN0U0b1JNUG1ZSWdaMmlwaSs1Vll1RkhZekxQ?=
 =?utf-8?B?VTJiR1lPeGV0UWtEaU5zeXdtTkhxK0RqU1JMSUtOOEdlc21EWm03cXFZTHVy?=
 =?utf-8?B?YzVFZnBDZXRJUWo4TnFxNGdsMFdBWUpFMXg5c1pncVRzK3lTejljcnRHWnFv?=
 =?utf-8?B?eDBuK05WcjlKUXVrWlBzVjJSVHNYLy9pU0t1OForNUNEUUpSTVl2MjVQeVJy?=
 =?utf-8?B?K1NCdldTTFd5aS9vRk40T0NwSU13LzBnTmhQMEY1NDZaVStxVGlTNW1OM0Nm?=
 =?utf-8?B?QVF2Rlg1N05YOFRFR1hkKzRxOGdjSHdZaUFuTDcwbm1mYVZtMEJmS0tBMzdK?=
 =?utf-8?B?Q0YrZWppYjhZYzJkOS8yYm5Rb3V5S2F2RUZDdVd1ZTJQSkR2a0lhK0g0V3hV?=
 =?utf-8?B?ZGNmWXI1RkdGL2w0K3BPU2E4Z0tZUXdVbkYyZ05JM3pOTnNyMFlmTVdRcUtT?=
 =?utf-8?B?TVZrVHYrRnpUQXRPNWZZVGtBQ0dzeTFYb28yMVRoQndIc3ppdWQ2c3RlSlU0?=
 =?utf-8?B?aTM3OHRNYmhmU0hNKzZWdGV6WVFVSzZJVEQxK3J6S2RVKzlVRnpXLzZPRUY5?=
 =?utf-8?B?cStIMnpubVU1VTJ1U2FPMGhFMTJnUXhHcG9VeTRnK3ZmTlRGcVBoWVJaS2xo?=
 =?utf-8?B?NE82QndxQklPZHJGQ0hBZEovMlZ6THVGRndrK3U2enhPeVJFMFhpcmQvbVRU?=
 =?utf-8?B?RjBuL0pkcmFJRC9OSjY4SnpFdXBpcHZLZzRpcTZ6WDdXY2pjQXZUQVo0MHd1?=
 =?utf-8?B?WmVBYlp4Yk1XN2ZiTFJDbDc3Ny95ZVpGbnd3Y0JLWlBxMFlFd0VvTnpLNkZ0?=
 =?utf-8?B?cEdYa0RYTjRUTHdaRitPOCswTDNYNFFKMkNhRnVqbDlTV3J6QkEySUJkcXdR?=
 =?utf-8?B?UVM0QVdJdGFuZTdUVS90VnFjTC9lcXpXSlRzMWp4aGpIY0Z5elpZam5ER3Ey?=
 =?utf-8?B?SGd0RHNtdlBuUi9LYTRCbVV2b3JCbWRzUWNMRThoNlZzYlZVQm5GbGRXakRL?=
 =?utf-8?B?alFtdnlRQUNQRUpCRGhhU1ZzWWNiVlZLQ0FhdEx5clhQVU00NktyUWxORjVn?=
 =?utf-8?B?dmF2WFEzYzVXejlZbzZVdmJNTEptdjk4bnB0c3VZTHpsR2lLeWkvM2lueGxN?=
 =?utf-8?B?akZBZXErZTJTa3Z3V01Cb0tycEp6ZnBmdDQyZE1abWVzNEY2UHB1Z0tydXJP?=
 =?utf-8?B?ZCtXVHdGU3B3WG00MUlqL1RNNCszYk5jdTRYMUwzWFdYNGpJNXYrNGZwMU14?=
 =?utf-8?B?STlPYkFpOWRORW5QZ3lCUFkwcnlZWmluMFdrYkQ5MVR5R1JWRUhyTE9xTzRU?=
 =?utf-8?B?NEZTa3NCVCthZmQ5MzE0bTkrUFN2ekQ3OWcyOVBtZDZGdm4xN0k0TUxROXda?=
 =?utf-8?B?L08rZHhLa1ZCVnRqd2NhSlM2TWVUM2g3aEY3MkpIMUdmMkIyUGxCWlRzaWFH?=
 =?utf-8?Q?bPuTrE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3dYeTQ2aTFMdUZoUlA0WTZaeldmeHlxdFZnWE1vbjkrdGtoSmxldEcxWUpY?=
 =?utf-8?B?MDQyUFJ1QUxrRTBNM3h3aVNUbEpTWGlneHk4bnNxQ3NxbzNyejdaZ2xNUzFx?=
 =?utf-8?B?blVERE4ycDNKRjhXQnEzTHozakN5M0tQT0wzaWZMaFhtU2VKMUkxd0wrTExT?=
 =?utf-8?B?d29paUlLODdKZXprUW43MVRJVk81YmhSZFhLTkdCSmQxUEsyb0lRUDUzSG8y?=
 =?utf-8?B?cUxINGR2Q0k0KzlHWGZQYVBDbEhtODNTeVR6NC9MTWxVY1hMdWVTTzlTbFRk?=
 =?utf-8?B?MzJyTlMvRW1hV2NGODVSMXhrR29iaHBId3RqdCtJeGNwcEJqV0VlaVlMdFNH?=
 =?utf-8?B?R3F6ZWo1MDQyQkQybEF3b2hUc3RTWGR6SGprQzB4S1FRT1o1Y0lETnVwMS9z?=
 =?utf-8?B?dTlJLzhsT0J2em4xbUM5KytoUTRRSVNLQzNUYnpCWkJTY3F1RHc2NkYyeFBs?=
 =?utf-8?B?cGQ4UnZsMDFQSHBzM0hzRUNGcjlSMzM3amZRR0Q0K3N2UXZuODUyemYxRzRm?=
 =?utf-8?B?aFhaa3VxZmlsTkNudGlwd2haRXNDQ0pjTW14UmNkQTA3elhHd3cxU0VsVCtm?=
 =?utf-8?B?bkNDaytvcVZyVXkrVzdwVFVlNUVkOEV3Z0xoaHA1WmJKeDhFeVQ2RkJMU3JH?=
 =?utf-8?B?aGN5VXZLU0hCRFMzUUI5Q1QzZjBBdldiVVQ3Wkx2bSttNDJFNWxOcnVyNXUx?=
 =?utf-8?B?ZEs5RWFsUTI1aHVsSHNuRzhsa3luMnNuenNsaTlscUMvOUtibTRPOWRLRXkz?=
 =?utf-8?B?amFTZkJOMEhJbnhLVVF5ZlhsSHVHOUltVzRzZmJtRGFvTEtBUGN0QmhJTnk0?=
 =?utf-8?B?MUg4WXNhRHVyMjA2S3pSSEErUGhicmRMdk5BSG5wbXJxcXo3SkxWbVBlb2FE?=
 =?utf-8?B?Z00ySU5PeEpFWS9pbUxYcDI2U0k2VjU3VEJjSzR5blhHcys4YitBMFM0UGI0?=
 =?utf-8?B?eHpBOUxPc2M2bUtwUDA2YUhrTWQ0QzBlSTJoUUJMOU9IcXN3eTkzWVlyY2J3?=
 =?utf-8?B?bmU1ckhkTlZNWW1qZHVJanNnbWZjMnUvT3FUREwrWGVIZ1JDY1psRDJQanE1?=
 =?utf-8?B?TzJncjkzdGQ5NWJWOU92clNyaW42clJxTUVaTFVFY3EydUMzQ3lEd2d0aTEy?=
 =?utf-8?B?NUN2Qk9zV0ZwaHoyWmRjeUtkdFRvUXRHOTg0djNROHZWM1JadXR3VTN1RGRZ?=
 =?utf-8?B?MnJPNG9qTHgvdVhlKzJabGxIUWJoUFE1Skx5VmxFOUpPSS9EWi96QzBBOCtT?=
 =?utf-8?B?VjNFTktrdld4SUVJSzl4SG1zdStUY1pKdDNWM3ZLNzVWZnNHN1E5T3JMYk5N?=
 =?utf-8?B?elJZQWwzcjhqc3FGTnU0RWhhNDNhdjA0d1RsZnphZHB5OVlpcjJWRFpLQ1Bp?=
 =?utf-8?B?bFRMZzhMRXRDSXM3eUs4V2tSVHpZb3lBOFA2bTIvcHVtRnNPMjdRZXhLUHBG?=
 =?utf-8?B?ZzJCVHUrU0kxcnBXZGFnQ3QwNS84dERncWxvWWNsdFFoSVkySU56Qzh3TUYy?=
 =?utf-8?B?bGI2ejFhc0hscFVGc2VRUDdwTG9SODB1UWJNaEJvR0pGTUx0Y05xaUNqWmF5?=
 =?utf-8?B?d0FydkRFMC9JdkFPWncyZkIyTXVvREFrNmNic09LcFU1RTFiL2dPRCtEN000?=
 =?utf-8?B?Mk11bEFGMlBuQ09vVWJua3Q2M1pFbzhvOThFZHA5ZmtoT2ovdmdnOGJLZ1FG?=
 =?utf-8?Q?cHaLYVTeWJi9Y3SglIYP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 249120e3-30dc-4d23-faba-08dd4792f5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 16:17:47.2417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007

SGkgTWlrZSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIGFuZCBpbnNpZ2h0cy4gSSBm
dWxseSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybnMgcmVnYXJkaW5nIHRoZSBmcmFnaWxpdHkgb2Yg
dGhlIGNvZGUgaW4gYG1lbWJsb2NrX2FkZF9yYW5nZSgpYCBhbmQgdGhlIGNoYWxsZW5nZXMgaW4g
aGFuZGxpbmcgZWRnZSBjYXNlcy4gSSBhbHNvIGFja25vd2xlZGdlIHlvdXIgcG9pbnQgdGhhdCB3
aGlsZSB0aGUgQ1BVIGN5Y2xlIHJlZHVjdGlvbnMgYXJlIG1lYXN1cmFibGUsIHRoZXkgbWF5IG5v
dCBmdWxseSBjYXB0dXJlIHRoZSBtb3N0IGltcG9ydGFudCBmYWN0b3Ig4oCUIHRoZSBib290IHRp
bWUgc3BlZWR1cC4NCg0KUmVnYXJkaW5nIHRoZSBwZXJmb3JtYW5jZSBtZXRyaWNzLCBJIHdhbnQg
dG8gY2xhcmlmeSB0aGF0IHRoZSBtYWluIGdvYWwgb2YgbXkgb3B0aW1pemF0aW9uIHdhcyB0byBp
bXByb3ZlIHRoZSBib290IHRpbWUgZHVyaW5nIHRoZSBlYXJseSBzdGFnZXMgb2Yga2VybmVsIGlu
aXRpYWxpemF0aW9uLiBXaGlsZSByZWR1Y2luZyB0aGUgQ1BVIGN5Y2xlcyBmb3IgYG1lbWJsb2Nr
X2FkZF9yYW5nZSgpYCBpcyBhIHBvc2l0aXZlIG91dGNvbWUsIHRoZSByZWFsIGJlbmVmaXQgaXMg
aW4gcmVkdWNpbmcga2VybmVsIGluaXRpYWxpemF0aW9uIHRpbWUsIHBhcnRpY3VsYXJseSBiZWZv
cmUgdGhlIGJ1ZGR5IHN5c3RlbSB0YWtlcyBvdmVyLiBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgQ1BV
IGN5Y2xlIHJlZHVjdGlvbiBhbG9uZSBkb2Vzbid0IGFkZHJlc3MgdGhlIGNyaXRpY2FsIHF1ZXN0
aW9uIG9mIGJvb3QgdGltZSBzcGVlZHVwLCBhbmQgSSB3aWxsIHdvcmsgb24gbWVhc3VyaW5nIHRo
aXMgbW9yZSBkaXJlY3RseS4NCg0KVG8gYWRkcmVzcyB0aGUgY29uY2VybiBhYm91dCByZWFsIGhh
cmR3YXJlIGFuZCBjb3JuZXIgY2FzZXMsIEkgcGxhbiB0byBjb25kdWN0IGZ1cnRoZXIgdGVzdGlu
ZyBvbiBhY3R1YWwgaGFyZHdhcmUgd2l0aCBkaWZmZXJlbnQgbWVtb3J5IGNvbmZpZ3VyYXRpb25z
IHRvIGVuc3VyZSB0aGUgcm9idXN0bmVzcyBvZiB0aGUgcGF0Y2guIFRoaXMgd2lsbCBoZWxwIGVu
c3VyZSB0aGUgc3RhYmlsaXR5IGFuZCBwZXJmb3JtYW5jZSBiZW5lZml0cyBhcmUgY29uc2lzdGVu
dCBhY3Jvc3MgdmFyaW91cyBzZXR1cHMuDQoNCkkgYWxzbyBwbGFuIHRvIGluY3JlYXNlIHRoZSB0
ZXN0aW5nIGNvdmVyYWdlIGZvciBlZGdlIGNhc2VzIGFuZCBpbmNsdWRlIG1vcmUgcm9idXN0IGZh
bGxiYWNrIG1lY2hhbmlzbXMgdG8gYWRkcmVzcyB0aGUgcG90ZW50aWFsIGZyYWdpbGl0eSBtZW50
aW9uZWQuIEkgd2FudCB0byBtYWtlIHN1cmUgdGhlIGNoYW5nZXMgaGFuZGxlIGFsbCBwb3NzaWJs
ZSBzY2VuYXJpb3MgZ3JhY2VmdWxseS4NCg0KSW4gYWRkaXRpb24sIEkgd2lsbCBmb2N1cyBvbiBt
ZWFzdXJpbmcgYm9vdCB0aW1lIG1vcmUgZGlyZWN0bHkgdXNpbmcgdG9vbHMgbGlrZSBgYm9vdGNo
YXJ0YCBhbmQgc2hhcmUgdGhlIHJlc3VsdHMsIGNvbXBhcmluZyB0aGUgYm9vdCB0aW1lcyBiZWZv
cmUgYW5kIGFmdGVyIHRoZSBvcHRpbWl6YXRpb24gdG8gZGVtb25zdHJhdGUgdGhlIGFjdHVhbCBp
bXBhY3Qgb24gc3RhcnR1cCBwZXJmb3JtYW5jZS4NCg0KR2l2ZW4gdGhlIGNvbmNlcm5zIHJhaXNl
ZCwgSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgeW91ciBndWlkYW5jZSBvbiB3aGV0aGVyIHlv
dSB0aGluayBpdCdzIHdvcnRod2hpbGUgZm9yIG1lIHRvIGNvbnRpbnVlIHdpdGggdGhpcyBhcHBy
b2FjaC4gU2hvdWxkIEkgcHJvY2VlZCB3aXRoIGZ1cnRoZXIgcmVmaW5lbWVudHMgYW5kIHRlc3Rp
bmcsIG9yIHdvdWxkIHlvdSByZWNvbW1lbmQgYSBkaWZmZXJlbnQgZGlyZWN0aW9uIGZvciBvcHRp
bWl6YXRpb24/IFlvdXIgaW5wdXQgd2lsbCBiZSBpbnZhbHVhYmxlIGluIGVuc3VyaW5nIHRoaXMg
cGF0Y2ggbWVldHMgYm90aCBwZXJmb3JtYW5jZSBhbmQgc3RhYmlsaXR5IGdvYWxzLg0KDQpUaGFu
ayB5b3UgYWdhaW4gZm9yIHlvdXIgY2FyZWZ1bCByZXZpZXcsIGFuZCBJIGxvb2sgZm9yd2FyZCB0
byB5b3VyIHRob3VnaHRzLg0KDQpCZXN0IHJlZ2FyZHMsICANClN0ZXBoZW4NCg0KLS0tLS3pgq7k
u7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+
IA0K5Y+R6YCB5pe26Ze0OiAyMDI15bm0MuaciDfml6UgMjI6NTkNCuaUtuS7tuS6ujogU3RlcGhl
biBFdGEgWmhvdSA8c3RlcGhlbi5ldGEuemhvdUBvdXRsb29rLmNvbT4NCuaKhOmAgTogYWtwbUBs
aW51eC1mb3VuZGF0aW9uLm9yZzsgbGludXgtbW1Aa3ZhY2sub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQrkuLvpopg6IFJlOiBbUEFUQ0hdIG1tOiBvcHRpbWl6ZSBtZW1ibG9ja19h
ZGRfcmFuZ2UoKSBmb3IgaW1wcm92ZWQgcGVyZm9ybWFuY2UNCg0KSGkgU3RlcGhlbiwNCg0KT24g
V2VkLCBGZWIgMDUsIDIwMjUgYXQgMDU6NTU6NTBBTSArMDAwMCwgU3RlcGhlbiBFdGEgWmhvdSB3
cm90ZToNCj4gSGkgTWlrZSBSYXBvcG9ydOOAgUFuZHJldyBNb3J0b24NCg0KPiBJIGhhdmUgcmVj
ZW50bHkgYmVlbiByZXNlYXJjaGluZyB0aGUgbW0gc3Vic3lzdGVtIG9mIHRoZSBMaW51eCBrZXJu
ZWwsIA0KPiBhbmQgSSBjYW1lIGFjcm9zcyB0aGUgbWVtYmxvY2tfYWRkX3JhbmdlIGZ1bmN0aW9u
LCB3aGljaCBwaXF1ZWQgbXkgDQo+IGludGVyZXN0LiBJIGZvdW5kIHRoZSBpbXBsZW1lbnRhdGlv
biBhcHByb2FjaCBxdWl0ZSBpbnRlcmVzdGluZywgc28gSSANCj4gYW5hbHl6ZWQgaXQgYW5kIGlk
ZW50aWZpZWQgc29tZSBhcmVhcyBmb3Igb3B0aW1pemF0aW9uLiBTdGFydGluZyB3aXRoIA0KPiB0
aGlzIHBhcnQgb2YgdGhlIGNvZGU6DQo+DQo+IGlmICh0eXBlLT5jbnQgKiAyICsgMSA8PSB0eXBl
LT5tYXgpDQo+IOKAguKAguKAguKAguKAguKAgmluc2VydCA9IHRydWU7DQo+IFRoZSBpZGVhIGhl
cmUgaXMgZ29vZCwgYnV0IGl0IGhhcyBhIGNlcnRhaW4gZmxhdy4gVGhlIGNvbmRpdGlvbiBpcyAN
Cj4gcmF0aGVyIHJlc3RyaWN0aXZlLCBhbmQgaXQgY2Fubm90IGJlIGV4ZWN1dGVkIGluaXRpYWxs
eS4gTW9yZW92ZXIsIGl0IA0KPiBpcyBvbmx5IHZhbGlkIHdoZW4gdGhlIHJlbWFpbmluZyBzcGFj
ZSBpcyAoMi8xKSArIDEuIElmIHRoZXJlIGlzIA0KPiBlbm91Z2ggbWVtb3J5LCBidXQgaXQgZG9l
cyBub3Qgc2F0aXNmeSAoMi8xKSArIDEsIHRoZSBpbnNlcnRpb24gDQo+IG9wZXJhdGlvbiBzdGls
bCBuZWVkcyB0byBiZSBwZXJmb3JtZWQgdHdpY2UuDQoNClRoZSBjb2RlIGluIG1lbWJsb2NrX2Fk
ZF9yYW5nZSgpIGlzIHZlcnkgZnJhZ2lsZSwgYW5kIG1hbnkgYXR0ZW1wdHMgdG8gcmVtb3ZlIHRo
ZSBzZWNvbmQgcGFzcyB0aGF0IGxvb2tlZCBjb3JyZWN0IGF0IHRoZSBmaXJzdCBnbGFuY2UgZmFp
bGVkIGZvciBzb21lIGNvcm5lciBjYXNlLg0KDQpVbmZvcnR1bmF0ZWx5LCBpdCdzIGltcG9zc2li
bGUgdG8gY2FwdHVyZSBhbGwgcG9zc2libGUgbWVtb3J5IGNvbmZpZ3VyYXRpb25zIGFuZCByZXNl
cnZhdGlvbnMgaW4gdGhlIG1lbWJsb2NrIHRlc3Qgc3VpdGUsIHNvIGV2ZW4gaXQgaXQgcGFzc2Vz
LCB0aGVyZSBpcyBhIGNoYW5jZSB0aGUga2VybmVsIHdpbGwgZmFpbCB0byBib290IG9uIGFuIGFj
dHVhbCBIVy4NCiANCj4gLSBCZWZvcmUgdGhlIHBhdGNoOg0KPiAgIC0gQXZlcmFnZTogMS4yMiUN
Cj4gICAtIE1heDogMS42MyUsIE1pbjogMC45MyUNCj4gDQo+IC0gQWZ0ZXIgdGhlIHBhdGNoOg0K
PiAgIC0gQXZlcmFnZTogMC42OSUNCj4gICAtIE1heDogMC45NCUsIE1pbjogMC41MCUNCj4gDQoN
ClRoZXNlIG51bWJlcnMgZG8gbm90IHJlcHJlc2VudCB3aGF0J3MgYWN0dWFsbHkgaW50ZXJlc3Rp
bmc6IHRoZSBib290IHRpbWUgc3BlZWR1cC4NCg0KLS0NClNpbmNlcmVseSB5b3VycywNCk1pa2Uu
DQo=

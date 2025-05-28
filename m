Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B2242D7E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416299; cv=fail; b=Ezt29AL712kypg5h2ZSwEouPM1ZfGtRsnY6HCXpNgONj+Qo6ZkDW+46v9UBI+OuLhxs8zi7gBsW4ECmF7JUPX06OPRyPyP8JnpcM8hMmEVoa9JEUFYgVAaTCPUgJHa9nJmzuNM7let8rYNu67SAwHE22A8bNSUWWhM6mvZ9HhOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416299; c=relaxed/simple;
	bh=WP2bed6KYhDQM4Gwj5U8y2Vuscv4EwD2xZpPlSeTXVw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bfV21qb5HJkpRDFAO0Pk2fZ+sW/Rplv1sHNFUhRxx7EZsEdE+ty6TPpcJhkpj72KbQzTVdwPNKx3L69nDrBbRRNJSz8ZZFwZhIUMKMmHOl6x7zUsO5R68jdoHWGzrURUAvICE9aG5jw/Iy/cqErnmqhtd+DpIIVD5ly4KUmyM7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/dV9mN2XNBkMP0sb0kGFB7YASIV3aRQm3DV8R1qNuFNM3wa4Z2fcMvBMDsQrYn0BMr0EBMcIUC6tpJVkHONMAD35vkF2IebvnmXNUcXup8OhXmZ643ANr1hJBXWN8kbjLZNfhwBijMJNckOJnhTl4YqbrbPtEBbZm3WuTaM/yRsZka1XV5MzrTEaQDy0eM5u/w7enFsaeEPchmak/gz3sPvd4smM3Vo0sfDBOAY5cPVo319Ju3AT4qliV9/ve2g5dQTBusumun2phQvEg90gjOzVUWbUHlN2rb/50kNf/BM0vScaNCcCHNgqAeVSVK15JHygoFI+iHc4CSOs/JCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP2bed6KYhDQM4Gwj5U8y2Vuscv4EwD2xZpPlSeTXVw=;
 b=HvBYCDv2ZpCjOHhtUt58dKtk0v8faFIX9Yzono/djX+Y1DVJ5wi7W0wXlpZPZ/6s/xtpjIjg3Tr77S+i2nb/H2+6k3cL4IJ1Fb0KbjnVW07aV5EXaU+wKsPYW8awY1pH1VYG/BBak5zUFS3ukXsBnnIu04J6dPw0aTFz6g2zDMVe31Yp5cJSp768wK5EbLlcF3sQCWs0AjJwyxJN918J7zUvvjxqfQU0mDZ2DXeBumjR8OEGG/Nn0bc6nh+1tH5rlZ+LPUX1zrY60mFp+nNeBeZGMCs/lwHKi/Lwbjf5rhdrQ212oqpqH1PId7lqzadpYS70ZQgkXHZp818ZcJItQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:10::10) by NT0PR01MB1006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 05:38:37 +0000
Received: from NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
 ([fe80::f92e:ed2b:961a:ffca]) by
 NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn ([fe80::f92e:ed2b:961a:ffca%4])
 with mapi id 15.20.8769.025; Wed, 28 May 2025 05:38:37 +0000
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Andrey Konovalov
	<andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Catalin Marinas
	<catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/9] kasan: RISC-V support for KASAN_SW_TAGS using
 pointer masking
Thread-Topic: [PATCH v2 0/9] kasan: RISC-V support for KASAN_SW_TAGS using
 pointer masking
Thread-Index: AQHbz5LCggCRyeDhFUyVwdwWhSEppQ==
Date: Wed, 28 May 2025 05:38:37 +0000
Message-ID: <46458788-54e1-4b4e-b7ef-852d9fb09ca6@starfivetech.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1182:EE_|NT0PR01MB1006:EE_
x-ms-office365-filtering-correlation-id: 9957ff34-53f5-4b73-4ecf-08dd9da9e550
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|41320700013|7416014|38070700018;
x-microsoft-antispam-message-info:
 Xc3KyDUF/tpXGwQVYwbX9utWh6W1HksN6qW51B02Yj/8Fp5nakSLLd5G4+bA20CN13m1POe0bmDgZ2zr9+XKft5yuWyfef2PN/foLOY6t5H7OrPlEYdEO8s6F5juldP+QXKf0EChJ32L6ND1MY6BfN0CkrGKQ1wUWdpxKLPFowWpjI7iZ9u6IWi9F7QRVHVzpthHx5nO9afTZ5dZqHHB0VFL6Jn2gd2mYz47RGGf3JCXBCTrXrCms+CRhYuTAXvqXlChsk3lsc9HQ6pL9nVGoCO/2jZUi/evf+9QuJmL+YJU31O4KBCrRWHxC4JzZFXmZc3w8o7d15joj0ZBOGrmwvLWBYVl8qMhiqBRyhlZGJuVX4ZzFIl2RBJT60lftvkmM/5j8vcP5geeKvUAofm5kFFg4Z/g3t/ul6k8K99T+xPGb7B8Hccvr7mGLDU5aoRQJr3ftrcAq4bKt150VhzRtKLYra7CL4uyp55r/xDeY71JFeA9fB6m5lGEvr635rmZ63OqQ2h6UBDX9KSQXmuZ7WuSSJ/iehUzF0eeCnzjUzVxtSF8OED3Zjl0EtWSsi8Sarw2jcYSB4Uw2SAMtLIBZw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qm9sMUZvMldmZkNXOGJ0N2pXVXcyMy83N3BBZTRITmUwUlZqZVdXaUJ2RzBp?=
 =?utf-8?B?WDNUclMwMVd3TC8wa1Nja0k1UFIzbXkyRWVybzIzUFBLSmx3ekxpT0I0VUcw?=
 =?utf-8?B?d3hHNW1UMUo4eGRRQlJyYXdHWWNJOEdJOXhvODZBeXVNeDZIZFEzRW92VVRU?=
 =?utf-8?B?UUVBOWlCQ05HSDBheUM1K1pvZVNCc2Vhd25Nb2xwaGVZdGU4QzRVcFVjbXVC?=
 =?utf-8?B?S1hWNGFyd3ZiWmVyNlQrZ3ByYk51SVBDa0VoQ3VheVZRak9BZ3psWVJFc200?=
 =?utf-8?B?Q24zT3Mvc2QvL3diWUdQWW9ocDhicVpDeTI1dTFzbWdTY0k1WVF5aDF1YjZ3?=
 =?utf-8?B?cUNJQXVFMlhaVmtjMThRT3VnYVh3OHU4NURPR29TbGcreDY1SU1IR2V4VnJS?=
 =?utf-8?B?d0o1TVFkaXd5OFRlZWEvS0l5OEpUZnVrbEpqRWRMYnlLOHRBZWZuZUl4SVli?=
 =?utf-8?B?dXkzc2Nqb1dHbUdVeDBmWUN6OVRTTjJXZVBzbmxxZ1FSQzhDRnhFNE41Szdw?=
 =?utf-8?B?TXNVTjJVYmZzaUtvUlg0MlhLUFphVU50dWl4TWJSWHc2Uk5Tb0dxV2cwRjRH?=
 =?utf-8?B?NzIvRG9KTEh3cnBHd3pXWHByY2JjQmtBaVE4YXN0WHZjWGIyWTZQbkMxSnVi?=
 =?utf-8?B?RHdGRSs2QW1mdDhMYlZVR2grM3NIeER2ZGlBSGFQVy9qLzRzR2hHWFJIVmc5?=
 =?utf-8?B?OWNzMVpzSTZqcXVmazFvbG5xY3hxTlVMODFtY2JCZ3hQRlp3Y1NiMG9JVW9Z?=
 =?utf-8?B?R2xIQmhBS2F5Wit2T0ZNSFZQUVBMK0dBcHZ2M25qRnkwSEhldkh1a3E0SXRV?=
 =?utf-8?B?dG9VdlNDOUg4U2picHlKZmxuY09BSDE5a2ttNTB3dFh5bHNqUjZIUmRRemE1?=
 =?utf-8?B?cjdLZStKelduYnlVZi9WTjMzNlJ6VzdpT1pISVFjUjZ6MEtrRjB2aDhaK2xw?=
 =?utf-8?B?d1VNM2s3eGtFby80QWdyM29paUxwNFg3d0RabVMvUlpsREI2aEVmY3pCZlFn?=
 =?utf-8?B?SjM3Q0JxZGRhMHdTZlpYK0VYUlgzaG5vYytXU0Z4OXdyaFhGN1hESyt2aG9U?=
 =?utf-8?B?R2V6cDdrK1RxWFd6QVQ2SDB2S0w3M0lRR1h5TDA3MzZRT295VXFXM0lKblh4?=
 =?utf-8?B?UThyQ21RclYwRGJOMTRrWktIWDR1NlZ4cVY1dnBtOEZjV01QSExKQzdERHpC?=
 =?utf-8?B?aGpIcUVtMG1IOURtNFR0MTlaWXZKclc5VWZwQnlNLzZhVVJabWsvc1g3NWQ4?=
 =?utf-8?B?ZDNCYzRmUmp5UTNLaGVjVU5WSWR6RUVtMmtTUmZxSHRmL0dRa2RRcGZ6NXBy?=
 =?utf-8?B?MHNERzU1eGhyRisrU0VaQks4YUVNZjRCa3ZtQnF6cHpPQmMyaTRCbGczZzd1?=
 =?utf-8?B?VHJQTFhHTTlRRDZmeVgybFZRd0ExcGFPeUtLaCtRT1J1OUt2OVRNTWpVTHhP?=
 =?utf-8?B?N0pzU1J5MVdLNm9iTk1HYTMrclJhZ1R6SG81dDBYYytoSWxZU1JnanU5UHpq?=
 =?utf-8?B?Z3gzWGZNNnUvZGVtVW9VUFdUK1dzNlBML0dQT0FFc2pMWGF2RkRaSFlLdXFZ?=
 =?utf-8?B?Zmp5N1FEeHZ2WFVOMHBacTRHM05sQktESysrK2sxNlVLSFJ3TWg3UTk2Q05k?=
 =?utf-8?B?WFdaMjJ5ampnR0tQTk92dkhZc3FNbFEwZDZLK3l2STlUUi9UMTVnL1VsMEpV?=
 =?utf-8?B?cEY5bkR0eURhSHJDSzFHMzZLQUcybWhpTDNhVU1HbVJWWHFyL05PSmE2VG1D?=
 =?utf-8?B?RGJxZmFZTTdUdytkT2ZBdTRlN2dIdkIrcWxrL0xXY21Eb0NtYmdYNE1XcXRq?=
 =?utf-8?B?YmdkcmJXaUtqZEVpWDNUcnhndDl1amE5bnlyRzZYRmc5c3gvN1ZYOWs2R3g4?=
 =?utf-8?B?LzJvL2kxNVlzakhxanhBZk9ZaDRNalVZVUZ5NWN6ZjhXUEh1MiszY1VJc1NK?=
 =?utf-8?B?TC9TRitxamhRR083TFdNR094V04xVTJ6dVFYdGFVRCtsSUMyajZlTnU0Mi9q?=
 =?utf-8?B?bEJuQTlLNndvRGdjVDkvU09sM1RITmg5U0M4c1NiQ010aHdHVE1nYnpsWEZk?=
 =?utf-8?B?ZC9lK2h6eFFzUnBiczVSOW9POVYzdXJOSkJZY3NLK3pQVC9WZCtPM0ZzajM3?=
 =?utf-8?Q?GpaxMWjuPba/J7wAlAsG6nRft?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <574075A7DDAB034190582EC40F87D767@CHNPR01.prod.partner.outlook.cn>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9957ff34-53f5-4b73-4ecf-08dd9da9e550
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 05:38:37.8514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtPkQxX8YtA2y1vlaU7nlBs7kcORqwOpJo56CIZ9ViIXM7daOKrk5XN/ruAN6js0OqY0auEOx/ket3hZstydjYonafBGUV8TT5kI9jz6Fko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1006

T24gMjIvMTAvMjAyNCA5OjU3IGFtLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToNCj4gVGhpcyBzZXJp
ZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBzb2Z0d2FyZSB0YWctYmFzZWQgS0FTQU4gdXNpbmcg
dGhlDQo+IFJJU0MtViBwb2ludGVyIG1hc2tpbmcgZXh0ZW5zaW9uWzFdLCB3aGljaCBzdXBwb3J0
cyA3IGFuZC9vciAxNi1iaXQNCj4gdGFncy4gVGhpcyBpbXBsZW1lbnRhdGlvbiB1c2VzIDctYml0
IHRhZ3MsIHNvIGl0IGlzIGNvbXBhdGlibGUgd2l0aA0KPiBlaXRoZXIgaGFyZHdhcmUgbW9kZS4g
UGF0Y2ggNCBhZGRzIHN1cHBvcnRzIGZvciBLQVNBTl9TV19UQUdTIHdpdGggdGFnDQo+IHdpZHRo
cyBvdGhlciB0aGFuIDggYml0cy4NCj4gDQo+IFBvaW50ZXIgbWFza2luZyBpcyBhbiBvcHRpb25h
bCBJU0EgZXh0ZW5zaW9uLCBhbmQgaXQgbXVzdCBiZSBlbmFibGVkDQo+IHVzaW5nIGFuIFNCSSBj
YWxsIHRvIGZpcm13YXJlIG9uIGVhY2ggQ1BVLiBJZiB0aGUgU0JJIGNhbGwgZmFpbHMgb24gdGhl
DQo+IGJvb3QgQ1BVLCBLQVNBTiBpcyBnbG9iYWxseSBkaXNhYmxlZC4gUGF0Y2ggMiBhZGRzIHN1
cHBvcnQgZm9yIGJvb3QtdGltZQ0KPiBkaXNhYmxpbmcgb2YgS0FTQU5fU1dfVEFHUywgYW5kIHBh
dGNoIDMgYWRkcyBzdXBwb3J0IGZvciBydW50aW1lIGNvbnRyb2wNCj4gb2Ygc3RhY2sgdGFnZ2lu
Zy4NCj4gDQo+IFBhdGNoIDEgaXMgYW4gb3B0aW1pemF0aW9uIHRoYXQgY291bGQgYmUgYXBwbGll
ZCBzZXBhcmF0ZWx5LiBJdCBpcw0KPiBpbmNsdWRlZCBoZXJlIGJlY2F1c2UgaXQgYWZmZWN0cyB0
aGUgc2VsZWN0aW9uIG9mIEtBU0FOX1NIQURPV19PRkZTRVQuDQo+IA0KPiBUaGlzIGltcGxlbWVu
dGF0aW9uIGN1cnJlbnRseSBwYXNzZXMgdGhlIEtBU0FOIEtVbml0IHRlc3Qgc3VpdGU6DQo+IA0K
PiAgICMga2FzYW46IHBhc3M6NjQgZmFpbDowIHNraXA6OSB0b3RhbDo3Mw0KPiAgICMgVG90YWxz
OiBwYXNzOjY0IGZhaWw6MCBza2lwOjkgdG90YWw6NzMNCj4gICBvayAxIGthc2FuDQo+IA0KPiBP
bmUgd29ya2Fyb3VuZCBpcyByZXF1aXJlZCB0byBwYXNzIHRoZSB2bWFsbG9jX3BlcmNwdSB0ZXN0
LiBJIGhhdmUgdG8NCj4gc2hyaW5rIHRoZSBpbml0aWFsIHBlcmNwdSBhcmVhIHRvIGZvcmNlIHRo
ZSB1c2Ugb2YgYSBLQVNBTi10YWdnZWQgcGVyY3B1DQo+IGFyZWEgaW4gdGhlIHRlc3QgKGRlcGVu
ZGluZyBvbiAuY29uZmlnLCB0aGlzIHdvcmthcm91bmQgaXMgYWxzbyBuZWVkZWQNCj4gb24gYXJt
NjQgd2l0aG91dCB0aGlzIHNlcmllcyBhcHBsaWVkLCBzbyBpdCBpcyBub3QgYSBuZXcgaXNzdWUp
Og0KPiANCj4gbWFza2luZywgdGhlIGtlcm5lbCBzdGlsbCBib290cyBzdWNjZXNzZnVsbHk6DQo+
IA0KPiAgIGthc2FuOiB0ZXN0OiBDYW4ndCBydW4gS0FTQU4gdGVzdHMgd2l0aCBLQVNBTiBkaXNh
YmxlZA0KPiAgICAgICAjIGthc2FuOiAgICAgIyBmYWlsZWQgdG8gaW5pdGlhbGl6ZSAoLTEpDQo+
ICAgbm90IG9rIDEga2FzYW4NCj4gDQo+IFRoaXMgc2VyaWVzIGNhbiBiZSB0ZXN0ZWQgYnkgYXBw
bHlpbmcgcGF0Y2ggc2VyaWVzIHRvIExMVk1bMl0gYW5kDQo+IFFFTVVbM10sIGFuZCB1c2luZyB0
aGUgbWFzdGVyIGJyYW5jaCBvZiBPcGVuU0JJWzRdLg0KPiANCj4gWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24vcmF3L2Q3MDAxMWRkZTZjMi96anBtLXNwZWMu
cGRmDQo+IFsyXTogaHR0cHM6Ly9naXRodWIuY29tL1NpRml2ZUhvbGxhbmQvbGx2bS1wcm9qZWN0
L2NvbW1pdHMvdXAvcmlzY3Y2NC1rZXJuZWwtaHdhc2FuDQo+IFszXTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvcWVtdS1kZXZlbC8yMDI0MDUxMTEwMTA1My4xODc1NTk2LTEtbWVAZGVsaXZlcnNt
b25rZXkuc3BhY2UvDQo+IFs0XTogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNy
Yy9vcGVuc2JpL2NvbW1pdC8xY2IyMzRiMWM5ZWQNCj4gDQoNCkhpIFNhbXVlbCwNCg0KSSBub3Rp
Y2VkIHZlY3RvciBpbnN0cnVjdGlvbnMgZmFpbGluZyB3aXRoIHN3IHRhZy1iYXNlZCBrYXNhbiBl
bmFibGVkLg0KRS5nLiBydW5uaW5nIHRoZSBydnZfbWVtY3B5IGV4YW1wbGUgZnJvbQ0KaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcnZ2LWludHJpbnNpYy1kb2MvdHJlZS9tYWluDQoN
CkVycm9yIGxvZzoNCiMgLi9ydnZfbWVtY3B5LmVsZg0KWyAgMzU0LjE0NTYzM10gVW5hYmxlIHRv
IGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIGZmN2FjMDAw
MDEwNzg0MTANClsgIDM1NC4xNDYzMzRdIE9vcHMgWyM2XQ0KWyAgMzU0LjE0NjUxMV0gTW9kdWxl
cyBsaW5rZWQgaW46DQpbICAzNTQuMTQ2NzkxXSBDUFU6IDIgVUlEOiAwIFBJRDogMTM0IENvbW06
IHJ2dl9tZW1jcHkuZWxmIFRhaW50ZWQ6IEcgICAgICBEICAgICAgICAgICAgNi4xMi4xOS0wMDAy
My1nNmVjMjNmNDUwMTE4LWRpcnR5ICMyMDANClsgIDM1NC4xNDc3NzFdIFRhaW50ZWQ6IFtEXT1E
SUUNClsgIDM1NC4xNDgzNTBdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkN
ClsgIDM1NC4xNDg4ODhdIGVwYyA6IGFyY2hfZXhpdF90b191c2VyX21vZGVfcHJlcGFyZSsweDMy
LzB4ODANClsgIDM1NC4xNDkzMzRdICByYSA6IGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKzB4
MWUvMHg5YQ0KWyAgMzU0LjE0OTY1OV0gZXBjIDogZmZmZmZmZmY4MDFiODgzNiByYSA6IGZmZmZm
ZmZmODIxM2RiOGMgc3AgOiBmZjIwMDAwMDAwN2I3ZTkwDQpbICAzNTQuMTUwMTczXSAgZ3AgOiBm
ZmZmZmZmZjgyYzJiYmM4IHRwIDogOTU2MDAwMDA4MGM1NjYwMCB0MCA6IDAwMDAwMDAwMDAwMDAw
MDENClsgIDM1NC4xNTA3MDldICB0MSA6IGZlZjAwMDEwMDAwMDAwMDAgdDIgOiA5NTYwMDAwMDgw
YzU2NjAwIHMwIDogZmYyMDAwMDAwMDdiN2VhMA0KWyAgMzU0LjE1MTA4Ml0gIHMxIDogZmYyMDAw
MDAwMDdiN2VlMCBhMCA6IGZmMjAwMDAwMDA3YjdlZTAgYTEgOiA5NTYwMDAwMDgwYzU2ZGZmDQpb
ICAzNTQuMTUxNjU4XSAgYTIgOiBiZDYwMDAwMDgzYzIwODAwIGEzIDogMDAwMDAwMDAwMDAwMDYw
MCBhNCA6IDAwMDAwMDAwMDAwMDAxMDANClsgIDM1NC4xNTMyMTJdICBhNSA6IGZmZjVmZmZmMDgw
YzU2NjEgYTYgOiBmZmY2MDAwMDA4MGM1NjYwIGE3IDogZmZmNWZmZmYwODBjNTY2MA0KWyAgMzU0
LjE1NDY2OF0gIHMyIDogMDAwMDAwMDAwMDAwMDAwMSBzMyA6IDAwMDAwMDAwYzIyMDI2ZjMgczQg
OiAwMDAwMDAwMDAwMDAwMDAyDQpbICAzNTQuMTU4MzI3XSAgczUgOiAwMDAwN2ZmZmFhYzYyM2Uw
IHM2IDogMDAwMDU1NTU1ZWVjNmRlMCBzNyA6IDAwMDA3ZmZmYWFjOGZjYjANClsgIDM1NC4xNTk0
ODFdICBzOCA6IDAwMDA3ZmZmYWFjOTAwMDggczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDogMDAw
MDU1NTU4NDRiMWJkNA0KWyAgMzU0LjE2MjY3M10gIHMxMTogMDAwMDU1NTU4NDRiMWI0OCB0MyA6
IDAwMDAwMDAwMDAwMDAwNGEgdDQgOiA0MDhhMDNjM2NhYzNhNzg4DQpbICAzNTQuMTY0Mzc4XSAg
dDUgOiA0MDY1OWI2YTM5NjNmNmQ0IHQ2IDogNDA4M2U5YzYwYzU1NzM4Yw0KWyAgMzU0LjE2NTEx
N10gc3RhdHVzOiA4MDAwMDAwMjAwMDAwNzAwIGJhZGFkZHI6IGZmN2FjMDAwMDEwNzg0MTAgY2F1
c2U6IDAwMDAwMDAwMDAwMDAwMGQNClsgIDM1NC4xNjYxMzddIFs8ZmZmZmZmZmY4MDFiODgzNj5d
IGFyY2hfZXhpdF90b191c2VyX21vZGVfcHJlcGFyZSsweDMyLzB4ODANClsgIDM1NC4xNjcyMDFd
IFs8ZmZmZmZmZmY4MjEzZGI4Yz5dIGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKzB4MWUvMHg5
YQ0KWyAgMzU0LjE2OTExOV0gWzxmZmZmZmZmZjgyMTNkNGNjPl0gZG9fdHJhcF9pbnNuX2lsbGVn
YWwrMHg1YS8weDkyDQpbICAzNTQuMTcxOTg5XSBbPGZmZmZmZmZmODIxNTZiZjg+XSBoYW5kbGVf
ZXhjZXB0aW9uKzB4MTQ4LzB4MTU2DQpbICAzNTQuMTc0MDU2XSBDb2RlOiAwNTkzIDdmZjIgYjYw
MyA0NjE1IDA2OTMgNjAwMCBhMDczIDEwMDYgNzc1NyAwYzMwICgwMDA3KSAwMjA2DQpbICAzNTQu
MTc1NTI0XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NClsgIDM1NC4xNzcz
NDRdIG5vdGU6IHJ2dl9tZW1jcHkuZWxmWzEzNF0gZXhpdGVkIHdpdGggaXJxcyBkaXNhYmxlZA0K
U2VnbWVudGF0aW9uIGZhdWx0DQoNClRoYW5rcw0KSmlhIEppZQ0KDQo=

Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2090.outbound.protection.partner.outlook.cn [139.219.17.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36B2030A;
	Fri,  7 Feb 2025 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897289; cv=fail; b=uk4pAGQ6tYDbqnNXtM+f+lNb7B/hDBv1ZuWTwsMGkR6Ma1LoI/dbpcYvM+wnBtdgLdzkj88fBOVYPgbl4+xIvTG1oiQOChlyiWoUZDCWM9gOVWG6L6ouzjI53pr/yyn0eFt4OTkRmkJ8jZKLtCsh75TIchaVurWmtKW8Gbsmu64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897289; c=relaxed/simple;
	bh=oW80PWPNsUNd4mu/R/c/0yRSnsguOqDYPJHfxYSzBRM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DqdFg5AuB7GQ2CWEr0KRl39CQzZr/nwSs9Q5qTu3qeW9ZeadCkS/d43kRNT1z8jr7vdJfxf2DNaCn5OG9KmbrC55fsvoVn7VPYaGSLHY8O0lRuHULcuwPDRYETCL5PFN+9Rtj9YzremrW/yoNiztQlYzrWEh0mdFmRqSHEudRxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2Nb5C+eHShkmMfnqLPnWPdeFbcim5ICoWIdhWdmyek/gdMvZA0UVMNFYTEIFmbxEYsFH+ZSlsQcQbRxRi56Dtgs1/Wn7FG9OgvYhVCaHfbvxhmeDjtBZ0JMGPuOsUg2Q24MNCf4fTgevnNH3gUzJTlMEu0fBqW/kiziGQIbWZ/sQR4iVawQUVJ/s0z3yUPtgIvFsJHR2gG/q2+koHkes1FkThCYhgdOnsU59Ea/4y7RZCijR2bdqC3Aqy6H58SCmPKBWuJtY6RJkBSit5pPfyIeXZ46GzsYNEVWH70m3dViS9Es2X6TusXjtL1rnn2Iono/Y7SJ94RK5/DN2y2RPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW80PWPNsUNd4mu/R/c/0yRSnsguOqDYPJHfxYSzBRM=;
 b=WRAOJpxwZc3P9ASYT7au0E9OE7mchXeqML0aitXJdR+e+Nq2ITsoWXxPqu80CJ+gkJI+v7ThK4fVBOsn8ga0rjCt3cM5BquJg1xjYs15GLmxZY0C4lUlj2e1sO5424wewsWJAoiovA5i1OEDGnn7m//RHxqfKi+xlzWvVvd0ve9BVU10WU8fgtgnkZRlLx6LYuowvfV3Mtu7TBgoBmeNrn0IG8uPR/lgEU1bY21FI5PWRpmsbchweQjTJNIZ8RN7ULPshgp0UFOp7exPUM1m6+64ws5hFb9KNaCDJn+uwI/u5t2PPNuKepzOuNi+n5ZMUcD42u/UMYAeRQS5EPIgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1146.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.14; Fri, 7 Feb
 2025 03:01:14 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%3]) with mapi id 15.20.8398.013; Fri, 7 Feb 2025
 03:01:13 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Hal Feng <hal.feng@linux.starfivetech.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: RE: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Thread-Topic: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Thread-Index: AQHbeEMnbyeQsjyaYki9HE0eCHXWhLM6IOAAgAD+3BA=
Date: Fri, 7 Feb 2025 03:01:13 +0000
Message-ID:
 <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
 <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
In-Reply-To: <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1146:EE_
x-ms-office365-filtering-correlation-id: 3aef0727-3724-450f-9f88-08dd4723aecd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 i1f+H47Ov0kwralNFtbczrOGyZZfr4G4YyDgb3aIL9/m3jiaI1VSUnHD/RSwYA0B5PRswTwKx5dfg0Jm02PVlAtedF+JuT4P/Y2NfsTNKH5wRlZLtjpRMr85CrNLEtqHjA7NLhBFZIUZuz02o0pGt4RXM6yaTmulil2TMuM68cr0a8xqpBVlw8pAz/nxr+T6zjGBvL2Xo/BB4p3xpZ+EoqeXt1Yxki5r3pfUqKWt8ritunqX94VV6+3M4HQOFkDbbnsNf7u6UAexhVQnnH5kgM048z/nD5+2DkreojHGxcvZPGf7NsrR83CEJ610pz9ZchOvxZ/avobVaBec481wq1olJ7bjgPr16tuP66iN6DkIKWnZrKA9RikmkDPAZF+kekYeN3RafofR9G51MwuFyhWwM4mSK+VWKegqrR3fHGC8r8xEY8xe8j23MUFVXijUGY7EmBxbNUfX20T9cW+TDSqTBKk6umTrZZWsE4A5TK7lTl5CYchQRwF3BQKnRsVoXhoHp7De8UIrb+5TxiBKeejLIpX4t1JnY7TW3b7lCJ1ZeTfVzQ+cmQPwEpVn5EDoxFlqxt+2EmJdzxM051sHcEyymdEqqkIZAEiYGdu/CyE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXZtUnQzaWhjTkYyQ0dOME5HKzR2Y3lFWWxJeTlGMSt1dExGTGJjbHdSbEE3?=
 =?utf-8?B?dGhDRE9KK2dub3U4cmg3aDI1QUhQRi9rQjdtL2kvMDJXZE03cmR6WTI2WHF1?=
 =?utf-8?B?eUZ2MmlEVGlTcEJIcjZtM0duZmV3MUhmcEdwUjFRNWpkYWVDcXY0c1hML3Rq?=
 =?utf-8?B?OU1xVWJReUlIWXdzdGl4T2JncnpXVFRYL1VhVzFmM0ljUEY0NWdKVDA0S3d2?=
 =?utf-8?B?OUoyd2wyRWFrZnh4UFdqYW9helY4Q29jM2FpZjZ6cHBYZXlGdnRzdGkrSFVL?=
 =?utf-8?B?eUIzWkJDQmdKS3FxTWdJblRBQUtreXMva3BXdFJYZW8xV0RQSHZoSnJ4Ym1o?=
 =?utf-8?B?L1VQWktJU2htUU42ejNFR0gxeS8wb2VjM3czOVlaRkNPTjlkV1FZK21wb09B?=
 =?utf-8?B?NkZibTd3MTgvcXJvYWxLcERoMlJad2tOZWd4dmZwSno3cHg0M2k5dDhnODFM?=
 =?utf-8?B?VGhPRnlhVTQvZTV1K3J6TXRBUzFvUFFDZlBIV0QzdEE5LzBGVnFrTmxVK0dU?=
 =?utf-8?B?OG9RZEVBcmpWRXMrYy94SVNpQUkzOVBIMU9RdGdUSFM3OTFLSzJCN3NzN1kv?=
 =?utf-8?B?MkxQeThRdE9tbEZvWUZFaG5NcU5Ddk9MOWsyMzRMK0F5UlgrT3lNUUZZZzhw?=
 =?utf-8?B?T2lLUmdNT1Z0emFhdG5WL09RK2hFd3VkcEp3QjFYZmlIYWFBZHVNTHAwMHUw?=
 =?utf-8?B?eHRxRHptS1lZYVFuVGo0UC9yRFB6TWlWNGd3K29aZndmdmliQmhsTm9RME5Q?=
 =?utf-8?B?UnpwVjgvRzd0NEUvQThWWUw5L0JSUm10cGFLM3BPYVJhRllLc3ZJL3pTU0hP?=
 =?utf-8?B?WlljZEI3ampQTkxpcFh2M25aZ0ovVnUrVW4vbW9xS0xHelcvMDB6M2hhNjBa?=
 =?utf-8?B?VUJwcGt2TElPZXJycnVVR09yQ0wwaWMrUGZUK001Q01kb3NUUW1xb3pwR3Rh?=
 =?utf-8?B?VjJhV3hHL1NwY2g2bXJQRGdlaHQwUkpUQmlCaEtxbUxnTjBmS0l6WjIrRmRU?=
 =?utf-8?B?K2lRMTJ5ZjdLTmNkVjB3bjhEY2g4MHdEUHZsT1dyempKUUxSOUJHV2ltTEQ4?=
 =?utf-8?B?Q1Z5aENhQzcxTlUwN1JGY28vVVpOK0JOSVJIbit2dlZHc3VtcUNsSUFZRXF6?=
 =?utf-8?B?NVB1ZkRNNFdtZDBYcUEvRndQV1VoSmRmZnpGczdVbzBwSmQ1d0FIbit4Z2Rv?=
 =?utf-8?B?Qm04V3Z0QnhreXFlMXRzeStNd05SYnlLRE5ZdmxROEo4dk9uU0hXVlF1bzJY?=
 =?utf-8?B?NkF4emNyZ2ZaNjhLLytEM3VILzVITGpnVUJqWWpsVjM3c2lsWlh5VnFRN3cv?=
 =?utf-8?B?UllpZktBajNSUnlmak1KL2hzNVRjV2tDd0hOVFF2Y3ZEWklmeWF0Si93OEdO?=
 =?utf-8?B?NDIycGJMUnFva0dvb2dkMVBLeDQzNk5VejM1UUhabTJSQ0l0RWw2NEE2MHIz?=
 =?utf-8?B?cENnZ2JJR3FJbXpiR3c2dENkV29QdGxsbjNndHFlWnpIOU1DSm1LWG1wWUJE?=
 =?utf-8?B?NjBtSlVmVFY2WFBUQk5FeTVTWEVFRUlqVWhlNGtlTzZnbkZxc2EvYlE1aVpz?=
 =?utf-8?B?VFJla2tZekpCYUNKb2hHNVFjM0RLZTBHeWNUOHpvMkc1ZGlUMXdkVkczRS9j?=
 =?utf-8?B?M3RyVkFnVTdrMmYxTmZ1czI1RVBjR1VxbVRBWlFlWDhja2daWjAyN3BYOGds?=
 =?utf-8?B?aHM1VTh6QS9vdlcxdWU0K3d5cEpDOHFjZmkyclBnRm9xQmlFWEZ5UEJOSitG?=
 =?utf-8?B?eWJhQXUxK1NndDlWUGNpc3ZuNVVJczZMQVJvT1VpYk52YzQ5M0lOa2pzdklh?=
 =?utf-8?B?T05HazdIZ0ZnbWltbTRUVXc1SndVL0xJRXo2RjdNK3k1LzZWT3I4aDJPdTF2?=
 =?utf-8?B?TlVtNzVLeDYvOFU1SlphYUllYk9BSTMySUVqNklkeTJsSWhaOHVOdGpFTlo4?=
 =?utf-8?B?cDNobG43MDAzcEZiT0thZzFhclBsZmwvek9MZnVKWTVIQzVaN25uWkdIUmQv?=
 =?utf-8?B?bGN0dDRSZ2NqWUQxbEdJYmJFcVczWi83VUo4NDBtNlA1OE52RlZvbEtPOUdq?=
 =?utf-8?B?RjNaRCs5RzdEVjRER2VtaWs1KzdpS1pPbGhKSUJ1bW1BUHlEbW5XeDRMWWl2?=
 =?utf-8?Q?G5uhfXKL5RnQpw+ab+WDbCZTI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aef0727-3724-450f-9f88-08dd4723aecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 03:01:13.8342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0MCjlU/Zfp0DHjpDjQg8rdTAEFlDl2brfUh06r98OXRlDkiwdUnXYyxQAgbSvZZ66u6VtMNsgMxg3uNKFkAB5Az9nvPK7FND/t6vUEEb0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1146

PiBPbiAwNi4wMi4yNSAxOToxNywgRSBTaGF0dG93IHdyb3RlOg0KPiBPbiAyLzUvMjUgMTg6NTks
IEhhbCBGZW5nIHdyb3RlOg0KPiA+IE9uIDIvNS8yMDI1IDY6MDEgUE0sIEhlaW5yaWNoIFNjaHVj
aGFyZHQgd3JvdGU6DQo+ID4+IE9uIDIvNS8yNSAwODo1NywgSGFsIEZlbmcgd3JvdGU6DQo+ID4+
PiBPbiAyLzMvMjAyNSA5OjM3IEFNLCBFIFNoYXR0b3cgd3JvdGU6DQo+ID4+Pj4gQWRkIGJvb3Rw
aC1wcmUtcmFtIGhpbnRpbmcgdG8gamg3MTEwLWNvbW1vbi5kdHNpOg0KPiA+Pj4+IMKgwqAgLSBp
MmM1X3BpbnMgYW5kIGkyYy1waW5zIHN1Ym5vZGUgZm9yIGNvbm5lY3Rpb24gdG8gZWVwcm9tDQo+
ID4+Pj4gwqDCoCAtIGVlcHJvbSBub2RlDQo+ID4+Pj4gwqDCoCAtIHFzcGkgZmxhc2ggY29uZmln
dXJhdGlvbiBzdWJub2RlDQo+ID4+Pj4gwqDCoCAtIG1lbW9yeSBub2RlDQo+ID4+Pj4gwqDCoCAt
IHVhcnQwIGZvciBzZXJpYWwgY29uc29sZQ0KPiA+Pj4+DQo+ID4+Pj4gwqDCoCBXaXRoIHRoaXMg
dGhlIFUtQm9vdCBTUEwgc2Vjb25kYXJ5IHByb2dyYW0gbG9hZGVyIG1heSBkcm9wIHN1Y2gNCj4g
Pj4+PiDCoMKgIG92ZXJyaWRlcyB3aGVuIHVzaW5nIGR0LXJlYmFzaW5nIHdpdGggSkg3MTEwIE9G
X1VQU1RSRUFNIGJvYXJkDQo+IHRhcmdldHMuDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5
OiBFIFNoYXR0b3cgPGVAZnJlZXNoZWxsLmRlPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+IMKgIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpIHwgNiArKysrKysNCj4g
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4+Pj4NCj4gPj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0
c2kNCj4gPj4+PiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5k
dHNpDQo+ID4+Pj4gaW5kZXggMzBjNWYzNDg3YzhiLi5jOWU3YWU1OWVlN2MgMTAwNjQ0DQo+ID4+
Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kN
Cj4gPj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24u
ZHRzaQ0KPiA+Pj4+IEBAIC0yOCw2ICsyOCw3IEBAIGNob3NlbiB7DQo+ID4+Pj4gwqDCoMKgwqDC
oCBtZW1vcnlANDAwMDAwMDAgew0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlw
ZSA9ICJtZW1vcnkiOw0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4NDAw
MDAwMDAgMHgxIDB4MD47DQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFtOw0K
PiA+Pj4+IMKgwqDCoMKgwqAgfTsNCj4gPj4+PiDCoCDCoMKgwqDCoMKgIGdwaW8tcmVzdGFydCB7
DQo+ID4+Pj4gQEAgLTI0Nyw2ICsyNDgsNyBAQCBlbW1jX3ZkZDogYWxkbzQgew0KPiA+Pj4+IMKg
wqDCoMKgwqAgfTsNCj4gPj4+PiDCoCDCoMKgwqDCoMKgIGVlcHJvbUA1MCB7DQo+ID4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFtOw0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBj
b21wYXRpYmxlID0gImF0bWVsLDI0YzA0IjsNCj4gPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gPDB4NTA+Ow0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlc2l6ZSA9IDwxNj47DQo+
ID4+Pj4gQEAgLTMyMyw2ICszMjUsNyBAQCAmcXNwaSB7DQo+ID4+Pj4gwqDCoMKgwqDCoCBub3Jf
Zmxhc2g6IGZsYXNoQDAgew0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
ImplZGVjLHNwaS1ub3IiOw0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47DQo+
ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFtOw0KPiA+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBjZG5zLHJlYWQtZGVsYXkgPSA8Mj47DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEwMDAwMDAwMD47DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGNkbnMsdHNoc2wtbnMgPSA8MT47DQo+ID4+Pj4gQEAgLTQwNSw2ICs0MDgsNyBAQCBHUE9F
Tl9TWVNfSTJDMl9EQVRBLA0KPiA+Pj4+IMKgwqDCoMKgwqAgfTsNCj4gPj4+PiDCoCDCoMKgwqDC
oMKgIGkyYzVfcGluczogaTJjNS0wIHsNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqAgYm9vdHBoLXBy
ZS1yYW07DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGkyYy1waW5zIHsNCj4gPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8R1BJT01VWCgxOSwgR1BPVVRfTE9XLA0K
PiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBHUE9FTl9TWVNfSTJDNV9DTEssIEBAIC00MTMsNiArNDE3LDcgQEANCj4gPj4+PiBHUElf
U1lTX0kyQzVfQ0xLKT4sDQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQT0VOX1NZU19JMkM1X0RBVEEsDQo+ID4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQSV9TWVNf
STJDNV9EQVRBKT47DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNh
YmxlOyAvKiBleHRlcm5hbCBwdWxsLXVwICovDQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYm9vdHBoLXByZS1yYW07DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5w
dXQtZW5hYmxlOw0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlucHV0LXNjaG1p
dHQtZW5hYmxlOw0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPiA+Pj4+IEBAIC02NDEs
NiArNjQ2LDcgQEAgR1BPRU5fRElTQUJMRSwNCj4gPj4+PiDCoCB9Ow0KPiA+Pj4+IMKgIMKgICZ1
YXJ0MCB7DQo+ID4+Pj4gK8KgwqDCoCBib290cGgtcHJlLXJhbTsNCj4gPj4+PiDCoMKgwqDCoMKg
IGNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47DQo+ID4+Pj4gwqDCoMKgwqDCoCBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPiA+Pj4+IMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZ1YXJ0
MF9waW5zPjsNCj4gPj4+DQo+ID4+PiBXaGF0IGFib3V0ICZtbWMwLCAmbW1jMSwgJnFzcGksICZz
eXNncGlvLCAmbW1jMF9waW5zLA0KPiAmbW1jMV9waW5zLCAmaTJjNT8NCj4gPj4+IFdoeSBub3Qg
YWRkICJib290cGgtcHJlLXJhbTsiIGZvciB0aGVtPw0KPiA+Pg0KPiA+PiBXb3VsZCB0aGV5IGJl
IG5lZWRlZCBiZWZvcmUgcmVsb2NhdGlvbiBvZiBVLUJvb3QgdG8gRFJBTT8NCj4gPg0KPiA+IFll
YWgsIHRoZXkgYXJlIG5lZWRlZCBieSBTUEwgYW5kIHRoZXkgYXJlIHNldCBpbiBVLUJvb3QNCj4g
PiBhcmNoL3Jpc2N2L2R0cy9qaDcxMTAtY29tbW9uLXUtYm9vdC5kdHNpLg0KPiA+DQo+ID4gQmVz
dCByZWdhcmRzLA0KPiA+IEhhbA0KPiA+DQo+IA0KPiBXaGVuIEkgdGVzdGVkIG9uIFN0YXI2NCB0
aGVyZSB3YXMgbm9uZSBvZiB0aG9zZSBuZWVkZWQgdG8gYm9vdC4gV2UgY2FuIGFkZA0KPiBtb3Jl
IGJvb3RwaC1wcmUtcmFtIGFzIG5lZWRlZCBidXQgSSB3YW50IHRvIGtub3cgaG93IHRvIHRlc3Qg
KGJlY2F1c2UgSQ0KPiBkaWQgbm90IHNlZSBhbnkgbmVlZCBmb3IgdGhlc2UpLg0KPiANCj4gSG93
IGRvIHlvdSB0ZXN0IHRoYXQgdGhlc2UgYXJlIG5lZWRlZD8NCg0KSW4gbXkgb3BpbmlvbiwgU1BM
IG5lZWQgdG8gcmVhZCBVLUJvb3QgZnJvbSBFTU1DIChtbWMwKSBvciBTRGNhcmQgKG1tYzEpIG9y
DQpRU1BJIGZsYXNoIChxc3BpKS4gQWxzbyBpdCBuZWVkIHRvIGNob29zZSB0aGUgY29ycmVjdCBE
VEIgYnkgcmVhZGluZyBFRVBST00NCm1vdW50ZWQgb24gaTJjNS4gVG8gcnVuIG1tYyAvIGkyYyBk
cml2ZXJzLCB0aGUgcGluIGNvbmZpZ3VyYXRpb25zIChzeXNncGlvLCBtbWMwLzFfcGlucykNCmFy
ZSBhbHNvIG5lZWRlZC4NCg0KQmVzdCByZWdhcmRzLA0KSGFsDQo=

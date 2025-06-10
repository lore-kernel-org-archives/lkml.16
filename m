Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCFD235355;
	Tue, 10 Jun 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567816; cv=none; b=Nj4tghxfEK9j+rrLj4rstNla5EBLbvsZI2YnRy4q3w9vr+0too7vJULvMXi8goWPSVuPCoZqXvPZYNUAXQRF0Vgp1yXoIhyc9j6MAmFm40M2HPveOxh7fcAtG5/nkqqK9EiWqcqDJk21HfSj91vWVAVAlyPUjlxNakfNvljyle0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567816; c=relaxed/simple;
	bh=PTMdhk67xc7XKkOuFv//TWr5oxho4kXHuNSuGFjH+xE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F7C7RTumPeTJExmIYIqgMNu6WmRAWQrvsZal/XofyVTT9AB/gdC3apGv9QB7Bem6NGGA3XnUGmeKQz7VEaSWckOgdUYzxj9WczPnaQrjmVfz00po28VEssBfZesKf889UpThLnIGR8Q/Oh75CWoUtOVTKgZahit0J6ttUD+6E9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:03:25 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 10 Jun 2025 17:03:25 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Shawn Guo <shawnguo2@yeah.net>
CC: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Topic: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Index: AQHb2Uk8r5zPXewyY0SsDNZZa8wLobP7lMcAgADIvwA=
Date: Tue, 10 Jun 2025 15:03:24 +0000
Message-ID: <8b48c88f-4d70-403a-b1a5-bb80643086ed@actia.se>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain> <aEeg1s9A0F8x0U2+@dragon>
In-Reply-To: <aEeg1s9A0F8x0U2+@dragon>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453627660
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A91E4C4EE6A4C4B8F9753C8D81719A4@actia.se>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgU2hhd24sDQoNCk9uIDYvMTAvMjUgNTowNCBBTSwgU2hhd24gR3VvIHdyb3RlOg0KPiBIaSBK
b2huLA0KPiANCj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDI6MTc6MzBQTSArMDAwMCwgSm9o
biBFcm5iZXJnIHdyb3RlOg0KPiANCj4gPHNuaXA+DQo+IA0KPj4gV2UgcHJvYmFibHkgcmFuIGlu
dG8gdGhlIHNhbWUgcHJvYmxlbSB0cnlpbmcgdG8gYnJpbmcgb25ib2FyZCA2LjEyLCBnb2luZw0K
Pj4gZnJvbSA2LjEsIG9uIGlNWDhRWFAuIEkgbWFuYWdlZCB0byB0cmFjZSB0aGUgaGFuZyB0byBF
UCBwcmltaW5nIHRocm91Z2ggYQ0KPj4gY29tYmluYXRpb24gb2YgZGVidWcgdHJhY2luZyBhbmQg
QlVHX09OIGV4cGVyaW1lbnRzLiBTZWUgaWYgaXQgc3RhcnRzDQo+PiBzcGxhdGluIHdpdGggdGhl
IGJlbG93IGNoYW5nZS4NCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0t
LS0tDQo+Pg0KPj4gIEZyb20gMDkyNTk5YWI2ZjllMjA0MTJhN2NhMWViMTE4ZGQyYmU4MGNkMThm
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206IEpvaG4gRXJuYmVyZyA8am9obi5l
cm5iZXJnQGFjdGlhLnNlPg0KPj4gRGF0ZTogTW9uLCA1IE1heSAyMDI1IDA5OjA5OjAxICswMjAw
DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIFVTQjogY2k6IGdhZGdldDogUGFuaWMgaWYgcHJpbWluZyB3
aGVuIGdhZGdldCBvZmYNCj4+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy91c2IvY2hpcGlkZWEvdWRj
LmMgfCA0ICsrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYyBi
L2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+PiBpbmRleCAyZmVhMjYzYTVlMzAuLjU0NGFh
NGZhMmQxZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+PiAr
KysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4gQEAgLTIwMyw4ICsyMDMsMTAgQEAg
c3RhdGljIGludCBod19lcF9wcmltZShzdHJ1Y3QgY2lfaGRyYyAqY2ksIGludCBudW0sIGludCBk
aXIsIGludCBpc19jdHJsKQ0KPj4NCj4+ICAgICAgaHdfd3JpdGUoY2ksIE9QX0VORFBUUFJJTUUs
IH4wLCBCSVQobikpOw0KPj4NCj4+IC0gICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQUklN
RSwgQklUKG4pKSkNCj4+ICsgICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQUklNRSwgQklU
KG4pKSkgew0KPj4gICAgICAgICAgY3B1X3JlbGF4KCk7DQo+PiArICAgICAgIEJVR19PTihkaXIg
PT0gVFggJiYgIWh3X3JlYWQoY2ksIE9QX0VORFBUQ1RSTCArIG51bSwgRU5EUFRDVFJMX1RYRSkp
Ow0KPj4gKyAgIH0NCj4+ICAgICAgaWYgKGlzX2N0cmwgJiYgZGlyID09IFJYICYmIGh3X3JlYWQo
Y2ksIE9QX0VORFBUU0VUVVBTVEFULCBCSVQobnVtKSkpDQo+PiAgICAgICAgICByZXR1cm4gLUVB
R0FJTjsNCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0K
PiBIbW0sIEkganVzdCB0ZXN0ZWQgdGhlIGNoYW5nZSBvbiBpLk1YOE1NIGJ1dCBkaWRuJ3Qgc2Vl
IHRoZSBzcGxhdHRpbmcuDQo+IE1heWJlIHdlIGFyZSBydW5uaW5nIGludG8gYSBzbGlnaHRseSBk
aWZmZXJlbnQgcHJvYmxlbXM/DQo+IA0KPiBTaGF3bg0KPiANCg0KUGVyaGFwcyB0aGUgaGFuZ2lu
ZyBwb2ludCBpcyBkaWZmZXJlbnQgaW4gaS5NWDhNTSwgSSB1bmZvcnR1bmF0ZWx5IGRvIA0Kbm90
IGhhdmUgYW55IGJvYXJkcyB3aXRoIHRoYXQgU29DIG9uIHRoZW0uIFdoZW4gSSB0cmFja2VkIGRv
d24gdGhlIA0KcHJvYmxlbSBvbiBRWFAgSSB0aHJldyBzaW1pbGFyIEJVR19PTiBzdGF0ZW1lbnRz
IGluIG1vc3Qgd2hpbGUgbG9vcHMuDQoNCkJ1dCBzaW5jZSBhIGZpeCBpcyB2ZXJ5IGxpa2VseSBp
ZGVudGlmaWVkIGFscmVhZHkgYnkgeW91IEknbSBub3Qgc3VyZSBpbiANCnRoZSB2YWx1ZSBvZiBm
aW5kaW5nIHRoZSBleGFjdCBzcG90Lg0KDQpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJn

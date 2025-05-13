Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCC1D6DB4;
	Tue, 13 May 2025 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747106010; cv=none; b=r2G5LkEwxyFNHPq1Bu8RR9lEb9j++F4C9QfxIq5wVb0womyFC0PQ8aadOBRqYAcsOtuMrbSpRhcs03HviwTCoIby7SgCevHW1Q9D8Vid4D1tBfNH3TCveLRERAhwYFrK4OUkwdqo9h0In/Jb/ZT3198Mjmv2Q5tcuxPg9XiGu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747106010; c=relaxed/simple;
	bh=Q8W8qfwh8NxnjZiNXhyA9RyEchXuGPe2F2HUcz7ww6k=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gTLA5qSuGPgp6JzC6ISj/aFMMJAYBRc7Lk65pr7K9xYIX2C1bjGGPbwtO5tj6jvhk5uQjP/dUD3l9FMzEYo5gvk3zU1RYhyYi7qj4JJ5i0cBfTgJTb5B1WIGu2YCK77qjFfrXyh72Q8FR1lTxw2W7yleMHSh67Wtq6KEQ7pSFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZxM1w2McHz1R7lv;
	Tue, 13 May 2025 11:11:16 +0800 (CST)
Received: from kwepemg200006.china.huawei.com (unknown [7.202.181.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D1D92140142;
	Tue, 13 May 2025 11:13:24 +0800 (CST)
Received: from dggpemf500008.china.huawei.com (7.185.36.156) by
 kwepemg200006.china.huawei.com (7.202.181.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 11:13:24 +0800
Received: from dggpemf500008.china.huawei.com ([7.185.36.156]) by
 dggpemf500008.china.huawei.com ([7.185.36.156]) with mapi id 15.02.1544.011;
 Tue, 13 May 2025 11:13:24 +0800
From: Zhangxiquan <zhangxiquan@hisilicon.com>
To: "will@kernel.org" <will@kernel.org>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "maz@kernel.org" <maz@kernel.org>,
	Zhengbingyang <zhengbingyang@hisilicon.com>, "Zhangyu(curtain,Babbage)"
	<zhangyu550@huawei.com>, "wangkai (CF)" <wangkai113@huawei.com>
Subject: ReSent in case the last mail not arrived//////Re: [PATCH]
 Documentation (arm64):Advanced SIMD and floating point support condition
Thread-Topic: ReSent in case the last mail not arrived//////Re: [PATCH]
 Documentation (arm64):Advanced SIMD and floating point support condition
Thread-Index: AdvDtPi9Mm+WJIeIS/WYPsp7WKkbFw==
Date: Tue, 13 May 2025 03:13:24 +0000
Message-ID: <c544a845dc334f30afcb98f7c34e2f7c@hisilicon.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgV2lsbCwNCg0KVGhhbmtzIGZvciBmZWVkYmFjayAhDQoNCkFmdGVyIHJlY2VpdmVkIHlvdXIg
ZW1haWwsIHdlIGRpc2N1c3MgdGhlIHNpdHVhdGlvbiAsIGFuZCBhbGlnbiB0aGUgc3RvcnkgYXMg
Og0KDQpUbyB0ZXN0IHRoZSBoYXJkd2FyZSwgd2UgcmFuZG9tbHkgY29uZmlndXJlZCB0aGUgcmVn
aXN0ZXIgYmVmb3JlIGVudGVyaW5nIExpbnV4LiANCk9uZSBvZiAgb3VyICB0ZXN0IGNhc2VzIGlz
IHRvIHNldCBlMmggdG8gMSBhbmQgc3RhcnQgTGludXggd2l0aCBlbDEuIA0KTGF0ZXIsIGl0IGlz
IGZvdW5kIHRoYXQgdGhpcyB0ZXN0IHNjZW5hcmlvIGlzIG5vdCBhIHR5cGljYWwgYXBwbGljYXRp
b24uIA0KDQpUaGVyZWZvcmUsIHdlIGRlY2lkZWQgOg0Kd2Ugd2l0aGRyYXcgdGhpcyBwYXRjaCBh
cHBsaWNhdGlvbiAsIGl0IGRvZXMgbm90IG5lZWQgdG8gYmUgc3VibWl0dGVkLiANCg0KVGhhbmsg
eW91IGZvciB5b3VyIHJlcGx5IGFnYWluIKOhDQoNCll1LVpoYW5nIA0KDQotLS0tLdPKvP7Urbz+
LS0tLS0NCreivP7IyzogV2lsbCBEZWFjb24gW21haWx0bzp3aWxsQGtlcm5lbC5vcmddDQq3osvN
yrG85DogMjAyNcTqNNTCMjnI1SAyMToxMQ0KytW8/sjLOiBaaGFuZ3hpcXVhbiA8emhhbmd4aXF1
YW5AaGlzaWxpY29uLmNvbT4NCrOty806IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOyBjb3JiZXRA
bHduLm5ldDsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1kb2NA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBtYXpAa2VybmVs
Lm9yZw0K1vfM4jogUmU6IFtQQVRDSF0gRG9jdW1lbnRhdGlvbiAoYXJtNjQpOkFkdmFuY2VkIFNJ
TUQgYW5kIGZsb2F0aW5nIHBvaW50IHN1cHBvcnQgY29uZGl0aW9uDQoNCk9uIFR1ZSwgQXByIDA4
LCAyMDI1IGF0IDExOjEzOjA5QU0gKzA4MDAsIFhpcXVhbiBaaGFuZyB3cm90ZToNCj4gRnJvbTog
emhhbmd5dSA8emhhbmd5dTU1MEBodWF3ZWkuY29tPg0KPiANCj4gQmVjYXVzZSB0aGUga2VybmVs
IGNvZGUgY2Fubm90IGJlIHN0YXJ0ZWQgZnJvbSBlbDEgYWNjb3JkaW5nIHRvIHRoZSANCj4gYm9v
dGluZy5yc3QuDQo+IEl0IGlzIGZvdW5kIHRoYXQgQ1BUUl9FTDIuRlBFTiBpcyBub3QgY29uZmln
dXJlZC4NCj4gQWZ0ZXIgdGhlIGNvbmZpZ3VyYXRpb24sIHRoZSBwcm9ibGVtIGlzIHNvbHZlZC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IHpoYW5neXUgPHpoYW5neXU1NTBAaHVhd2VpLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogemhhbmd4aXF1YW4gPHpoYW5neGlxdWFuQGhpc2lsaWNvbi5jb20+DQo+
IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9hcmNoL2FybTY0L2Jvb3RpbmcucnN0IHwgMSArDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2FyY2gvYXJtNjQvYm9vdGluZy5yc3QNCj4gYi9Eb2N1bWVudGF0aW9uL2FyY2gvYXJt
NjQvYm9vdGluZy5yc3QNCj4gaW5kZXggZGVlN2I2ZGU4NjRmLi5jY2VmYzQyYjUxYmMgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9hcm02NC9ib290aW5nLnJzdA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL2FyY2gvYXJtNjQvYm9vdGluZy5yc3QNCj4gQEAgLTMwOSw2ICszMDksNyBA
QCBCZWZvcmUganVtcGluZyBpbnRvIHRoZSBrZXJuZWwsIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9u
cyBtdXN0IGJlIG1ldDoNCj4gICAgLSBJZiBFTDIgaXMgcHJlc2VudCBhbmQgdGhlIGtlcm5lbCBp
cyBlbnRlcmVkIGF0IEVMMToNCj4gDQo+ICAgICAgLSBDUFRSX0VMMi5URlAgKGJpdCAxMCkgbXVz
dCBiZSBpbml0aWFsaXNlZCB0byAwYjAuDQo+ICsgICAgLSBDUFRSX0VMMi5GUEVOIChiaXQgMjE6
MjApIG11c3QgYmUgaW5pdGlhbGlzZWQgdG8gMGIxMS4NCg0KU29ycnksIGJ1dCBJIGRvbid0IHF1
aXRlIHVuZGVyc3RhbmQgdGhpcy4gQ1BUUl9FTDIgaGFzIGEgZGlmZmVyZW50IGZvcm1hdCBkZXBl
bmRpbmcgb24gSENSX0VMMi5FMkggYW5kIHRoZSBGUEVOIGZpZWxkIG9ubHkgZXhpc3RzIHdoZW4g
dGhhdCBiaXQgaXMgc2V0IHRvIDEuIEluIHRoYXQgY2FzZSwgaG93ZXZlciwgd2h5IHdvdWxkIHRo
ZSBrZXJuZWwgYmUgZW50ZXJlZCBhdCBFTDE/DQoNCldpbGwNCg==

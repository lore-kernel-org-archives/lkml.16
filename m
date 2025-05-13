Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9221DEFDB;
	Tue, 13 May 2025 03:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747105889; cv=none; b=uyGQWkKZUfMGss3WskH23znouT4UOgX7wUzuEnUyuHMfxwZZxfZe+KOtqzHzT+6wiMCnfx8Ux4Tl3toFkNDm1RY4Zf5Su6sogzC960KUmQrfGXXxREfHU13kb6q+xNA59bzKFEUnw/1mRDwAGrw3sG8B8/+rRTFGPwnbLTciNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747105889; c=relaxed/simple;
	bh=Q8W8qfwh8NxnjZiNXhyA9RyEchXuGPe2F2HUcz7ww6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aDrXHvM8b5QEuWUwZjorWe8aJF6n6u01I2VkrQjIz1SIdZV3Y76mY0xxSj7d/Yfyc8GJRgPSsUDdmWrp8aEhp0Ly7YHvgnVkQk8pHpZ+kzl4jRQTwDmbSCNmNzlSYNN63+NtHI+iuCn3l8juSdR4hakHuI26odGnirNasB8d+s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZxLzR6Kz6z1R7m9;
	Tue, 13 May 2025 11:09:07 +0800 (CST)
Received: from kwepemg200004.china.huawei.com (unknown [7.202.181.31])
	by mail.maildlp.com (Postfix) with ESMTPS id 647CB1A016C;
	Tue, 13 May 2025 11:11:16 +0800 (CST)
Received: from dggpemf500008.china.huawei.com (7.185.36.156) by
 kwepemg200004.china.huawei.com (7.202.181.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 11:11:15 +0800
Received: from dggpemf500008.china.huawei.com ([7.185.36.156]) by
 dggpemf500008.china.huawei.com ([7.185.36.156]) with mapi id 15.02.1544.011;
 Tue, 13 May 2025 11:11:15 +0800
From: Zhangxiquan <zhangxiquan@hisilicon.com>
To: "Will Deacon " <IMCEAMAILTO-will+40kernel+2Eorg@huawei.com>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "maz@kernel.org" <maz@kernel.org>,
	Zhengbingyang <zhengbingyang@hisilicon.com>, "Zhangyu(curtain,Babbage)"
	<zhangyu550@huawei.com>, "wangkai (CF)" <wangkai113@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBEb2N1bWVudGF0aW9uIChhcm02NCk6QWR2YW5jZWQg?=
 =?gb2312?Q?SIMD_and_floating_point_support_condition?=
Thread-Topic: [PATCH] Documentation (arm64):Advanced SIMD and floating point
 support condition
Thread-Index: AQHbuQg949jaHUBo+0OHD38f08bHYrPGl37wgAlXc8CAAAcTYA==
Date: Tue, 13 May 2025 03:11:15 +0000
Message-ID: <8d9400dcdf9442de82f43c484e82e7f2@hisilicon.com>
References: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
 <20250429131116.GA25912@willie-the-truck>
 <0acdf18f6c2748919dcbeb943e4ced3e@hisilicon.com>
 <a90e072198c344e3a4ae0ed0cb8bbe62@huawei.com>
In-Reply-To: <a90e072198c344e3a4ae0ed0cb8bbe62@huawei.com>
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

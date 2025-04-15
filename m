Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3FD1C3C14
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720479; cv=none; b=fjQIQDKXGTo72nF3cOYZQM4Dx7WaTDLQ8+4xB1SAhpRhxgvOcalsJ2SPFsq6ryx7jIKT1T5J0hniE9W00iUxUhzfQ+0gTp0YS4o1wajF2H4QKMb2Wk7x6rLumUIsnmhadh4XIqID6VCDfKkU+XeVcJ8pKxYsyB1TYuPPzacJPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720479; c=relaxed/simple;
	bh=aiSMYHLnYQ3oizGkqzxNLojLXqc+ZxZMWQPa8wzkH/Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T1mL8v2mdsxA7yCLGMetSZD4E0BM9aUKsK0BOKzZFJH74sh6y65M5GP7X0jZNhbgeeWmmJPnHmi722J0t7XBUpl+YSUVpdeozuEzTZlsa52RJO+TE8Ilmq0+PRTlScKx+8VynCoEPcofBYWYOigEXuo6ijNtMsDEcqeaEC+e8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4ZcNpy3vmrzYlCgn;
	Tue, 15 Apr 2025 20:32:58 +0800 (CST)
Received: from a001.hihonor.com (10.68.28.182) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 15 Apr
 2025 20:34:27 +0800
Received: from a007.hihonor.com (10.68.22.31) by a001.hihonor.com
 (10.68.28.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 15 Apr
 2025 20:34:27 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Tue, 15 Apr 2025 20:34:27 +0800
From: gaoxu <gaoxu2@honor.com>
To: Matthew Wilcox <willy@infradead.org>, Barry Song <21cnbao@gmail.com>
CC: Mike Rapoport <rppt@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, "surenb@google.com" <surenb@google.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
Thread-Topic: [PATCH] mm: simplify zone_idx()
Thread-Index: AduqEEHvK6kd7fhKS8Kk+tRXk/ygUf//psiAgAB6Y4D//Ve/sIAE9zeA//9wInCAAvcyAIAAF0YAgAJwF5A=
Date: Tue, 15 Apr 2025 12:34:27 +0000
Message-ID: <b2bde1ca046949599d74cb9e88c21ba3@honor.com>
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>
 <Z_fYsyEA9hSEOoxp@kernel.org>
 <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
 <bdf6988006d546d498ccb2b7c14c6fe0@honor.com>
 <CAGsJ_4xDc_5q8dBYVq-Ga0iKJD9pTQdYSHrKw8R=1RHNb4+r7Q@mail.gmail.com>
 <c915776e308f49e7867ecb50afa44d36@honor.com>
 <CAGsJ_4x+5Pm6r655k+H9A67-d9AchD9qgsEKgU5oY6N1=JbTRA@mail.gmail.com>
 <Z_xGzAx13diuCdvv@casper.infradead.org>
In-Reply-To: <Z_xGzAx13diuCdvv@casper.infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiANCj4gT24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgMDk6NTc6MjZBTSArMTIwMCwgQmFycnkgU29u
ZyB3cm90ZToNCj4gPiBPbiBTYXQsIEFwciAxMiwgMjAyNSBhdCAxMDowNuKAr1BNIGdhb3h1IDxn
YW94dTJAaG9ub3IuY29tPiB3cm90ZToNCj4gPiA+IFRoZSB6b25lIGluZm8gb2J0YWluZWQgdGhy
b3VnaCBUMzIgaW4gdGhlIEFuZHJvaWQgMTUtNi42IHN5c3RlbShhcm02NCk6DQo+ID4gPiAoc3Ry
dWN0IHpvbmUpIHN0cnVjdCAoMTY2NCBieXRlcywNCj4gPg0KPiA+IEkgZG9uJ3QgaGF2ZSBhIHN0
cm9uZyBvcGluaW9uIG9uIHdoZXRoZXIgd2UgbmVlZCBgem9uZV9pZHhg4oCUSSdtIG9rYXkNCj4g
PiB3aXRoIGhhdmluZyBpdCBvciBub3QuIElmIHlvdSdkIGxpa2UgdG8gYWRkIGl0LCBmZWVsIGZy
ZWUgdG8gc2VuZCBvdXQNCj4gPiBhIHYyIG5vdGluZyB0aGF0IGl0IGRvZXNuJ3QgaW5jcmVhc2Ug
dGhlIHN0cnVjdCBzaXplLiBJZiBubyBvbmUNCj4gPiBvYmplY3RzLCBpdCBtaWdodCBiZSBhIG5p
Y2UgY2xlYW51cC4NCj4gDQo+IFBsdXMgaXQncyBhbHJlYWR5IDE2NjQgYnl0ZXMhICBBbmQgd2Ug
aGF2ZSwgd2hhdCwgNCB6b25lcyBwZXIgTlVNQSBub2RlPw0KPiBHcm93aW5nIGl0IGRvZXNuJ3Qg
ZmVlbCBsaWtlIGEgYmlnIGRlYWwuICBBbHRob3VnaCAic2F2ZXMgdHdvIGFzc2VtYmx5DQo+IGlu
c3RydWN0aW9ucyIgaXMgYWxzbyBub3QgZXhhY3RseSBhIGJpZyB3aW4uICBJZiBpdCBzYXZlZCBh
IGNhY2hlbGluZSByZWZlcmVuY2UsDQo+IHRoYXQgbWlnaHQgYmUgbW9yZSBpbnRlcmVzdGluZywg
YnV0IGl0IHNlZW1zIGxpa2UgaXQncyBtb3JlIGxpa2VseSB0byBpbnRyb2R1Y2UgYQ0KPiBjYWNo
ZWxpbmUgcmVmZXJlbmNlIHRoYW4gc2F2ZSBvbmUuICBNYXliZSBqdXN0IG5vdCB3b3J0aCBkb2lu
Zz8NCg0KWm9uZSwgem9uZV9wZ2RhdCwgYW5kIG5vZGVfem9uZXMgYXJlIGFsbCBjb25zaWRlcmVk
IGhvdCBkYXRhOyBtb3N0IG9mIHRoZSB0aW1lLA0KdGhleSByZXNpZGUgaW4gdGhlIGNhY2hlLiBJ
biBjb250cmFzdCwgem9uZV9pZHggaW4gdGhlIHBhdGNoIGlzIG5vdCBob3QgZGF0YSwNCmFuZCBl
eGVjdXRpbmcgKCh6b25lKS0+em9uZV9pZHgpIHdpbGwgYWRkIGEgbmV3IGNhY2hlIGxpbmUuDQpB
bSBJIHVuZGVyc3RhbmRpbmcgdGhpcyBjb3JyZWN0bHk/DQoNCklmIHRoZSBoZWF0IG9mIHRoZSB6
b25lX2lkeCBmdW5jdGlvbiBpbmNyZWFzZXMsIHRoaXMgbW9kaWZpY2F0aW9uIHdpbGwgYmVjb21l
DQp3b3J0aHdoaWxlLiBGb3IgZXhhbXBsZSwgdGhpcyBwYXRjaCB3aWxsIGluY3JlYXNlIHRoZSBo
ZWF0IG9mIHRoZSB6b25lX2lkeCBmdW5jdGlvbi4NClRoZSBwYXRjaCAoaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQwMjI5MTgzNDM2LjQxMTA4NDUtMi15dXpoYW9AZ29vZ2xlLmNvbS8p
DQp3aWxsIGFkZCBuZXcgaG90c3BvdCBwYXRocywgd2l0aCB0aGUgZGV0YWlscyBhcyBmb2xsb3dz
Og0KX196b25lX3dhdGVybWFya19vaygpLT56b25lX2lzX3N1aXRhYmxlKCktPnpvbmVfaWR4KCkN
CnpvbmVfd2F0ZXJtYXJrX2Zhc3QoKS0+em9uZV9pc19zdWl0YWJsZSgpLT56b25lX2lkeCgpDQpn
ZXRfcGFnZV9mcm9tX2ZyZWVsaXN0KCktPnpvbmVfaXNfc3VpdGFibGUoKS0+em9uZV9pZHgoKQ0K
X19mcmVlX29uZV9wYWdlKCktPnpvbmVfbWF4X29yZGVyKCktPnpvbmVfaWR4KCkNCg==

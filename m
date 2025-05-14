Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267DB2741A4;
	Wed, 14 May 2025 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223525; cv=none; b=oVIk+L8IxUDQp3fRbGCm8HS757G4Tyce0ViFS0p2sUa8l6qES1oP+a8jmZiG8MkT5ajRitgGM57r4/EUyiXO5tEOrTAkLBuAY0holmsozAR+P2tFEtdwNiVZNtbjAdFswnZnx5dI44JRpBYA31EVep/VqzNGR5VLlOxBuYNgLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223525; c=relaxed/simple;
	bh=ig8WQD2mm9MKTSF9qc4BBEUvxyfahEl5b6dtPdFLtAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=PccIo3JB7b5w4OQTZPcQgBQLEth9/nGSv12vkOa+8nifTXS1W98ypjAhxQUwmTV4Nm+ZBPT/HJ7BDF0dLURNeAp06AoihBOFdJ3RBwoo7tdCSerRxD3ZvQpuZj8rNwcYEzblIdBRh4wC4O4Eg1wBIFkDp8sXJ76gg6ubqs1vWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=BqKDeVxA reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="BqKDeVxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=rMbvT6uML8YQwQrr4NcesSn671/PWQtE82gjKxtCgFo=; b=B
	qKDeVxA0jPK6cINFe2JwcLXpiSKMrAUlhwm9uB6SgV+xOrVJ4tu0kn3oCXWCIJGu
	9WvrSaNsUn9JAd+oveIQaUAjbDYzPUjszksJpd13w8ce9CwgDvt0Rm1vlURtZwsC
	jFMuKwOFBaevAVD3LqjwDxzg36cPgYM/q02OojZU0c=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-146 (Coremail) ; Wed, 14 May 2025 19:51:36 +0800
 (CST)
Date: Wed, 14 May 2025 19:51:36 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
X-NTES-SC: AL_Qu2fBf6ZvEwi4CSYYekZnEYQheY4XMKyuPkg1YJXOp80tCb8wgUaeXBjIGn77cOIKS2Svxeadh1H8uJQYYtJWbJN6jmTiaZ4mmytp3jfX693
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kigvCgD3X77JgyRoMYMEAA--.29853W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqARNqmgkfR-pFAACsa
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTQgMTk6MjM6MDIsICJPbGl2ZXIgTmV1a3VtIiA8b25ldWt1bUBzdXNlLmNv
bT4gd3JvdGU6Cj4KPgo+T24gMTMuMDUuMjUgMTM6MzgsIERhdmlkIFdhbmcgd3JvdGU6Cj4+IC0t
LQo+Cj5IaSwKPgo+c3RpbGwgYW4gaXNzdWUgYWZ0ZXIgYSBzZWNvbmQgcmV2aWV3Lgo+SSBzaG91
bGQgaGF2ZSBub3RpY2VkIGVhcmxpZXIuCj4KPj4gLS0tIGEvZHJpdmVycy91c2IvY29yZS91cmIu
Ywo+PiArKysgYi9kcml2ZXJzL3VzYi9jb3JlL3VyYi5jCj4+IEBAIC0yMyw2ICsyMyw3IEBAIHN0
YXRpYyB2b2lkIHVyYl9kZXN0cm95KHN0cnVjdCBrcmVmICprcmVmKQo+PiAgIAo+PiAgIAlpZiAo
dXJiLT50cmFuc2Zlcl9mbGFncyAmIFVSQl9GUkVFX0JVRkZFUikKPj4gICAJCWtmcmVlKHVyYi0+
dHJhbnNmZXJfYnVmZmVyKTsKPj4gKwlrZnJlZSh1cmItPmhjcHJpdl9tZW1wb29sKTsKPgo+V2hh
dCBpZiBzb21lYm9keSB1c2VzIHVzYl9pbml0X3VyYigpPwoKSSBhbSBub3QgcXVpdGUgc3VyZSBh
Ym91dCB0aGUgY29uY2VybiBoZXJlLCBkbyB5b3UgbWVhbiBzb21lYm9keSBjcmVhdGUgYSB1cmIs
CmFuZCB0aGVuIHVzYl9pbml0X3VyYigpIGhlcmUsIGFuZCBuZXZlciB1c2UgdXJiX2Rlc3Ryb3kg
dG8gcmVsZWFzZSBpdD8KClRoYXQgd291bGQgY2F1c2UgbWVtb3J5IGxlYWsgaWYgdXJiX2Rlc3Ry
b3kgaXMgbm90IGNhbGxlZC4uLi4uLkJ1dCBpcyB0aGlzIHJlYWxseSBwb3NzaWJsZT8uCgo+ICAK
Pj4gICAJa2ZyZWUodXJiKTsKPj4gICB9Cj4+IEBAIC0xMDM3LDMgKzEwMzgsMjUgQEAgaW50IHVz
Yl9hbmNob3JfZW1wdHkoc3RydWN0IHVzYl9hbmNob3IgKmFuY2hvcikKPj4gICAKPj4gICBFWFBP
UlRfU1lNQk9MX0dQTCh1c2JfYW5jaG9yX2VtcHR5KTsKPj4gICAKPj4gKy8qKgo+PiArICogdXJi
X2hjcHJpdl9tZW1wb29sX3phbGxvYyAtIGFsbG9jIG1lbW9yeSBmcm9tIG1lbXBvb2wgZm9yIGhj
cHJpdgo+PiArICogQHVyYjogcG9pbnRlciB0byBVUkIgYmVpbmcgdXNlZAo+PiArICogQHNpemU6
IG1lbW9yeSBzaXplIHJlcXVlc3RlZCBieSBjdXJyZW50IGhvc3QgY29udHJvbGxlcgo+PiArICog
QG1lbV9mbGFnczogdGhlIHR5cGUgb2YgbWVtb3J5IHRvIGFsbG9jYXRlCj4+ICsgKgo+PiArICog
UmV0dXJuOiBOVUxMIGlmIG91dCBvZiBtZW1vcnksIG90aGVyd2lzZSBtZW1vcnkgYXJlIHplcm9l
ZAo+PiArICovCj4+ICt2b2lkICp1cmJfaGNwcml2X21lbXBvb2xfemFsbG9jKHN0cnVjdCB1cmIg
KnVyYiwgc2l6ZV90IHNpemUsIGdmcF90IG1lbV9mbGFncykKPj4gK3sKPj4gKwlpZiAodXJiLT5o
Y3ByaXZfbWVtcG9vbF9zaXplIDwgc2l6ZSkgewo+PiArCQlrZnJlZSh1cmItPmhjcHJpdl9tZW1w
b29sKTsKPj4gKwkJdXJiLT5oY3ByaXZfbWVtcG9vbF9zaXplID0gc2l6ZTsKPj4gKwkJdXJiLT5o
Y3ByaXZfbWVtcG9vbCA9IGttYWxsb2Moc2l6ZSwgbWVtX2ZsYWdzKTsKPgo+VGhhdCBjb3VsZCB1
c2Uga3phbGxvYygpLgoKVGhlIG1lbW9yeSB3b3VsZCBiZSAgc2V0IHRvIDAgYmVmb3JlIHJldHVy
bmluZyB0byB1c2VyLCB2aWEgbWVtc2V0LCAgIG5vIG1hdHRlciB3aGV0aGVyIHRoZSBtZW1vcnkg
aXMgCm5ld2x5IGFsbG9jZWQgb3IganVzdCByZXVzZWQuICBJIHRoaW5rIHVzaW5nIGttYWxsb2Mg
aXMgb2sgaGVyZS4KCgpUaGFua3MKRGF2aWQKCj4KPglSZWdhcmRzCj4JCU9saXZlcgo=

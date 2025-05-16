Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF15224F6
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413635; cv=none; b=oZ+kJCiCm9x/HROs+eEakK5IEpiYBfR5siafptBhxvbWgwD1hYZL9ghDnNFk/3yjL6nYF73m9W5pBDc3jSGIpOt9GXuqRvnUUtyr9gf7wEk3EUlVlRp26Hv4/lO6ctbORbnLj5XhzaY7gOf4p8eUd7EXS6IqtC5nA5laIpuqFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413635; c=relaxed/simple;
	bh=D0Nh94fTaSsba30kvmokC+CY5lJDNuDYNJDnyIUAOVI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=nOR09c9+S4CYFg/qxvEd1DdNmV5H6PYtjOcskgF0hLt32/ZaR0XhKhXe2790tJTGUBk37Xt3I00ohMCuK3rCfREZHFarTaqorYwo3DeW9P08zhQza9VQ8brCVIhghGOnTO1zOXwRV8nDgJmCto0iTyeSiIsr5QLN5d8O059CdAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=YI5dux/f reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="YI5dux/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=mOYd48idEXtbPMw0QhLwj9DRwcntZvg3z1v1i5XgcY0=; b=Y
	I5dux/fW8SyP2eLXyhO2LniB3nJEolTHxJoPMdKFxNWQ4b1sAp12aJnverGJ7SiL
	exZvLKKs4kCB9Q0GEA2Lru8shCTQ/xkeO2PfCNkhnKKwnX0VdvsLc3DOqr0jrsHX
	t4Cdk8tVTdAP/jW/u2VLx9q4REi3Wdzih3/Ms+looA=
Received: from xavier_qy$163.com ( [180.168.35.125] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Sat, 17 May 2025 00:40:03 +0800
 (CST)
Date: Sat, 17 May 2025 00:40:03 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: anna-maria@linutronix.de, frederic@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v1] hrtimer: Simplify the logic of
 __hrtimer_get_next_event
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <87ecwoj0bz.ffs@tglx>
References: <20250516070153.2410363-1-xavier_qy@163.com>
 <87ecwoj0bz.ffs@tglx>
X-NTES-SC: AL_Qu2fBfiavE4r5SWdbekfmkgWgus/WcW2u/Qj3IRSO5FwjBHo5DIER3tMJHz5/d+OOxC3rheYdwBvztt7e7d6W6E1ODjevpJ83E00cHWk2UQxSQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <9657931.a6fb.196d9f794f0.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iygvCgDn71NjaidoD1gGAA--.58690W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiVhlPEGgnFmJI5AAEsD
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIFRob21hcywKCkF0IDIwMjUtMDUtMTYgMTg6NTA6NTYsICJUaG9tYXMgR2xlaXhuZXIiIDx0
Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+T24gRnJpLCBNYXkgMTYgMjAyNSBhdCAxNTowMSwg
WGF2aWVyIFhpYSB3cm90ZToKPj4gQ3VycmVudGx5LCBfX2hydGltZXJfZ2V0X25leHRfZXZlbnQg
bWFrZXMgdHdvIHNlcGFyYXRlIGNhbGxzIHRvCj4+IF9faHJ0aW1lcl9uZXh0X2V2ZW50X2Jhc2Ug
Zm9yIEhSVElNRVJfQUNUSVZFX1NPRlQgYW5kIEhSVElNRVJfQUNUSVZFX0hBUkQKPj4gcmVzcGVj
dGl2ZWx5IHRvIG9idGFpbiBleHBpcmVzX25leHQuIEhvd2V2ZXIsIF9faHJ0aW1lcl9uZXh0X2V2
ZW50X2Jhc2UgaXMKPj4gY2FwYWJsZSBvZiB0cmF2ZXJzaW5nIGFsbCB0aW1lciB0eXBlcyBzaW11
bHRhbmVvdXNseSBieSBzaW1wbHkgY29udHJvbGxpbmcKPj4gdGhlIGFjdGl2ZSBtYXNrLiBUaGVy
ZSBpcyBubyBuZWVkIHRvIGRpc3Rpbmd1aXNoIHRoZSBvcmRlciBvZiB0cmF2ZXJzYWwKPj4gYmV0
d2VlbiBzb2Z0IGFuZCBoYXJkIHRpbWVycywgYXMgdGhlIHNvbGUgcHVycG9zZSBpcyB0byBmaW5k
IHRoZSBlYXJsaWVzdAo+PiBleHBpcmF0aW9uIHRpbWUuCj4+IFRoZXJlZm9yZSwgdGhlIGNvZGUg
Y2FuIGJlIHNpbXBsaWZpZWQgYnkgcmVkdWNpbmcgdGhlIHR3byBjYWxscyB0byBhIHNpbmdsZQo+
PiBpbnZvY2F0aW9uIG9mIF9faHJ0aW1lcl9uZXh0X2V2ZW50X2Jhc2UsIG1ha2luZyB0aGUgY29k
ZSBtb3JlCj4+IHN0cmFpZ2h0Zm9yd2FyZCBhbmQgZWFzaWVyIHRvIHVuZGVyc3RhbmQuCj4KPi4u
LiBhbmQgYnJva2VuCj4KPj4gLQkJY3B1X2Jhc2UtPnNvZnRpcnFfbmV4dF90aW1lciA9IE5VTEw7
Cj4+IC0JCW5leHRfdGltZXIgPSBjcHVfYmFzZS0+c29mdGlycV9uZXh0X3RpbWVyOwo+PiAtCQlj
cHVfYmFzZS0+bmV4dF90aW1lciA9IG5leHRfdGltZXI7Cj4KPmJlY2F1c2UgeW91IHJlbW92ZWQg
dGhlIGNwdV9iYXNlOjpbc29mdGlycV9dbmV4dF90aW1lciB1cGRhdGUgbG9naWMuCj4KClRoYW5r
cyBmb3IgeW91ciByZW1pbmRlci4gWW91J3JlIHJpZ2h0LiBXZSBkbyBuZWVkIHRvIHVwZGF0ZQpj
cHVfYmFzZS0+bmV4dF90aW1lciBhbmQgc29mdGlycV9uZXh0X3RpbWVyIGhlcmUuIERvIHlvdSB0
aGluawppdCdzIGZlYXNpYmxlIHRvIGRpcmVjdGx5IHBsYWNlIHRoZSB1cGRhdGVzIG9mIHRoZXNl
IHR3byB2YXJpYWJsZXMKaW5zaWRlIF9faHJ0aW1lcl9uZXh0X2V2ZW50X2Jhc2UsIG1heWJlIGp1
c3QgbGlrZSB0aGlzOgoKIHN0YXRpYyBrdGltZV90IF9faHJ0aW1lcl9uZXh0X2V2ZW50X2Jhc2Uo
c3RydWN0IGhydGltZXJfY3B1X2Jhc2UgKmNwdV9iYXNlLAogCQkJCQkgY29uc3Qgc3RydWN0IGhy
dGltZXIgKmV4Y2x1ZGUsCi0JCQkJCSB1bnNpZ25lZCBpbnQgYWN0aXZlLAorCQkJCQkgdW5zaWdu
ZWQgaW50IGFjdGl2ZV9tYXNrLAogCQkJCQkga3RpbWVfdCBleHBpcmVzX25leHQpCiB7CiAJc3Ry
dWN0IGhydGltZXJfY2xvY2tfYmFzZSAqYmFzZTsKIAlrdGltZV90IGV4cGlyZXM7CisJdW5zaWdu
ZWQgaW50IGFjdGl2ZTsKKwlib29sIGluY2x1ZGVfaGFyZDsKKworCWFjdGl2ZSA9IGNwdV9iYXNl
LT5hY3RpdmVfYmFzZXMgJiBhY3RpdmVfbWFzazsKKwlpbmNsdWRlX2hhcmQgPSAhIShhY3RpdmVf
bWFzayAmIEhSVElNRVJfQUNUSVZFX0hBUkQpOyAKKworCWNwdV9iYXNlLT5uZXh0X3RpbWVyID0g
TlVMTDsKKwljcHVfYmFzZS0+c29mdGlycV9uZXh0X3RpbWVyID0gTlVMTDsKIAogCWZvcl9lYWNo
X2FjdGl2ZV9iYXNlKGJhc2UsIGNwdV9iYXNlLCBhY3RpdmUpIHsKIAkJc3RydWN0IHRpbWVycXVl
dWVfbm9kZSAqbmV4dDsKQEAgLTUzOCw4ICs1NDYsMTEgQEAgc3RhdGljIGt0aW1lX3QgX19ocnRp
bWVyX25leHRfZXZlbnRfYmFzZShzdHJ1Y3QgaHJ0aW1lcl9jcHVfYmFzZSAqY3B1X2Jhc2UsCiAJ
CQlpZiAoZXhjbHVkZSkKIAkJCQljb250aW51ZTsKIAotCQkJaWYgKHRpbWVyLT5pc19zb2Z0KQor
CQkJaWYgKHRpbWVyLT5pc19zb2Z0KSB7CiAJCQkJY3B1X2Jhc2UtPnNvZnRpcnFfbmV4dF90aW1l
ciA9IHRpbWVyOworCQkJCWlmIChpbmNsdWRlX2hhcmQpCisJCQkJCWNwdV9iYXNlLT5uZXh0X3Rp
bWVyID0gdGltZXI7CisJCQl9CiAJCQllbHNlCiAJCQkJY3B1X2Jhc2UtPm5leHRfdGltZXIgPSB0
aW1lcjsKIAkJfQoKCkknbSBhIGJpdCBjb25mdXNlZC4gV2h5IGRvZXNuJ3QgdGhlIGhydGltZXJf
bmV4dF9ldmVudF93aXRob3V0CmZ1bmN0aW9uIG5lZWQgdG8gdXBkYXRlIGNwdV9iYXNlLT5uZXh0
X3RpbWVyIGxpa2UgdGhlCl9faHJ0aW1lcl9nZXRfbmV4dF9ldmVudCBmdW5jdGlvbiBkb2VzPwoK
RG8geW91IGtub3cgaWYgdGhlcmUgYXJlIG90aGVyIHRpbWVyLXJlbGF0ZWQgdGVzdCBjYXNlcyBi
ZXNpZGVzCnRob3NlIGluIHRoZSB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90aW1lcnMgcGF0aD8K
Ci0tClRoYW5rcywKWGF2aWVyCg==

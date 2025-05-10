Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F3024B29
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746847584; cv=none; b=Vez1hY778oVxXQyFmNQdDtEmF0a7+02gNc6BBhBZS3NuGzBc1uVdg2kTukRrr8QFfQ/VWLuUCZ0UgLdb8t3kQ3FoHc+RTt3QVIQL9yPLImwcL6rU1toaA4HvlXgC2tpLLnDL9KGu06Zh0HbZf/vFnVy8TjvM7naVBxwySWbnYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746847584; c=relaxed/simple;
	bh=QIpt02LYO1R8RWPVE5NAgG9Nn7Ig63WWTiMMMzfCXxA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=resIrwWQ0CHZXyHzaLmZBnBzPwIg6yyjxubhGAg+ONLaYtWlM6whI84QrDeSRuB63aGRJb+56/BuUdQUWE+v57GYKYQ9ecIYLfZMSB3F6MGfrokdruIpzv8i+A3vcWDN6JyQ69ktb/wqKVSptTuVQBTav2SnNqae5I2VZDk7THo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Tdh3J8SS reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Tdh3J8SS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=oU+cMc6ZOlFQWAq6dQ2bMXk2bihfuhYNwBhN6Y+KoxU=; b=T
	dh3J8SSPjrJiIHYNmZr1fGdobVGwZTBri3HKjvK7e75/a980n1FWS8LciFRWknhF
	WCcv7B98i+Z9VXjvo5rJ1vNWS/wA1zgWvMq+Y5XhSd2bJPXwfFveI++9gAV+n08r
	xQ1AnzdziCuU3c61xTvycZ7D+nhgGPSPs/wYxzGDME=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-128 (Coremail) ; Sat, 10 May 2025 11:25:18 +0800
 (CST)
Date: Sat, 10 May 2025 11:25:18 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Tim Chen" <tim.c.chen@linux.intel.com>
Cc: surenb@google.com, kent.overstreet@linux.dev, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
References: <20250507175500.204569-1-00107082@163.com>
 <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
X-NTES-SC: AL_Qu2fBPSfuE0q7imdYukZnEYQheY4XMKyuPkg1YJXOp80liTj+QsqeHJmM2fy0MWCMhmgvRWIThZo2P9Ff7J6UbIjiec6pflHcWV1TvGZ1P7k
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4538ec3b.1052.196b839d0f1.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gCgvCgD3n+Ufxx5oeSwBAA--.7119W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBxJqmgevNQrKQAHs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEwIDAyOjMzOjQ4LCAiVGltIENoZW4iIDx0aW0uYy5jaGVuQGxpbnV4Lmlu
dGVsLmNvbT4gd3JvdGU6Cj5PbiBTYXQsIDIwMjUtMDUtMTAgYXQgMDE6MzkgKzA4MDAsIERhdmlk
IFdhbmcgd3JvdGU6Cj4+IAo+PiAKPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV2FuZyA8MDAxMDcw
ODJAMTYzLmNvbT4KPj4gLS0tCj4+ICBsaWIvYWxsb2NfdGFnLmMgfCAyOSArKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE5
IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2xpYi9hbGxvY190YWcuYyBiL2xpYi9h
bGxvY190YWcuYwo+PiBpbmRleCAyNWVjYzEzMzRiNjcuLmZkZDU4ODc3NjlhNiAxMDA2NDQKPj4g
LS0tIGEvbGliL2FsbG9jX3RhZy5jCj4+ICsrKyBiL2xpYi9hbGxvY190YWcuYwo+PiBAQCAtNDUs
MjEgKzQ1LDE2IEBAIHN0cnVjdCBhbGxvY2luZm9fcHJpdmF0ZSB7Cj4+ICBzdGF0aWMgdm9pZCAq
YWxsb2NpbmZvX3N0YXJ0KHN0cnVjdCBzZXFfZmlsZSAqbSwgbG9mZl90ICpwb3MpCj4+ICB7Cj4+
ICAJc3RydWN0IGFsbG9jaW5mb19wcml2YXRlICpwcml2Owo+PiAtCXN0cnVjdCBjb2RldGFnICpj
dDsKPj4gIAlsb2ZmX3Qgbm9kZSA9ICpwb3M7Cj4+ICAKPj4gLQlwcml2ID0ga3phbGxvYyhzaXpl
b2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKPj4gLQltLT5wcml2YXRlID0gcHJpdjsKPj4gLQlpZiAo
IXByaXYpCj4+IC0JCXJldHVybiBOVUxMOwo+PiAtCj4+IC0JcHJpdi0+cHJpbnRfaGVhZGVyID0g
KG5vZGUgPT0gMCk7Cj4+ICsJcHJpdiA9IChzdHJ1Y3QgYWxsb2NpbmZvX3ByaXZhdGUgKiltLT5w
cml2YXRlOwo+PiAgCWNvZGV0YWdfbG9ja19tb2R1bGVfbGlzdChhbGxvY190YWdfY3R0eXBlLCB0
cnVlKTsKPj4gLQlwcml2LT5pdGVyID0gY29kZXRhZ19nZXRfY3RfaXRlcihhbGxvY190YWdfY3R0
eXBlKTsKPj4gLQl3aGlsZSAoKGN0ID0gY29kZXRhZ19uZXh0X2N0KCZwcml2LT5pdGVyKSkgIT0g
TlVMTCAmJiBub2RlKQo+PiAtCQlub2RlLS07Cj4+IC0KPj4gLQlyZXR1cm4gY3QgPyBwcml2IDog
TlVMTDsKPj4gKwlpZiAobm9kZSA9PSAwKSB7Cj4+ICsJCXByaXYtPnByaW50X2hlYWRlciA9IHRy
dWU7Cj4+ICsJCXByaXYtPml0ZXIgPSBjb2RldGFnX2dldF9jdF9pdGVyKGFsbG9jX3RhZ19jdHR5
cGUpOwo+PiArCQljb2RldGFnX25leHRfY3QoJnByaXYtPml0ZXIpOwo+PiArCX0KPgo+RG8geW91
IG5lZWQgdG8gc2tpcCBwcmludCBoZWFkZXIgd2hlbiAqcG9zICE9IDA/IGkuZSBhZGQKPgo+CX0g
ZWxzZSB7Cj4JCXByaXYtPnByaW50X2hlYWRlciA9IGZhbHNlOwo+CX0KPgo+VGltCgpwcmludF9o
ZWFkZXIgZmxhZyB3aWxsIGJlIHNldCB0byBmYWxzZSBvbmNlIGhlYWRlciBpcyBwcmludGVkLCBp
biBhbGxvY2luZm9fc2hvdygpOgoxMTQgICAgICAgICBpZiAocHJpdi0+cHJpbnRfaGVhZGVyKSB7
CjExNSAgICAgICAgICAgICAgICAgcHJpbnRfYWxsb2NpbmZvX2hlYWRlcigmYnVmKTsKMTE2ICAg
ICAgICAgICAgICAgICBwcml2LT5wcmludF9oZWFkZXIgPSBmYWxzZTsKMTE3ICAgICAgICAgfQoK
b25jZSBwcml2LT5wcmludF9oZWFkZXIpIGlzIHNldCB0byB0cnVlLCAgdGhlIGhlYWRlciB3aWxs
IGJlIHByaW50ZWQgb25jZSBhbmQgb25seSBvbmNlIHVudGlsIGl0IGlzIApzZXQgdG8gdHJ1ZSBu
ZXh0IHRpbWUuCgpUaGFua3MKRGF2aWQKCj4KPj4gKwlyZXR1cm4gcHJpdi0+aXRlci5jdCA/IHBy
aXYgOiBOVUxMOwo+PiAgfQo+PiAgCg==

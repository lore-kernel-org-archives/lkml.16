Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD8519C556
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746848177; cv=none; b=HjdWWMub6VTerUn2xhRHfGdI6Xksbw0D0rMtWk+tT9fCYJGPUhjbR1pP7Au0iHhmNhg3WmDG95WpFq4u7RZzyR4dGblEkk5bOsHnpX9rC9YhLUVmewKcQ1aqA3SVVFGfST4JT3fdEmCpJMbZykW+tWO0627sCZXkOZcQCoaeZvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746848177; c=relaxed/simple;
	bh=90SklKXFWqF5yabT/MHUzKHcwbxe9jbWkHzVLaV2rQ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=R4kbdpOrtVs1gj6xqdeH245RuskaBlw81FgRtixYaKaYTruMx8v9/11oJZIHwLF4sO34riJamFZBxtImnQve3gJs+HFfa1DZa0zd4bCmKzrMIH28JQ4NSUhH5Cud8JGI9s0cQHYQnXZThuTsrC8uyOo/cGhzf8kYCWvslp7scWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IMZspYA7; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IMZspYA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=90SklKXFWqF5yabT/MHUzKHcwbxe9jbWkHzVLaV2rQ4=; b=I
	MZspYA7CKGyBpyUpunt1oHmohNU8QGVZkHBzgmfD0Iwq43ahcLhf2o2eRV1kXr+1
	fC5I0CEMXo20qjEL4j7Pe2BMG0yAXxSqKU0dy2eO7/4UhJ5oKVIFQhwbUtH+LRoE
	bsS7TU3ILPdtxtWtdQpA0ISSAqzpmgXm8Re+uQK3Uw=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-128 (Coremail) ; Sat, 10 May 2025 11:35:47 +0800
 (CST)
Date: Sat, 10 May 2025 11:35:47 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Tim Chen" <tim.c.chen@linux.intel.com>
Cc: "Suren Baghdasaryan" <surenb@google.com>, kent.overstreet@linux.dev,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com>
References: <20250507175500.204569-1-00107082@163.com>
 <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
 <CAJuCfpHB8T8daanvE_wowRD9-sAo30rtCcFfMPZL_751+KSs5w@mail.gmail.com>
 <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com>
X-NTES-SC: AL_Qu2fBPSft0kv4SSYYOkZnEYQheY4XMKyuPkg1YJXOp80liTj+QsqeHJmM2fy0MWCMhmgvRWIThZo2P9Ff7J6UbI9cYWZ5Z7tgSJZMW1ehqq3
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <c48b719.112d.196b84367d1.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gCgvCgD3f+STyR5oqC0BAA--.7114W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gxJqmgexcNK8QACs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTAgMDM6NDY6MDYsICJUaW0gQ2hlbiIgPHRpbS5jLmNoZW5AbGludXguaW50
ZWwuY29tPiB3cm90ZToKPk9uIEZyaSwgMjAyNS0wNS0wOSBhdCAxMjozNiAtMDcwMCwgU3VyZW4g
QmFnaGRhc2FyeWFuIHdyb3RlOgo+PiBPbiBGcmksIE1heSA5LCAyMDI1IGF0IDExOjMz4oCvQU0g
VGltIENoZW4gPHRpbS5jLmNoZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKPj4gPiAKPj4gPiBP
biBTYXQsIDIwMjUtMDUtMTAgYXQgMDE6MzkgKzA4MDAsIERhdmlkIFdhbmcgd3JvdGU6Cj4+ID4g
PiAKPj4gPiA+IAo+PiA+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV2FuZyA8MDAxMDcwODJAMTYz
LmNvbT4KPj4gCj4+IEFja2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUu
Y29tPgo+PiAKPj4gPiA+IC0tLQo+PiA+ID4gIGxpYi9hbGxvY190YWcuYyB8IDI5ICsrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tCj4+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDE5IGRlbGV0aW9ucygtKQo+PiA+ID4gCj4+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL2Fs
bG9jX3RhZy5jIGIvbGliL2FsbG9jX3RhZy5jCj4+ID4gPiBpbmRleCAyNWVjYzEzMzRiNjcuLmZk
ZDU4ODc3NjlhNiAxMDA2NDQKPj4gPiA+IC0tLSBhL2xpYi9hbGxvY190YWcuYwo+PiA+ID4gKysr
IGIvbGliL2FsbG9jX3RhZy5jCj4+ID4gPiBAQCAtNDUsMjEgKzQ1LDE2IEBAIHN0cnVjdCBhbGxv
Y2luZm9fcHJpdmF0ZSB7Cj4+ID4gPiAgc3RhdGljIHZvaWQgKmFsbG9jaW5mb19zdGFydChzdHJ1
Y3Qgc2VxX2ZpbGUgKm0sIGxvZmZfdCAqcG9zKQo+PiA+ID4gIHsKPj4gPiA+ICAgICAgIHN0cnVj
dCBhbGxvY2luZm9fcHJpdmF0ZSAqcHJpdjsKPj4gPiA+IC0gICAgIHN0cnVjdCBjb2RldGFnICpj
dDsKPj4gPiA+ICAgICAgIGxvZmZfdCBub2RlID0gKnBvczsKPj4gPiA+IAo+PiA+ID4gLSAgICAg
cHJpdiA9IGt6YWxsb2Moc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4+ID4gPiAtICAgICBt
LT5wcml2YXRlID0gcHJpdjsKPj4gPiA+IC0gICAgIGlmICghcHJpdikKPj4gPiA+IC0gICAgICAg
ICAgICAgcmV0dXJuIE5VTEw7Cj4+ID4gPiAtCj4+ID4gPiAtICAgICBwcml2LT5wcmludF9oZWFk
ZXIgPSAobm9kZSA9PSAwKTsKPj4gPiA+ICsgICAgIHByaXYgPSAoc3RydWN0IGFsbG9jaW5mb19w
cml2YXRlICopbS0+cHJpdmF0ZTsKPj4gPiA+ICAgICAgIGNvZGV0YWdfbG9ja19tb2R1bGVfbGlz
dChhbGxvY190YWdfY3R0eXBlLCB0cnVlKTsKPj4gPiA+IC0gICAgIHByaXYtPml0ZXIgPSBjb2Rl
dGFnX2dldF9jdF9pdGVyKGFsbG9jX3RhZ19jdHR5cGUpOwo+PiA+ID4gLSAgICAgd2hpbGUgKChj
dCA9IGNvZGV0YWdfbmV4dF9jdCgmcHJpdi0+aXRlcikpICE9IE5VTEwgJiYgbm9kZSkKPj4gPiA+
IC0gICAgICAgICAgICAgbm9kZS0tOwo+PiA+ID4gLQo+PiA+ID4gLSAgICAgcmV0dXJuIGN0ID8g
cHJpdiA6IE5VTEw7Cj4+ID4gPiArICAgICBpZiAobm9kZSA9PSAwKSB7Cj4+ID4gPiArICAgICAg
ICAgICAgIHByaXYtPnByaW50X2hlYWRlciA9IHRydWU7Cj4+ID4gPiArICAgICAgICAgICAgIHBy
aXYtPml0ZXIgPSBjb2RldGFnX2dldF9jdF9pdGVyKGFsbG9jX3RhZ19jdHR5cGUpOwo+PiA+ID4g
KyAgICAgICAgICAgICBjb2RldGFnX25leHRfY3QoJnByaXYtPml0ZXIpOwo+PiA+ID4gKyAgICAg
fQo+PiA+IAo+PiA+IERvIHlvdSBuZWVkIHRvIHNraXAgcHJpbnQgaGVhZGVyIHdoZW4gKnBvcyAh
PSAwPyBpLmUgYWRkCj4+IAo+PiBUZWNobmljYWxseSBub3QgbmVlZGVkIHNpbmNlIHByb2NfY3Jl
YXRlX3NlcV9wcml2YXRlKCkgYWxsb2NhdGVzCj4+IHNlcS0+cHJpdmF0ZSB1c2luZyBremFsbG9j
KCksIHNvIHRoZSBpbml0aWFsIHZhbHVlIG9mCj4+IHByaXYtPnByaW50X2hlYWRlciBpcyBhbHdh
eXMgZmFsc2UuCj4KPkJ1dCB3ZSdsbCBzdGFydCB3aXRoIGZpcnN0IGNhbGwgdG8gYWxsb2NpbmZv
X3N0YXJ0KCkgd2l0aCAqcG9zID09IDAswqAKPnRoZW4gcHJpbnRfaGVhZGVyIHdpbGwgYmUgaW5p
dGlhbGl6ZWQgdG8gdHJ1ZS4KPldpbGwgdGhlcmUgYmUgc3Vic2VxdWVudCBjYWxscyBvZiBhbGxv
Y2luZm9fc3RhcnQoKSB3aXRoICpwb3MgIT0wLAo+YnV0IHByaXYtPnByaW50X2hlYWRlciBzdGF5
cyBhdCAwPyAKCkhlYWRlciBvbmx5IG5lZWRzIHRvIGJlIHByaW50ZWQgYXQgbGluZSAjMDoKTm9y
bWFsIHNlcV9maWxlIG9wZXJhdGVzOwogICAgc3RhcnQoMCkKICAgIHNob3coMCkgICA8LS0tcHJp
bnQgaGVhZGVyIGhlcmUKICAgIHNob3coMSkKICAgIHN0b3AoKQogICAgc3RhcnQoMikgICA8LS0t
LW5vIG5lZWQgdG8gcHJpbnQgaGVhZGVyCiAgICBzaG93KDIpCiAgICBzaG93KDMpCiAgIC4uLgoK
SWYgc3RhcnQoMCkvc2hvdygwKSBoYXBwZW5lZCB0d2ljZSwgdHdvIGhlYWRlciB3b3VsZCBiZSBw
cmludGVkOyBvciBpZiB0aGVyZSBpcyBubyBzdGFydCgwKSBub3RoaW5nIHdvdWxkIGJlIHByaW50
ZWQuCklmIHRob3NlIHR3byBzY2VuYXJpbyBoYXBwZW5zLCAgSSB0aGluayBpdCBpcyBhIGJ1ZyBp
biBzZXFfZmlsZS4KClRoYW5rcwpEYXZpZAogCgo+Cj5UaW0KPj4gCj4+ID4gCj4+ID4gICAgICAg
ICB9IGVsc2Ugewo+PiA+ICAgICAgICAgICAgICAgICBwcml2LT5wcmludF9oZWFkZXIgPSBmYWxz
ZTsKPj4gPiAgICAgICAgIH0KPj4gPiAKPj4gPiBUaW0KPj4gPiAKPj4gPiA+ICsgICAgIHJldHVy
biBwcml2LT5pdGVyLmN0ID8gcHJpdiA6IE5VTEw7Cj4+ID4gPiAgfQo+PiA+ID4gCj4+ID4gCg==


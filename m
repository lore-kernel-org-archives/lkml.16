Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A690E204C00;
	Tue, 13 May 2025 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124712; cv=none; b=DfQuO5nag8CYDHHXs4US+HkCdz2o//h2YGriURqoF97h5yM84JBO2YVsR26ct4RR8AFa6fJHeFebVeU+xjQLn1zl8Yy5+9Hp6erM38X1hwhZkahs8SviRhNK5FDECJcJzUWGNKPh9sXKaLyYuSKjet9DeFkNjBQqJAF1tfB4yxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124712; c=relaxed/simple;
	bh=/e9IFo7NOULWBraqABWGGOO0QNcEpYAXusfimVcSJhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=OXVWycWApWh9PATUKIsUSHDeWR14DtxUI3r4FWFPmwsU+wzp6f8dZWgPPDzuE32f7G1JLaG5gGQ7O/9jyRtVGCihMAaZ4l052xhgqb03YHyDFL7ZZ388bZHE8ggfngKA+KvNl11SxFm9k0tCT+WOoUVlo89i1wHvmXArifdS+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=QMNc+BB2 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="QMNc+BB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=jZPrqQGEvdb3YL+9BCnhNo0UsuME3r3d+9fkNikNK/Y=; b=Q
	MNc+BB2dovCFtIKCnTmaFsjVsKeVInbrmBr3i+zf3+I5DirTTC5WJei2+ua/KaxK
	J/89b+/Y/NEgrJrSGWtDvuEx7KaZXAiWwU5W+YgtHJGN6CnXo5dQMch1/849aQ15
	cVXFT2P1n5N17IwxyzaBry5RhP4PNGVfhdinYCf3hc=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-110 (Coremail) ; Tue, 13 May 2025 16:23:49 +0800
 (CST)
Date: Tue, 13 May 2025 16:23:49 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, surenb@google.com,
	kent.overstreet@linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
 <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
X-NTES-SC: AL_Qu2fBf2Zu04p7ySdZOkZnEYQheY4XMKyuPkg1YJXOp80vyTg8BgQZm9MAUHHws6uNDKhoAi0TT1A0eZkcIVZfqRklkAzFdBynpW860y7Rrd+
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bigvCgD3n7eWASNoTlEDAA--.28447W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hdMqmgi-c1uJwADsT
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEzIDE2OjExOjIwLCAiT2xpdmVyIE5ldWt1bSIgPG9uZXVrdW1Ac3VzZS5j
b20+IHdyb3RlOgo+SGksCj4KPk9uIDEzLjA1LjI1IDA3OjU0LCBEYXZpZCBXYW5nIHdyb3RlOgo+
PiBVUkIgb2JqZWN0cyBoYXZlIGxvbmcgbGlmZWN5Y2xlLCBhbiB1cmIgY2FuIGJlIHJldXNlZCBi
ZXR3ZWVuCj4+IGVucXVldWUtZGVxdWV1ZSBsb29wczsgVGhlIHByaXZhdGUgZGF0YSBuZWVkZWQg
Ynkgc29tZSBob3N0IGNvbnRyb2xsZXIKPj4gaGFzIHZlcnkgc2hvcnQgbGlmZWN5Y2xlLCB0aGUg
bWVtb3J5IGlzIGFsbG9jZWQgd2hlbiBlbnF1ZXVlLCBhbmQKPj4gcmVsZWFzZWQgd2hlbiBkZXF1
ZXVlLiBGb3IgZXhhbXBsZSwgb24gYSBzeXN0ZW0gd2l0aCB4aGNpLCBzZXZlcmFsCj4+IG1pbnV0
ZXMgb2YgdXNhZ2Ugb2Ygd2ViY2FtL2tleWJvYXJkL21vdXNlIGhhdmUgbWVtb3J5IGFsbG9jIGNv
dW50czoKPj4gICAgZHJpdmVycy91c2IvY29yZS91cmIuYzo3NSBbdXNiY29yZV0gZnVuYzp1c2Jf
YWxsb2NfdXJiIDY2MQo+PiAgICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYzoxNTU1IFt4aGNpX2hj
ZF0gZnVuYzp4aGNpX3VyYl9lbnF1ZXVlIDQyNDg2Mwo+PiBNZW1vcnkgYWxsb2NhdGlvbiBmcmVx
dWVuY3kgZm9yIGhvc3QtY29udHJvbGxlciBwcml2YXRlIGRhdGEgY2FuIHJlYWNoCj4+IH4xay9z
Lgo+Cj5GaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSBmb3IgdHJ5aW5nIHRvIHRhY2tsZSB0aGlzIGxv
bmcgcnVubmluZyBpc3N1ZS4KPgo+PiBAQCAtNzcsNiArNzgsNyBAQCBzdHJ1Y3QgdXJiICp1c2Jf
YWxsb2NfdXJiKGludCBpc29fcGFja2V0cywgZ2ZwX3QgbWVtX2ZsYWdzKQo+PiAgIAlpZiAoIXVy
YikKPj4gICAJCXJldHVybiBOVUxMOwo+PiAgIAl1c2JfaW5pdF91cmIodXJiKTsKPj4gKwl1cmIt
PmhjcHJpdl9tZW1wb29sX2ZsYWdzID0gbWVtX2ZsYWdzOwo+Cj5Oby4gWW91IGNhbm5vdCBkbyB0
aGlzLiBUaGUgZmxhZ3MgeW91IHBhc3MgdG8gdXNiX2FsbG9jX3VyYigpCj5kZXBlbmQgb24gdGhl
IGNvbnRleHQgeW91IGNhbGwgaXQgaW4uIEZvciBleGFtcGxlLCBpZiB5b3UgYXJlCj5hbGxvY2F0
aW5nIGl0IHdoaWxlIGhvbGRpbmcgYSBzcGlubG9jaywgb3UgbmVlZCB0byB1c2UgR0ZQX0FUT01J
Qwo+Cj5CdXQgdGhhdCBtYXkgb3IgbWF5IG5vdCBiZSB0aGUgc2FtZSBjb250ZXh0IHlvdSBzdWJt
aXQgdGhlIFVSQiBpbi4KPlJlY29yZGluZyBtZW1fZmxhZ3MgaGVyZSBtYWtlcyBubyBzZW5zZS4K
Pgo+CVJlZ2FyZHMKPgkJT2xpdmVyCgpUaGFua3MgZm9yIHJldmlld2luZyB0aGlzLiAgVGhlIG1l
bW9yeSBmbGFnIHRoaW5nIGRvIHJhaXNlIGNvbmNlcm4uIApJIHRoaW5rIEkgY2FuIG1ha2UgYWRq
dXN0bWVudDogIHJlYWxsb2MgdGhlIG1lbW9yeSBpZiBmbGFnIGNoYW5nZWQuCgoKVGhhbmtzCkRh
dmlkCg==

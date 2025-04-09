Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CCA267B0E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211749; cv=none; b=Acmz2K5TBnmJ1QGJo8HCdp/HpaS/8xTS+DRWjyQpMkpjAB4mr4uiwUcd0lBtfClp1xpzPt9GMqYQxXy99durZ97fzY3MqtlTPRUPX+NTEHALHnyG1/QCxDV7gLu4YE5SpXvYucZUbp9r0o0vK1aQ8d7fanN376qEwWEpBD4qdXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211749; c=relaxed/simple;
	bh=mp2CsehvKqem/lx+OexYDU/oBQK2yMbEYL7KsM3zEk0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZRvEfJQr+5aAL8Wr0B5VLaIaauhJhaJeMRcXsif5m8oHd+Q+5j7G5LSKn95WPaM4hQ7KYWpePdfWwI1K6KZ70dS3SfucMscKJxv/If2Hfb0A7KtnVXGKgZJNP7Pnuk/tAXUpYqZB6VTZo5cBgPWBwng/Uxy/15XLDbOAMwQbwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=bji4hMnN reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="bji4hMnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=p17wyMtonYAQUADLGWTScq4n6sxeET0p55+B5KQ9WCU=; b=b
	ji4hMnNkUfdiRrheqU2nhsFtDk80YN1tS22La//IBIbHBi1XoQWcCCCrYmlNk/7W
	xjs/0h8i8q35eCkKL8tuIvKCFK6RQKZH/vCQeOPd7I2BBjH6kCuQVCQHjhmob8dw
	sWhPLkgKCVyrGgJOKtc4+yHs/iwHLJ/H+4Ga7V1KE4=
Received: from xavier_qy$163.com ( [2408:820c:340b:d070:c540:cde:b0c8:b3ab]
 ) by ajax-webmail-wmsvr-40-117 (Coremail) ; Wed, 9 Apr 2025 23:15:13 +0800
 (CST)
Date: Wed, 9 Apr 2025 23:15:13 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Lance Yang" <ioworker0@gmail.com>
Cc: "Dev Jain" <dev.jain@arm.com>, akpm@linux-foundation.org,
	baohua@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, will@kernel.org
Subject: Re:Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAK1f24nR9kYE7OA3onPYi0_jYeAPeX-yqLCFh8GJOkUuZOt45g@mail.gmail.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
 <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
 <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <CAK1f24nR9kYE7OA3onPYi0_jYeAPeX-yqLCFh8GJOkUuZOt45g@mail.gmail.com>
X-NTES-SC: AL_Qu2fBv6avk8q5Saebekfmk4QgeY+WMW1vP4m34NSN5FwjD/pywkgQGVSIETq9eO0NCSzmgmGehVR0OBiRbhaTaA3/FwUOmzmXNlPer6WIiUFBA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <20c9bd15.b2a7.1961b1e9e88.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dSgvCgBnrWMBj_ZnwbSSAA--.27509W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTgcqEGf18hkl0QAIs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBMYW5jZSwKCgpBdCAyMDI1LTA0LTA4IDE3OjE3OjI3LCAiTGFuY2UgWWFuZyIgPGlvd29y
a2VyMEBnbWFpbC5jb20+IHdyb3RlOgo+T24gVHVlLCBBcHIgOCwgMjAyNSBhdCAxMjoxOeKAr0FN
IERldiBKYWluIDxkZXYuamFpbkBhcm0uY29tPiB3cm90ZToKPj4KPj4KPj4gSGkgWGF2aWVyLAo+
Pgo+PiBPbiAwNy8wNC8yNSA3OjAxIHBtLCBMYW5jZSBZYW5nIHdyb3RlOgo+PiA+IE9uIE1vbiwg
QXByIDcsIDIwMjUgYXQgODo1NuKAr1BNIFhhdmllciA8eGF2aWVyX3F5QDE2My5jb20+IHdyb3Rl
Ogo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+PiBIaSBMYW5jZSwKPj4gPj4KPj4gPj4gVGhhbmtzIGZv
ciB5b3VyIGZlZWRiYWNrLCBteSByZXNwb25zZSBpcyBhcyBmb2xsb3dzLgo+PiA+Pgo+PiA+PiAt
LQo+PiA+PiBUaGFua3MsCj4+ID4+IFhhdmllcgo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+
Pgo+PiA+PiBBdCAyMDI1LTA0LTA3IDE5OjI5OjIyLCAiTGFuY2UgWWFuZyIgPGlvd29ya2VyMEBn
bWFpbC5jb20+IHdyb3RlOgo+PiA+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIFdvdWxkIHRoZSBm
b2xsb3dpbmcgY2hhbmdlIGJlIGJldHRlcj8KPj4gPj4+Cj4+ID4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9tbS9jb250cHRlLmMgYi9hcmNoL2FybTY0L21tL2NvbnRwdGUuYwo+PiA+Pj4gaW5k
ZXggNTUxMDdkMjdkM2Y4Li42NGViM2IyZmJmMDYgMTAwNjQ0Cj4+ID4+PiAtLS0gYS9hcmNoL2Fy
bTY0L21tL2NvbnRwdGUuYwo+PiA+Pj4gKysrIGIvYXJjaC9hcm02NC9tbS9jb250cHRlLmMKPj4g
Pj4+IEBAIC0xNzQsNiArMTc0LDkgQEAgcHRlX3QgY29udHB0ZV9wdGVwX2dldChwdGVfdCAqcHRl
cCwgcHRlX3Qgb3JpZ19wdGUpCj4+ID4+Pgo+PiA+Pj4gICAgICAgICAgICAgICAgaWYgKHB0ZV95
b3VuZyhwdGUpKQo+PiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBvcmlnX3B0ZSA9IHB0ZV9t
a3lvdW5nKG9yaWdfcHRlKTsKPj4gPj4+ICsKPj4gPj4+ICsgICAgICAgICAgICAgIGlmIChwdGVf
eW91bmcob3JpZ19wdGUpICYmIHB0ZV9kaXJ0eShvcmlnX3B0ZSkpCj4+ID4+PiArICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+PiA+Pj4gICAgICAgIH0KPj4KPj4gUXVpdGUgdGhlIGNvaW5j
aWRlbmNlLCBJIHdhcyB0aGlua2luZyBvZiBkb2luZyBleGFjdGx5IHRoaXMgc29tZSBkYXlzCj4+
IGJhY2sgYW5kIHRlc3RpbmcgaXQgb3V0IDogKSBDYW4geW91IGRvIGEgbWljcm9hbmFseXNpcyB3
aGV0aGVyIHRoaXMgZ2V0cwo+PiB1cyBhIGJlbmVmaXQgb3Igbm90PyBUaGlzIGxvb2tzIGxpa2Ug
YW4gb3B0aW1pemF0aW9uIG9uIHBhcGVyIGJ1dCBtYXkKPj4gbm90IGJlIG9uZSBhZnRlciBhbGwg
YmVjYXVzZSBDT05UX1BURVMgaXMgb25seSAxNiBhbmQgYSBzaW1wbGUgbG9vcAo+PiB3aXRob3V0
IGV4dHJhIGlmLWNvbmRpdGlvbnMgbWF5IGp1c3QgYmUgZmFzdGVyLgo+Cj5ZZWFoLCBJIHdhcyB0
aGlua2luZyB0aGUgc2FtZSA7KQo+Cj5UaGlzIGNoYW5nZSBzZWVtcyByZWFzb25hYmxlIGluIHRo
ZW9yeS4gQnV0IHdpdGggQ09OVF9QVEVTPTE2LCBrZWVwaW5nCj5pdCBzaW1wbGUgbWlnaHQgYWN0
dWFsbHkgYmUgZmFzdGVyLCBJTU8uCgpQbGVhc2UgdGFrZSBhIGxvb2sgYXQgcGF0Y2ggdjIuIEkn
dmUgdXBkYXRlZCB0aGUgY29kZSB3aXRob3V0IGludHJvZHVjaW5nIGFueQphZGRpdGlvbmFsIGNo
ZWNrcy4gVGhlIG51bWJlciBvZiBjaGVja3MgaW4gdGhlIG5ldyBwYXRjaCBpcyBkZWZpbml0ZWx5
IGxlc3MgdGhhbgpvciBlcXVhbCB0byB0aGF0IGluIHRoZSBvcmlnaW5hbCBjb2RlLgoKLS0KVGhh
bmtzLApYYXZpZXIKCgo+Cj5UaGFua3MsCj5MYW5jZQo+Cj4+Cj4+ID4+Pgo+PiA+Pj4gICAgICAg
IHJldHVybiBvcmlnX3B0ZTsKPj4gPj4+IC0tCj4+ID4+Pgo+PiA+Pj4gV2UgY2FuIGNoZWNrIHRo
ZSBvcmlnX3B0ZSBmbGFncyBkaXJlY3RseSBpbnN0ZWFkIG9mIHVzaW5nIGV4dHJhIGJvb2xlYW4K
Pj4gPj4+IHZhcmlhYmxlcywgd2hpY2ggZ2l2ZXMgdXMgYW4gZWFybHktZXhpdCB3aGVuIGJvdGgg
ZGlydHkgYW5kIHlvdW5nIGZsYWdzCj4+ID4+PiBhcmUgc2V0Lgo+PiA+PiBZb3VyIHdheSBvZiB3
cml0aW5nIHRoZSBjb2RlIGlzIGluZGVlZCBtb3JlIGNvbmNpc2UuIEhvd2V2ZXIsIEkgdGhpbmsK
Pj4gPj4gICB1c2luZyBib29sZWFuIHZhcmlhYmxlcyBtaWdodCBiZSBtb3JlIGVmZmljaWVudC4g
QWx0aG91Z2ggaXQgaW50cm9kdWNlcwo+PiA+PiAgIGFkZGl0aW9uYWwgdmFyaWFibGVzLCBjb21w
YXJpbmcgYm9vbGVhbiB2YWx1ZXMgaXMgbGlrZWx5IHRvIGJlIG1vcmUKPj4gPj4gICBlZmZpY2ll
bnQgdGhhbiBjaGVja2luZyBiaXQgc2V0dGluZ3MuCj4+ID4+Cj4+ID4+Pgo+PiA+Pj4gQWxzbywg
aXMgdGhpcyBvcHRpbWl6YXRpb24gcmVhbGx5IG5lZWRlZCBmb3IgdGhlIGNvbW1vbiBjYXNlPwo+
PiA+PiBUaGlzIGZ1bmN0aW9uIGlzIG9uIGEgaGlnaC1mcmVxdWVuY3kgZXhlY3V0aW9uIHBhdGgu
IER1cmluZyBkZWJ1Z2dpbmcsCj4+ID4+ICAgSSBmb3VuZCB0aGF0IGluIG1vc3QgY2FzZXMsIHRo
ZSBmaXJzdCBmZXcgcGFnZXMgYXJlIGFscmVhZHkgbWFya2VkIGFzCj4+ID4+ICAgYm90aCBkaXJ0
eSBhbmQgeW91bmcuIEJ1dCBjdXJyZW50bHksIHRoZSBwcm9ncmFtIHN0aWxsIGhhcyB0byBjb21w
bGV0ZQo+PiA+PiAgIHRoZSBlbnRpcmUgbG9vcCBvZiAxNiBwdGVwIGl0ZXJhdGlvbnMsIHdoaWNo
IHNlcmlvdXNseSByZWR1Y2VzIHRoZSBlZmZpY2llbmN5Lgo+PiA+Cj4+ID4gSG1tLi4uIGFncmVl
ZCB0aGF0IHRoaXMgcGF0Y2ggaGVscHMgd2hlbiBlYXJseSBQVEVzIGFyZSBkaXJ0eS95b3VuZywg
YnV0Cj4+ID4gZm9yIGxhdGUtb25lcy1vbmx5IGNhc2VzLCBpdCBvbmx5IGludHJvZHVjZXMgb3Zl
cmhlYWQgd2l0aCBubyBiZW5lZml0LCBJSVVDLgo+PiA+Cj4+ID4gU28sIGxldCdzIHdhaXQgZm9y
IGZvbGtzIHRvIHRha2UgYSBsb29rIDspCj4+ID4KPj4gPiBUaGFua3MsCj4+ID4gTGFuY2UKPj4g
Pgo+PiA+Pj4KPj4gPj4+IFRoYW5rcywKPj4gPj4+IExhbmNlCj4+ID4KPj4KCgo=

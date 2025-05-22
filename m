Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537081C5489;
	Thu, 22 May 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907825; cv=none; b=cjjlnT6wj2+VcY6n9rvnbZPiFUISa4zGd4IVg95OM5VW+TyHOx+Dnr6pQafK8AD4hYbH6ssLBALI5OoEW+6Mth8BEaceueswCIY0l8IEGOYScpOHmSam/8PleqdJ7QG3sgzQlcsi16ShgRtXI3f8zXgii5fFYwg22I0aTJX1ZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907825; c=relaxed/simple;
	bh=XjKIIcx3vLMme/sjaI9nyr8i3Pmp6qx3DPHpese1Jao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=W5KAl5Kv+CrK6cpfNN/kYC1EbqeWzH96u4s2wkfuVwduVXq+hJN/RZbyc1mxdwT2SakkcWVMmR3zqMXeEKWcOwBlvsLshSg4pORbC6HZu0igE68k04jRO6tbNnjS9C1uxpBiqVKrNgXQG0j+QK0tccto+mIuOB4BJfuUNAgj+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=WaiHNJNe reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="WaiHNJNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=okdYhAg1EMXOC1tTtA3Ehh6LzobI5jXkaIDyLZfblgk=; b=W
	aiHNJNey5FkSDAN2DAQY1AN6Ln5fO3oP0+wbEbQIiSi7IH5BhC20UCKM/ehB1EJa
	8R66N/gNKxOkVIxefG19u8HL9DmpqIiwQat8AZqYQELGeZsdZvn9D5K+W+AHrDSq
	k4DnknWzcKjDsMFu57wKAMrv6/aGHyBX16iJX9+TLw=
Received: from 00107082$163.com ( [111.35.189.95] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Thu, 22 May 2025 17:56:34 +0800
 (CST)
Date: Thu, 22 May 2025 17:56:34 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, oneukum@suse.com, stern@rowland.harvard.edu,
	hminas@synopsys.com, rui.silva@linaro.org, jgross@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] USB: xhci: use urb hcpriv mempool for private
 data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <2025052211-oxidizing-tannery-de3f@gregkh>
References: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
 <5f14d11e4c651f9e856d760bc8b45ea7ac863b2f.1747897366.git.00107082@163.com>
 <2025052211-oxidizing-tannery-de3f@gregkh>
X-NTES-SC: AL_Qu2fBfWbuE8i4iCZZukZnEYQheY4XMKyuPkg1YJXOp80siTL9w4MZm9zFkDN986wFQWhoAiIdylMx/1of7R9bZJVNX/HNQ3LFeP/ZbF4qrek
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <45b6468c.9346.196f76c5461.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgCnjwPS9C5o0M0KAA--.22592W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBBVqmgu58u1pQAFsA
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNS0wNS0yMiAxNjozMjo0MCwgIkdyZWcgS0giIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4gd3JvdGU6Cj5PbiBUaHUsIE1heSAyMiwgMjAyNSBhdCAwMzoxMDoxMFBNICswODAwLCBE
YXZpZCBXYW5nIHdyb3RlOgo+PiB4aGNpIGtlZXBzIGFsbG9jL2ZyZWUgcHJpdmF0ZSBkYXRhIGZv
ciBlYWNoIGVucXVldWUvZGVxdWV1ZSBjeWNsZXMsCj4+IHdoZW4gdXNpbmcgYSBVU0Igd2ViY2Ft
LCBhbGxvY2F0aW9uIHJhdGUgaXMgfjI1MC9zOwo+PiB3aGVuIHVzaW5nIGEgVVNCIG1pYywgYWxs
b2NhdGlvbiByYXRlIHJlYWNoZXMgfjFrL3M7Cj4+IFRoZSBtb3JlIHVzYiBkZXZpY2UgaW4gdXNl
LCB0aGUgaGlnaGVyIGFsbG9jYXRpb24gcmF0ZS4KPj4gCj4+IFVSQiBvYmplY3RzIGhhdmUgbG9u
Z2VyIGxpZmVzcGFuIHRoYW4gcHJpdmF0ZSBkYXRhLCBoYW5kIG92ZXIgb3duZXJzaGlwCj4+IG9m
IHByaXZhdGUgZGF0YSB0byB1cmIgY2FuIHNhdmUgbG90cyBvZiBtZW1vcnkgYWxsb2NhdGlvbnMg
b3ZlciB0aW1lLgo+PiBXaXRoIHRoaXMgY2hhbmdlLCBubyBleHRyYSBtZW1vcnkgYWxsb2NhdGlv
biBpcyBuZWVkZWQgZHVyaW5nIHVzYWdlcyBvZgo+PiBVU0Igd2ViY2FtL21pYy4KPj4gCj4+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIFdhbmcgPDAwMTA3MDgyQDE2My5jb20+Cj4+IC0tLQo+PiAgZHJp
dmVycy91c2IvaG9zdC94aGNpLW1lbS5jICB8IDEgKwo+PiAgZHJpdmVycy91c2IvaG9zdC94aGNp
LXJpbmcuYyB8IDMgKy0tCj4+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyAgICAgIHwgOCArKyst
LS0tLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJpdmVy
cy91c2IvaG9zdC94aGNpLW1lbS5jCj4+IGluZGV4IGQ2OTgwOTVmYzg4ZC4uYjE5ZTQxY2YxYzRj
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmMKPj4gKysrIGIvZHJp
dmVycy91c2IvaG9zdC94aGNpLW1lbS5jCj4+IEBAIC0xNzQ1LDYgKzE3NDUsNyBAQCBzdHJ1Y3Qg
eGhjaV9jb21tYW5kICp4aGNpX2FsbG9jX2NvbW1hbmRfd2l0aF9jdHgoc3RydWN0IHhoY2lfaGNk
ICp4aGNpLAo+PiAgCj4+ICB2b2lkIHhoY2lfdXJiX2ZyZWVfcHJpdihzdHJ1Y3QgdXJiX3ByaXYg
KnVyYl9wcml2KQo+PiAgewo+PiArCVdBUk5fT05DRSgxLCAieGhjaSBwcml2YXRlIGRhdGEgc2hv
dWxkIGJlIG1hbmFnZWQgYnkgdXJiIik7Cj4KPllvdSBqdXN0IGNyYXNoZWQgdGhlIGtlcm5lbCBp
ZiB0aGlzIGV2ZXIgZ2V0cyBoaXQuICBBcyB5b3UgYXJlIHNheWluZwo+dGhpcyBzaG91bGQgbmV2
ZXIgYmUgY2FsbGVkLCB3aHkgaXMgdGhpcyBmdW5jdGlvbiBldmVuIHByZXNlbnQgYW55bW9yZT8K
Pgo+VGhpcyBtYWtlcyBubyBzZW5zZSA6KAoKSSBtZWFudCB0byB3YXJuIGZ1cnRoZXIgY2hhbmdl
cyB0byB4aGNpOiAgYmV0dGVyIG5vdCBtYW5hZ2UgIHByaXZhdGUgZGF0YSAuCkkgZG9uJ3QgdGhp
bmsgaXQgd291bGQgY3Jhc2gsICAgeGhjaV91cmJfZnJlZV9wcml2IHNob3VsZCBub3QgIGJlIHBh
aXJlZCB3aXRoIAp1cmJfaGNwcml2X21lbXBvb2xfemFsbG9jLiAgKEJ1dCBub3RoaW5nIHByZXZl
bnQgaXQgdGhvdWdoLCBzYW1lIGFzIG5vdGhpbmcgCnByZXZlbnRzIHVyYl9oY3ByaXZfbWVtcG9v
bF96YWxsb2MgYmVpbmcgcGFpcmVkIHdpdGgga2ZyZWUuLi4uKQpJdCB3b3VsZCBiZSBiZXR0ZXIg
dG8gcmVtb3ZlIHRoZSB3aG9sZSBmdW5jdGlvbi4KCgo+Cj5BZ2FpbiwgTkVWRVIgYWRkIGEgV0FS
TiooKSBjYWxsIHRvIHRoZSBrZXJuZWwgZm9yIHNvbWV0aGluZyB0aGF0IGl0Cj5zaG91bGQgYmUg
aGFuZGxpbmcgcHJvcGVybHkgb24gaXRzIG93bi4gIE90aGVyd2lzZSB5b3UganVzdCBsb3N0IGFs
bCB0aGUKPnVzZXIncyBkYXRhIHdoZW4gdGhlIGJveCBnb3QgcmVib290ZWQgKGFuZCBpZiB1c2Vy
c3BhY2UgY2FuIHRyaWdnZXIKPnRoaXMsIHlvdSBqdXN0IGNyZWF0ZWQgYSBuZXcgQ1ZFLi4uKQoK
Q29weSB0aGF0fiEKClRoYW5rc34KRGF2aWQKPgo+dGhhbmtzLAo+Cj5ncmVnIGstaAo=

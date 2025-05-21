Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE9B23504B;
	Wed, 21 May 2025 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841724; cv=none; b=No4lGjA4dhVPrCMdt6yaAmICmR7kX6yCkqBCcwUQPvTTsWtkumlKIxnnNHCKxK6Ildbfz+GNuzAD6/pUxdAb2aIdf3bt5f/9QVehGjX0c2wm+iTkZmLhnHARAMe06zQjoOKSZn379HfpQkgr9gXHRtB4ZbJMThQcxHmH448AubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841724; c=relaxed/simple;
	bh=XooCWNNRqdvEVYuLjZIbG1ceuypLG3gFSa95qeXEvfE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Kzva44tUJ4SpMYuPbUYigPjC8MQLZlSbS9Oowj/IXHWwCeJ6Ug93il7rE/+4Ug9Ol5qI2N5ZgBnjN/rzJQ/PUvtMCd8PvZ67DlhEs1uu8kJO7NWm9kU3odybUTuEgnXyo1Z8nLAomRwVTx3PGRZPVOlbvhP5Ug7N29nfheqD9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=oFrr2zGL reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="oFrr2zGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HX9rihR1zHLjYS5jyqHPAYE/ranZ14TkA50FbFx3orU=; b=o
	Frr2zGLthFHzFYVAcUkBUjXXLOSlZ120AH5LcIkqNWnIIuyCUTpX9LUY89c+Le28
	loAaGbNxdix/dnKKWpTsG+FuYH/ptqG+OYpduJUWHv5qIMBIfZegk28gwR3ZqXor
	9uwKQPl/9aRdKOSMEW9rWrbsUbxeNzGwvMuB3b6B9A=
Received: from 00107082$163.com ( [111.35.189.95] ) by
 ajax-webmail-wmsvr-40-135 (Coremail) ; Wed, 21 May 2025 23:34:33 +0800
 (CST)
Date: Wed, 21 May 2025 23:34:33 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, oneukum@suse.com,
	mathias.nyman@intel.com
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <5d02ca20.a42f.196f3251196.Coremail.00107082@163.com>
References: <20250517083819.6127-1-00107082@163.com>
 <2025052148-cannot-football-74e1@gregkh>
 <572f1814.9a08.196f2971eea.Coremail.00107082@163.com>
 <2025052132-sloped-strewn-397a@gregkh>
 <5d02ca20.a42f.196f3251196.Coremail.00107082@163.com>
X-NTES-SC: AL_Qu2fBfSfvk4s5SeZYukZnEYQheY4XMKyuPkg1YJXOp80hiXs5y0de1tdNELQyv2tARCglDysXjJszPZVeZNJZIy7KvkByAZv0zRQ0kTHlPVY
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <69909e94.a8db.196f37b69fb.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3_waK8i1oKAQKAA--.25306W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gdUqmgt31KRMgAEsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNS0wNS0yMSAyMjowMDoxNCwgIkRhdmlkIFdhbmciIDwwMDEwNzA4MkAxNjMuY29tPiB3
cm90ZToKPgo+V2hlbiBsb29raW5nIGluIGNvZGVzLCBJIG5vdGljZSB4ZW4taGNkIGhhdmUgYWxy
ZWFkeSBpbXBsZW1lbnRlZCBhIG1lbXBvb2wsIGZvciBleGFtcGxlOgo+ZHJpdmVycy91c2IvaG9z
dC94ZW4taGNkLmMKPjEzMjMgc3RhdGljIGludCB4ZW5oY2RfdXJiX2VucXVldWUoc3RydWN0IHVz
Yl9oY2QgKmhjZCwgc3RydWN0IHVyYiAqdXJiCj4uLi4KPjEzMzQgICAgICAgICB1cmJwID0ga21l
bV9jYWNoZV96YWxsb2MoeGVuaGNkX3VyYnBfY2FjaGVwLCBtZW1fZmxhZ3MpOwo+MTMzNSAgICAg
ICAgIGlmICghdXJicCkKPjEzMzYgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+MTMz
NyAKPjEzMzggICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW5mby0+bG9jaywgZmxhZ3MpOwo+
MTMzOSAKPjEzNDAgICAgICAgICB1cmJwLT51cmIgPSB1cmI7Cj4xMzQxICAgICAgICAgdXJiLT5o
Y3ByaXYgPSB1cmJwOwo+MTM0MiAgICAgICAgIHVyYnAtPnJlcV9pZCA9IH4wOwo+Cj5CdXQgbW9z
dCBvdGhlcnMgc3RpbGwgdXNlIGt6YWxsb2MuICAgCj5CZXR3ZWVuIGttZW1fY2FjaGUgYW5kIGEg
bWVtIHNsb3QgaW4gVVJCLCBJIHdhbnQgc2F5IHRoZSBtZW0gc2xvdCBpbiBVUkIgaXMgbWFuYWdl
ZCBtb3JlIGVmZmljaWVudGx5L2JhbGFuY2VkLAo+YW5kIHdvdWxkIGl0IGJlICBoZWFsdGh5IHRv
IGFkZCBrbWVtX2NhY2hlIGluIGVhY2ggaGNkcyBhcyB0aGV5IHNlZSB0aGUgbmVlZHMsIHdlIHdv
dWxkIGhhdmUgc2VwYXJhdGVkIGttZW1fY2FjaGUKPmV2ZXJ5d2hlcmUuCj4KPgo+VGhhbmtzCj5E
YXZpZAoKaGNkcyBmb3VuZCB1c2luZyBrbWVtX2NhY2hlICBmb3IgaGMgcHJpdmF0ZSBkYXRhOgoK
Li9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jOgkJaHNvdGctPmRlc2NfZ2VuX2NhY2hlID0ga21lbV9j
YWNoZV9jcmVhdGUoImR3YzItZ2VuLWRlc2MiLAouL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmM6CQlo
c290Zy0+ZGVzY19oc2lzb2NfY2FjaGUgPSBrbWVtX2NhY2hlX2NyZWF0ZSgiZHdjMi1oc2lzb2Mt
ZGVzYyIsCi4vZHJpdmVycy91c2IvZHdjMi9oY2QuYzoJCWhzb3RnLT51bmFsaWduZWRfY2FjaGUg
PSBrbWVtX2NhY2hlX2NyZWF0ZSgiZHdjMi11bmFsaWduZWQtZG1hIiwKLi9kcml2ZXJzL3VzYi9p
c3AxNzYwL2lzcDE3NjAtaGNkLmM6CXVyYl9saXN0aXRlbV9jYWNoZXAgPSBrbWVtX2NhY2hlX2Ny
ZWF0ZSgiaXNwMTc2MF91cmJfbGlzdGl0ZW0iLAouL2RyaXZlcnMvdXNiL2lzcDE3NjAvaXNwMTc2
MC1oY2QuYzoJcXRkX2NhY2hlcCA9IGttZW1fY2FjaGVfY3JlYXRlKCJpc3AxNzYwX3F0ZCIsCi4v
ZHJpdmVycy91c2IvaXNwMTc2MC9pc3AxNzYwLWhjZC5jOglxaF9jYWNoZXAgPSBrbWVtX2NhY2hl
X2NyZWF0ZSgiaXNwMTc2MF9xaCIsIHNpemVvZihzdHJ1Y3QgaXNwMTc2MF9xaCksCi4vZHJpdmVy
cy91c2IvaG9zdC91aGNpLWhjZC5jOgl1aGNpX3VwX2NhY2hlcCA9IGttZW1fY2FjaGVfY3JlYXRl
KCJ1aGNpX3VyYl9wcml2IiwKLi9kcml2ZXJzL3VzYi9ob3N0L3hlbi1oY2QuYzoJeGVuaGNkX3Vy
YnBfY2FjaGVwID0ga21lbV9jYWNoZV9jcmVhdGUoInhlbmhjZF91cmJfcHJpdiIsCgpJIHRoaW5r
IHRob3NlIGhjZHMgaGF2ZSBhbHJlYWR5IGNvbnNpZGVyZWQgdGhlIGhpZ2ggZnJlcXVlbmN5IG9m
IG1lbW9yeSBhbGxvY2F0aW9uIGZvciBwcml2YXRlIGRhdGEgIGFzIGFuIGlzc3VlIGFuZAphZGRy
ZXNzIGl0IHZpYSBhIGNvbnN0IHNpemVkIG1lbW9yeSBwb29sLi4KeGhjaSBjb3VsZCBub3QgZm9s
bG93IHRoaXMgcGF0dGVybiBzaW5jZSBpdCBuZWVkcyBhIHZhcmlhYmxlIGxlbmd0aCBtZW1vcnku
CkJ1dCBpcyB0aGlzIGEgZ29vZCBwYXR0ZXJuIHRvIGZvbGxvdz8gQSBzaW5nbGUgc2xvdCBvZiBt
ZW1vcnkgaW4gVVJCIGNhbiBoYW5kbGUgYWxsIHRob3NlIHJlcXVlc3QuCgoKVGhhbmtzCkRhdmlk
CiAgCgo=

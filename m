Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FA74CB5B;
	Wed, 21 May 2025 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833848; cv=none; b=hOgxILDvxMn1m4OwSvoN+GYva74iTj9KdLYNo/WR83R2zKj+24mRo1fl9jJfxy/1eNSvoNKf2e5eSKv9GXNmP43dkNUl1B4H+jkxNryxsIIRMC44CD5f1bBdA7MAQztr9Ekg7mPe4tHgjqpV/qcwpBcBJSHpVeMxUj6RcJ3xLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833848; c=relaxed/simple;
	bh=CUGajLlg1XnQmwwrLHHWnGnjQ2xDxF9As14gJBZZZVs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=FWXsrDZmYQEdPlSmCifYFqBu6gZ5jpxdxnp33AqI+2/3VG2OH3zUDP/9cqIxm/820pV7fdd9mliV1QsiQFCqlp8ZOJd/tMZgrQIDeYPUaYjyUDBasoyRtivmiQWZ25Bwl2twyi1mzip2Flaf9xYVBgNTTbTE+CxnNNp33c6sCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=oKXaKvr8 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="oKXaKvr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=a5dNVSXt6TNtSMCQgez6UuCPV4F7hGDEi5COSwRV7AM=; b=o
	KXaKvr8rsNAkC6uK2CzFIoAoqgTfq48LiP97liQo0wbw6joAqNoOQiu/dIS6FejD
	dAT4HSnyXjap1c4MuChMhgyueg/8KWdY2aUzczisEvh6vx0AfiT1pB/wchAWP2v+
	doOJRqIBAfed9G7v07rAfbYipIQn4lxe7tyGOQDLps=
Received: from 00107082$163.com ( [111.35.189.95] ) by
 ajax-webmail-wmsvr-40-135 (Coremail) ; Wed, 21 May 2025 21:23:45 +0800
 (CST)
Date: Wed, 21 May 2025 21:23:45 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Mathias Nyman" <mathias.nyman@intel.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <e6f782db-5818-4d6c-99e0-bcf300fc5b4f@intel.com>
References: <20250517083819.6127-1-00107082@163.com>
 <e6f782db-5818-4d6c-99e0-bcf300fc5b4f@intel.com>
X-NTES-SC: AL_Qu2fBfSYvEAp4yiYYukZnEYQheY4XMKyuPkg1YJXOp80hiXs5y0de1tdNELQyv2tARCglDysXjJszPZVeZNJZIzyTXUGfkExsDiBt9Uqo4Jx
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <49228bf7.a1d1.196f303aa15.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3fxLi0y1oGPsJAA--.25514W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqBBUqmgtygNpkAAFs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMjEgMjA6Mjg6MTcsICJNYXRoaWFzIE55bWFuIiA8bWF0aGlhcy5ueW1hbkBp
bnRlbC5jb20+IHdyb3RlOgo+T24gMTcuNS4yMDI1IDExLjM4LCBEYXZpZCBXYW5nIHdyb3RlOgo+
PiAtLS0KPj4gQ2hhbmdlcyBzaW5jZSB2MjoKPj4gMS4gYWN0aXZhdCB0aGUgcG9vbCBvbmx5IHdo
ZW4gdGhlIHVyYiBvYmplY3QgaXMgY3JlYXRlZCB2aWEKPj4gdXNiX2FsbG9jX3VyYigpCj4+IFRo
YW5rcyB0byBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPidzIHJldmlldy4KPj4gLS0t
Cj4+IFVSQiBvYmplY3RzIGhhdmUgbG9uZyBsaWZlY3ljbGUsIGFuIHVyYiBjYW4gYmUgcmV1c2Vk
IGJldHdlZW4KPj4gc3VibWl0IGxvb3BzOyBUaGUgcHJpdmF0ZSBkYXRhIG5lZWRlZCBieSBzb21l
IGhvc3QgY29udHJvbGxlcgo+PiBoYXMgdmVyeSBzaG9ydCBsaWZlY3ljbGUsIHRoZSBtZW1vcnkg
aXMgYWxsb2NlZCB3aGVuIGVucXVldWUsIGFuZAo+PiByZWxlYXNlZCB3aGVuIGRlcXVldWUuIEZv
ciBleGFtcGxlLCBvbiBhIHN5c3RlbSB3aXRoIHhoY2ksIGluCj4+IHhoY2lfdXJiX2VucXVldWU6
Cj4+IFVzaW5nIGEgVVNCIHdlYmNhbSB3b3VsZCBoYXZlIH4yNTAvcyBtZW1vcnkgYWxsb2NhdGlv
bjsKPj4gVXNpbmcgYSBVU0IgbWljIHdvdWxkIGhhdmUgfjFLL3MgbWVtb3J5IGFsbG9jYXRpb247
Cj4+IAo+PiBIaWdoIGZyZXF1ZW50IGFsbG9jYXRpb25zIGZvciBob3N0LWNvbnRyb2xsZXIgcHJp
dmF0ZSBkYXRhIGNhbiBiZQo+PiBhdm9pZGVkIGlmIHVyYiB0YWtlIG92ZXIgdGhlIG93bmVyc2hp
cCBvZiBtZW1vcnksIHRoZSBtZW1vcnkgdGhlbiBzaGFyZXMKPj4gdGhlIGxvbmdlciBsaWZlY3lj
bGUgd2l0aCB1cmIgb2JqZWN0cy4KPj4gCj4+IEFkZCBhIG1lbXBvb2wgdG8gdXJiIGZvciBoY3By
aXYgdXNhZ2UsIHRoZSBtZW1wb29sIG9ubHkgaG9sZHMgb25lIGJsb2NrCj4+IG9mIG1lbW9yeSBh
bmQgZ3Jvd3Mgd2hlbiBsYXJnZXIgc2l6ZSBpcyByZXF1ZXN0ZWQuCj4+IAo+PiBUaGUgbWVtcG9v
bCBpcyBhY3RpdmF0ZWQgb25seSB3aGVuIHRoZSBVUkIgb2JqZWN0IGlzIGNyZWF0ZWQgdmlhCj4+
IHVzYl9hbGxvY191cmIoKSBpbiBjYXNlIHNvbWUgZHJpdmVycyBjcmVhdGUgYSBVUkIgb2JqZWN0
IGJ5IG90aGVyCj4+IG1lYW5zIGFuZCBtYW5hZ2UgaXQgbGlmZWN5Y2xlIHdpdGhvdXQgY29ycmVz
cG9uZGluZyB1c2JfZnJlZV91cmIuCj4KPldvbid0IHRoaXMgc3RpbGwgYWxsb2NhdGUgYSBsb3Qg
b2YgdW5uZWNlc3NhcnkgbWVtb3J5IGZvciB0aGUgcm9vdGh1YiB1cmJzPwo+aS5lLiB0aGUgb25l
cyBxdWV1ZWQgd2l0aCByaF91cmJfZW5xdWV1ZShoY2QsIHVyYikuCj5UaGUgaG9zdCBkcml2ZXJz
IGRvbid0IHVzZSB0aGUgdXJiLT5oY3ByaXYgb2YgdGhvc2UgVVJCcy4KPgpUaGUgbWVtcG9vbCBz
bG90IGlzIGFsbG9jZWQgb24gZGVtYW5kIHdoZW4gaGNkIHJlcXVlc3QgcHJpdmF0ZSBkYXRhIHdp
dGggaXRzIHVyYi4KSWYgYSB1cmIgaXMgIGV2ZXIgdXNlZCBieSBoY2QgYW5kIHRoZSAgaGNkIHJl
cXVlc3RzIHByaXZhdGUgZGF0YSB3aXRoIGl0LCBhICBtZW1vcnkgd291bGQgYmUgYWxsb2NlZAph
bmQgdGhpcyBtZW1vcnkgd2lsbCBub3QgYmUgcmVsZWFzZWQgdW50aWwgdGhlIHVyYiBpcyBkZXN0
cm95ZWQuCgpJZiB0aG9zZSBVUkIga2VlcHMgYmVpbmcgcmV1c2VkLCB0aGFuIHRoZSBtZW1wb29s
IHNsb3Qgd2l0aGluIGl0IGNhbiBiZSByZXVzZWQgYnkgaGNkcyB3aGljaCBnZXQgaG9sZCBvbiBp
dC4KCkFuZCB5ZXMsIGl0IGEgVVJCIGlzIHVzZWQgb25seSBvbmNlIG9yIHVzZWQgdmVyeSB1bmZy
ZXF1ZW50bHksIGFuZCBoY2QgbmVlZHMgcHJpdmF0ZSBkYXRhIHdpdGggaXQsIHRoZSBtZW1wb29s
CnNsb3Qgd291bGQgYmUgYWxsb2NlZCB3aXRoIGl0IGFuZCB3b3VsZCBiZSBhIHZlcnkgdXNlbGVz
cyBtZW1wb29sIHNsb3QsIHdhc3RpbmcgbWVtb3J5LgoKPlRoaXMgd291bGQgYmUgdGhlIHJvb3Ro
dWIgc3RhdHVzIFVSQiwgYW5kIGV2ZXJ5IGh1YiByZXF1ZXN0IHNlbnQKPmR1cmluZyBkZXZpY2Ug
ZW51bWVyYXRpb24gZm9yIGRldmljZXMgY29ubmVjdGVkIHRvIHRoZSByb290aHViLgoKPgo+SXMg
dGhpcyB3aG9sZSBVUkIgaGNwcml2IG1lbXBvb2wgYWRkaXRpb24gYW4gYWN0dWFsIGlzc3VlIHRo
YXQgbmVlZHMgZml4aW5nPwoKTk8sIG5vdCBhbiBpc3N1ZSwganVzdCBtZWFudCB0byBhdm9pZCBt
ZW1vcnkgYWxsb2NhdGlvbnMsIGxvdHMgb2YgYWxsb2NhdGlvbiwgdG8gdGhlb3JldGljYWxseSAg
aW1wcm92ZSB0aGluZ3MuLgoKPgo+SWYgeWVzIHRoZW4gSSBzdGlsbCB0aGluayBpdCdzIGJldHRl
ciB0byBkbyBpdCBpbiB0aGUgaG9zdCBkcml2ZXIgbGlrZSBJCj5kZXNjcmliZWQgZWFybGllci4g
SSBkb24ndCB0aGluayBpdCB3aWxsIGJlIHRvbyBjb21wbGV4Cj4KPlRoYW5rcwo+LU1hdGhpYXMK
Pgo+Cg==

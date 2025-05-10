Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DDD846F
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746846650; cv=none; b=szSfHRrmqGnChUkur7cbovF/zabL5ceRHPkxUfl82zoT7ZaJUm+CSAKkbHyy+hzweCHLGkiJlVHqfYmqszkdawKQKyX9jGnOE1oNPx09Df74WB1WkO3Mmt/Ihh7ykMQHbK83B10LmZp8dkjh/CXtVFT8EVhmPlOWXiyO5PqhHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746846650; c=relaxed/simple;
	bh=CAgHGSxCvrBE9rW8K/6Dj0MxZd8Dgot57x2MAuXnQ2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=QPBbAVpFiWjMnuW2tcIqXRMk6FD7+D9E6/Qs31gcKHvj00qPPZ49J4Hs+Qh6zxJrqMcgAyq0YyFaZ3HkkYST11oniLckkXRCM1uT6YQyTj2omMb5Ue191KdLclPPvs4n9QyWRB7Vy8oErFsKnG73zVr7YX6iDMl6Fbo+vnUJbEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Dc7vaGyD reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Dc7vaGyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=liqVt+y/MENWHPAiidgPdcKn8HEolOEYJQaAWDXSlcA=; b=D
	c7vaGyDj43tcllREAY+LIzGrNw8YrVaVZVvWyNZbRLQ91viLiqDQnwW+7XUGFFbR
	sEsmvOLyMa0RipIYtXHeylhoXz+hPUKUiFLcLuVYnuYdOP+mQwCTVdXY+WI2ABgn
	WS5yfFARmhXj1yZOCqMOZuURLswbSciuMrR6XnXWAM=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-128 (Coremail) ; Sat, 10 May 2025 11:10:04 +0800
 (CST)
Date: Sat, 10 May 2025 11:10:04 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Suren Baghdasaryan" <surenb@google.com>
Cc: "Tim Chen" <tim.c.chen@linux.intel.com>, kent.overstreet@linux.dev,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between
 read() calls
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAJuCfpFLqTR=KfkstR-iRQvE7ZQMsr9=jXj6C4VdFq-Ebq6mvQ@mail.gmail.com>
References: <20250507175500.204569-1-00107082@163.com>
 <20250509173929.42508-1-00107082@163.com>
 <7f237574d9f08a9fa8dcaa60d2edf8d8e91441d4.camel@linux.intel.com>
 <CAJuCfpHB8T8daanvE_wowRD9-sAo30rtCcFfMPZL_751+KSs5w@mail.gmail.com>
 <294d0743c0b2e5c409857ef81a6fe8baaf87727f.camel@linux.intel.com>
 <CAJuCfpF=u-LpR6S+XmwPe8a6h4knzP2Nu5WFp=Rdvqa14vOzDA@mail.gmail.com>
 <CAJuCfpFLqTR=KfkstR-iRQvE7ZQMsr9=jXj6C4VdFq-Ebq6mvQ@mail.gmail.com>
X-NTES-SC: AL_Qu2fBPSfuU4r4iSQYOkZnEYQheY4XMKyuPkg1YJXOp80liTj+QsqeHJmM2fy0MWCMhmgvRWIThZo2P9Ff7J6UbI3tyWRlCbZhr3wKmxlG/6j
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3cbaf905.ef7.196b82bdcc9.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gCgvCgD3_wSNwx5omyoBAA--.8290W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBxJqmgevNQrKQADsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTAgMDU6MTU6NDMsICJTdXJlbiBCYWdoZGFzYXJ5YW4iIDxzdXJlbmJAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj5PbiBGcmksIE1heSA5LCAyMDI1IGF0IDE6NDbigK9QTSBTdXJlbiBC
YWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPiB3cm90ZToKPj4KPj4gT24gRnJpLCBNYXkg
OSwgMjAyNSBhdCAxMjo0NuKAr1BNIFRpbSBDaGVuIDx0aW0uYy5jaGVuQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6Cj4+ID4KPj4gPiBPbiBGcmksIDIwMjUtMDUtMDkgYXQgMTI6MzYgLTA3MDAsIFN1
cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPj4gPiA+IE9uIEZyaSwgTWF5IDksIDIwMjUgYXQgMTE6
MzPigK9BTSBUaW0gQ2hlbiA8dGltLmMuY2hlbkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+PiA+
ID4gPgo+PiA+ID4gPiBPbiBTYXQsIDIwMjUtMDUtMTAgYXQgMDE6MzkgKzA4MDAsIERhdmlkIFdh
bmcgd3JvdGU6Cj4+ID4gPiA+ID4KPj4gPiA+ID4gPgo+PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IERhdmlkIFdhbmcgPDAwMTA3MDgyQDE2My5jb20+Cj4+ID4gPgo+PiA+ID4gQWNrZWQtYnk6IFN1
cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4+ID4gPgo+PiA+ID4gPiA+IC0t
LQo+PiA+ID4gPiA+ICBsaWIvYWxsb2NfdGFnLmMgfCAyOSArKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLQo+PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTkg
ZGVsZXRpb25zKC0pCj4+ID4gPiA+ID4KPj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL2FsbG9j
X3RhZy5jIGIvbGliL2FsbG9jX3RhZy5jCj4+ID4gPiA+ID4gaW5kZXggMjVlY2MxMzM0YjY3Li5m
ZGQ1ODg3NzY5YTYgMTAwNjQ0Cj4+ID4gPiA+ID4gLS0tIGEvbGliL2FsbG9jX3RhZy5jCj4+ID4g
PiA+ID4gKysrIGIvbGliL2FsbG9jX3RhZy5jCj4+ID4gPiA+ID4gQEAgLTQ1LDIxICs0NSwxNiBA
QCBzdHJ1Y3QgYWxsb2NpbmZvX3ByaXZhdGUgewo+PiA+ID4gPiA+ICBzdGF0aWMgdm9pZCAqYWxs
b2NpbmZvX3N0YXJ0KHN0cnVjdCBzZXFfZmlsZSAqbSwgbG9mZl90ICpwb3MpCj4+ID4gPiA+ID4g
IHsKPj4gPiA+ID4gPiAgICAgICBzdHJ1Y3QgYWxsb2NpbmZvX3ByaXZhdGUgKnByaXY7Cj4+ID4g
PiA+ID4gLSAgICAgc3RydWN0IGNvZGV0YWcgKmN0Owo+PiA+ID4gPiA+ICAgICAgIGxvZmZfdCBu
b2RlID0gKnBvczsKPj4gPiA+ID4gPgo+PiA+ID4gPiA+IC0gICAgIHByaXYgPSBremFsbG9jKHNp
emVvZigqcHJpdiksIEdGUF9LRVJORUwpOwo+PiA+ID4gPiA+IC0gICAgIG0tPnByaXZhdGUgPSBw
cml2Owo+PiA+ID4gPiA+IC0gICAgIGlmICghcHJpdikKPj4gPiA+ID4gPiAtICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+PiA+ID4gPiA+IC0KPj4gPiA+ID4gPiAtICAgICBwcml2LT5wcmludF9o
ZWFkZXIgPSAobm9kZSA9PSAwKTsKPj4gPiA+ID4gPiArICAgICBwcml2ID0gKHN0cnVjdCBhbGxv
Y2luZm9fcHJpdmF0ZSAqKW0tPnByaXZhdGU7Cj4+ID4gPiA+ID4gICAgICAgY29kZXRhZ19sb2Nr
X21vZHVsZV9saXN0KGFsbG9jX3RhZ19jdHR5cGUsIHRydWUpOwo+PiA+ID4gPiA+IC0gICAgIHBy
aXYtPml0ZXIgPSBjb2RldGFnX2dldF9jdF9pdGVyKGFsbG9jX3RhZ19jdHR5cGUpOwo+PiA+ID4g
PiA+IC0gICAgIHdoaWxlICgoY3QgPSBjb2RldGFnX25leHRfY3QoJnByaXYtPml0ZXIpKSAhPSBO
VUxMICYmIG5vZGUpCj4+ID4gPiA+ID4gLSAgICAgICAgICAgICBub2RlLS07Cj4+ID4gPiA+ID4g
LQo+PiA+ID4gPiA+IC0gICAgIHJldHVybiBjdCA/IHByaXYgOiBOVUxMOwo+PiA+ID4gPiA+ICsg
ICAgIGlmIChub2RlID09IDApIHsKPj4gPiA+ID4gPiArICAgICAgICAgICAgIHByaXYtPnByaW50
X2hlYWRlciA9IHRydWU7Cj4+ID4gPiA+ID4gKyAgICAgICAgICAgICBwcml2LT5pdGVyID0gY29k
ZXRhZ19nZXRfY3RfaXRlcihhbGxvY190YWdfY3R0eXBlKTsKPj4gPiA+ID4gPiArICAgICAgICAg
ICAgIGNvZGV0YWdfbmV4dF9jdCgmcHJpdi0+aXRlcik7Cj4+ID4gPiA+ID4gKyAgICAgfQo+PiA+
ID4gPgo+PiA+ID4gPiBEbyB5b3UgbmVlZCB0byBza2lwIHByaW50IGhlYWRlciB3aGVuICpwb3Mg
IT0gMD8gaS5lIGFkZAo+PiA+ID4KPj4gPiA+IFRlY2huaWNhbGx5IG5vdCBuZWVkZWQgc2luY2Ug
cHJvY19jcmVhdGVfc2VxX3ByaXZhdGUoKSBhbGxvY2F0ZXMKPj4gPiA+IHNlcS0+cHJpdmF0ZSB1
c2luZyBremFsbG9jKCksIHNvIHRoZSBpbml0aWFsIHZhbHVlIG9mCj4+ID4gPiBwcml2LT5wcmlu
dF9oZWFkZXIgaXMgYWx3YXlzIGZhbHNlLgo+PiA+Cj4+ID4gQnV0IHdlJ2xsIHN0YXJ0IHdpdGgg
Zmlyc3QgY2FsbCB0byBhbGxvY2luZm9fc3RhcnQoKSB3aXRoICpwb3MgPT0gMCwKPj4KPj4gVXN1
YWxseSBidXQgbm90IGFsd2F5cyBpZiB3ZSBkbyBsc2VlaygpIHRvIGEgbm9uLXplcm8gcG9zaXRp
b24gYmVmb3JlaGFuZC4KPgo+QWN0dWFsbHksIHRoaXMgY2hhbmdlIHdpbGwgYnJlYWsgdGhlIGxz
ZWVrKCkgY2FzZS4gV2UgY2FuJ3QgYWx3YXlzCj5hc3N1bWUgdGhhdCB3ZSBzdGFydCByZWFkaW5n
IGZyb20gKnBvcyA9PSAwLiBDdXJyZW50IHBhdGNoIHdpbGwgZmFpbAo+dG8gaW5pdGlhbGl6ZSBw
cml2IGlmIHdlIHN0YXJ0IHJlYWRpbmcgd2l0aCAqcG9zICE9IDAuCj5wcml2LT5pdGVyIHNob3Vs
ZCBiZSB0cmFja2luZyBjdXJyZW50IHBvc2l0aW9uIGFuZCBhbGxvY2luZm9fc3RhcnQoKQo+c2hv
dWxkIGRldGVjdCBhIG1pc21hdGNoIGJldHdlZW4gKnBvcyBhbmQgaXRlci0+cG9zIGFuZCByZS13
YWxrIHRoZQo+dGFncyBpZiB0aGVyZSB3YXMgYSBwb3NpdGlvbiBjaGFuZ2UuCgpzZXFfZmlsZSB3
b3JrcyBsaW5lIGJ5IGxpbmUsICBJIHRoaW5rIGV2ZW4gaWYgaXQgc3VwcG9ydCBsc2Vlaywgc2Vx
X2ZpbGUgd291bGQgc3RpbGwgc3RhcnQgd2l0aCBsaW5lICMwLApzaW5jZSBzZXFfZmlsZSBoYXZl
IG9uIGNsdWUgdGhlIGJ5dGUgc2l6ZSBmb3IgZWFjaCBsaW5lLgoKSSB3aWxsIGNoZWNrIHRoZSBj
b2RlLCAgbWFrZSBzb21lIHRlc3RzIGFuZCB1cGRhdGUgbGF0ZXIuCgoKPgo+Pgo+PiA+IHRoZW4g
cHJpbnRfaGVhZGVyIHdpbGwgYmUgaW5pdGlhbGl6ZWQgdG8gdHJ1ZS4KPj4KPj4gQWZ0ZXIgdGhl
IGZpcnN0IGNhbGwgdG8gYWxsb2NpbmZvX3Nob3coKSBwcmludF9oZWFkZXIgd2lsbCBiZSByZXNl
dAo+PiBiYWNrIHRvIGZhbHNlLgo+Pgo+PiA+IFdpbGwgdGhlcmUgYmUgc3Vic2VxdWVudCBjYWxs
cyBvZiBhbGxvY2luZm9fc3RhcnQoKSB3aXRoICpwb3MgIT0wLAo+PiA+IGJ1dCBwcml2LT5wcmlu
dF9oZWFkZXIgc3RheXMgYXQgMD8KPj4KPj4gWWVzLCB0aGVyZSB3aWxsIGJlIHN1YnNlcXVlbnQg
Y2FsbHMgdG8gYWxsb2NpbmZvX3N0YXJ0KCkgd2l0aCAqcG9zICE9MAo+PiBhbmQgcHJpdi0+cHJp
bnRfaGVhZGVyPWZhbHNlLCB3aGljaCBpcyB3aGF0IHdlIHdhbnQsIHJpZ2h0PyBXZSB3YW50IHRv
Cj4+IHByaW50IHRoZSBoZWFkZXIgb25seSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBmaWxlIChu
b2RlID09IDApLgo+Pgo+PiA+Cj4+ID4gVGltCj4+ID4gPgo+PiA+ID4gPgo+PiA+ID4gPiAgICAg
ICAgIH0gZWxzZSB7Cj4+ID4gPiA+ICAgICAgICAgICAgICAgICBwcml2LT5wcmludF9oZWFkZXIg
PSBmYWxzZTsKPj4gPiA+ID4gICAgICAgICB9Cj4+ID4gPiA+Cj4+ID4gPiA+IFRpbQo+PiA+ID4g
Pgo+PiA+ID4gPiA+ICsgICAgIHJldHVybiBwcml2LT5pdGVyLmN0ID8gcHJpdiA6IE5VTEw7Cj4+
ID4gPiA+ID4gIH0KPj4gPiA+ID4gPgo+PiA+ID4gPgo+PiA+Cg==

Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A526C1DB12E;
	Tue, 13 May 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126417; cv=none; b=PiI5I43PxttaDWgH06zgx19aIIoA4IuCMMgutJBPo/3wQCMezT0N8ZuBlSMSMFeLy8qTzXsSRLpPuWicqXPr/n0Q7M6BfS0n1lG/GBsP15o2p0P6X7/eX1u9wBe7Qbbeu9rKlL6jUiNEdq3BSto0UtUyguIqo3ORdKxs45W5qt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126417; c=relaxed/simple;
	bh=REbSFGrndC39YSd/ENp2/81/uKncHo5YWy3tgdWjWo4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=TgiISMxXYAwOWYn1PERgDy9F7zUy6vVEo0qHSBLLsl6L6SEMU4RqfpnmUEiRHIQMYGiGgQTxdBMddBQr6sv/fij8/kS68h1et49v8bZt4NPG2EOtXSfUU5kX6mxb2QrQsKkDMnrrIyI3WeDhKjYQ1fA3MgP1SptqPKMjfEEvCZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=IZDH0w+c reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="IZDH0w+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=pRRUWz9hn+AaASBrQIVYJKnl1xBvWzdQbHYb3YX0pHI=; b=I
	ZDH0w+coZsKYYDh8m1DA4cnV21MqHuknE6FPEN8Es54r+twc4/Ah6dZWoLroF+pB
	DCOG4FKdEnUuG/oFb0qXNGYvXNm0PEuny3M1R0DqbmbsuqMCi0rS1yCcZ54TtIiO
	DqKcei/kw2vYBFWSQ+f/+BNBzWeDYjtCIBxJXsNjrE=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-110 (Coremail) ; Tue, 13 May 2025 16:53:05 +0800
 (CST)
Date: Tue, 13 May 2025 16:53:05 +0800 (CST)
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
In-Reply-To: <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
 <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
 <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
 <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
X-NTES-SC: AL_Qu2fBf2ZuUsj4yCQZukZnEYQheY4XMKyuPkg1YJXOp80vyTg8BgQZm9MAUHHws6uNDKhoAi0TT1A0eZkcIVZfqTEUP4SQ/5n/klhfdWT8IJU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2c2d065e.8320.196c8d8f9c0.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bigvCgD3n7dyCCNo918DAA--.28928W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hdMqmgi-c1uJwAJsZ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTMgMTY6NDY6MzksICJPbGl2ZXIgTmV1a3VtIiA8b25ldWt1bUBzdXNlLmNv
bT4gd3JvdGU6Cj5PbiAxMy4wNS4yNSAxMDoyMywgRGF2aWQgV2FuZyB3cm90ZToKPgo+SGksCj4g
ID4gVGhhbmtzIGZvciByZXZpZXdpbmcgdGhpcy4gIFRoZSBtZW1vcnkgZmxhZyB0aGluZyBkbyBy
YWlzZSBjb25jZXJuLgo+PiBJIHRoaW5rIEkgY2FuIG1ha2UgYWRqdXN0bWVudDogIHJlYWxsb2Mg
dGhlIG1lbW9yeSBpZiBmbGFnIGNoYW5nZWQuCj4KPkkgYW0gc29ycnkuIEkgaGF2ZSBiZWVuIHVu
Y2xlYXIuIEhlcmUgY29tZXMgYSBkZXRhaWxlZCBleHBsYW5hdGlvbjoKPgo+V2hhdCB3ZSBjYWxs
ICJnZnBfdCIgaXMgYSBjb21iaW5hdGlvbiBvZiBmbGFncy4gVGhleSBkZXNjcmliZQo+Cj5BIC0g
dGhlIHR5cGUgb2YgbWVtb3J5IChhbHdheXMgdmFsaWQpCj5CIC0gdGhlIHdheSB0aGUgbWVtb3J5
IGNhbiBiZSBhbGxvY2F0ZWQgKHZhbGlkIG9ubHkgYXQgYSBzcGVjaWZpYyB0aW1lKQo+Cj5UaGUg
VVJCIGlzIGEgZ2VuZXJpYyBkYXRhIHN0cnVjdHVyZSB0byBiZSBwcm9jZXNzZWQgYnkgdGhlIENQ
VSwgX25vdF8KPnRoZSBIQy4gSXQgaXMgYWx3YXlzIGdlbmVyaWMga2VybmVsIG1lbW9yeS4gRmxh
Z3Mgb2YgdHlwZSBBIG1ha2Ugbm8gc2Vuc2UKPnRvIHBhc3MuCj5JbiBmYWN0IHlvdSBtYXkgbm90
IGtub3cgZm9yIHdoaWNoIGRldmljZSBhbiBVUkIgd2lsbCBiZSB1c2VkIHdoZW4geW91Cj5hbGxv
Y2F0ZSBpdC4gVGhlIG9ubHkgdmFsaWQgbWVtX2ZsYWdzIHlvdSBjYW4gcGFzcyB0byB1c2JfYWxs
b2NfdXJiKCkKPmFyZSBHRlBfS0VSTkVMLCBHRlBfTk9JTyBvciBHRlBfQVRPTUlDLgo+Cj5JZiB5
b3UgbmVlZCB0byByZWFsbG9jYXRlIG1lbW9yeSBmb3IgcHJpdmF0ZSBkYXRhIHlvdSBfbXVzdF8g
dXNlCj50aGUgZmxhZ3MgcGFzc2VkIHdpdGggdXNiX3N1Ym1pdF91cmIoKS4gQSBIQ0QgY2FuIG1v
ZGlmeSB0aGVtIGJ5IGFkZGluZwo+ZmxhZ3Mgb2YgdHlwZSBBLCBidXQgeW91IGNhbm5vdCBjaGFu
Z2UgZmxhZ3Mgb2YgdHlwZSBCLgo+Rm9yIGV4YW1wbGUsIGlmIHVzYl9hbGxvY191cmIoKSB1c2Vk
IEdGUF9LRVJORUwgdG8gYWxsb2NhdGUgdGhlIFVSQiwKPmJ1dCB1c2VzIEdGUF9BVE9NSUMgaW4g
dXNiX3N1Ym1pdF91cmIoKSwgeW91IHdpbGwgZGVhZGxvY2sgaWYgeW91IHNhdmUKPmFuZCByZXVz
ZSB0aGUgR0ZQX0tFUk5FTC4KPgo+CUhUSAo+CQlPbGl2ZXIKPiAgClRoYW5rcyBmb3IgZXhwbGFp
bmluZyB0aGlzLiAgIEkgd2lsbCBhZGp1c3QgY29kZSB0byBoYW5kbGUgbWVtX2ZsYWdzIGNoYW5n
ZXMsCmFuZCB1cGRhdGUgc29vbiBhZnRlciBJIG1hZGUgc29tZSB0ZXN0cy4KCkRhdmlkCg==

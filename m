Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDAA19F40B;
	Tue, 13 May 2025 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147339; cv=none; b=Scpm186AaulwYtZYlxN8km6NZqRAcc28CRcnsEfcXtkogH0DIKPQiJg7gZbYitZk/LRPvk2ZvLh1Vu+82hOj0sO+G2LxoxcySfJ99VIA9hKh3q0GbYeYp5QBGiV7m5tfz+5rq+xg+Thdq4rkJ1T6tDaTerFaMBMad0Pz+BdwUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147339; c=relaxed/simple;
	bh=4KcevAX47uPd8DaXUGm9PtOGKEhO4cJO3Y3jn1NJaTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZfW67izWJZn+dc2Ro9m9BAssImPmyT7GgNowNLY8mCtVYEvOM1YWVlUp9NQHYC7jmjGhdW/dGvKQbWiDULhcjpE131t1WEhdOJwh2cVLIZ8tKyPUfqrJylGtqR/1fLwFDjO4err6KpCNqs0oXIikOJPlB/CDuIveOnPl50fShpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=hHg8Wc4B reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="hHg8Wc4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=CxhojO/kTZI9+TtamrY1UhMIFJL84NcI0rqn1Hi2Wm4=; b=h
	Hg8Wc4ByXLEeP5l6AXrRSzU9/5cHqViebCSJ8H6KivvRHGvgSgXobzmafOGkVDti
	dFpcx3//ahFel56Fs9Mh6QTa/2V7TXYQ5n/hLBXZ7M+SFWi7MBXevNM7Gp2HyND5
	rSBclBpfbwhLyxIN0LE6C6MQAfQzLOyrwSJzoC+hkk=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Tue, 13 May 2025 22:41:45 +0800
 (CST)
Date: Tue, 13 May 2025 22:41:45 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
X-NTES-SC: AL_Qu2fBf2fuEsr4yCRYOkZnEYQheY4XMKyuPkg1YJXOp80oyTWxTsHf19qHlLo1cmEJCmxkDi8TiBW9s9aZq9IW6koOKibP3HAyhtnfeHEjYaY
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cigvCgD3v3sqWiNonJADAA--.29422W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqBBMqmgjNKfPMQAFs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEzIDIyOjI1OjUwLCAiQWxhbiBTdGVybiIgPHN0ZXJuQHJvd2xhbmQuaGFy
dmFyZC5lZHU+IHdyb3RlOgo+T24gVHVlLCBNYXkgMTMsIDIwMjUgYXQgMDc6Mzg6MTdQTSArMDgw
MCwgRGF2aWQgV2FuZyB3cm90ZToKPj4gLS0tCj4+IENoYW5nZXM6Cj4+IDEuIFVzZSBjYWxsZXIn
cyBtZW1fZmxhZ3MgaWYgYSBsYXJnZXIgbWVtb3J5IGlzIG5lZWRlZC4KPj4gVGhhbmtzIHRvIE9s
aXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+J3MgcmV2aWV3Lgo+PiAtLS0KPj4gVVJCIG9i
amVjdHMgaGF2ZSBsb25nIGxpZmVjeWNsZSwgYW4gdXJiIGNhbiBiZSByZXVzZWQgYmV0d2Vlbgo+
PiBlbnF1ZXVlLWRlcXVldWUgbG9vcHM7IFRoZSBwcml2YXRlIGRhdGEgbmVlZGVkIGJ5IHNvbWUg
aG9zdCBjb250cm9sbGVyCj4+IGhhcyB2ZXJ5IHNob3J0IGxpZmVjeWNsZSwgdGhlIG1lbW9yeSBp
cyBhbGxvY2VkIHdoZW4gZW5xdWV1ZSwgYW5kCj4+IHJlbGVhc2VkIHdoZW4gZGVxdWV1ZS4gRm9y
IGV4YW1wbGUsIG9uIGEgc3lzdGVtIHdpdGggeGhjaSwgc2V2ZXJhbAo+PiBtaW51dGVzIG9mIHVz
YWdlIG9mIHdlYmNhbS9rZXlib2FyZC9tb3VzZSBoYXZlIG1lbW9yeSBhbGxvYyBjb3VudHM6Cj4+
ICAgZHJpdmVycy91c2IvY29yZS91cmIuYzo3NSBbdXNiY29yZV0gZnVuYzp1c2JfYWxsb2NfdXJi
IDY2MQo+PiAgIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5jOjE1NTUgW3hoY2lfaGNkXSBmdW5jOnho
Y2lfdXJiX2VucXVldWUgNDI0ODYzCj4+IE1lbW9yeSBhbGxvY2F0aW9uIGZyZXF1ZW5jeSBmb3Ig
aG9zdC1jb250cm9sbGVyIHByaXZhdGUgZGF0YSBjYW4gcmVhY2gKPj4gfjFrL3MgYW5kIGFib3Zl
Lgo+PiAKPj4gSGlnaCBmcmVxdWVudCBhbGxvY2F0aW9ucyBmb3IgaG9zdC1jb250cm9sbGVyIHBy
aXZhdGUgZGF0YSBjYW4gYmUKPj4gYXZvaWRlZCBpZiB1cmIgdGFrZSBvdmVyIHRoZSBvd25lcnNo
aXAgb2YgbWVtb3J5LCB0aGUgbWVtb3J5IHRoZW4gc2hhcmVzCj4+IHRoZSBsb25nZXIgbGlmZWN5
Y2xlIHdpdGggdXJiIG9iamVjdHMuCj4+IAo+PiBBZGQgYSBtZW1wb29sIHRvIHVyYiBmb3IgaGNw
cml2IHVzYWdlLCB0aGUgbWVtcG9vbCBvbmx5IGhvbGRzIG9uZSBibG9jawo+PiBvZiBtZW1vcnkg
YW5kIGdyb3dzIHdoZW4gbGFyZ2VyIHNpemUgaXMgcmVxdWVzdGVkLgo+PiAKPj4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgV2FuZyA8MDAxMDcwODJAMTYzLmNvbT4KPgo+SXQgc2hvdWxkIGJlIHBvc3Np
YmxlIHRvIGRvIHdoYXQgeW91IHdhbnQgd2l0aG91dCB0b3VjaGluZyB0aGUgVVNCIGNvcmUgCj5j
b2RlIGF0IGFsbCwgY2hhbmdpbmcgb25seSB4aGNpLWhjZC4gIFRoYXQncyB3aGF0IE1hdGhpYXMg
aXMgc3VnZ2VzdGluZy4KPgo+SW5zdGVhZCBvZiBoYXZpbmcgYW4gVVJCIGtlZXAgb3duZXJzaGlw
IG9mIGl0cyBleHRyYSBtZW1vcnkgYWZ0ZXIgaXQgCj5jb21wbGV0ZXMsIHhoY2ktaGNkIGNhbiBw
dXQgdGhlIG1lbW9yeSBhcmVhIG9udG8gYSBmcmVlIGxpc3QuICBUaGVuIAo+bWVtb3J5IGFyZWFz
IG9uIHRoZSBmcmVlIGxpc3QgY2FuIGJlIHJldXNlZCB3aXRoIGFsbW9zdCBubyBvdmVyaGVhZCB3
aGVuIAo+VVJCcyBhcmUgZW5xdWV1ZWQgbGF0ZXIgb24uCgpJIGhhdmUgdG8gZGlzYWdyZWUsICB5
b3VyIHN1Z2dlc3Rpb24gaGFzIG5vIG11Y2ggZGlmZmVyZW5jZSBmcm9tIHJlcXVlc3RpbmcgbWVt
b3J5IGZyb20Kc3lzdGVtLCBsb2NrcyBhbmQgbWVtb3J5IHBvb2wgbWFuYWdlbWVudHMsIGFsbCB0
aGUgc2FtZSBhcmUgbmVlZGVkLCB3aHkgYm90aGVyPwoKVGhlIHJlYXNvbiBJIGNob29zZSBVUkIg
aXMgdGhhdCAgVVJCIGxpZmUgY3ljbGUgY29udGFpbnMgdGhlIHByaXZhdGUgZGF0YSdzIGxpZmVj
eWNsZSwgCmFuZCBubyB0d28gSENEIGNhbiB0YWtlIG92ZXIgdGhlIHNhbWUgVVJCIGFzIHRoZSBz
YW1lIHRpbWUuCgpJIHRoaW5rIHRoZSBtZW1vcnkgcG9vbCBoZXJlIGlzIG5vdCBhY3R1YWxseSBh
IHBvb2wsICBvciBJIHNob3VsZCBzYXkgdGhlIG1lbXBvb2wgY29uc2lzdHMgb2YKcG9vbCBvZiBV
UkJzLCBhbmQgZWFjaCBVUkIgaGF2ZSBvbmx5ICJzaW5nbGUgb25lIiBzbG90IG9mIG1lbSBwb29s
IGluIGl0LgoKCj4KPlRoaXMgaWRlYSBjYW4gYmVjb21lIG1vcmUgZWxhYm9yYXRlIGlmIHlvdSBt
YWludGFpbiBzZXBhcmF0ZSBmcmVlIGxpc3RzIAo+Zm9yIGRpZmZlcmVudCBkZXZpY2VzLCBvciBl
dmVuIGZvciBkaWZmZXJlbnQgZW5kcG9pbnRzLCBvciBzb3J0IHRoZSBmcmVlIAo+bGlzdCBieSB0
aGUgc2l6ZSBvZiB0aGUgbWVtb3J5IGFyZWFzLiAgQnV0IHRoZSBiYXNpYyBpZGVhIGlzIGFsd2F5
cyB0aGUgCj5zYW1lOiBEb24ndCBjaGFuZ2UgdXNiY29yZSAoaW5jbHVkaW5nIHN0cnVjdCB1cmIp
LCBhbmQgbWFrZSBnZXR0aW5nIGFuZCAKPnJlbGVhc2luZyB0aGUgZXh0cmEgbWVtb3J5IGFyZWFz
IGhhdmUgZXh0cmVtZWx5IGxvdyBvdmVyaGVhZC4KCldoeSBpbXBsZW1lbnRzIGEgZGV2aWNlIGxl
dmVsIG1lbW9yeSBwb29sIHdvdWxkIGhhdmUgZXh0cmVtZWx5IGxvdyBvdmVyaGVhZD8KV2h5ICBt
YWtpbmcgY2hhbmdlcyB0byB1c2IgY29yZSBpcyBiYWQ/IFRoZSBpZGVhIGluIHRoaXMgdGhyZWFk
IGlzIG1lYW50IGZvciBhbGwga2luZHMgb2YKaG9zdCBjb250cm9sbGVycywgeGhjaSBpcyB3aGF0
IEkgaGF2ZSBpbiBteSBzeXN0ZW07IGkgdGhpbmsgc2ltaWxhciBjaGFuZ2VzIHdvdWxkIGJlbmVm
aXQgb3RoZXIKSENzCgoKPgo+QWxhbiBTdGVybgo=

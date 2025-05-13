Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5663721421A;
	Tue, 13 May 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129362; cv=none; b=cffLjm1cwTmTUoBvq56p2c96Azag0cQav8Vuzg6dUNvJirCqhpeQ8k+I6vl1VEm+/Ifa2kcUvMT/sdIyEQfZx6Cs5j9NNsNWm9lVD4rED3s7dCiANw8dpbm0psDdJ91QWXwkxo9z95Ci8G0QlauSNOPOj16/cMC8u7Ncs2hivhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129362; c=relaxed/simple;
	bh=M+yKmN1koIZ36ERi0qheu0QfoMnio0RKdbnPCYGl9/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Cm4/YI2NSDRh3fRMoH02uWV4wVIPNbJ/yfKWFeb1vZmZFI17Z+rmptYTTE52ufBGlfpZW6z4xtutwknIhj8McfaJLuVJtA/RS90Z06j2qzf/iJkOaZ0ggX84MKuDnOvv0PEYn+FTxSjqNSxgJU755gW93Kl4q2f3++zc0g8LrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=n7hpxsMF reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="n7hpxsMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dogYMoWGOHSNgWDSY9Uko0mlmhk8IaMi8xlVmljwiJg=; b=n
	7hpxsMFe8mUg2o6ez+GBSvysoC5DUhiWaNNwnAU2jj+Js60gDAXP+hmh9NmXIL6j
	4E2BC8wr25QLmOaX6g0mD/J9yxzDCyzQDm0CH0ctY90mZwhnT1Wi84m8nuWQWHfe
	JvCM28wlqAHeeFFdPNz8vnT01SBJKuXaUDb0V/KlEo=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-110 (Coremail) ; Tue, 13 May 2025 17:41:37 +0800
 (CST)
Date: Tue, 13 May 2025 17:41:37 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Mathias Nyman" <mathias.nyman@intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, surenb@google.com,
	kent.overstreet@linux.dev
Subject: Re: [RFC] USB: core/xhci: add a buffer in urb for host controller
 private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <76b2a5ae-31b1-4627-aa59-8ff023654c3d@intel.com>
References: <20250512150724.4560-1-00107082@163.com>
 <76b2a5ae-31b1-4627-aa59-8ff023654c3d@intel.com>
X-NTES-SC: AL_Qu2fBf2Ztkoi4SadYukZnEYQheY4XMKyuPkg1YJXOp80vyTg8BgQZm9MAUHHws6uNDKhoAi0TT1A0eZkcIVZfqSsHLL8VHnwAltxxnfdVEgh
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <49a5d0b7.9095.196c9056aff.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bigvCgDnD+DSEyNojXMDAA--.31721W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hVMqmgjDQV06AADs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEzIDE3OjI3OjM0LCAiTWF0aGlhcyBOeW1hbiIgPG1hdGhpYXMubnltYW5A
aW50ZWwuY29tPiB3cm90ZToKPkhpIERhdmlkCj4KPk9uIDEyLjUuMjAyNSAxOC4wNywgRGF2aWQg
V2FuZyB3cm90ZToKPj4gLS0tCj4+IEkgd2FzIGNoZWNraW5nIG1lbW9yeSBhbGxvY2F0aW9uIGJl
aGF2aW9ycyAodmlhIG1lbW9yeSBwcm9maWxpbmdbMV0pLAo+PiB3aGVuIEkgbm90aWNlIGEgaGln
aCBmcmVxdWVudCBtZW1vcnkgYWxsb2NhdGlvbiBpbiB4aGNpX3VyYl9lbnF1ZXVlLCBhYm91dAo+
PiAyNTAvcyB3aGVuIHVzaW5nIGEgVVNCIHdlYmNhbS4gSWYgdGhvc2UgYWxsb2NlZCBidWZmZXIg
Y291bGQgYmUga2VwdCBhbmQKPj4gcmV1c2VkLCBsb3RzIG9mIG1lbW9yeSBhbGxvY2F0aW9ucyBj
b3VsZCBiZSBhdm9pZCBvdmVyIHRpbWUuCj4+IAo+PiBUaGlzIHBhdGNoIGlzIGp1c3QgYSBQT0Ms
IGFib3V0IDAvcyBtZW1vcnkgYWxsb2NhdGlvbiBpbiB4aGNpIHdpdGggdGhpcwo+PiBwYXRjaCwg
d2hlbiBJIHVzZSBteSBVU0IgZGV2aWNlcywgd2ViY2FtL2tleWJvYXJkL21vdXNlLgo+Cj5UaGFu
a3MgZm9yIGxvb2tpbmcgYXQgdGhpcywgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBvYnZpb3VzbHkg
bmVlZHMgbW9yZQo+YXR0ZW50aW9uCj4KPj4gCj4+IEEgZHluYW1pYyBjYWNoZWQgbWVtb3J5IHdv
dWxkIGJlIGJldHRlcjogVVJCIGtlZXAgaG9zdCBjb250cm9sbGVyJ3MKPj4gcHJpdmF0ZSBkYXRh
LCBpZiBsYXJnZXIgc2l6ZSBidWZmZXIgbmVlZGVkIGZvciBwcml2YXRlIGRhdGEsIG9sZCBidWZm
ZXIKPj4gcmVsZWFzZWQgYW5kIGEgbGFyZ2VyIGJ1ZmZlciBhbGxvY2VkLgo+PiAKPj4gSSBkaWQg
bm90IG9ic2VydmUgYW55IG5hZ2F0aXZlIGltcGFjdCB3aXRoIHhoY2kncyAyNTAvcyBhbGxvY2F0
aW9ucwo+PiB3aGVuIHVzaW5nIG15IHN5c3RlbSwgaGVuY2Ugbm8gbWVhc3VyZW1lbnQgb2YgaG93
IHVzZWZ1bCB0aGlzIGNoYW5nZXMKPj4gY2FuIG1ha2UgdG8gdXNlci4gSnVzdCB3YW50IHRvIGNv
bGxlY3QgZmVlZGJhY2tzIGJlZm9yZSBwdXR0aW5nIG1vcmUKPj4gZWZmb3J0Lgo+PiAKPgo+SSB0
aGluayB3ZSBjYW4gbWFrZSBhIHhoY2kgaW50ZXJuYWwgc29sdXRpb24gdGhhdCBkb2Vzbid0IGFm
ZmVjdCBvdGhlciBob3N0cwo+b3IgdXNiIGNvcmUuCgpZZXMsICBteSBsYXRlc3QgcGF0Y2hlcyBz
ZXBhcmF0ZXMgeGhjaSBjaGFuZ2VzIGZyb20gIHVzYmNvcmUgLgo+Cj5Ib3cgYWJvdXQgYWRkaW5n
IGEgbGlzdCBvZiBzdHJ1Y3QgdXJiX3ByaXYgbm9kZXMgZm9yIGV2ZXJ5IHVzYiBkZXZpY2UsIG9y
IG1heWJlCj5ldmVuIHBlciBlbmRwb2ludD8gaS5lLiB0byBzdHJ1Y3QgeGhjaV92aXJ0X2Rldmlj
ZSBvciAgc3RydWN0IHhoY2lfdmlydF9lcC4KPgo+QWRkIHNpemUgYW5kIGxpc3RfaGVhZCBlbnRy
aWVzIHRvIHN0cnVjdCB1cmJfcHJpdi4KPgpkZXZpY2UgbGV2ZWwgbWVtcG9vbCBjb3VsZCBiZSB2
ZXJ5IGNvbXBsaWNhdGVkLCBJIHRoaW5rIGEgc2luZ2xlIG1lbW9yeSBwb29sIGhvbGQgYnkgVVJC
CndvdWxkIGJlIG11Y2ggc2ltcGxlci4gKENvdWxkIHlvdSBoZWxwICB0YWtlIGEgbG9vayBhdCB0
aGlzIHBhdGNoOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNTEzMDU1NDQ3LjU2
OTYtMS0wMDEwNzA4MkAxNjMuY29tLykgCgo+SW4geGhjaV91cmJfZW5xdWV1ZSgpIHBpY2sgdGhl
IGZpcnN0IHVyYl9wcml2IG5vZGUgZnJvbSBsaXN0IGlmIGl0IGV4aXN0cyBhbmQgaXMKPmxhcmdl
IGVub3VnaCwgb3RoZXJ3aXNlIGp1c3QgYWxsb2NhdGUgYSBuZXcgb25lIGFuZCBzZXQgdGhlIHNp
emUuCj4KPldoZW4gZ2l2aW5nIGJhY2sgdGhlIFVSQiB6ZXJvIGV2ZXJ5dGhpbmcgaW4gdGhlIHN0
cnVjdCB1cmJfcHJpdiBleGNlcHQgdGhlIHNpemUsCj5hbmQgYWRkIGl0IHRvIHRoZSBsaXN0Lgo+
Cj5XaGVuIHRoZSBkZXZpY2UgaXMgZnJlZWQgdGhlcmUgc2hvdWxkbid0IGJlIGFueSBub2RlcyBs
ZWZ0IGluIHRoZSBsaXN0LCBidXQgaWYKPnRoZXJlIGFyZSB0aGVuIHdhcm4gYW5kIGZyZWUgdGhl
bS4KPgo+SXNvYyB0cmFuc2ZlcnMgYXJlIHRoZSBvbmVzIHdpdGggb2RkIHVyYl9wcml2IHNpemVz
LiBJZiB3ZSBoYXZlIGEgcGVyIGRldmljZSBvcgo+cGVyIGVuZHBvaW50IHVyYl9wcml2IGxpc3Qg
dGhlbiBzaXplcyB3aWxsIG1hdGNoIGJldHRlci4KCklmIHRoZSBtZW1wb29sIGlzIGluIFVSQiwg
dGhlbiBvbmx5IGxhcmdlc3Qgc2l6ZSBtYXR0ZXJzLCBzaW5jZSBubyB0d28gSEMgY2FuIG93biB0
aGUgVVJCCmF0IHRoZSBzYW1lIHRpbWUuCgo+Cj5UaGFua3MKPk1hdGhpYXMKPgoKVGhhbmtzIGZv
ciB0aGUgY29tbWVudHMgYW5kIHN1Z2dlc3Rpb25zLgpEYXZpZA==

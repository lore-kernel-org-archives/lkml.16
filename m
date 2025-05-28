Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D6C2749FE;
	Wed, 28 May 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422244; cv=none; b=FOqhYyk0pKqNCt7kC9C9k105OKhnCbEXpKshFPVGM3wkhMd43YbvBjKXfA0eu+yL6ZLr9+rC5aFygbZCd1k/lqqAtWos0VJFj/AO9C1N9/uCAU001smYc7KsQ187n4IvCtadO+I62R3sQWNyl9C4Apnmn43z4UOqvijTbg30rCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422244; c=relaxed/simple;
	bh=oGI3YIv5COewLp59/u1LKJ9iLFWVW3C7cV+6fuUVsMw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZqWseK2g2ybWLH1MZ4v3Hyb1pKDr26fVGA3+j5P7pfsdFqMAP+ugtsBNVD7VVSDE80nmn3RRuoS/tntXHvQhORBhtlsUEEjaa5/hJP7uRCgV95JSaisx8K4C6P3UK7isuV2McQbC6Kp0vXnOuEmIp7XFUgLjMbvW50MS/iATaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=NnWYVRPS reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="NnWYVRPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Q/Kz/3SM6qMlxK4FSVI0nwRtn+UkFkCaBDdk8+T5tYc=; b=N
	nWYVRPSt9m92/Gn7VY4ZUuEqbwwnAbRw5+pW4GB/CSIO17d6Vc552qtDu3a+gIhj
	9P+v0CQDqArbn4Kfi3dtJWthUkg2hD9IQb/fp38ECY8pAivdDz3Ojw765MK4ktP1
	PG5QLZ0pP+vc7b93D9xERUOsExTTf0UWuc/c87L+fU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-128 (Coremail) ; Wed, 28 May 2025 16:49:53 +0800
 (CST)
Date: Wed, 28 May 2025 16:49:53 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, simic@manjaro.org,
	krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, algea.cao@rock-chips.com,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO
 driver strength for rk3588
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <3704844.aeNJFYEL58@workhorse>
References: <20250522020537.1884771-1-andyshrk@163.com>
 <3704844.aeNJFYEL58@workhorse>
X-NTES-SC: AL_Qu2fCviZvUki5SKQZukfmkcVgOw9UcO5v/Qk3oZXOJF8jA7p4wscQHpOAWbq0cyIMRyRnBWaVRtWyPRTR6hlT6sb/yONQoqn4Ld8lYww2OFEbg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <9ffd480.852d.19716157087.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gCgvCgD3X+UxzjZopHQPAA--.35457W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAJbXmg2ya2jJQABsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxvIE5pY29sYXMsCgpBdCAyMDI1LTA1LTI3IDE5OjUzOjU2LCAiTmljb2xhcyBGcmF0dGFy
b2xpIiA8bmljb2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+T24gVGh1cnNk
YXksIDIyIE1heSAyMDI1IDA0OjA1OjI0IENlbnRyYWwgRXVyb3BlYW4gU3VtbWVyIFRpbWUgQW5k
eSBZYW4gd3JvdGU6Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4K
Pj4gCj4+IEZvciB0aGUgUkszNTg4IEhETUkgY29udHJvbGxlciwgdGhlIGZhbGxpbmcgZWRnZSBv
ZiBEREMgU0RBIGFuZCBTQ0wKPj4gYWxtb3N0IGNvaW5jaWRlIGFuZCBjYW5ub3QgYmUgYWRqdXN0
ZWQgYnkgSERNSSByZWdpc3RyZXIsIHJlc3VsdGluZwo+PiBpbiBwb29yIGNvbXBhdGliaWxpdHkg
b2YgRERDIGNvbW11bmljYXRpb24uCj4+IAo+PiBBbiBpbXByb3ZlbWVudCBvZiB0aGUgY29tcGF0
aWJpbGl0eSBvZiBEREMgY2FuIGJlIGRvbmUgYnkgaW5jcmVhc2luZwo+PiB0aGUgZHJpdmVyIHN0
cmVuZ3RoIG9mIFNDTCBhbmQgZGVjcmVhc2luZyB0aGUgZHJpdmVyIHN0cmVuZ3RoIG9mIFNEQQo+
PiB0byBpbmNyZWFzZSB0aGUgc2xvcGUgb2YgdGhlIGZhbGxpbmcgZWRnZS4KPj4gCj4+IEl0IHNo
b3VsZCBiZSBub3RlZCB0aGF0IHRoZSBtYXhpbXVtIGRyaXZpbmcgc3RyZW5ndGggb2YgaGRtaW0w
X3R4MV9zY2wKPj4gaXMgb25seSAzLCB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0aGF0IG9mIHRo
ZSBvdGhlciBJT3MuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9j
ay1jaGlwcy5jb20+Cj4+IAo+PiAtLS0KPj4gCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gQ29ycmVj
dCB0aGUgbWF4IGRyaXZlIGxldmVsIG9mIGhkbWltMF90eDFfc2NsLgo+PiAKPj4gIC4uLi9kdHMv
cm9ja2NoaXAvcmszNTg4LWJhc2UtcGluY3RybC5kdHNpICAgICB8IDIwICsrKysrLS0tLS0tCj4+
ICAuLi4vZHRzL3JvY2tjaGlwL3JrMzU4OC1leHRyYS1waW5jdHJsLmR0c2kgICAgfCAgNSArLS0K
Pj4gIC4uLi9ib290L2R0cy9yb2NrY2hpcC9yb2NrY2hpcC1waW5jb25mLmR0c2kgICB8IDM1ICsr
KysrKysrKysrKysrKysrKysKPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCj4+IAo+Cj5UZXN0ZWQtYnk6IE5pY29sYXMgRnJhdHRhcm9saSA8bmlj
b2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+Cj4KPlF1aWNrbHkgdGVzdGVkIHRoaXMgb24g
Ym90aCBIRE1JIHBvcnRzIG9mIGEgUk9DSyA1VCB3aXRoIGFuIEhETUkgY2FwdHVyZQo+Y2FyZCBv
biB0aGUgb3RoZXIgZW5kLiBXaGlsZSBJIGRpZG4ndCBvcmlnaW5hbGx5IGhhdmUgYW55IGlzc3Vl
cyB0byBiZWdpbgo+d2l0aCwgdGhpcyBwYXRjaCBkb2VzIG5vdCBpbnRyb2R1Y2UgYW55IG5ldyBv
bmVzLCBzbyBzZWVtcyBnb29kIHRvIG1lLgoKClRoYW5rcyBmb3IgeW91dCB0ZXN0LgoKSSBzZW50
IHRoaXMgcGF0Y2ggYmVjYXVzZSBzb21lb25lIGZyb20gdGhlIGNvbW11bml0eSByZXBvcnRlZCB0
byBtZSB0aGF0IGhpcyBib2FyZApjb3VsZG4ndCBzdWNjZXNzZnVsbHkgZXN0YWJsaXNoIGRkYyBj
b21tdW5pY2F0aW9uIHdoZW4gcnVubmluZyB0aGUgbWFpbmxpbmUga2VybmVsLgpBZnRlciBjb25k
dWN0aW5nIGV4dGVuc2l2ZSBjb21wYXJpc29ucywgaXQgd2FzIGRpc2NvdmVyZWQgdGhhdCB0aGVy
ZSB3ZXJlIGRpZmZlcmVuY2VzCmluIHRoZSBJTyBkcml2ZSBzdHJlbmd0aCBjb25maWd1cmF0aW9u
IGJldHdlZW4gbWFpbmxpbmUgY29kZSBhbmQgdGhlIGRvd25zdHJlYW0gY29kZS4gClRoZW4sIEkg
cmVjYWxsZWQgdGhhdCBkdXJpbmcgdGhlIGNoaXAgYnJpbmd1cCBwcm9jZXNzIGFuZCB3aGVuIGNv
bmR1Y3RpbmcgdGhlIFNJIHRlc3QsIAp3ZSBoYWQgZW5jb3VudGVyZWQgdGhpcyBwcm9ibGVtIGJl
Zm9yZSwgYW5kIHdlIGRpZCB0aGUgZml4IGJ5IGFkanVzdGluZyBEREMgSU8gZHJpdmUgc3RyZW5n
dGguCj4K

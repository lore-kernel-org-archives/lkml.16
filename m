Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F291F2B88
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708771; cv=none; b=F1YMVj3dc5VjLcOVclkCJ+r+dp1ejBlQBCqlBdYOxdb4Et0aHY9j5S3ges2XXjDP/SGvL6vh92j/DkuflC6bu5UTc6wAJK3Ngm33lnjPNHHl1TrSfKVHKHzqS1/TPaQI4qRMKGELFpkgqlZAmfpXju1nU0s+DjlCSA8IbMKimmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708771; c=relaxed/simple;
	bh=0mNvayiA4tnzp8kDTCtTD6lvIrDP/VYeD+91qYRCn74=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=VPdRgcm/joNTSM2KPBg0yGfubSuivO5qY0qvZCLoLW0qsjIaGzp8lbiKXMowNcKYS9sz7l8nHY1tj0M2EntVHW4uOMcuNnsJHy/GdRL4yCn6/mM+1yDhdvQiUIdO99LsTTng1SQaP8aIjdUzK7S6K5fm0CW6Rf/p6azMw6WhTeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=CcLJrhIV reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="CcLJrhIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=uqsR+yBXJaeE7Gc/RSa8YhyVSpecmvVTUqnfn/mFK0k=; b=C
	cLJrhIVjF8wuN2+QsJ1M6HPkdsCWjG/xaKOhP6mySJWs7itSwCEKfpzaxPPYmU2z
	abGKCLAUZAb6MqeVwYAbmjnbu3LIhs6m+VzFcMBNtBAc0WYI23PimHBp/g6wSUXX
	cc37VpOttrVx/HfAp1WGwvCVZdlABqwEfFReyhHXzA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-106 (Coremail) ; Thu, 12 Jun 2025 14:11:37 +0800
 (CST)
Date: Thu, 12 Jun 2025 14:11:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/rockchip: vop2: fail cleanly if missing a primary
 plane for a video-port
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250610212748.1062375-1-heiko@sntech.de>
References: <20250610212748.1062375-1-heiko@sntech.de>
X-NTES-SC: AL_Qu2fC/ubt04i4SmdZ+kfmkcVgOw9UcO5v/Qk3oZXOJF8jCDp5y4hcHpTPUXy9sWDKyGinQiHTBd1y8NDfahcdIMob9tkaclLAvXdvK0Y9HVFTw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4a19525.4f96.19762c3f163.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aigvCgD3H3Oab0pooEUaAA--.55529W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB9qXmhKaNasWgABso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIEhlaWtv77yMCkF0IDIwMjUtMDYtMTEgMDU6Mjc6NDgsICJIZWlrbyBTdHVlYm5lciIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj5FYWNoIHdpbmRvdyBvZiBhIHZvcDIgaXMgdXNhYmxlIGJ5
IGEgc3BlY2lmaWMgc2V0IG9mIHZpZGVvIHBvcnRzLCBzbyB3aGlsZQo+YmluZGluZyB0aGUgdm9w
Miwgd2UgbG9vayB0aHJvdWdoIHRoZSBsaXN0IG9mIGF2YWlsYWJsZSB3aW5kb3dzIHRyeWluZyB0
bwo+ZmluZCBvbmUgZGVzaWduYXRlZCBhcyBwcmltYXJ5LXBsYW5lIGFuZCB1c2FibGUgYnkgdGhh
dCBzcGVjaWZpYyBwb3J0Lgo+Cj5UaGUgY29kZSBsYXRlciB3YW50cyB0byB1c2UgZHJtX2NydGNf
aW5pdF93aXRoX3BsYW5lcyB3aXRoIHRoYXQgZm91bmQKPnByaW1hcnkgcGxhbmUsIGJ1dCBub3Ro
aW5nIGhhcyBjaGVja2VkIHNvIGZhciBpZiBhIHByaW1hcnkgcGxhbmUgd2FzCj5hY3R1YWxseSBm
b3VuZC4KPgo+Rm9yIHdoYXRldmVyIHJlYXNvbiwgdGhlIHJrMzU3NiB2cDIgZG9lcyBub3QgaGF2
ZSBhIHVzYWJsZSBwcmltYXJ5IHdpbmRvdwo+KGlmIHZwMCBpcyBhbHNvIGluIHVzZSkgd2hpY2gg
YnJvdWdodCB0aGUgaXNzdWUgdG8gbGlnaHQgYW5kIGVuZGVkIGluIGEKPm51bGwtcG9pbnRlciBk
ZXJlZmVyZW5jZSBmdXJ0aGVyIGRvd24uCj4KPkFzIHdlIGV4cGVjdCBhIHByaW1hcnktcGxhbmUg
dG8gZXhpc3QgZm9yIGEgdmlkZW8tcG9ydCwgYWRkIGEgY2hlY2sgYXQKPnRoZSBlbmQgb2YgdGhl
IHdpbmRvdy1pdGVyYXRpb24gYW5kIGZhaWwgcHJvYmluZyBpZiBub25lIHdhcyBmb3VuZC4KPgo+
Rml4ZXM6IDYwNGJlODU1NDdjZSAoImRybS9yb2NrY2hpcDogQWRkIFZPUDIgZHJpdmVyIikKPlNp
Z25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgpSZXZpZXdlZC1i
eTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgoKVGhhbmtzCgoKPi0tLQo+IGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgNCArKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+aW5kZXggN2RkZjMxMWIzOGM2Li5hOGRjMmU1NTgxMmEg
MTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
Ywo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPkBA
IC0yNDI1LDYgKzI0MjUsMTAgQEAgc3RhdGljIGludCB2b3AyX2NyZWF0ZV9jcnRjcyhzdHJ1Y3Qg
dm9wMiAqdm9wMikKPiAJCQkJYnJlYWs7Cj4gCQkJfQo+IAkJfQo+Kwo+KwkJaWYgKCF2cC0+cHJp
bWFyeV9wbGFuZSkKPisJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkcm0tPmRldiwgLUVOT0VOVCwK
PisJCQkJCSAgICAgIm5vIHByaW1hcnkgcGxhbmUgZm9yIHZwICVkXG4iLCBpKTsKPiAJfQo+IAo+
IAkvKiBSZWdpc3RlciBhbGwgdW51c2VkIHdpbmRvdyBhcyBvdmVybGF5IHBsYW5lICovCj4tLSAK
PjIuNDcuMgo+Cg==

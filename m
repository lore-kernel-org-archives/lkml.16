Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F417F7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455471; cv=none; b=cnJebp8j1b9sJO60Kqh779JIo/QwD8autvDOKR0iDAlzH87zlQW9g4MffTrzW6gy1QKPD7PM1yW+K5XiUwUfwWbH6Hr11g0N26+aITKPn18QPU3tusLEQ11OLSFmf8Z/ZvkIgmpkaBQogml3lFOR0xlg7rtxQsdclLqoS28fhg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455471; c=relaxed/simple;
	bh=83mcjUifPIfk/6ORujgQWzGN58qZCqIJuR06Usw8ypw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=HUEiBO3BL3mhklTRuBZIzGdcy/z61oZ8Bjy58mk6xPlbk1xoFO9IxihBk838qOx4F8Fl2OMzhQwFfdFQ7PC8Je8/C6pBxPydlM7qOra5VPMqglEgs4auZvmRY0ED4iF0ccV4jDEjsvR7RniyQqoopRcRkpgv7PXWoqXw23lQpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=mYxNlMXl reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="mYxNlMXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QTVmIoV8bT7TS1J/bHn0cF9ZcR5e5MVRDdBrhghGq8c=; b=m
	YxNlMXlspOe81pr+rfZ922TXq7NPZVFz2l/cr9hGOHCmECkeuqrNXH+or4V2+NQk
	hZuLwwMjC6S1sQdRE8ZdnCPit5RfJutnbss/kSCvxmZLU0NUs5WRDtXFXdZwpI9g
	ZJdiSQ9ZaHzk9kWFAXg7ytfzoXuzf3+hr3OFCu4ZyI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 24 Apr 2025 08:42:47 +0800
 (CST)
Date: Thu, 24 Apr 2025 08:42:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Douglas Anderson" <dianders@chromium.org>,
	"Damon Ding" <damon.ding@rock-chips.com>,
	"Arnd Bergmann" <arnd@arndb.de>,
	"Heiko Stuebner" <heiko.stuebner@cherry.de>,
	"Geert Uytterhoeven" <geert+renesas@glider.be>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
References: <20250423164422.2793634-1-arnd@kernel.org>
 <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
X-NTES-SC: AL_Qu2fB/ieukst4SadbekfmkcVgOw9UcO5v/Qk3oZXOJF8jCzp8D4yf1JTEnDy1fCDKg+MkAiHYjpJ8Pt0f7d2fYwuVF/Ep8+wUnGXRqnQ58Y+5g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <13627027.772.196653f45f1.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZigvCgAXfIYHiQlo2ESdAA--.63259W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBU5XmgJh6IglgABsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksIAoKQXQgMjAyNS0wNC0yNCAwMToxODo0NSwgIkRtaXRyeSBCYXJ5c2hrb3YiIDxkbWl0cnku
YmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+T24gV2VkLCBBcHIgMjMsIDIwMjUg
YXQgMDY6NDQ6MTZQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gCj4+IERSTV9ESVNQTEFZX0RQX0FVWF9CVVMgY2Fu
bm90IGJlIHNlbGVjdGVkIHdoZW4gQ09ORklHX09GIGlzIGRpc2FibGVkOgo+PiAKPj4gV0FSTklO
RzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgRFJNX0RJU1BMQVlfRFBf
QVVYX0JVUwo+PiAgIERlcGVuZHMgb24gW25dOiBIQVNfSU9NRU0gWz15XSAmJiBEUk0gWz15XSAm
JiBPRiBbPW5dCj4+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+PiAgIC0gRFJNX1JPQ0tDSElQIFs9eV0g
JiYgSEFTX0lPTUVNIFs9eV0gJiYgRFJNIFs9eV0gJiYgUk9DS0NISVBfSU9NTVUgWz15XSAmJiBS
T0NLQ0hJUF9BTkFMT0dJWF9EUCBbPXldCj4+IAo+PiBSb2NrY2hpcCBwbGF0Zm9ybXMgYWxsIGRl
cGVuZCBvbiBPRiBhbnl3YXksIHNvIGFkZCB0aGUgZGVwZW5kZW5jeSBoZXJlCj4+IGZvciBjb21w
aWxlIHRlc3RpbmcuCj4+IAo+PiBGaXhlczogZDdiNDkzNmIyYmMwICgiZHJtL3JvY2tjaGlwOiBh
bmFsb2dpeF9kcDogQWRkIHN1cHBvcnQgdG8gZ2V0IHBhbmVsIGZyb20gdGhlIERQIEFVWCBidXMi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKICAgIEFj
a2VkLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cgo+PiAtLS0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPj4gCj4KPlJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0
cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+Cj4KPi0tIAo+V2l0aCBiZXN0IHdpc2hlcwo+
RG1pdHJ5Cg==

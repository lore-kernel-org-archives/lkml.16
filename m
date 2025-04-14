Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B070E482EB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625903; cv=none; b=tB3VX0k/bMDQcWM6TxgqJofCIJ6wrH4cxp5NZVBjgWFdZlNFQ2IahPtlBmKdOXPe0XBU4CHqSCmTHjz/aVrf3O1y2JjRQPlopqnWfgagYhpMQhHOJzwDawo+2OrdFd1t09XYfN31BJMfTDWop3rdMrrbmsCVOySw8QFs65HzI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625903; c=relaxed/simple;
	bh=SceVE8FU3+MkupJVCuwJx4NvPv+OBwNBxI5lA921f5Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=YS02cPnEBYG4pBKrSxq3BruJRq4iQsySjVEtHuAZGR86lU2qzbHrx1QdLDXwDI1N5UJ9Ma111CzVkHrFpDhCmlilh44mYqkQJ+FIaeuuVvFELRkKaldNwsKBhdvaVXwAW4aNOX7mxTCTGtyQfuVoH4bz1lYsVqzeIzOLvc2fVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=b/1e/km8 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="b/1e/km8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=FtHH1d9fc5EscATSZ+LEwdKwN/9RUht32VDf5GvO+Zs=; b=b
	/1e/km85XpatlSBKKo7qYtrX+aI1570IX3PQtLF1DTpxf1GE46YD+sx8rH8Qnulf
	tu0Qcr/20nQLkg3120uaN/zqHTnin0TEd5SpxfyOrd2/FUdDyXeT8/LxfMxeyDs8
	Tmfp8Gxb5WBoeYC3cMIK03yTNMycR4+3Ywci88WK0Q=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Mon, 14 Apr 2025 18:16:28 +0800
 (CST)
Date: Mon, 14 Apr 2025 18:16:28 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Konstantin Shabanov" <mail@etehtsea.me>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Daniel Stone" <daniel@fooishbar.org>,
	"Dan Callaghan" <djc@djc.id.au>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH v2] (drm/rockchip) Reject AFBC for resolutions >2560x1600
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250414095332.9674-1-mail@etehtsea.me>
References: <20250402125320.21836-1-mail@etehtsea.me>
 <20250414095332.9674-1-mail@etehtsea.me>
X-NTES-SC: AL_Qu2fBvqZuk8j7iGdZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDLp/j0HdmVSAWfk9OO0GyOzmgmGQhZw7+16UYtfUYcQHT/0ebyDUKlumhG+41/E3w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <60813eed.a78b.19633cce4fb.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eCgvCgDX_PN84PxnM7qWAA--.37454W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA0vXmf83VVrHAABsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBLb25zdGFudGlu77yMCgp0aGUgU3ViamVjdCBzaG91bGQgYmU6IGRybS9yb2NrY2hpcDog
eHh4eHh4eHh4eHh4CgpBdCAyMDI1LTA0LTE0IDE3OjUzOjMxLCAiS29uc3RhbnRpbiBTaGFiYW5v
diIgPG1haWxAZXRlaHRzZWEubWU+IHdyb3RlOgo+QXMgaXQgaXNuJ3Qgc3VwcG9ydGVkIGJ5IGhh
cmR3YXJlLiBBdCBsZWFzdCwgUkszMzk5IGRvZXNuJ3Qgc3VwcG9ydAo+aXQuIEZyb20gdGhlIGRh
dGFzaGVldFsxXQo+KCIxLjIuMTAgVmlkZW8gSU4vT1VUIiwgIkRpc3BsYXkgSW50ZXJmYWNlIiwg
cC4gMTcpOgo+Cj4gIFN1cHBvcnQgQUZCQyBmdW5jdGlvbiBjby1vcGVyYXRpb24gd2l0aCBHUFUK
PiAgICAqIHN1cHBvcnQgMjU2MHgxNjAwIFVJCj4KPk1hbnVhbGx5IHRlc3RlZCBvbiBSb2NrUHJv
NjQgKHJrMzM5OSk6Cj4tIEFSTV9BRkJDIG1vZGlmaWVyIGlzIHVzZWQgZm9yIDE5MjB4MTA4MAo+
LSBEUk1fRk9STUFUX01PRF9MSU5FQVIgbW9kaWZpZXIgdXMgdXNlZCBmb3IgMzg0MHgyMTYwCj4t
IE5vIG5vaXNlIG9uIHRoZSBzY3JlZW4gd2hlbiBzd2F5IGlzIHJ1bm5pbmcgaW4gNGsKPi0gRHlu
YW1pYyByZXNvbHV0aW9uIHN3aXRjaGluZyB3b3JrcyBjb3JyZWN0bHkgaW4gc3dheQo+Cj5TaWdu
ZWQtb2ZmLWJ5OiBLb25zdGFudGluIFNoYWJhbm92IDxtYWlsQGV0ZWh0c2VhLm1lPgo+Q2M6IERh
bmllbCBTdG9uZSA8ZGFuaWVsQGZvb2lzaGJhci5vcmc+Cj5SZXBvcnRlZC1ieTogRGFuIENhbGxh
Z2hhbiA8ZGpjQGRqYy5pZC5hdT4KPkNsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL21lc2EvbWVzYS8tL2lzc3Vlcy83OTY4Cj4KPlsxXTogaHR0cHM6Ly9vcGVuc291cmNlLnJv
Y2stY2hpcHMuY29tL2ltYWdlcy9kL2Q3L1JvY2tjaGlwX1JLMzM5OV9EYXRhc2hlZXRfVjIuMS0y
MDIwMDMyMy5wZGYKPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
ZmIuYyB8IDkgKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj5k
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCj5pbmRleCBkY2MxZjA3
NjMyYzMuLjEzNzliYzNjZDkzNyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fZmIuYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV9mYi5jCj5AQCAtMTgsNiArMTgsOCBAQAo+ICNpbmNsdWRlICJyb2NrY2hpcF9kcm1f
ZmIuaCIKPiAjaW5jbHVkZSAicm9ja2NoaXBfZHJtX2dlbS5oIgo+Cj4rI2RlZmluZSBST0NLQ0hJ
UF9BRkJDX01BWF9XSURUSAkJMjU2MAo+Kwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyX2Z1bmNzIHJvY2tjaGlwX2RybV9mYl9mdW5jcyA9IHsKPiAJLmRlc3Ryb3kgICAgICAg
PSBkcm1fZ2VtX2ZiX2Rlc3Ryb3ksCj4gCS5jcmVhdGVfaGFuZGxlID0gZHJtX2dlbV9mYl9jcmVh
dGVfaGFuZGxlLAo+QEAgLTUyLDYgKzU0LDEzIEBAIHJvY2tjaGlwX2ZiX2NyZWF0ZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gCX0KPgo+IAlpZiAoZHJt
X2lzX2FmYmMobW9kZV9jbWQtPm1vZGlmaWVyWzBdKSkgewo+KwkJaWYgKG1vZGVfY21kLT53aWR0
aCA+IFJPQ0tDSElQX0FGQkNfTUFYX1dJRFRIKSB7Cj4rCQkJRFJNX0RFQlVHX0tNUygiQUZCQyBp
cyBub3Qgc3VwcG9ydGVkIGZvciB0aGUgd2lkdGggJWQgKG1heCAlZClcbiIsCj4rCQkJCSAgICAg
IG1vZGVfY21kLT53aWR0aCwKPisJCQkJICAgICAgUk9DS0NISVBfQUZCQ19NQVhfV0lEVEgpOwo+
KwkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+KwkJfTsKCkFzIHRoZSBjb21taXQgbWVzc2Fn
ZSBzYXlpbmc6IFRoaXMgcmVzdHJpY3Rpb24gb25seSBhcHBsaWVzIHRvIHJrMzM5OS4KClRoZXJl
IGlzIG5vIHN1Y2ggbGltaXRhdGlvbiBmb3IgcmszNTZ4L3JrMzU4OC4KQnV0IHRoaXMgcGF0Y2gg
d2lsbCBSZWplY3QgQUZCQyBmb3IgcmVzb2x1dGlvbnMgPjI1NjB4MTYwMCBvbiBhbGwgcm9ja2No
aXAgcGxhdGZvcm1zLApzbyB0aGlzIGlzIG5vdCByaWdodC4KCgo+Kwo+IAkJaW50IHJldCwgaTsK
Pgo+IAkJcmV0ID0gZHJtX2dlbV9mYl9hZmJjX2luaXQoZGV2LCBtb2RlX2NtZCwgYWZiY19mYik7
Cj4KPmJhc2UtY29tbWl0OiBlN2JiN2Q0NGMzYjk3YWVhMWYwZTM1NGM2NDk5OTAwMTU0YWM2N2Yy
Cj4tLQo+Mi40OC4xCg==

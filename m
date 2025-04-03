Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400E4746E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 01:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743645048; cv=none; b=XfFhF1O8M0UP9cPzQ7/6apENHt3msdUX4rLALMyuGX/WzkoOBY9BZPeHTyweRHHnYbv0fIFvhzJWnjRAfHw55/stAr7ZKsDOzJ13dsNiilQNvyuxYLARGnxJjLHE62FaFUxjbIIMIKPuO8gqyPX8deRz4e6r2WiqHm6N/cthU68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743645048; c=relaxed/simple;
	bh=fvhrmqFxRW9iluUlEIEdINB9npE40ubf0w3F0jkTFnQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Ncf4+/Kny8i0KM2mdOawzfeKQbohq/bVC5DGcouQMM4A48sGKeHowxaPsa7mB13BxbXs1394Nk5LOYXdrSmzL0buLKsGt5aNV+Vjgz6f9O+yaJraOQcV5y38Q8E04E9yJozrz1ptjuUl8mhYGZz4UqHJSbY3vBglQVBUMyBYZhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=a5+8K1b8 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="a5+8K1b8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vXp/4TYR9/zzfCV+PTqmdxbyCOY2QQST3egC5LaB1TE=; b=a
	5+8K1b8XeCGZSR1RJ0SeJrDZlIfW8c1ZENEc8U225eTvwk9d0DPYxUghUFhW6qaI
	Mrpo1e8WUrJt4HRyRI6en92vFMf4YnGmKMYH9SgP1ByRPXxsIovK+IT56LIxe4Lx
	M9hr9+4fMTvynx3fSqQGK6kt6UflDwI3I7Iefom9/M=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Thu, 3 Apr 2025 09:49:35 +0800 (CST)
Date: Thu, 3 Apr 2025 09:49:35 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
	neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, heiko@sntech.de,
	"Andy Yan" <andy.yan@rock-chips.com>,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re:[PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250314075754.539221-1-andyshrk@163.com>
References: <20250314075754.539221-1-andyshrk@163.com>
X-NTES-SC: AL_Qu2fAfqfu0Es4yaYZukfmkcVgOw9UcO5v/Qk3oZXOJF8jDvp6CEgd21jJ0DK6eeEOiqAjTi3YBx39upQfaBdUrMAyVPhYVx7fETPIuJHQPI3Ag==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4d4460.1cc4.195f956e1f7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cigvCgD3_zwv6e1nC6yNAA--.9840W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAskXmft4vBCUwABsR
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgogR2VudGxlIHBpbmcuLi4uLi4KCkF0IDIwMjUtMDMtMTQgMTU6NTc6NDcsICJBbmR5IFlhbiIg
PGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+RnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2st
Y2hpcHMuY29tPgo+Cj5JdCBpcyBub3QgcmVjb21tZW5kZWQgZm9yIGRyaXZlcnMgdG8gaW5jbHVk
ZSBVQVBJIGhlYWRlcgo+ZGlyZWN0bHkuCj4KPlNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5
LnlhbkByb2NrLWNoaXBzLmNvbT4KPi0tLQo+Cj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMgfCA0ICsrLS0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYwo+aW5kZXggMDg5MGFkZDVmNzA3Li4zMDZlMDlhMjRhMWMgMTAwNjQ0Cj4tLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+KysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPkBAIC0yMiw4ICsyMiw4IEBACj4gCj4gI2lu
Y2x1ZGUgPG1lZGlhL2NlYy1ub3RpZmllci5oPgo+IAo+LSNpbmNsdWRlIDx1YXBpL2xpbnV4L21l
ZGlhLWJ1cy1mb3JtYXQuaD4KPi0jaW5jbHVkZSA8dWFwaS9saW51eC92aWRlb2RldjIuaD4KPisj
aW5jbHVkZSA8bGludXgvbWVkaWEtYnVzLWZvcm1hdC5oPgo+KyNpbmNsdWRlIDxsaW51eC92aWRl
b2RldjIuaD4KPiAKPiAjaW5jbHVkZSA8ZHJtL2JyaWRnZS9kd19oZG1pLmg+Cj4gI2luY2x1ZGUg
PGRybS9kaXNwbGF5L2RybV9oZG1pX2hlbHBlci5oPgo+LS0gCj4yLjM0LjEK

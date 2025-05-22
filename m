Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7C724E4BF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900504; cv=none; b=P380PbRYG8x4GC9Ln8Qcko5bkkziSWwncaTieLv7Wf6ujnjQU0uX2e4bUygEYDWZ8mSLlGDPcpkThmQMpVATtX2IPaWC1wMJZBL66iutIrQAcc8UHoDHsDkDwVV9CQudq/qYOVusW06ySXpcdanCClU1hE2lhbDQ+fBKmI5fHo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900504; c=relaxed/simple;
	bh=sdaeGIr7jFwZoAKH5/TjHpYm6fN0BLPvd9XLtFwckBA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=uDjiJZgs7yXIESjS+iG4DdQP4hAADtu4Py22JbtMFoUO8D+c8VlXYepsmeI5ZG2/gQHvPDl4kz2/kLnDIFGOMxC8xL2wvUuJYFReidQ2JNiIy4pgD/3OjDEu6gx2D+t69nV9CzBE+/Ux+LT+zRLs0XRS36Bwcov1npt77qOjqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=bruCieqq reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="bruCieqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=e+mEkABP8C6+wf+XwcSnrlG6wBq+UUqB+lqd2bdio5o=; b=b
	ruCieqqeBv1bYlQabWWOHA310S/+fR0mxrK7BSyWLs/967jiAmG/gAJTT3EQQx2L
	h4pBP+kmMzyrr41fQ3oQCUqLZQjrWpFZeFnixFmXw8bp1nBtaZZmspyR8ZUuFDrt
	bbQy439/B25TXHnfiRgMf8CasZHyH05PRZjLq+bepU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Thu, 22 May 2025 15:54:17 +0800
 (CST)
Date: Thu, 22 May 2025 15:54:17 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: tzimmermann@suse.de, simona@ffwll.ch, mripard@kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] drm/gem-framebuffer: log errors when gem size <
 afbc_size
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
References: <20250508084811.2472877-1-andyshrk@163.com>
 <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
X-NTES-SC: AL_Qu2fBfWbv0wu4SCabOkfmkcVgOw9UcO5v/Qk3oZXOJF8jAnp4h0vRHlFF0T18sKdCjuCnh6Rezd+48txc5VhR4MF0Qhd3Wi8+fJVnN4ZAxFIiQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6883df90.7132.196f6fc6055.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eygvCgD3v3op2C5o2ZMKAA--.16852W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAVVXmgu1QtbtAABso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGVsbG/vvIwKCgpBdCAyMDI1LTA1LTA4IDE3OjExOjAxLCAiRGFuaWVsIFN0b25lIiA8ZGFuaWVs
QGZvb2lzaGJhci5vcmc+IHdyb3RlOgo+SGkgQW5keSwKPgo+T24gVGh1LCA4IE1heSAyMDI1IGF0
IDExOjQ5LCBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4gd3JvdGU6Cj4+IExldCB0aGUgdXNl
ciBrbm93IHdoYXQgd2VudCB3cm9uZyBpbiBkcm1fZ2VtX2ZiX2FmYmNfaW5pdAo+PiBmYWlsdXJl
IHBhdGhzLgo+Cj5UaGFua3MgZm9yIHRoaXMsIGFuZCB0aGFua3MgYWxzbyBmb3IgdXNpbmcgZHJt
X2RiZ19rbXMoKSB0byBtYWtlIHN1cmUKPnRoYXQgdXNlcnNwYWNlIGNhbid0IGZsb29kIHRoZSBs
b2cgd2l0aCBlcnJvcnMuCj4KPlJldmlld2VkLWJ5OiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29s
bGFib3JhLmNvbT4KCgpNYXkgSSBraW5kbHkgYXNrIHdoaWNoIE1haW50YWluZXIgY2FuIHRha2Ug
dGhpcyBwYXRjaD8KCj4KPkNoZWVycywKPkRhbmllbAo=

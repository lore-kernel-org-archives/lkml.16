Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E64323BFBC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030603; cv=none; b=cEubg1ex2dhZ4Bl/AoTW7azvFyk3bNvlqid7RvK28UX1EfNBwMfHx0Jka0aNckZBJUxGhRcNivFZZx+gK2cjEEGQ7xafJpu66jQgnDEG7jC0Cm0KWot5dNgnO3NnOHfb1JhqN0m+esZZxJc5oSMhZ+j/vICY4Ha8ZCnYu/KK8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030603; c=relaxed/simple;
	bh=18LZ3UeBeD8+PKgIIQH47A2OwH8h/rcoFydIPYn9mgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Fi7CIhgHRnTS84XHVvSscc+6GQvo+B8Pimj9TneOCWJceyWn3eazbJbvi4GNjRyaOPogPh+aaOED/A9kOqf20Z19E0xMoSZzvUrUOuDl5+3QPg+BAOBaWaDgyC0N1l++SsMrQpnirNs6Pz7Fk5pWjxH07iiq4BK8hQ89xySIfhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=XgQnXrBJ reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="XgQnXrBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=WMahgglQfhKL4OuHDIAWoSXkPdUPZsYVvzA3TCjbEf0=; b=X
	gQnXrBJb2R3WZcdOyq6khpMjlzuHyfF5MIDl29e+2RZQA47I/kH5MmOXRE8kMPy7
	FXhOVSL+UZDGWuhIL6XL/otpGtij/wphUcNCk8zWYJKFs6b9rgiAlPPWtK1xHNRL
	Y5YfFPlKGAZXDq76HgbgMd3XdLiCUvAoNhE2AmtcLs=
Received: from xavier_qy$163.com ( [117.131.123.221] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Mon, 7 Apr 2025 20:56:06 +0800 (CST)
Date: Mon, 7 Apr 2025 20:56:06 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Lance Yang" <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, will@kernel.org
Subject: Re:Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250407112922.17766-1-ioworker0@gmail.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <20250407112922.17766-1-ioworker0@gmail.com>
X-NTES-SC: AL_Qu2fBvyYv00t4CWcYekfmkgWgus/WcW2u/Qj3IRSO5FwjCHp5BA7Y1lTE0bM2/CDFx2OkAiHXThMzOpkY49pWoEMkBbwyGARC+fCx4rMd7OOzw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgCHr+dmy_NnpzeQAA--.53262W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTQYoEGfzsgefNwADs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBMYW5jZSwKClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywgbXkgcmVzcG9uc2UgaXMgYXMg
Zm9sbG93cy4KCi0tClRoYW5rcywKWGF2aWVyCgoKCgoKQXQgMjAyNS0wNC0wNyAxOToyOToyMiwg
IkxhbmNlIFlhbmciIDxpb3dvcmtlcjBAZ21haWwuY29tPiB3cm90ZToKPlRoYW5rcyBmb3IgdGhl
IHBhdGNoLiBXb3VsZCB0aGUgZm9sbG93aW5nIGNoYW5nZSBiZSBiZXR0ZXI/Cj4KPmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L21tL2NvbnRwdGUuYyBiL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jCj5p
bmRleCA1NTEwN2QyN2QzZjguLjY0ZWIzYjJmYmYwNiAxMDA2NDQKPi0tLSBhL2FyY2gvYXJtNjQv
bW0vY29udHB0ZS5jCj4rKysgYi9hcmNoL2FybTY0L21tL2NvbnRwdGUuYwo+QEAgLTE3NCw2ICsx
NzQsOSBAQCBwdGVfdCBjb250cHRlX3B0ZXBfZ2V0KHB0ZV90ICpwdGVwLCBwdGVfdCBvcmlnX3B0
ZSkKPiAKPiAJCWlmIChwdGVfeW91bmcocHRlKSkKPiAJCQlvcmlnX3B0ZSA9IHB0ZV9ta3lvdW5n
KG9yaWdfcHRlKTsKPisKPisJCWlmIChwdGVfeW91bmcob3JpZ19wdGUpICYmIHB0ZV9kaXJ0eShv
cmlnX3B0ZSkpCj4rCQkJYnJlYWs7Cj4gCX0KPiAKPiAJcmV0dXJuIG9yaWdfcHRlOwo+LS0gCj4K
PldlIGNhbiBjaGVjayB0aGUgb3JpZ19wdGUgZmxhZ3MgZGlyZWN0bHkgaW5zdGVhZCBvZiB1c2lu
ZyBleHRyYSBib29sZWFuCj52YXJpYWJsZXMsIHdoaWNoIGdpdmVzIHVzIGFuIGVhcmx5LWV4aXQg
d2hlbiBib3RoIGRpcnR5IGFuZCB5b3VuZyBmbGFncwo+YXJlIHNldC4KWW91ciB3YXkgb2Ygd3Jp
dGluZyB0aGUgY29kZSBpcyBpbmRlZWQgbW9yZSBjb25jaXNlLiBIb3dldmVyLCBJIHRoaW5rCiB1
c2luZyBib29sZWFuIHZhcmlhYmxlcyBtaWdodCBiZSBtb3JlIGVmZmljaWVudC4gQWx0aG91Z2gg
aXQgaW50cm9kdWNlcwogYWRkaXRpb25hbCB2YXJpYWJsZXMsIGNvbXBhcmluZyBib29sZWFuIHZh
bHVlcyBpcyBsaWtlbHkgdG8gYmUgbW9yZQogZWZmaWNpZW50IHRoYW4gY2hlY2tpbmcgYml0IHNl
dHRpbmdzLgoKPgo+QWxzbywgaXMgdGhpcyBvcHRpbWl6YXRpb24gcmVhbGx5IG5lZWRlZCBmb3Ig
dGhlIGNvbW1vbiBjYXNlPwpUaGlzIGZ1bmN0aW9uIGlzIG9uIGEgaGlnaC1mcmVxdWVuY3kgZXhl
Y3V0aW9uIHBhdGguIER1cmluZyBkZWJ1Z2dpbmcsCiBJIGZvdW5kIHRoYXQgaW4gbW9zdCBjYXNl
cywgdGhlIGZpcnN0IGZldyBwYWdlcyBhcmUgYWxyZWFkeSBtYXJrZWQgYXMKIGJvdGggZGlydHkg
YW5kIHlvdW5nLiBCdXQgY3VycmVudGx5LCB0aGUgcHJvZ3JhbSBzdGlsbCBoYXMgdG8gY29tcGxl
dGUKIHRoZSBlbnRpcmUgbG9vcCBvZiAxNiBwdGVwIGl0ZXJhdGlvbnMsIHdoaWNoIHNlcmlvdXNs
eSByZWR1Y2VzIHRoZSBlZmZpY2llbmN5Lgo+Cj5UaGFua3MsCj5MYW5jZQo=

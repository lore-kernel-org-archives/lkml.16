Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12164C6C;
	Tue, 13 May 2025 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125152; cv=none; b=PMRZQ31t6hDOmZsMwAt+yLLVzQXjDSEg9FRmvCyAXiXZmW3aSn55OX9gpIMqRTuGcHub59yMIgmYMLhDO+Emu3If2fXcvD5FJh0X0LEaxxAYE000K6BFRiUDVVrolF4bs/15CEhrHWeW+9YYYKNYiTjIHUAvwskMm7okw1z5HLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125152; c=relaxed/simple;
	bh=qEeth5gfdHFocktPysgpKR3djQ+QAg++lc+RTE0OoJA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Ot0gJmmetxkc2/KM+IHAOm0FQba4h+I5G8wQn2MT+bxn7V6UcgeosXnw1PJX1hD5+9i13hxiZciDnDTPHNYHr5+5pQHb5JHxsur45Fgsp01cSw5jkkyZ64HK43XbtZcYfjSLQIoSalAJ79zX6d9Y7oDh2l1GeJenBwQPAwOxcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=MEyXMj4z reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="MEyXMj4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=r5g/HdRGV3CZ2sUgwPHRpvFdkoD9ErLEom5erjkSpTs=; b=M
	EyXMj4zxI3+3B7memUYPCpG4Pr/PlfoMhuaNB5dHCm1KRJSRfhDOOi/Bkdz2J97w
	QivpHb8uHPTKHgYTNaUXzNMonaV90R7jGT4ByaWHTjEsRqb/lyFflHYmnoHlgYL7
	DJe4hrRfWOmlBaljpq07s7W3cp0wITNQgTEPDgcjc8=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-110 (Coremail) ; Tue, 13 May 2025 16:31:31 +0800
 (CST)
Date: Tue, 13 May 2025 16:31:31 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: xhci: use urb hcpriv mempool for private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <875848ec-f92b-48a9-b5c2-792bb0121824@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055545.5738-1-00107082@163.com>
 <875848ec-f92b-48a9-b5c2-792bb0121824@suse.com>
X-NTES-SC: AL_Qu2fBf2Zukgi5yOYY+kZnEYQheY4XMKyuPkg1YJXOp80vyTg8BgQZm9MAUHHws6uNDKhoAi0TT1A0eZkcIVZfqQyXwUBQOfPkouoQyAIP8ct
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1335f63c.7bea.196c8c53bef.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bigvCgDX36VjAyNoGFUDAA--.11642W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hdMqmgi-c1uJwAGsW
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEzIDE2OjIxOjA2LCAiT2xpdmVyIE5ldWt1bSIgPG9uZXVrdW1Ac3VzZS5j
b20+IHdyb3RlOgo+SGksCj4KPk9uIDEzLjA1LjI1IDA3OjU1LCBEYXZpZCBXYW5nIHdyb3RlOgo+
PiB4aGNpIGtlZXBzIGFsbG9jL2ZyZWUgcHJpdmF0ZSBkYXRhIGZvciBlYWNoIGVucXVldWUvZGVx
dWV1ZSBjeWNsZXMsCj4+IHdoZW4gdXNpbmcgYSBVU0Igd2ViY2FtLCB0aGUgbWVtb3J5IGFsbG9j
YXRpb24gZnJlcXVlbmN5IGNvdWxkIHJlYWNoCj4+IGFib3V0IDFrL3MuCj4+IAo+PiBVUkIgb2Jq
ZWN0cyBoYXZlIGxvbmdlciBsaWZlY3ljbGUgdGhhbiBwcml2YXRlIGRhdGEsIGhhbmQgb3ZlciBv
d25lcnNoaXAKPj4gb2YgcHJpdmF0ZSBkYXRhIHRvIHVyYiBjYW4gc2F2ZSBsb3RzIG9mIG1lbW9y
eSBhbGxvY2F0aW9ucyBvdmVyIHRpbWUuCj4KPkkgYW0gYWZyYWlkIEkgbmVlZCB0byBtYWtlIGEg
Y29tbWVudCBhYm91dCBhIHByaW5jaXBhbCBpc3N1ZS4KPgo+VGhpcyBwYXRjaCBzZXQgb3Zlcmxv
b2tzIGEgZnVuZGFtZW50YWwgaXNzdWUuIFlvdSBjYW5ub3QgZ3VhcmFudGVlCj50aGF0IGFuIFVS
QiBpcyByZXVzZWQgYnkgdGhlIHNhbWUgSEMuIEZvciBleGFtcGxlIHlvdSBjYW5ub3QgcnVsZQo+
b3V0IHRoYXQgdGhlIG5leHQgdGltZSB5b3VyIFVSQiBpcyByZXN1Ym1pdHRlZCwgaXQgd2lsbCBs
YW5kIHdpdGgKPlhIQ0kgYWdhaW4uCj4KPlRoYXQgbWVhbnMgeW91IGNhbm5vdCB0b3VjaCBqdXN0
IGhvdyBvbmUgSENEIGhhbmRsZXMgcHJpdmF0ZSBkYXRhLgo+T3IgeW91IG5lZWQgdG8gcmVjb3Jk
IHdoaWNoIEhDIHRoZSBVUkIgd2FzIGxhc3QgdXNlZCBmb3IuCgpObywgSSBkb24ndCB0aGluayB3
aGljaCBIQyB0aGUgVVJCIHdhcyBsYXN0IHVzZWQgZm9yIGNvbmNlcm5zIGhlcmUuCkEgVVJCIGNh
bm5vdCBiZSB1c2VkIGJ5IHR3byBIQyBhdCB0aGUgc2FtZSB0aW1lLCBhcyBsb25nIGFzIHRoaXMg
aG9sZCwgSSBkb24ndCBzZWUgcmVhc29uCiB3b3JyeWluZyBhYm91dCB3aG8gdXNlIHRoaXMgcHJp
dmF0ZSBkYXRhIGJlZm9yZS4KClRoaXMgcGF0Y2ggZm9yIHhoY2kgZG9zZSBub3QgYXNzdW1lIHdo
aWNoIEhDIHVzZSB0aGUgcHJpdmF0ZSBkYXRhIG1lbXBvb2wgIHByZXZpb3VzbHksIG5vcgpzaG91
bGQgb3RoZXIgSENzLgoKT3IsIGRvIEkgbWlzdW5kZXJzdGFuZCB5b3VyIGNvbW1lbnRzPwoKRGF2
aWQKCj4KPglSZWdhcmRzCj4JCU9saXZlcgo=

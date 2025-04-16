Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53651C27
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820191; cv=none; b=HmfPyKCMP8V8vW8IoV0+6Issylz6Ih+wlgZNoOW0mMDrgeqymE51fGUoA6+1CE1BcRaEGg+2O1SLAXZ3kvjQo3LD1jJhbqxbovuA1Sveb3QxaGQZytLVBDj33/uMPaQKajFwER/JBSMs8ReXWdufP6tFYnwjC+sPzW3YJrQ7miQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820191; c=relaxed/simple;
	bh=47+gJAncXgsW/UcXh8b5zJQvQEDM/97e78NneI/DLfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ibsaMT18b+aHZLyMGP3FHhtU+3TU64SyjDZV8DPmJ/sb29gvHiSX2B7rPgUIHF8u+6Xk0T/eVLh1NTmR6Ny9HGC2bheZU7cVhQwdTUd8hBRUEahUcxl6XTe/4aOjHCBdUI/eXwHsZiPFJ03nmT/593QR9OakjGIdsoLmV1dwEaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=DzRM4zOz reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="DzRM4zOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=E2lpbnQnbBedyoi0B/LK+sQPIFtcBCPeDplGCecK+HA=; b=D
	zRM4zOztmBCkE7fFty+203GCYYVh4T4AfQCmyzCP+csHf6fIZAwY20mMjpmieEkz
	u0RaTcR3a8jQ/C3pxJYBO8J82jRYZrXxN1U8ZWMHY2dR+vMgI0YVKrhYoekX7XDe
	jibYLu2Pdil4TNv/jOWXWc+OIdcXbo6aEFlYCzRXeM=
Received: from xavier_qy$163.com ( [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
 ) by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 17 Apr 2025 00:15:37 +0800
 (CST)
Date: Thu, 17 Apr 2025 00:15:37 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
	21cnbao@gmail.com, akpm@linux-foundation.org,
	catalin.marinas@arm.com, david@redhat.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, willy@infradead.org, ziy@nvidia.com
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce
 redundant operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250416095706.47a8afa2@pumpkin>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com>
 <20250416095706.47a8afa2@pumpkin>
X-NTES-SC: AL_Qu2fBvSZv0ko4SaQZekfmk4QgeY+WMW1vP4m34NSN5FwjCzp0ysiZlJTIXjNyvCDLzqKkAiHVTRiy9ZZf7hifrkoAhZ95jwxhkNyTfgk8IjyDQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2b02076d.b3d5.1963f626edb.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZigvCgD3H+mp1_9noeSXAA--.33084W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhExEGf-pJJ9EwAOs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKQXQgMjAyNS0wNC0xNiAxNjo1NzowNiwgIkRhdmlkIExhaWdodCIgPGRhdmlkLmxhaWdodC5s
aW51eEBnbWFpbC5jb20+IHdyb3RlOgo+T24gVHVlLCAxNSBBcHIgMjAyNSAxNjoyMjowNSArMDgw
MAo+WGF2aWVyIDx4YXZpZXJfcXlAMTYzLmNvbT4gd3JvdGU6Cj4KPj4gVGhpcyBjb21taXQgb3B0
aW1pemVzIHRoZSBjb250cHRlX3B0ZXBfZ2V0IGZ1bmN0aW9uIGJ5IGFkZGluZyBlYXJseQo+PiAg
dGVybWluYXRpb24gbG9naWMuIEl0IGNoZWNrcyBpZiB0aGUgZGlydHkgYW5kIHlvdW5nIGJpdHMg
b2Ygb3JpZ19wdGUKPj4gIGFyZSBhbHJlYWR5IHNldCBhbmQgc2tpcHMgcmVkdW5kYW50IGJpdC1z
ZXR0aW5nIG9wZXJhdGlvbnMgZHVyaW5nCj4+ICB0aGUgbG9vcC4gVGhpcyByZWR1Y2VzIHVubmVj
ZXNzYXJ5IGl0ZXJhdGlvbnMgYW5kIGltcHJvdmVzIHBlcmZvcm1hbmNlLgo+Cj5CZW5jaG1hcmtz
Pwo+Cj5BcyBoYXMgYmVlbiBwb2ludGVkIG91dCBiZWZvcmUgQ09OVF9QVEVTIGlzIHNtYWxsIGFu
ZCBJSVJDIGRpcnR5K3lvdW5nCj5pcyB1bnVzdWFsLgoKSSBoYXZlbid0IGZvdW5kIHNvbWUgc3Vp
dGFibGUgYmVuY2htYXJrIHRlc3RzIHlldC4gSSB3aWxsIHdyaXRlIHNvbWUgbW9yZQpnZW5lcmFs
IHRlc3Qgc2NlbmFyaW9zLiBQbGVhc2UgcGF5IGF0dGVudGlvbiB0byB0aGUgc3Vic2VxdWVudCBl
bWFpbHMuCgo+Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBYYXZpZXIgPHhhdmllcl9xeUAxNjMuY29t
Pgo+PiAtLS0KPj4gIGFyY2gvYXJtNjQvbW0vY29udHB0ZS5jIHwgMjAgKysrKysrKysrKysrKysr
KysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jIGIvYXJjaC9hcm02
NC9tbS9jb250cHRlLmMKPj4gaW5kZXggYmNhYzRmNTVmOWMxLi4wYWNmZWU2MDQ5NDcgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jCj4+ICsrKyBiL2FyY2gvYXJtNjQvbW0v
Y29udHB0ZS5jCj4+IEBAIC0xNTIsNiArMTUyLDE2IEBAIHZvaWQgX19jb250cHRlX3RyeV91bmZv
bGQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gIH0KPj4gIEVY
UE9SVF9TWU1CT0xfR1BMKF9fY29udHB0ZV90cnlfdW5mb2xkKTsKPj4gIAo+PiArLyogTm90ZTog
aW4gb3JkZXIgdG8gaW1wcm92ZSBlZmZpY2llbmN5LCB1c2luZyB0aGlzIG1hY3JvIHdpbGwgbW9k
aWZ5IHRoZQo+PiArICogcGFzc2VkLWluIHBhcmFtZXRlcnMuKi8KPgo+Li4uIHRoaXMgbWFjcm8g
bW9kaWZpZXMgLi4uCj4KPkJ1dCB5b3UgY2FuIG1ha2UgaXQgb2J2aW91cyBteSBwYXNzaW5nIGJ5
IHJlZmVyZW5jZS4KPlRoZSBjb21waWxlciB3aWxsIGdlbmVyYXRlIHRoZSBzYW1lIGNvZGUuCj4K
ClRoaXMgcGFydCBtYXkgYWxzbyBiZSBmdXJ0aGVyIHJlZmluZWQuCgotLQpUaGFua3MsClhhdmll
cgo=

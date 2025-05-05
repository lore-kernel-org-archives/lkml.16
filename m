Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7717B50F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455528; cv=none; b=L+HPHK18G6U3xy6nWKaim/iVRY7Jx3d4xxRm1xxYQZdSH5Oq9P0ks32IHvq1L6xMVqlqFVtJE892PmttbBAKZ4JRTLapBfvjuJ/BJI+bb67xkHmN5cafEBHv5orj6cKvQBDYtBDBRoElNDEwVc7+Fhp+CIszItYGknkckf+p9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455528; c=relaxed/simple;
	bh=IYPXgw/t9enEBh5s6b8ufe/hnPw6ndScQx6VQ5ln5Vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=NEXez4y5ua5CB51/a85BBpPbjeFKEp0d3rquTRPEp3bisD22KTA+cygvpRzdIlGjGr2cgS5vW4xJnIkn7IuSekQyeuJNDX6C7wJ1UTB4YOGLE4FxIl8D4ngnnCxt2BJ68rwkBU2N/pRDWnWaJD5XS0D82lireJe6WCM6RpHQR/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=lGWSIlYJ reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="lGWSIlYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=/iKhHXdYy1FVlNTfxYSUFTO6/q/u/BAYTYvmtxNn4gg=; b=l
	GWSIlYJ7twSvWPZHZAKnC0AA2GhuAzFDumYHVYNuU0ztc/cRdPrXZ62ygLh9RPF9
	J3QUbf7NtE/eLSkuErgRtce0mL5ZfJA3nO3MnIAI5eK4GuDPMP38JMIAXpKEJUBz
	sxpa40AqoccALlOYUwDwKTXREXEefVCGyAaRAtuaDI=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-131 (Coremail) ; Mon, 5 May 2025 22:31:01 +0800 (CST)
Date: Mon, 5 May 2025 22:31:01 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Vlastimil Babka" <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	"Shakeel Butt" <shakeel.butt@linux.dev>
Subject: Re: [PATCH] mm/codetag: sub in advance when free non-compound high
 order pages
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8edbd2be-d495-4bfc-a9f3-6eaae7a66d91@suse.cz>
References: <20250504061923.66914-1-00107082@163.com>
 <8edbd2be-d495-4bfc-a9f3-6eaae7a66d91@suse.cz>
X-NTES-SC: AL_Qu2fBPieukwt5yOYYukXn0oTju85XMCzuv8j3YJeN500lyX10RAvZ25bJlHU0fmINxqmoQmpcDt+19t1bLZ7db+fL+cFMTGsWNG1WkcGN+M1
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1da43908.3afc.196a0db7dc3.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gygvCgDnT3mmyxhoTuWjAA--.18912W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkAhEqmgYuTbx-AAFsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTA1IDIxOjEyOjU1LCAiVmxhc3RpbWlsIEJhYmthIiA8dmJhYmthQHN1c2Uu
Y3o+IHdyb3RlOgo+T24gNS80LzI1IDA4OjE5LCBEYXZpZCBXYW5nIHdyb3RlOgo+PiBXaGVuIHBh
Z2UgaXMgbm9uLWNvbXBvdW5kLCBwYWdlWzBdIGNvdWxkIGJlIHJlbGVhc2VkIGJ5IG90aGVyCj4+
IHRocmVhZCByaWdodCBhZnRlciBwdXRfcGFnZV90ZXN0emVybyBmYWlsZWQgaW4gY3VycmVudCB0
aHJlYWQsCj4+IHBnYWxsb2NfdGFnX3N1Yl9wYWdlcyBhZnRlcndhcmRzIHdvdWxkIG1hbmlwdWxh
dGUgYW4gaW52YWxpZAo+PiBwYWdlIGZvciBhY2NvdW50aW5nIHJlbWFpbmluZyBwYWdlczoKPj4g
Cj4+IFt0aW1lbGluZV0gICBbdGhyZWFkMV0gICAgICAgICAgICAgICAgICAgICBbdGhyZWFkMl0K
Pj4gICB8ICAgICAgICAgIGFsbG9jX3BhZ2Ugbm9uLWNvbXBvdW5kCj4+ICAgVgo+PiAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3BhZ2UsIHJmIGNvdW50ZXIg
aW5jCj4+ICAgVgo+PiAgIHwgICAgICAgICAgaW4gX19fZnJlZV9wYWdlcwo+PiAgIHwgICAgICAg
ICAgcHV0X3BhZ2VfdGVzdHplcm8gZmFpbHMKPj4gICBWCj4+ICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwdXRfcGFnZSwgcGFnZSByZWxlYXNlZAo+PiAgIFYKPj4g
ICB8ICAgICAgICAgIGluIF9fX2ZyZWVfcGFnZXMsCj4+ICAgfCAgICAgICAgICBwZ2FsbG9jX3Rh
Z19zdWJfcGFnZXMKPj4gICB8ICAgICAgICAgIG1hbmlwdWxhdGUgYW4gaW52YWxpZCBwYWdlCj4+
ICAgVgo+PiAgIFYKPj4gCj4+IE1vdmUgdGhlIHRhZyBwYWdlIGFjY291bnRpbmcgYWhlYWQsIGFu
ZCBvbmx5IGFjY291bnQgcmVtYWluaW5nIHBhZ2VzCj4+IGZvciBub24tY29tcG91bmQgcGFnZXMg
d2l0aCBub24temVybyBvcmRlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFdhbmcgPDAw
MTA3MDgyQDE2My5jb20+Cj4KPkhtbSwgSSB0aGluayB0aGUgcHJvYmxlbSB3YXMgaW50cm9kdWNl
ZCBieSA1MWZmNGQ3NDg2ZjAgKCJtbTogYXZvaWQgZXh0cmEKPm1lbV9hbGxvY19wcm9maWxpbmdf
ZW5hYmxlZCgpIGNoZWNrcyIpLiBQcmV2aW91c2x5IHdlJ2QgZ2V0IHRoZSB0YWcgcG9pbnRlcgo+
dXBmcm9udCBhbmQgYXZvaWQgdGhlIHBhZ2UgdXNlLWFmdGVyLWZyZWUuCgoKT2gsIHlvdSdyZSBy
aWdodC4gSSBmb3Jnb3QgdG8gY2hlY2sgaGlzdG9yeS4uLi4uLgoKCj4KPkl0IHdvdWxkIGxpa2Vs
eSBiZSBuaWNlciB0byBmaXggaXQgYnkgZ29pbmcgYmFjayB0byB0aGF0IGFwcHJvYWNoIGZvcgo+
X19fZnJlZV9wYWdlcygpLCB3aGlsZSBob3BlZnVsbHkga2VlcGluZyB0aGUgb3B0aW1pc2F0aW9u
cyBvZiA1MWZmNGQ3NDg2ZjAKPmZvciB0aGUgb3RoZXIgY2FsbCBzaXRlcyB3aGVyZSBpdCBhcHBs
aWVzPwoKQWZ0ZXIgY2hlY2tpbmcgdGhhdCBjb21taXQsIEkga2luZCBvZiBmZWVscyB0aGUgY2hh
bmdlcyBpbiBfX2ZyZWVfcGFnZXMgYXJlCiB0aGUgbWFqb3Igb3B0aW1pemF0aW9uIG9mIHRoZSBj
b21taXQuLi4uCldoYXQgYWJvdXQgcmV2ZXJ0IHRoYXQgY29tbWl0IGFuZCBtYWtlIG9wdGltaXph
dGlvbiBieSBjb25kaXRpb24gY2hlY2tzLApzaW1pbGFyIHRvIHdoYXQgdGhpcyBwYXRjaCBkaWQ/
CiAKCgpEYXZpZAoK

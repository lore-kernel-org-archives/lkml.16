Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D74F1C5F39
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724698; cv=none; b=i3GPXkldr9legd2Lv9LI3Ys22USNOlNJTLlpkNGB8UloX44aO+DlVsUAZmNa1VoquRs6ZSdoE5jD2CilkwMNBGRpQD+byBx9pbwbXtXk7/5wov5iTcDfH9z5dozZI5XXjtAnMFjr9cSx/NsiGJBCxYYU2ZtYiHzEzukJvLh4qDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724698; c=relaxed/simple;
	bh=IMCh+tq8j9wHnaZEbSrNFAcEhviUrY4c9Vtez+vwluc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=qGRbEljgW/Oaf+DVowqGaofOG7DnLwZt4R5HpXimitZvYsuGG0pRjtUPcfNcLapE05rT3W/0NLH08zre4uCiUCBT+CxdhgUmuYzRmIlr672nl1uVO8sxyZozAfy4eF3Offdob/w6yDj2mvJI2pzD4pRau476OiJVPD2SGRcdBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=KVO43dDb reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="KVO43dDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=xCN3jLSYPaDNZk6gL76QJxjo3ljN0XUkcNKSxLPeGbM=; b=K
	VO43dDbqbiaAKH2Ao4zU6topieCra0PI2IMdGkQgyD3f+5a9V+2fEgqIUCONuEfB
	V90h/f92rw0UxtXEQyayfD+DPmf0VRhT0CstlNkTi7pV06ZXSCNaT3MlqKOUamPa
	8yXUKUtDvEesLpVBUM1yskH5gMNaAZJSzQ1wb1ZIGA=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-103 (Coremail) ; Fri, 9 May 2025 01:17:46 +0800 (CST)
Date: Fri, 9 May 2025 01:17:46 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Kent Overstreet" <kent.overstreet@linux.dev>
Cc: "Suren Baghdasaryan" <surenb@google.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <5294252d.b74a.196b0d583c6.Coremail.00107082@163.com>
References: <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
 <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
 <52tsrapmkfywv4kkdpravtfmxkhxchyua4wttpugihld4iws3r@atfgtbd5wwhx>
 <e1cc19.5287.196ae733594.Coremail.00107082@163.com>
 <y6d7vzvii5wvfby5446ukpvdmulwd5lzcyki6rpxckh432d6jz@xwtlwnkhztuo>
 <7bf1ee37.b6a4.196b0b6dce1.Coremail.00107082@163.com>
 <is4valhxssgmj7cjdlp2gfvyivhdflu75vzzbkjeiyb47wom55@yx5lfwsptamg>
 <5294252d.b74a.196b0d583c6.Coremail.00107082@163.com>
X-NTES-SC: AL_Qu2fBPuZu04t4CWZYukXn0oTju85XMCzuv8j3YJeN500tSTu1xw5Zm9ZHnDfws6lOxmhoAi0Xj5Pz8ZQTIhae6+V4r8K4co45vCxTSEEu3gA
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <64e0d38f.b791.196b0e73c9d.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgDX3+k75xxoIwgAAA--.449W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hhHqmgcyMqBEAAWsW
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

ClRoZSBpbXBhY3Qgb2YgYWNjdW11bGF0ZWQgaXRlcmF0b3IgcmV3aW5kaW5nIGNvdWxkIGJlIG9i
c2VydmVkIHZpYToKCnN1ZG8gc3RyYWNlIC1UIC1lIHJlYWQgY2F0IC9wcm9jL2FsbG9jaW5mbyAg
PiAvZGV2L251bGwKClRlbnMgb2YgcmVhZCBzaG91bGQgYmUgb2JzZXJ2ZWQgYW5kIGVhY2ggcmVh
ZCBzaG91bGQgYmVjb21lIHNsb3dlciBhbmQgc2xvd2VyLgoKCiAKCkF0IDIwMjUtMDUtMDkgMDA6
NTg6MjUsICJEYXZpZCBXYW5nIiA8MDAxMDcwODJAMTYzLmNvbT4gd3JvdGU6Cj4KPkF0IDIwMjUt
MDUtMDkgMDA6MzQ6MjcsICJLZW50IE92ZXJzdHJlZXQiIDxrZW50Lm92ZXJzdHJlZXRAbGludXgu
ZGV2PiB3cm90ZToKPj5PbiBGcmksIE1heSAwOSwgMjAyNSBhdCAxMjoyNDo1NkFNICswODAwLCBE
YXZpZCBXYW5nIHdyb3RlOgo+Pj4gQXQgMjAyNS0wNS0wOCAyMTozMzo1MCwgIktlbnQgT3ZlcnN0
cmVldCIgPGtlbnQub3ZlcnN0cmVldEBsaW51eC5kZXY+IHdyb3RlOgo+Pj4gPlRoZSBmaXJzdCBx
dWVzdGlvbiBpcyAtIGRvZXMgaXQgbWF0dGVyPyBJZiB0aGUgb3B0aW1pemF0aW9uIGlzIGp1c3Qg
Zm9yCj4+PiA+L3Byb2MvYWxsb2NpbmZvLCB3aG8ncyByZWFkaW5nIGl0IGF0IGEgaGlnaCBlbm91
Z2ggcmF0ZSB0aGF0IHdlIGNhcmU/Cj4+PiA+Cj4+PiA+SWYgaXQncyBvbmx5IGJlaW5nIHVzZWQg
aW50ZXJhY3RpdmVseSwgaXQgZG9lc24ndCBtYXR0ZXIuIElmIGl0J3MgYmVpbmcKPj4+ID5yZWFk
IGF0IGEgaGlnaCByYXRlIGJ5IHNvbWUgc29ydCBvZiBwcm9maWxpbmcgcHJvZ3JhbSwgd2UnZCB3
YW50IHRvIHNraXAKPj4+ID50aGUgdGV4dCBpbnRlcmZhY2UgZW50aXJlbHkgYW5kIGFkZCBhbiBp
b2N0bCB0byByZWFkIHRoZSBkYXRhIG91dCBpbiBhCj4+PiA+YmluYXJ5IGZvcm1hdC4KPj4+IC4u
Ll5fXiwgQWN0dWFsbHksIEkgaGF2ZSBiZWVuIHJ1bm5pbmcgdG9vbHMgcGFyc2luZyAvcHJvYy9h
bGxvY2luZm8gZXZlcnkgNSBzZWNvbmRzCj4+PiAsYW5kIGZlZWRpbmcgZGF0YSB0byBhIHByb21l
dGhldXMgc2VydmVyIGZvciBhIHF1aXRlIGxvbmcgd2hpbGUuLi4KPj4+IDUgc2Vjb25kcyBzZWVt
cyBub3QgdGhhdCBmcmVxdWVudCwgYnV0IEkgYWxzbyBoYXZlIGFsbCBvdGhlciBwcm9jIGZpbGVz
IHRvIHJlYWQsIAo+Pj4gSSB3b3VsZCBsaWtlIG9wdGltaXphdGlvbiBmb3IgYWxsIHRoZSBwcm9j
IGZpbGVzLi4uLi4uCj4+PiAKPj4+IElvY3RsIG9yIG90aGVyIGJpbmFyeSBpbnRlcmZhY2VzIGFy
ZSBpbmRlZWQgbW9yZSBlZmZpY2llbnQsIGJ1dCBtb3N0IGFyZQo+Pj4gbm90IHdlbGwgZG9jdW1l
bnRlZCwgd2hpbGUgbW9zdCBwcm9jIGZpbGVzIGFyZSBzZWxmLWRvY3VtZW50ZWQuIElmIHByb2Mg
ZmlsZXMKPj4+IGFyZSBlZmZpY2llbnQgZW5vdWdoLCBJIHRoaW5rIEkgd291bGQgc3RheSB3aXRo
IHByb2MgZmlsZXMgZXZlbiB3aXRoIGEgYmluYXJ5Cj4+PiBpbnRlcmZhY2UgYWx0ZXJuYXRlIHRl
bnMgb2YgZm9sZCBmYXN0ZXIuCj4+Cj4+VGhpcyB3b3VsZCBiZSBhIHBlcmZlY3QgcGxhY2UgZm9y
IGEgYmluYXJ5IGludGVyZmFjZSwgeW91IGp1c3Qgd2FudCB0bwo+PnJldHVybiBhbiBhcnJheSBv
Zgo+Pgo+PnN0cnVjdCBhbGxvY2F0ZWRfYnlfaXAgewo+Pgl1NjQJaXA7Cj4+CXU2NAlieXRlczsK
Pj59Owo+Cj4KPgo+Pgo+PlByaW50aW5nIGl0IGluIHRleHQgZm9ybSByZXF1aXJlcyBzeW1ib2wg
dGFibGUgbG9va3VwLCB3aGF0IHlvdSdyZQo+Pm9wdGltaXppbmcgaXMgbm9pc2UgY29tcGFyZWQg
dG8gdGhhdCBhbmQgdnNucHJpbnRmKCkuCj4KPk9oLCBubywgdGhpcyBvcHRpbWl6YXRpb24gaXMg
bW9zdGx5IGFjaGlldmVkIGJ5IGF2b2lkaW5nIGl0ZXIgcmV3aW5kaW5nLCBJIHRoaW5rCj5JIHRh
bGsgYWJvdXQgdGhlIGV4dHJhIG1lbW9yeSBhbGxvY2F0aW9uICJ0b28gbXVjaCIuLi4uCj5UaGVz
ZSBsaW5lcyBvZiBjb2RlOgo+LQl3aGlsZSAoKGN0ID0gY29kZXRhZ19uZXh0X2N0KCZwcml2LT5p
dGVyKSkgIT0gTlVMTCAmJiBub2RlKQo+LQkJbm9kZS0tOwo+aGF2ZSBhY2N1bXVsYXRlZCB3YXkg
dG9vIG11Y2guCj5UaGluayBpdCB0aGlzIHdheSwgYWR2YW5jaW5nIGl0ZXJhdG9yIG4gdGltZXMg
dGFrZXMgMSUsIHJlYXNvbmFibGUgbm9pc2UKPmNvbXBhcmVkIHRvICBzeW1ib2wgbG9va3VwIGFu
ZCBwcmludGYoKS4gVGhlIHByb2JsZW0gaXMgc2VxX2ZpbGUoKSB3b3VsZAo+cmVzdGFydCBhYm91
dCA4MCB0aW1lcyB0byByZWFkIG91dCBhbGwgY29udGVudCBvZiAvcHJvYy9hbGxvY2luZm8sIGFj
Y3VtdWxhdGVkCj50byBhIHRvdGFsIDQwKm4gaXRlcmF0b3IgYWR2YW5jZW1lbnQsIGhlbmNlIDEl
IGJlY29tZSA0MCoxJSwgbm9pc2UgYmVjb21lIHNpZ25pZmljYW50Lgo+Cj5NeSB0ZXN0IHJlc3Vs
dCBzaG93cyBhbiBpbXByb3ZlbWVudCBmcm9tIDdtcyB0byA0bXM6Cj4KPlRpbWluZ3MgYmVmb3Jl
Ogo+CSQgdGltZSBjYXQgL3Byb2MvYWxsb2NpbmZvICA+IC9kZXYvbnVsbAo+Cj4JcmVhbAkwbTAu
MDA3cwo+CXVzZXIJMG0wLjAwMHMKPglzeXMJMG0wLjAwN3MKPnJlYWQtc3lzY2FsbHMgZ2V0IHNs
b3dlciBhbmQgc2xvd2VyOgo+CXJlYWQoMywgImFsbG9jaW5mbyAtIHZlcnNpb246IDEuMFxuIyAg
ICAgPCIuLi4sIDEzMTA3MikgPSA0MDg1IDwwLjAwMDA2Mj4KPgkuLi4KPglyZWFkKDMsICIgICAg
ICAgICAgIDAgICAgICAgIDAgZHJpdmVycy9ncCIuLi4sIDEzMTA3MikgPSA0MDQ2IDwwLjAwMDEz
NT4KPglyZWFkKDMsICIgICAgICAgICAgIDAgICAgICAgIDAgc291bmQvY29yZSIuLi4sIDEzMTA3
MikgPSA0MDIxIDwwLjAwMDE1MD4KPgkuLi4KPgo+YW5kIHdpdGggdGhlIGNoYW5nZToKPgkkIHRp
bWUgY2F0IC9wcm9jL2FsbG9jaW5mbyAgPiAvZGV2L251bGwKPgo+CXJlYWwJMG0wLjAwNHMKPgl1
c2VyCTBtMC4wMDBzCj4Jc3lzCTBtMC4wMDNzCj4K

Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DED21147B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819835; cv=none; b=he5APlAYBYe7cBQGgW69Qbj9JYoYQarq4vN5VG3lem1g+dOW+sYQ/E0ybqP+aAoTMNGGnaBb0vA1w9Giy3AaPA2yI1e9BaXYHBPw1rhdQlMdzGO6jE3lVqkD0p+I6E07s5wcBj0guJZZasuf+JLHDV18Cnkws/WnSXdkTB9lwKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819835; c=relaxed/simple;
	bh=Vfyrn4sci4VZ12tMwuzEKJhCvHNChdBJTlObtHxjXM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Mtge7H/KMCdPZrouQpmY3koKHv55iInOuKnsd3XK7RQ+eRiMiWGeJIqjLaa3hvRluHysf+nH8ojAg45XuNXhfcoY00nmiZVUfB8O6etJ+KUmz3Bm5ZIlZJVsi9gnlYrJZElAxPv45/O11e4SmuevS9uR69Etd6YjW3t346a5lVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=LBMazJEH reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="LBMazJEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=d6PzMlsChX8XLKLTAraoErRhLqsSXDpIfKoTtzsgAxo=; b=L
	BMazJEHSsbW9G6/DUvWedBCUo2CtaamOQrINRFU1n5FMddxiofiem3MjH7DN/PSI
	0K9LAsTQpSQlO8vjgqOyJQK09g9rlfjYKw7FmNoEIoI0tQjKuUfdbijnWt+m7fAo
	G+up6ijBmGHL5Fez+VKoLRrgpFVLIztiGnjCd8s8Es=
Received: from xavier_qy$163.com ( [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
 ) by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 17 Apr 2025 00:09:36 +0800
 (CST)
Date: Thu, 17 Apr 2025 00:09:36 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>
Cc: dev.jain@arm.com, ioworker0@gmail.com, 21cnbao@gmail.com,
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
	ziy@nvidia.com
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce
 redundant operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com>
 <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
X-NTES-SC: AL_Qu2fBvSatk8s4CWaZekfmk4QgeY+WMW1vP4m34NSN5FwjCzp0ysiZlJTIXjNyvCDLzqKkAiHVTRiy9ZZf7hifrko7HzbN781LCzEGZh9hD9SQg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <72ff1deb.b3a7.1963f5cec0c.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZigvCgD339ZA1v9nYeSXAA--.45267W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhExEGf-pJJ9EwAMs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA0LTE2IDIwOjU0OjQ3LCAiUnlhbiBSb2JlcnRzIiA8cnlhbi5yb2JlcnRzQGFy
bS5jb20+IHdyb3RlOgo+T24gMTUvMDQvMjAyNSAwOToyMiwgWGF2aWVyIHdyb3RlOgo+PiBUaGlz
IGNvbW1pdCBvcHRpbWl6ZXMgdGhlIGNvbnRwdGVfcHRlcF9nZXQgZnVuY3Rpb24gYnkgYWRkaW5n
IGVhcmx5Cj4+ICB0ZXJtaW5hdGlvbiBsb2dpYy4gSXQgY2hlY2tzIGlmIHRoZSBkaXJ0eSBhbmQg
eW91bmcgYml0cyBvZiBvcmlnX3B0ZQo+PiAgYXJlIGFscmVhZHkgc2V0IGFuZCBza2lwcyByZWR1
bmRhbnQgYml0LXNldHRpbmcgb3BlcmF0aW9ucyBkdXJpbmcKPj4gIHRoZSBsb29wLiBUaGlzIHJl
ZHVjZXMgdW5uZWNlc3NhcnkgaXRlcmF0aW9ucyBhbmQgaW1wcm92ZXMgcGVyZm9ybWFuY2UuCj4+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBYYXZpZXIgPHhhdmllcl9xeUAxNjMuY29tPgo+PiAtLS0KPj4g
IGFyY2gvYXJtNjQvbW0vY29udHB0ZS5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jIGIvYXJjaC9hcm02NC9tbS9jb250cHRl
LmMKPj4gaW5kZXggYmNhYzRmNTVmOWMxLi4wYWNmZWU2MDQ5NDcgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvYXJtNjQvbW0vY29udHB0ZS5jCj4+ICsrKyBiL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jCj4+
IEBAIC0xNTIsNiArMTUyLDE2IEBAIHZvaWQgX19jb250cHRlX3RyeV91bmZvbGQoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gIH0KPj4gIEVYUE9SVF9TWU1CT0xf
R1BMKF9fY29udHB0ZV90cnlfdW5mb2xkKTsKPj4gIAo+PiArLyogTm90ZTogaW4gb3JkZXIgdG8g
aW1wcm92ZSBlZmZpY2llbmN5LCB1c2luZyB0aGlzIG1hY3JvIHdpbGwgbW9kaWZ5IHRoZQo+PiAr
ICogcGFzc2VkLWluIHBhcmFtZXRlcnMuKi8KPj4gKyNkZWZpbmUgQ0hFQ0tfQ09OVFBURV9GTEFH
KHN0YXJ0LCBwdGVwLCBvcmlnX3B0ZSwgZmxhZykgXAo+PiArICAgIGZvciAoOyAoc3RhcnQpIDwg
Q09OVF9QVEVTOyAoc3RhcnQpKyssIChwdGVwKSsrKSB7IFwKPj4gKwkJaWYgKHB0ZV8jI2ZsYWco
X19wdGVwX2dldChwdGVwKSkpIHsgXAo+PiArCQkJCW9yaWdfcHRlID0gcHRlX21rIyNmbGFnKG9y
aWdfcHRlKTsgXAo+PiArCQkJCWJyZWFrOyBcCj4+ICsJCX0gXAo+PiArICAgIH0KPgo+SSdtIHJl
YWxseSBub3QgYSBmYW4gb2YgdGhpcyBtYWNybywgaXQganVzdCBvYmZ1c2NhdGVzIHdoYXQgaXMg
Z29pbmcgb24uIEknZAo+cGVyc29uYWxseSBwcmVmZXIgdG8gc2VlIHRoZSAyIGV4dHJhIGxvb3Bz
IG9wZW4gY29kZWQgYmVsb3cuCj4KPk9yIGV2ZW4gYmV0dGVyLCBjb3VsZCB5b3UgcHJvdmlkZSBy
ZXN1bHRzIGNvbXBhcmluZyB0aGlzIDMgbG9vcCB2ZXJzaW9uIHRvIHRoZQo+c2ltcGxlciBhcHBy
b2FjaCBJIHN1Z2dlc3RlZCBwcmV2aW91c2x5PyBJZiB0aGUgcGVyZm9ybWFuY2UgaXMgc2ltaWxh
ciAod2hpY2ggSQo+ZXhwZWN0IGl0IHdpbGwgYmUsIGVzcGVjaWFsbHkgZ2l2ZW4gQmFycnkncyBw
b2ludCB0aGF0IHlvdXIgdGVzdCBhbHdheXMgZW5zdXJlcwo+dGhlIGZpcnN0IFBURSBpcyBib3Ro
IHlvdW5nIGFuZCBkaXJ0eSkgdGhlbiBJJ2QgcHJlZmVyIHRvIGdvIHdpdGggdGhlIHNpbXBsZXIg
Y29kZS4KCkkgd2lsbCB0ZXN0IHRoZSBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlcyBhbW9uZyB0aGVz
ZSBzZXZlcmFsIGltcGxlbWVudGF0aW9ucy4KSWYgdGhlIGRpZmZlcmVuY2VzIGFyZSBub3Qgc2ln
bmlmaWNhbnQsIEkgd2lsbCB0cnkgdG8gaW1wbGVtZW50IGl0IHdpdGggdGhlIHNpbXBsZXIgbWV0
aG9kLgoKQXQgdGhlIHNhbWUgdGltZSwgYWNjb3JkaW5nIHRvIEJhcnJ5J3Mgc3VnZ2VzdGlvbiwg
SSB3aWxsIGFkZCBzb21lIG1vcmUgZ2VuZXJhbAp0ZXN0IGNhc2VzIHRvIHZlcmlmeSB3aGV0aGVy
IHRoZSBvcHRpbWl6YXRpb24gaXMgZWZmZWN0aXZlLgoKU2luY2UgSSdtIGEgYml0IGJ1c3kgcmVj
ZW50bHksIGl0IG1heSB0YWtlIG1lIGEgZmV3IGRheXMgdG8gY29tcGxldGUgdGhpcyB0YXNrLgoK
Pj4gKwo+PiAgcHRlX3QgY29udHB0ZV9wdGVwX2dldChwdGVfdCAqcHRlcCwgcHRlX3Qgb3JpZ19w
dGUpCj4+ICB7Cj4+ICAJLyoKPj4gQEAgLTE2OSwxMSArMTc5LDE3IEBAIHB0ZV90IGNvbnRwdGVf
cHRlcF9nZXQocHRlX3QgKnB0ZXAsIHB0ZV90IG9yaWdfcHRlKQo+PiAgCWZvciAoaSA9IDA7IGkg
PCBDT05UX1BURVM7IGkrKywgcHRlcCsrKSB7Cj4+ICAJCXB0ZSA9IF9fcHRlcF9nZXQocHRlcCk7
Cj4+ICAKPj4gLQkJaWYgKHB0ZV9kaXJ0eShwdGUpKQo+PiArCQlpZiAocHRlX2RpcnR5KHB0ZSkp
IHsKPj4gIAkJCW9yaWdfcHRlID0gcHRlX21rZGlydHkob3JpZ19wdGUpOwo+PiArCQkJQ0hFQ0tf
Q09OVFBURV9GTEFHKGksIHB0ZXAsIG9yaWdfcHRlLCB5b3VuZyk7Cj4+ICsJCQlicmVhazsKPj4g
KwkJfQo+PiAgCj4+IC0JCWlmIChwdGVfeW91bmcocHRlKSkKPj4gKwkJaWYgKHB0ZV95b3VuZyhw
dGUpKSB7Cj4+ICAJCQlvcmlnX3B0ZSA9IHB0ZV9ta3lvdW5nKG9yaWdfcHRlKTsKPj4gKwkJCUNI
RUNLX0NPTlRQVEVfRkxBRyhpLCBwdGVwLCBvcmlnX3B0ZSwgZGlydHkpOwo+PiArCQkJYnJlYWs7
Cj4+ICsJCX0KPj4gIAl9Cj4+ICAKPj4gIAlyZXR1cm4gb3JpZ19wdGU7Cj4KPklmIHdlIGRlY2lk
ZSB0aGlzIGlzIGFsbCB3b3J0aCB0aGUgdHJvdWJsZSwgdGhlbiBJIHRoaW5rIHdlIGNhbiAoYW5k
ICpzaG91bGQqLAo+aW4gb3JkZXIgdG8gYmUgY29uc2lzdGVudCkgcHVsbCBhIHNpbWlsYXIgc3R1
bnQgaW4gY29udHB0ZV9wdGVwX2dldF9sb2NrbGVzcygpLgoKT0suIFRoaXMgZnVuY3Rpb24gc2Vl
bXMgdG8gYmUgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4gSSdsbCBnaXZlIGl0IGEgdHJ5IHRvCmZp
Z3VyZSBvdXQgaG93IHRvIG9wdGltaXplIGl0LgoKLS0KVGhhbmtzLApYYXZpZXIKCg==

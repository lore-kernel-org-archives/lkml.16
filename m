Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB528D832
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746642003; cv=none; b=KyCr8BYCKeT7TnnAAlCLqmalitaiWiyOykysAaX+yPr+eHz19DzXenpJwAH3E5WJ0YGA1suxewcsWq+mDRJ0GFV7j+VAKB0ZKsHlphZ3ydbyB+dhGVRzDyJxxT0UIVh0tMvCVahL7dgJblUfT5nvwQF2FlP24tLUKXg8yYRe7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746642003; c=relaxed/simple;
	bh=w8RDwUIprAz9qIuiqbTeicSkjzeMH9+CVIua/qg5doI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=QEccDpmnoPPMmrYfF5UEVlrEh2HSutB+V/JPVOM0eilboq1njaBYuAQO1CgrxkKhZ5B0XOAekCTBslr5bDFXHL74E7OPbg7z0J5A2f4SA527FPU7ij+0c6m0Cg35wvev36uJTqvs3gg7qdYACYOliAM44i0LetBx+eWsrzM9puQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Cqb1g1mO reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Cqb1g1mO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=NzAVPZu75Gizd8T2vMxouZiBws7gu4nUf1pGGBbVNSY=; b=C
	qb1g1mOy0h7dP0n11Vvr3al5epfqydRM9Tip2/1JSBAtPLRbvda3i/b3PFAruu2L
	178cKEcBdE4tYDAmPrhtv1pE25PUY+TRkNq5DaEsi9pA5fkYRIvsPXmURyd2xlE+
	oFPXXP+9HryIKLOMLEMTWSg64GOrTOfNSMXgehlRpQ=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 8 May 2025 02:19:34 +0800 (CST)
Date: Thu, 8 May 2025 02:19:34 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: surenb@google.com, kent.overstreet@linux.dev, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250507175500.204569-1-00107082@163.com>
References: <20250507175500.204569-1-00107082@163.com>
X-NTES-SC: AL_Qu2fBPqfvkEs4iGaZOkXn0oTju85XMCzuv8j3YJeN500uSTXywcqW29JPUDfws6QOyusoAiQdzRj4/R6caldXIAxrCzA3ipq/U8yZiVSG0Z1
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgBHj6A3pBtoYZ+mAA--.54758W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkB5GqmgbnJg6CwAEsg
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksIApKdXN0IHdhbnQgdG8gc2hhcmUgaG93IEkgbm90aWNlIHRob3NlIG1lbW9yeSBhbGxvY2F0
aW9uIGJlaGFpdm9yczogdGhlIGN1bXVsYXRpdmUgY291bnRlcnN+IQoKV2l0aCBjdW11bGF0aXZl
IGNvdW50ZXJzLCBJIGNhbiBpZGVudGlmeSB3aGljaCBtb2R1bGUga2VlcHMgYWxsb2MvZnJlZSBt
ZW1vcnksIGJ5IHRoZSByYXRpbyBiZXR3ZWVuCiBjdW11bGF0aXZlIGNhbGxzIGFuZCByZW1haW5p
bmcgY2FsbHMsIGFuZCBtYXliZSBhbiBvcHRpbWl6YXRpb24gY291bGQgYmUgYXBwbGllZC4KRm9s
bG93aW5nIGlzIHRvcDE2IEkgZ290IG9uIG15IHN5c3RlbToKCistLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLS0tLS0tLSsKfCAgICAgICAgICAgICAgICAgIGFsbG9jICAgICAgICAgICAgICAgICAg
fCBjYWxscyB8IGN1bXVsYXRpdmUgY2FsbHMgfCAgICAgICByYXRpbyAgICAgICAgfAorLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLSstLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0rCnwgICAgICAgICAgICBmcy9zZXFfZmlsZS5jOjU4
NCAgICAgICAgICAgIHwgICAyICAgfCAgICAgMTgwNjQ4MjUgICAgIHwgICAgIDkwMzI0MTIuNSAg
ICAgIHwKfCAgICAgICAgICAgICBmcy9zZXFfZmlsZS5jOjM4ICAgICAgICAgICAgfCAgIDUgICB8
ICAgICAxODE0ODI4OCAgICAgfCAgICAgMzYyOTY1Ny42ICAgICAgfAp8ICAgICAgICAgICAgIGZz
L3NlcV9maWxlLmM6NjMgICAgICAgICAgICB8ICAgMTUgIHwgICAgIDE4MTUzMjcxICAgICB8IDEy
MTAyMTguMDY2NjY2NjY2NyB8CnwgICAgICAgICAgbmV0L2NvcmUvc2tidWZmLmM6NTc3ICAgICAg
ICAgIHwgICA5ICAgfCAgICAgMTA2Nzk5NzUgICAgIHwgMTE4NjY2My44ODg4ODg4ODkgIHwKfCAg
ICAgICAgICBuZXQvY29yZS9za2J1ZmYuYzo2NTggICAgICAgICAgfCAgIDIxICB8ICAgICAxMTAx
MzQzNyAgICAgfCAgNTI0NDQ5LjM4MDk1MjM4MSAgfAp8ICAgICAgICAgICAgIGZzL3NlbGVjdC5j
OjE2OCAgICAgICAgICAgICB8ICAgNyAgIHwgICAgIDI4MzEyMjYgICAgICB8IDQwNDQ2MC44NTcx
NDI4NTcxNiB8CnwgICAgICAgICAgICBsaWIvYWxsb2NfdGFnLmM6NTEgICAgICAgICAgIHwgICAx
ICAgfCAgICAgIDM0MDY0OSAgICAgIHwgICAgICAzNDA2NDkuMCAgICAgIHwgIDwtLS0gSGVyZSBJ
IHN0YXJ0ZWQKfCAgICAgICAgICAga2VybmVsL3NpZ25hbC5jOjQ1NSAgICAgICAgICAgfCAgIDEg
ICB8ICAgICAgMzAwNzMwICAgICAgfCAgICAgIDMwMDczMC4wICAgICAgfAp8IGZzL25vdGlmeS9p
bm90aWZ5L2lub3RpZnlfZnNub3RpZnkuYzo5NiB8ICAgMSAgIHwgICAgICAyNDk4MzEgICAgICB8
ICAgICAgMjQ5ODMxLjAgICAgICB8CnwgICAgICAgICAgICBmcy9leHQ0L2Rpci5jOjY3NSAgICAg
ICAgICAgIHwgICAzICAgfCAgICAgIDUxOTczNCAgICAgIHwgMTczMjQ0LjY2NjY2NjY2NjY2IHwK
fCAgICAgICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYzoxNTU1ICAgICAgfCAgIDQgICB8ICAgICAg
MTI2NDAyICAgICAgfCAgICAgIDMxNjAwLjUgICAgICAgfAp8ICAgICAgICAgICAgICBmcy9sb2Nr
cy5jOjI3NSAgICAgICAgICAgICB8ICAgMzYgIHwgICAgICA5ODY5NTcgICAgICB8IDI3NDE1LjQ3
MjIyMjIyMjIyMyB8CnwgICAgICAgICAgIGZzL3Byb2MvaW5vZGUuYzo1MDIgICAgICAgICAgIHwg
ICAzICAgfCAgICAgIDYzNzUzICAgICAgIHwgICAgICAyMTI1MS4wICAgICAgIHwKfCAgICAgICAg
ICAgICAgZnMvcGlwZS5jOjEyNSAgICAgICAgICAgICAgfCAgMTIzICB8ICAgICAyMTQzMzc4ICAg
ICAgfCAxNzQyNS44MzczOTgzNzM5ODQgfAp8ICAgICAgICAgICAgbmV0L2NvcmUvc2NtLmM6ODQg
ICAgICAgICAgICB8ICAgMyAgIHwgICAgICA0MzI2NyAgICAgICB8IDE0NDIyLjMzMzMzMzMzMzMz
NCB8CnwgICAgICAgICBmcy9rZXJuZWxfcmVhZF9maWxlLmM6ODAgICAgICAgIHwgICAyICAgfCAg
ICAgIDI2OTEwICAgICAgIHwgICAgICAxMzQ1NS4wICAgICAgIHwKKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLS0tKwoKSSB0aGluayB0aGlzIGlzIGFub3RoZXIgImdvb2QiIHVzYWdlIGZv
ciBjdW11bGF0aXZlIGNvdW50ZXJzOiBpZiBhIG1vZHVsZSBqdXN0IGtlZXBzIGFsbG9jL2ZyZWUg
bWVtb3J5LAptYXliZSBpdCBpcyBnb29kIHRvIG1vdmUgdGhlIG1lbW9yeSBhbGxvYy9mcmVlIHRv
IHNvbWV3aGVyZSBsZXNzIGZyZXF1ZW50LgoKSW4gdGhlIGNhc2Ugb2YgdGhpcyBwYXRjaCwgYSBt
ZW1vcnkgYWxsb2NhdGlvbiBmb3IgZWFjaCByZWFkLWNhbGxzLCBjYW4gYmUgbW92ZWQgdG8gb3Bh
bi1jYWxscy4KCklmIGludGVyZXN0ZWQsIEkgY2FuIHJlLXNlbmQgdGhlIHBhdGNoIGZvciBjdW11
bGF0aXZlIGNvdW50ZXJzIGZvciBmdXJ0aGVyIGRpc2N1c3Npb25zLgoKCkZZSQpEYXZpZA==

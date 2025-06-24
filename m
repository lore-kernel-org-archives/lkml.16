Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE9D19F480
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756068; cv=none; b=vEj4+lkqFl3p/FgV2EL8FId7V+wi+kpK2IpsDUZysnm/7kvj9AcxfltrY1bmZUwlC+UjBWpU9L9WI92oc7aGvjrX1VtAuiP+9UFaIpd6/c3f/0nKl3A23yvFbovgWuFXcIm2G7WkPIagQRz4StexLPFcKx3Ht84klcchL1D89u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756068; c=relaxed/simple;
	bh=PXxv1x4vMj8HtH6mDoDCzo/S/O1hLgYUGm2bvINLW8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ka/AsJn8f0rvwdkjXb7cQ6YuMl7Kn60sTH+TZbJXxVjrHGhHdyD/nFg6VngLZuAF9g3K7mJb5ustsvLW3YO95xNZ+Jw/YVbYvChDZwZriZ3vXzsuWu4EAane1/bZIJGiLcKeL3rysgcmqwSBy80vYr+htz8c5o3HyqA50k/eQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=L2mjg3x6 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="L2mjg3x6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=AJtl+7U6LDrFg/qEQD3I4MJY8fflm/Bd3d5juOYtBlY=; b=L
	2mjg3x6IZ47fmg9peX8RRCP2wdic9Vai5lyZfci6lXzrf0cZKLrGCe4+EbjQ9kuF
	oEOMZpa69GfYBY/c+kbaWQQfcfQYUUiRRNzum25vTx9jZ3V3Gq4waD2Qx7IbHm2v
	VVlcVMC6ZpzfTHcoWjJxUfNRBUOHqZRX6uNz/6EScM=
Received: from 00107082$163.com ( [111.35.191.166] ) by
 ajax-webmail-wmsvr-40-138 (Coremail) ; Tue, 24 Jun 2025 17:07:15 +0800
 (CST)
Date: Tue, 24 Jun 2025 17:07:15 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>, "Baoquan He" <bhe@redhat.com>,
	"Harry Yoo" <harry.yoo@oracle.com>,
	"Suren Baghdasaryan" <surenb@google.com>
Subject: Re:[PATCH 1/2] lib/test_vmalloc.c: Use late_initcall() if built-in
 for init ordering
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250623184035.581229-1-urezki@gmail.com>
References: <20250623184035.581229-1-urezki@gmail.com>
X-NTES-SC: AL_Qu2eAvueuUgo4ySbZ+kZnEYQheY4XMKyuPkg1YJXOp80iCXp/hEFeXBPAETKwcOtMz6tvxe6XzRR9O1eYKR/YotLYXjwF9/upYrzi2UFi4Fl
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5686796f.8f47.197a1310b6d.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iigvCgD3L9vEalpoZKAjAA--.21015W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBd2qmhaYIw2TAACs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDYtMjQgMDI6NDA6MzQsICJVbGFkemlzbGF1IFJlemtpIChTb255KSIgPHVyZXpr
aUBnbWFpbC5jb20+IHdyb3RlOgo+V2hlbiB0aGUgdm1hbGxvYyB0ZXN0IGNvZGUgaXMgY29tcGls
ZWQgYXMgYSBidWlsdC1pbiwgdXNlIGxhdGVfaW5pdGNhbGwoKQo+aW5zdGVhZCBvZiBtb2R1bGVf
aW5pdCgpIHRvIGRlZmVyIGEgdm1hbGxvYyB0ZXN0IGV4ZWN1dGlvbiB1bnRpbCBtb3N0Cj5zdWJz
eXN0ZW1zIGFyZSB1cCBhbmQgcnVubmluZy4KPgo+SXQgYXZvaWRzIGludGVyZmVyaW5nIHdpdGgg
Y29tcG9uZW50cyB0aGF0IG1heSBub3QgeWV0IGJlIGluaXRpYWxpemVkCj5hdCBtb2R1bGVfaW5p
dCgpIHRpbWUuIEZvciBleGFtcGxlLCB0aGVyZSB3YXMgYSByZWNlbnQgcmVwb3J0IG9mIG1lbW9y
eQo+cHJvZmlsaW5nIGluZnJhc3RydWN0dXJlIG5vdCBiZWluZyByZWFkeSBlYXJseSBlbm91Z2gg
bGVhZGluZyB0byBrZXJuZWwKPmNyYXNoLgo+Cj5CeSB1c2luZyBsYXRlX2luaXRjYWxsKCkgaW4g
dGhlIGJ1aWx0LWluIGNhc2UsIHdlIGVuc3VyZSB0aGUgdGVzdHMgYXJlCj5ydW4gYXQgYSBzYWZl
ciBwb2ludCBkdXJpbmcgYSBib290IHNlcXVlbmNlLgo+Cj5DYzogSGFycnkgWW9vIDxoYXJyeS55
b29Ab3JhY2xlLmNvbT4KPkNjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29t
Pgo+Q2M6IERhdmlkIFdhbmcgPDAwMTA3MDgyQDE2My5jb20+Cj5TaWduZWQtb2ZmLWJ5OiBVbGFk
emlzbGF1IFJlemtpIChTb255KSA8dXJlemtpQGdtYWlsLmNvbT4KPi0tLQo+IGxpYi90ZXN0X3Zt
YWxsb2MuYyB8IDQgKysrKwo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+ZGlm
ZiAtLWdpdCBhL2xpYi90ZXN0X3ZtYWxsb2MuYyBiL2xpYi90ZXN0X3ZtYWxsb2MuYwo+aW5kZXgg
MWIwYjU5NTQ5YWFmMS4uNzI2NDc4MTc1MGM5NiAxMDA2NDQKPi0tLSBhL2xpYi90ZXN0X3ZtYWxs
b2MuYwo+KysrIGIvbGliL3Rlc3Rfdm1hbGxvYy5jCj5AQCAtNTk4LDcgKzU5OCwxMSBAQCBzdGF0
aWMgaW50IF9faW5pdCB2bWFsbG9jX3Rlc3RfaW5pdCh2b2lkKQo+IAlyZXR1cm4gSVNfQlVJTFRJ
TihDT05GSUdfVEVTVF9WTUFMTE9DKSA/IDA6LUVBR0FJTjsKPiB9Cj4gCj4rI2lmZGVmIE1PRFVM
RQo+IG1vZHVsZV9pbml0KHZtYWxsb2NfdGVzdF9pbml0KQo+KyNlbHNlCj4rbGF0ZV9pbml0Y2Fs
bCh2bWFsbG9jX3Rlc3RfaW5pdCk7Cgo+KyNlbmRpZgoKCldoZW4gTU9EVUxFIGRlZmluZWQswqAg
bGF0ZV9pbml0Y2FsbCBpcyBkZWZpbmVkIGFzIG1vZHVsZV9pbml0IGluIC4vaW5jbHVkZS9saW51
eC9tb2R1bGUuaApJIHRoaW5rIHRoZSBNT0RVTEUgY2hlY2sgaGVyZSBpcyByZWR1bmRhbnQsICAo
aXQgaXMgY2xlYXJlciB0aG91Z2gpCgoKCgo+IAo+IE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiBN
T0RVTEVfQVVUSE9SKCJVbGFkemlzbGF1IFJlemtpIik7Cj4tLSAKPjIuMzkuNQo=

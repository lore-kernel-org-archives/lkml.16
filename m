Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F741ACED7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746675348; cv=none; b=Br0PCixfvKJhgQ2llvQLyzjQkGwIUKI7kXN7+hHajs5UWZ/uQ+6/od5ZeawiKHDNRON9FlcnCo6AZOOLMliROnebea6jCANmI7Lwu26p9IuEUJsit6AbwLXK1YAKVm9wcf4tp8LQTfcGXWXK37KoFBviOxPDeKJIh7lWmA17gaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746675348; c=relaxed/simple;
	bh=piZRPJMYQhGy4bkDpNIvJJwb9xrQI4jbepYvvYPxbxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=mYNMXbE6p3lQuDC2O4Yqj683+96WG4k2VuLQgYbEcHG2McklHXNXbIWbsvTkFthPkBA7JPM+vpq+AdofZlJ/Z3Mhwdj9qPIyy7Dt1hNdNnQuHCU9IaHhwb9hVeC/0vCzcBBzmfr9XHzZt0w10Wj59TPsIsI9YTDZ3n91o0oCqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=p0spf1qZ reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="p0spf1qZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=1T4TewOhq9jtD3mU3UmbygBVz/T5dQ2YuA0u2Yu5YGo=; b=p
	0spf1qZGPnKHwlqS0AuIwacDygP7DKkn0dlDY1ROVNFMYJrk3N3sGCz9rv2KeW4w
	4oUhcitRE199i59ZJz0pDhr3b/u1iI+BJRhj+ma9anBEtsVdTNU81kOBCWFbLTOx
	l1gczxFkDzr7GCBXEOp/uZHnWGaUfOma4kF64q4urQ=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Thu, 8 May 2025 11:35:11 +0800 (CST)
Date: Thu, 8 May 2025 11:35:11 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Kent Overstreet" <kent.overstreet@linux.dev>
Cc: "Suren Baghdasaryan" <surenb@google.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
References: <20250507175500.204569-1-00107082@163.com>
 <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
X-NTES-SC: AL_Qu2fBPqcuksq5yCYYukZnEYQheY4XMKyuPkg1YJXOp80lyTS1i8PZ25IJ2Ls0fmBKwSmoQmJUCZj9eRhRIVjWqgFK3ytXkkVok9qRhKNuA7h
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:fygvCgD3_6hwJhxofp2mAA--.57328W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkAJHqmgcH4DcLgABsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTA4IDExOjMxOjEyLCAiS2VudCBPdmVyc3RyZWV0IiA8a2VudC5vdmVyc3Ry
ZWV0QGxpbnV4LmRldj4gd3JvdGU6Cj5PbiBUaHUsIE1heSAwOCwgMjAyNSBhdCAxMTowNjozNUFN
ICswODAwLCBEYXZpZCBXYW5nIHdyb3RlOgo+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFja34KPj4g
SSBhZ3JlZSB0aGF0IG1lbW9yeSBhbGxvY2F0aW9uIG5vcm1hbGx5IGRvc2Ugbm90IHRha2UgbWFq
b3IgcGFydCBvZiBhIHByb2ZpbGluZyByZXBvcnQsCj4+IGV2ZW4gcHJvZmlsaW5nIGEgZmlvIHRl
c3QsIGttZW1fY2FjaGVfYWxsb2Mgb25seSB0YWtlcyB+MSUgcGVyZiBzYW1wbGVzLgo+PiAKPj4g
SSBkb24ndCBrbm93IHdoeSBJIGhhdmUgdGhpcyAidGhlIGxlc3MgbWVtb3J5IGFsbG9jYXRpb24s
IHRoZSBiZXR0ZXInIG1pbmRzZXQsICBtYXliZQo+PiBJIHdhcyB3b3JyeWluZyBhYm91dCBtZW1v
cnkgZnJhZ21lbnRhdGlvbiwgb3Igc29tZXRoaW5nIGVsc2UgSSAgbGVhcm5lZCBvbiBzb21lICJ0
ZXh0Ym9vayIsCj4+IFRvIGJlIGhvbmVzdCwgSSAgaGF2ZSBuZXZlciBoYWQgcmVhbCBleHBlcmll
bmNlIHdpdGggdGhvc2Ugd29ycmllcy4uLi4KPgo+SXQncyBhIGNvbW1vbiBiaWFzLiAiTWVtb3J5
IGFsbG9jYXRpb25zIiB0YWtlIHVwIGEgbG90IG9mIGNvbmNlcHR1YWwKPnNwYWNlIGluIG91ciBo
ZWFkcywgYW5kIGdlbmVyYWxseSBmb3IgZ29vZCByZWFzb24gLSBpLmUuIGhhbmRsaW5nIG1lbW9y
eQo+YWxsb2NhdGlvbiBlcnJvcnMgaXMgb2Z0ZW4gYSBtYWpvciBjb25jZXJuLCBhbmQgeW91IGRv
IGFsd2F5cyB3YW50IHRvIGJlCj5hd2FyZSBvZiBtZW1vcnkgbGF5b3V0Lgo+Cj5CdXQgdGhpcyBj
YW4gdHVybiBpbnRvIGFuIGF2ZXJzaW9uIHRoYXQncyBlbnRpcmVseSBkaXNwcm9wb3J0aW9uYXRl
IC0KPmUuZy4gdXNpbmcgbGlua2VkIGxpbmtlZCBsaXN0cyBhbmQgZml4ZWQgc2l6ZSBhcnJheXMg
aW4gd2F5cyB0aGF0IGFyZQo+ZW50aXJlbHkgaW5hcHByb3ByaWF0ZSwgaW5zdGVhZCBvZiB2ZWN0
b3JzIGFuZCBvdGhlciBiZXR0ZXIgZGF0YQo+c3RydWN0dXJlczsgZ29vZCBkYXRhIHN0cnVjdHVy
ZXMgYWx3YXlzIHJlcXVpcmUgYWxsb2NhdGlvbnMuCj4KPlByb2ZpbGUsIHByb2ZpbGUsIHByb2Zp
bGUsIGFuZCByZW1lbWJlciB5b3VyIGJhc2ljIENTIChiaWcgTyBub3RhdGlvbikgLQo+OTAlIG9m
IHRoZSB0aW1lLCBzaW1wbGUgY29kZSB3aXRoIGdvb2QgYmlnIE8gcnVubmluZyB0aW1lIGlzIGFs
bCB5b3UKPm5lZWQuCgpjb3B5IHRoYXR+IQoKVGhhbmtzCkRhdmlkCg==

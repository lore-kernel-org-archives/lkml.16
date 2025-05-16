Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B14A200B9F;
	Fri, 16 May 2025 17:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415661; cv=none; b=I+l3eqbXO/ncl7ZhrWeNvIosQXi6wJGZ55zeTgdOGR08KdctB9CaX5EWXnBWgwW0orEbMsv+Aw0onlMJyG2qnRDEFdqL9/aBKJqL9mshNJJ2tZkLO5DuVVVySgqMXp949OIt06Q1j/NitM4UQzRiujfnemdsrw47DUxkM5hmbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415661; c=relaxed/simple;
	bh=b9Wp7ZxxHE3QqSQgRGTlMLm9m9x2s19tjDrqdDOk3rA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JQvJXbtJ3MRdM2eSOeNBlfvOXNfMBIGbW+G6k/Vj76ox404imw91xYAbP90CXUlbrx9lIQBZk4JqyorMDvoSK3Bz1yTawxyyAxPZlNFCKQ99WjXBWWgFqIvPBWTXCRps6UdlxraP/w4g4854Sf5cWxfEI/h7MTHuNI+cxXh/FGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=fwk8H0EY reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="fwk8H0EY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ITvCj/071s0fxBqJc3xYLvKHyLNlNZYigmrM6DCxXek=; b=f
	wk8H0EYzh70d6sIE2XJ1+nZ/0MaQB5DEAyK1tfzNYtg0uidsJDjJxauQrMFLbSkc
	byzTRHBf6fPJ2lLL6B+YTMFJBQdFJA4Rpn7oKKlDIG6vQ1pHUqMGkewAyDBUWhso
	BFswTQolaBkRAOy2WT/aE+QUCvSMOz/sB4UpN/icfc=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-113 (Coremail) ; Sat, 17 May 2025 01:13:22 +0800
 (CST)
Date: Sat, 17 May 2025 01:13:22 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>, Jes.Sorensen@gmail.com
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <7419cfbc-1269-46fc-95b9-502e6fe23226@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
 <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
 <7419cfbc-1269-46fc-95b9-502e6fe23226@suse.com>
X-NTES-SC: AL_Qu2fBfiauk4r5CSYZukXn0oTju85XMCzuv8j3YJeN500oiTn6zACZm9AEmD4ws6ANDusoAiafxpE9+pkWK59UqXBml4MfZoTCCwoxars1hD0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4f421ea5.ac18.196da1614e9.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSgvCgD3n_ozcidozo0GAA--.52657W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAVPqmgnX6tR2AAIsy
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKQXQgMjAyNS0wNS0xNCAyMDowMzowMiwgIk9saXZlciBOZXVrdW0iIDxvbmV1a3VtQHN1c2Uu
Y29tPiB3cm90ZToKPgo+Cj5PbiAxNC4wNS4yNSAxMzo1MSwgRGF2aWQgV2FuZyB3cm90ZToKPiAg
Cj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgYWJvdXQgdGhlIGNvbmNlcm4gaGVyZSwgZG8geW91IG1l
YW4gc29tZWJvZHkgY3JlYXRlIGEgdXJiLAo+PiBhbmQgdGhlbiB1c2JfaW5pdF91cmIoKSBoZXJl
LCBhbmQgbmV2ZXIgdXNlIHVyYl9kZXN0cm95IHRvIHJlbGVhc2UgaXQ/Cj4KPlllcy4KPgo+PiAK
Pj4gVGhhdCB3b3VsZCBjYXVzZSBtZW1vcnkgbGVhayBpZiB1cmJfZGVzdHJveSBpcyBub3QgY2Fs
bGVkLi4uLi4uQnV0IGlzIHRoaXMgcmVhbGx5IHBvc3NpYmxlPy4KPgo+SSB0aGluayBhIGZldyBk
cml2ZXJzIHVuZGVyIGRyaXZlcnMvbWVkaWEgZG8gc28uCgoKSSBzZWFyY2ggdGhyb3VnaCBjb2Rl
cywgc29tZSBkcml2ZXJzIHdpbGwgdXNlIHVzYl9mcmVlX3VyYiB3aGljaCB3b3VsZCBpbnZva2Ug
dXJiX2Rlc3Ryb3k7CkJ1dCB0aGVyZSBhcmUgaW5kZWVkIHNldmVyYWwgZHJpdmVycyB1c2UgdXJi
IGFzIGEgc3RydWN0IG1lbWJlciwgd2hpY2ggaXMgbm90IGRpcmVjdGx5IGttYWxsb2NlZCBhbmQg
CnNob3VsZCBub3QgYmUga2ZyZWVkIHZpYSB1c2JfZnJlZV91cmIuLi4uLiBJdCB3b3VsZCBpbnZv
bHZlIGxvdHMgb2YgY2hhbmdlcy4uLi4uCgpPbiB0aGUgYnJpZ2h0IHNpZGUsIHdoZW4gSSBtYWRl
IHRoZSBjb2RlIGNoZWNrLCBJIG5vdGljZSBzb21ldGhpbmcgb2ZmOgppbiBkcml2ZXJzL25ldC93
aXJlbGVzcy9yZWFsdGVrL3J0bDh4eHh1L2NvcmUuYwoKCjUxNjggICAgICAgICAgICAgICAgIHVz
Yl9mcmVlX3VyYigmdHhfdXJiLT51cmIpOwo1ODY4ICAgICAgICAgICAgICAgICB1c2JfZnJlZV91
cmIoJnJ4X3VyYi0+dXJiKTsKNTg5MCAgICAgICAgICAgICAgICAgdXNiX2ZyZWVfdXJiKCZyeF91
cmItPnVyYik7CjU5MzggICAgICAgICAgICAgICAgICAgICAgICAgdXNiX2ZyZWVfdXJiKCZyeF91
cmItPnVyYik7Cgp1c2JfZnJlZV91cmIgd291bGQga2ZyZWUgdGhlIHVyYiBwb2ludGVyLCB3aGlj
aCB3b3VsZCBiZSB3cm9uZyBoZXJlIHNpbmNlIHJ4X3VyYiBhbmQgdHhfdXJiIGRlZmluZWQgCmlu
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvcnRsOHh4eHUuaAoxOTQ0IHN0
cnVjdCBydGw4eHh4dV9yeF91cmIgewoxOTQ1ICAgICAgICAgc3RydWN0IHVyYiB1cmI7CjE5NDYg
ICAgICAgICBzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodzsKMTk0NyAgICAgICAgIHN0cnVjdCBsaXN0
X2hlYWQgbGlzdDsKMTk0OCB9OwoxOTQ5IAoxOTUwIHN0cnVjdCBydGw4eHh4dV90eF91cmIgewox
OTUxICAgICAgICAgc3RydWN0IHVyYiB1cmI7CjE5NTIgICAgICAgICBzdHJ1Y3QgaWVlZTgwMjEx
X2h3ICpodzsKMTk1MyAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKMTk1NCB9OwoKCkhp
LCBKZXMKCldvdWxkIHlvdSB0YWtlIGEgbG9vaz8gSSBmZWVsIHVzYl9mcmVlX3VyYiBuZWVkcyBh
IHBvaW50ZXIgd2hpY2ggaXMgYWxsb2tlZGQgZGlyZWN0bHksIGJ1dCBJIHdvdWxkIGJlIHdyb25n
Li4uLi4KCgpUaGFua3MKRGF2aWQKPgo+CVJlZ2FyZHMKPgkJT2xpdmVyCg==

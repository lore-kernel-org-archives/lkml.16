Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC83256D;
	Fri,  4 Jul 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751587599; cv=none; b=XWS2Ffzhrqsb2Nu+NdgWWVojSefX4dlAMg0n2mkdIrCd+7DKjx6cJIOcdQcAfghFhUHSS5TbL8K0fOHQ/S7c/DdzyfHG9yOCmYnsS6nKxJQL1XtwjluAwcmL69m1FttXUkVeZf+OP6cxP3HNrPmSTWmj+gayViJuuass0Wa3EvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751587599; c=relaxed/simple;
	bh=4HvshWDHlLlPvbXK9Y83KcYdKVX+YX4UjkJdPlQODCg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U6hOzfxgkEZEk33aR93UhZCOulKSbtzmkNbRRUE6G2S6/BHsNsDP/6KrfcFaFIjxcSfUHYHRzk8+c6zXVC+waQxgRvNFntoYTizs2PmndqDZGPYllWWyZx5EcPNNiFw0AHm8gcYaC/0Ra6Zzxj7iThxZ2X/fhF0+RqaaoBywWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=bd8cK7MY; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bd8cK7MY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751587594;
	bh=4HvshWDHlLlPvbXK9Y83KcYdKVX+YX4UjkJdPlQODCg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bd8cK7MYknGTS0lOj+U8WZ6K9i1+iL4/RcZ+73L+lPeLQ+/miHT1MDVXHrbVf1To8
	 C5X6XpLEK6MffQ1s78rE7Y+heB8kXVhyjtBf6eeD0nQ8XtD2zZE4rseor3xURQ8SFV
	 72jk/KMostVgC9EsC9AB7NasfNH/i0p1kfQnXVOaoWjelDS5zw0CuMm5FXdMtAR2b5
	 FCbJTrOhbAlt9ZUnCaFUajIcfRUuCOVeRNxN3yh5SpDAZXKGKwJqY5228nsOnzo5W/
	 hs3108j+Sw3AywZrDMEKTvq1sFY3CDCMMdOPU2vUqFTVgVLF+Fl1EGuPoBN+imQkG8
	 TK9ry16QRj3Kg==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 431E36443C;
	Fri,  4 Jul 2025 08:06:33 +0800 (AWST)
Message-ID: <78f9fcbc58261064f248e95eb7740549e338bc78.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/5] ARM: dts: aspeed: Expand data0 partition in
 facebook-bmc-flash-layout-128.dtsi
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Tao Ren <taoren@meta.com>
Date: Fri, 04 Jul 2025 09:36:29 +0930
In-Reply-To: <20250702050421.13729-2-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
	 <20250702050421.13729-2-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI1LTA3LTAxIGF0IDIyOjA0IC0wNzAwLCByZW50YW8uYnVwdEBnbWFpbC5jb20g
d3JvdGU6Cj4gRnJvbTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+IAo+IEV4cGFu
ZCBkYXRhMCBwYXJ0aXRpb24gdG8gNjRNQiBpbiBmYWNlYm9vay1ibWMtZmxhc2gtbGF5b3V0LTEy
OC5kdHNpIGZvcgo+IGxhcmdlciBwZXJzaXN0ZW50IHN0b3JhZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+IC0tLQo+IMKgLi4uL2Jvb3QvZHRz
L2FzcGVlZC9mYWNlYm9vay1ibWMtZmxhc2gtbGF5b3V0LTEyOC5kdHNpIHwgMTAgKysrKystLS0t
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2ZhY2Vib29rLWJtYy1mbGFz
aC1sYXlvdXQtMTI4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvZmFjZWJvb2stYm1j
LWZsYXNoLWxheW91dC0xMjguZHRzaQo+IGluZGV4IDdmMzY1MmRlYTU1MC4uZWZkOTIyMzJjZGEy
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9mYWNlYm9vay1ibWMtZmxh
c2gtbGF5b3V0LTEyOC5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2ZhY2Vi
b29rLWJtYy1mbGFzaC1sYXlvdXQtMTI4LmR0c2kKPiBAQCAtMzIsMTkgKzMyLDE5IEBAIGltYWdl
LW1ldGFAZjAwMDAgewo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oC8qCj4gLcKgwqDCoMKgwqDCoMKgICogRklUIGltYWdlOiAxMTkgTUIuCj4gK8KgwqDCoMKgwqDC
oMKgICogRklUIGltYWdlOiA2MyBNQi4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDC
oMKgwqDCoGZpdEAxMDAwMDAgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcg
PSA8MHgxMDAwMDAgMHg3NzAwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmVnID0gPDB4MTAwMDAwIDB4M2YwMDAwMD47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBsYWJlbCA9ICJmaXQiOwo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICogImRhdGEwIiBwYXJ0aXRpb24gKDhNQikgaXMg
dXNlZCBieSBGYWNlYm9vayBCTUMgcGxhdGZvcm1zIGFzCj4gK8KgwqDCoMKgwqDCoMKgICogImRh
dGEwIiBwYXJ0aXRpb24gKDY0TUIpIGlzIHVzZWQgYnkgRmFjZWJvb2sgQk1DIHBsYXRmb3JtcyBh
cwo+IMKgwqDCoMKgwqDCoMKgwqAgKiBwZXJzaXN0ZW50IGRhdGEgc3RvcmUuCj4gwqDCoMKgwqDC
oMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGRhdGEwQDc4MDAwMDAgewo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8MHg3ODAwMDAwIDB4ODAwMDAwPjsKPiArwqDCoMKg
wqDCoMKgwqBkYXRhMEA0MDAwMDAwIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmVnID0gPDB4NDAwMDAwMCAweDQwMDAwMDA+Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgbGFiZWwgPSAiZGF0YTAiOwo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgCgpUd28gZXhp
c3Rpbmcgc3lzdGVtcyB1c2UgdGhpcyBkdHNpOgoKICAgPiBnaXQgZ3JlcCBmYWNlYm9vay1ibWMt
Zmxhc2gtbGF5b3V0LTEyOC5kdHNpCiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQt
Ym1jLWZhY2Vib29rLXdlZGdlNDAwLmR0czojaW5jbHVkZSAiZmFjZWJvb2stYm1jLWZsYXNoLWxh
eW91dC0xMjguZHRzaSIKICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzdDI2MDAtZmFjZWJv
b2stbmV0Ym1jLWNvbW1vbi5kdHNpOiNpbmNsdWRlICJmYWNlYm9vay1ibWMtZmxhc2gtbGF5b3V0
LTEyOC5kdHNpIgoKVGhpcyBjaGFuZ2UgcmVxdWlyZXMgYSBmdWxsIHJlZmxhc2ggb2YgdGhvc2Ug
ZGV2aWNlcywgd2hpY2ggaXMgcHJldHR5CmRpc3J1cHRpdmUuCgpJdCBzZWVtcyBtb3JlIGFwcHJv
cHJpYXRlIHRvIG1lIHRvIGNyZWF0ZSBhIHNlcGFyYXRlIGR0c2kgZm9yIHRoZSBuZXcKZmxhc2gg
bGF5b3V0IHRvIHVzZSBpbiBuZXcgc3lzdGVtcy4KCkFuZHJldwo=


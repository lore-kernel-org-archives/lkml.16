Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B50412B73;
	Wed,  7 May 2025 02:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746586333; cv=none; b=BBiemmtlXDtMwaN1mAXN7GGrO0fOjaqHpP1c3OklWedqAKvOdYIVXOIIv90ZHpGX+yp4Kt9MPzBv6umNR+631EaCE17UtDHgswIWHoC4Oz+8QxNcMybPq1gWNBeGkQlWF+oP/P1g68zya9wBCD3i1zQaqf8tyOeccpGZcQwr8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746586333; c=relaxed/simple;
	bh=jla9KNrIyCdQo3DzfEhy08PcQH+6cSQg16Xv+U233AU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OOF9sw2gmb5M1wgBJE4XknrW3gYR0kAmWsH5oL4XEXpXwMtIUvM67od9714eaAzRXTsa4r6BSSv5HBzC+xiGUWBlzlpqGuLnorcVzNqQtjSKkymc5OxPFWQbMsqWKNmQvQTTf4ISeNKzXsAr2UrVeJiFsf/Uby33pR4SJ4ylyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=DEAxXyIW; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="DEAxXyIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746586329;
	bh=jla9KNrIyCdQo3DzfEhy08PcQH+6cSQg16Xv+U233AU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DEAxXyIW/x7MxY0+7oDOoLYtt8LXGz1pQqcEmy/0HTyKS8dm4l8erumNwzO07H7K4
	 n0vWuEVTc/pZZxYQEapnu9D8kulboSld91j2dGSHH8U+m38Tyf5JspN5j9ZYgxJ8pr
	 e/Bx+K+Rlpgdulin/WuxhXSTfhXeC/h/jVrNa6nOPYS4OFKmfC8Gmk7y7SRvbUKQdT
	 /mrzZLZFagMzN1+9UCl5pvflJtjYJZD0Y3l5nDgLjdcrN3MFjzbF9MjWf1/xWQeOle
	 U2mzLOuF71sPUsRmesGjqbTYFJtsrRh0r3dZQFCpjvWjwR3mNHpqOBsOnNxaZVz1jm
	 D11auCpKfOHkA==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E93E764473;
	Wed,  7 May 2025 10:52:08 +0800 (AWST)
Message-ID: <2ed50b1463f62a829f863b889ab818f492b73946.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add EDAC controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Avi Fishman
 <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
 <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 12:22:08 +0930
In-Reply-To: <20250415233403.2052913-1-william@wkennington.com>
References: <20250415233403.2052913-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI1LTA0LTE1IGF0IDE2OjM0IC0wNzAwLCBXaWxsaWFtIEEuIEtlbm5pbmd0b24g
SUlJIHdyb3RlOgo+IFdlIGhhdmUgdGhlIGRyaXZlciBzdXBwb3J0IGJ1dCBuZWVkIGEgY29tbW9u
IG5vZGUgZm9yIGFsbCB0aGUgOHh4Cj4gcGxhdGZvcm1zIHRoYXQgY29udGFpbiB0aGlzIGRldmlj
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIEEuIEtlbm5pbmd0b24gSUlJIDx3aWxsaWFt
QHdrZW5uaW5ndG9uLmNvbT4KPiAtLS0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvbnV2b3Rvbi9u
dXZvdG9uLWNvbW1vbi1ucGNtOHh4LmR0c2kgfCA3ICsrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9u
dXZvdG9uL251dm90b24tY29tbW9uLW5wY204eHguZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bnV2b3Rvbi9udXZvdG9uLWNvbW1vbi1ucGNtOHh4LmR0c2kKPiBpbmRleCA0ZGE2MjMwOGIyNzQu
LmNjZWJjYjExYzA1ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL251dm90b24v
bnV2b3Rvbi1jb21tb24tbnBjbTh4eC5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9u
dXZvdG9uL251dm90b24tY29tbW9uLW5wY204eHguZHRzaQo+IEBAIC01Niw2ICs1NiwxMyBAQCBj
bGs6IHJzdGM6IHJlc2V0LWNvbnRyb2xsZXJAZjA4MDEwMDAgewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCNjbG9jay1jZWxscyA9IDwxPjsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbWM6IG1lbW9yeS1jb250cm9sbGVyQGYwODI0MDAwIHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAibnV2b3Rv
bixucGNtODQ1LW1lbW9yeS1jb250cm9sbGVyIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHhmMDgyNDAwMCAweDAgMHgyMDAwPjsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVw
dHMgPSA8R0lDX1NQSSAyNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gKwoKVGhlIHBhdGNoIGZhaWxzIHRvIGFw
cGx5IGR1ZSB0byBmdXp6LCBkbyB5b3UgbWluZCByZWJhc2luZyBpdCBvbgpudXZvdG9uL2FybTY0
L2R0IGZyb20gWzFdPwoKWzFdOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9hcmovYm1jLmdpdAoKUG9zc2libHkgaXQncyB0aGUgcmVzdWx0IG9mIGFwcGx5
aW5nIG90aGVyIHBhdGNoZXMgb2YgeW91cnMgYXMgdGhleQp3ZXJlIHNlbnQgaW5kZXBlbmRlbnRs
eS4gSXQgbWlnaHQgYmUgYmVzdCB0byBzZW5kIHRoZW0gYXMgYSBzZXJpZXMgZXZlbgppZiB0aGV5
IGFyZSBjb25jZXB0dWFsbHkgaW5kZXBlbmRlbnQuCgpBbmRyZXcK


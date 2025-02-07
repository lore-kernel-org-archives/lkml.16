Received: from fennec.yew.relay.mailchannels.net (fennec.yew.relay.mailchannels.net [23.83.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC201A0714;
	Fri,  7 Feb 2025 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953645; cv=pass; b=er0NSY+UGjygcUtLPooXn4ru8MNaMcr3efwW+LjZNVsfhWsuRw7pNCFEHhPmZOHcRTXVxWKbhmbbnGf8CcMRzr2HhGkakbTqq5Asj9Vrf4/vwa5EIJ8oT4m6YraaNv/FmXmZqpVqRCub5z+oGG/zXft9zBltR5EH8fnbmCgVMW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953645; c=relaxed/simple;
	bh=uH8vMkud4EQnG1MvnsD+6x2TVRiu3o9+ST5+Uv6tPPA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=fiBRD8YI2kNe9UJeyy3qJANbMDe1nk7soZdp0PdMGMTIfqh7C+W1o3ssj7CDvKmk97osbtiwqv0m2RsRyEH7RyMPGEoVfF98HFgGuEeGw5w0GaVO8DDfG09ASTOQEj5f8G8ShE22/ox5xFXvSZPUrDERYlnFvCJ6t51U7geOiOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=cFhxWNIJ reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="cFhxWNIJ"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 11312783C33;
	Fri,  7 Feb 2025 18:40:35 +0000 (UTC)
Received: from nl-srv-smtpout1.hostinger.io (100-96-47-154.trex-nlb.outbound.svc.cluster.local [100.96.47.154])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 92CE97836D2;
	Fri,  7 Feb 2025 18:40:33 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738953634; a=rsa-sha256;
	cv=none;
	b=05GfAoI6YeQihX8U+9D6RwafPy+FLN0ywCBHFu/cgBU0LCsw8JYdauUPr+E0vlMxpYTg4x
	F/MKAlOfYQyJND1nhv8z7Dlz/yVharp5nnOYijVSchY/IycU8NMCuex/McuRoh3eHwIdGp
	rpXGLigV/uNgQnTz1tZRzFgnPR0Ql9UzqxgOWqSlRZi3FqRcPW+CMHZ5/ifdjY2HLlOVGg
	NyNeCsem+0Iye69j7IsBZhNQXDNC2qpBox9p6xQztE8bRHCfTuIcSB78qtKduzdX8nKQQZ
	HVkovXk85jE+XQfpMOgFtOe0VPonouf6gDxACyP5G/slmZ6nEAkRa2EdFvgDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738953634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=uH8vMkud4EQnG1MvnsD+6x2TVRiu3o9+ST5+Uv6tPPA=;
	b=1C9J369QowZZDXMHT9AHtmIArm3hlwyuivq8vXm9LcPRE6AS0FgNeBHVzMZIzcXrjDzv43
	M039Ju7jad6vB5SKJ+InGXtMs5O0ffOdcPbMSKw3Fo76krYAn8+YwHwT3o4pbEWQOeM1/t
	fvTSUUauxUb/jXjVUGWBfoMfYTSvO8f2i7UNbjJEJhoGh1oxdZqMZm7oDr9bCadtKAk6JD
	IUKCiMjNNvpObr9PbZQlWore9f30mvEyyk5Gl4vIaWOmHrmsRFp21SMrxX0N171i81uSEA
	esie8U974ugtutg0nyrJU2bk5lG+Bcj2EPnLjsPuQxRU9TMcS+gKueEcxeOA6Q==
ARC-Authentication-Results: i=1;
	rspamd-68c88d6cff-88t9z;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Good
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Cold-Cold: 25a9a48e2d918c2f_1738953634950_1626323575
X-MC-Loop-Signature: 1738953634950:2589816486
X-MC-Ingress-Time: 1738953634950
Received: from nl-srv-smtpout1.hostinger.io (nl-srv-smtpout1.hostinger.io
 [145.14.150.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.47.154 (trex/7.0.2);
	Fri, 07 Feb 2025 18:40:34 +0000
Message-ID: <7e664d9e0f957206cdc70fb7f178df709fe4d936.camel@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738953631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uH8vMkud4EQnG1MvnsD+6x2TVRiu3o9+ST5+Uv6tPPA=;
	b=cFhxWNIJLI3dGMHqygeL9lOR0dfjGG2RBZ0xXfamW/Z/xXWGTxOct6uWNDx1IkMdsxSwQc
	sIlEmhNvolNIgXjUj9yrJh7y5jZCFIzFSnXQaqCplVRJijKEtIkcXtXJJRi9yWwIUdUomN
	eVW1tv2XryFAeW1TRrWtaiUN2QRvgtP8BuPZVHpt1rmOuUZLmGkZeDwd+eQSMqS3YQ6uRB
	yocy/LmOagNhaM8QC6VQJ9ADzxAOAHvJDu+KTvTKXbeT3aWZhyZA0l6SFdo9qEidvEQc6f
	NdivWGMWuikGNFiDJWpG1/GQslGgrp0vnEHDP9w4CfEwDzjvMBEGxkOP0gmT6Q==
Subject: Re: [PATCH v2 RESEND 1/1] checkpatch: add warning for pr_* and
 dev_* macros without a trailing newline
From: Alban Kurti <kurti@invicto.ai>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Joe Perches <joe@perches.com>, Andrew Morton
 <akpm@linux-foundation.org>,  Mugel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <m25xllr51m.fsf@posteo.net>
References: <20250206120911.175884-1-kurti@invicto.ai>
	 <m25xllr51m.fsf@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 18:40:31 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=R7tRGsRX c=1 sm=1 tr=0 ts=67a6539f a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=Ip8iZo8Gh7Y5z734uKoA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfE5SczPfzR1uBpYEWFlKOXuOS1ZM+1emLjby2At/nA7hxIGn0hJ35IdFeBKts7Bn9i+r5I+TLvLZcsyRFvwUNQItq2bRprF+eHcQt+WAgOIInOjUgSFs A/q6ydcXo02AcHEPNsnLIhsOHZ+IUwjn6/8OP3CSlhrHH7oQf7NKNiZAkuFzeb8aOdTM07ghbkeDLSd49D20LDgyXdDoUCkQVNPaodgP/1IwfyPMN3BV3dam 9kPN10KmHvP757mVU4Q9X+7XBJhGXr7Upad+j5ek2MAor44ZoIcvgkdNetOUMCoJZMx89VfbIlBSPikzHiBbnuOOdFIIyftMo+VHgCME3i5pivJSojojQJy5 5HrvjJTJ
X-AuthUser: kurti@invicto.ai

SGkgQ2hhcmFsYW1wb3MsCgpUaGFuayB5b3UgZm9yIHRlc3RpbmcuCgpJIGp1c3Qgc2VuZCB2NCwg
aWdub3JlIHYzIHBsZWFzZS4gSXQgc2hvdWxkIGZpeCB0aGUgZm9ybWF0dGluZyBpc3N1ZSwKYWRk
aXRpb25hbGx5LCBJIHRob3VnaHQgb2YgaW1wbGVtZW50aW5nIGEgbmV3IGZlYXR1cmUgZnVydGhl
ciBhcyBJCnRoaW5rIGl0IGNhbiBlbmhhbmNlIHRoZSBmdW5jdGlvbmFsaXR5LCBidXQgSSBjYW4g
YWx3YXlzIHJldmVydCB0byB0aGUKdjIgYXBwcm9hY2ggaWYgaXQgaXMgZGVlbWVkIHRvIGNvbXBs
aWNhdGVkIG9yIHVubmVjZXNzYXJ5LgoKS2luZCByZWdhcmRzLApBbGJhbiBLdXJ0aQoKT24gRnJp
LCAyMDI1LTAyLTA3IGF0IDE4OjE5ICswMDAwLCBDaGFyYWxhbXBvcyBNaXRyb2RpbWFzIHdyb3Rl
Ogo+IEFsYmFuIEt1cnRpIDxrdXJ0aUBpbnZpY3RvLmFpPiB3cml0ZXM6Cj4gCj4gPiBBZGQgYSBu
ZXcgY2hlY2sgaW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIHRvIGRldGVjdCB1c2FnZSBvZgo+ID4g
cHJfKGxldmVsKQo+ID4gYW5kIGRldl8obGV2ZWwpIG1hY3JvcyAoZm9yIGJvdGggQyBhbmQgUnVz
dCkgd2hlbiB0aGUgc3RyaW5nCj4gPiBsaXRlcmFsCj4gPiBkb2VzIG5vdCBlbmQgd2l0aCAnXG4n
LiBNaXNzaW5nIHRyYWlsaW5nIG5ld2xpbmVzIGNhbiBsZWFkIHRvCj4gPiBpbmNvbXBsZXRlCj4g
PiBsb2cgbGluZXMgdGhhdCBkbyBub3QgYXBwZWFyIHByb3Blcmx5IGluIGRtZXNnIG9yIGluIGNv
bnNvbGUKPiA+IG91dHB1dC4KPiA+IFRvIHNob3cgYW4gZXhhbXBsZSBvZiB0aGlzIHdvcmtpbmcg
YWZ0ZXIgYXBwbHlpbmcgdGhlIHBhdGNoIHdlIGNhbgo+ID4gcnVuCj4gPiB0aGUgc2NyaXB0IG9u
IHRoZSBjb21taXQgdGhhdCBsaWtlbHkgbW90aXZhdGVkIHRoaXMgbmVlZC9pc3N1ZToKPiA+IMKg
IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0IC1nCj4gPiBmNDMxYzVjNTgxZmExNzZm
NjA4YmEzZmRlYmIzYzEwNTFiYWQ1Nzc0Cj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogTWlndWVsIE9q
ZWRhIDxvamVkYUBrZXJuZWwub3JnPgo+ID4gQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5jb20vUnVz
dC1mb3ItTGludXgvbGludXgvaXNzdWVzLzExNDAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsYmFuIEt1
cnRpIDxrdXJ0aUBpbnZpY3RvLmFpPgo+ID4gLS0tCj4gPiBDaGFuZ2Vsb2cgc2luY2UgdjE6Cj4g
PiDCoC0gU3RyaXAgY29tbWVudHMgYmVmb3JlIG1hdGNoaW5nIHRvIGF2b2lkIGZhbHNlIHBvc2l0
aXZlcy4KPiA+IMKgLSBSZWZhY3RvcmVkIHRoZSBtYWNybyBwYXR0ZXJucyBmb3IgY2xhcml0eS4K
PiA+IAo+ID4gwqBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgfCA0Ngo+ID4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNDYgaW5z
ZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIv
c2NyaXB0cy9jaGVja3BhdGNoLnBsCj4gPiBpbmRleCA5ZWVkMzY4M2FkNzYuLjMyNTZiNWYzMTgz
NSAxMDA3NTUKPiA+IC0tLSBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbAo+ID4gKysrIGIvc2NyaXB0
cy9jaGVja3BhdGNoLnBsCj4gPiBAQCAtMzg4OCw2ICszODg4LDUyIEBAIHN1YiBwcm9jZXNzIHsK
PiA+IMKgCQkJfQo+ID4gwqAJCX0KPiA+IMKgCj4gPiArIyBjaGVjayBmb3IgcHJfKiBhbmQgZGV2
XyogbG9ncyB3aXRob3V0IGEgbmV3bGluZSBmb3IgQyBhbmQgUnVzdAo+ID4gZmlsZXMgdG8gYXZv
aWQgbWlzc2luZyBsb2cgbWVzc2FnZXMKPiA+ICvCoMKgwqAgbXkgJGxvZ19tYWNyb19wYXR0ZXJu
ID0gcXJ7Cj4gPiArwqDCoMKgwqDCoMKgwqAgXGIKPiA+ICvCoMKgwqDCoMKgwqDCoCAoCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl8oPzplbWVyZ3xhbGVydHxjcml0fGVycnx3YXJufG5v
dGljZXxpbmZvfGRlYnVnKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCB8IGRldl8oPzplbWVyZ3xh
bGVydHxjcml0fGVycnx3YXJufG5vdGljZXxpbmZvfGRiZykKPiA+ICvCoMKgwqDCoMKgwqDCoCAp
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKCE/KQo+ID4gK8KgwqDCoMKgwqDCoMKgIFxzKgo+ID4gK8Kg
wqDCoMKgwqDCoMKgIFwoCj4gPiArwqDCoMKgwqDCoMKgwqAgXHMqCj4gPiArwqDCoMKgwqDCoMKg
wqAgIihbXiJdKikiCj4gPiArwqDCoMKgIH14Owo+ID4gKwo+ID4gK8KgwqDCoCBpZiAoJHJlYWxm
aWxlID1+IC9cLig/OmN8aHxycykkLykgewo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmICgkcmF3bGlu
ZSA9fiAvXlwrLykgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXkgJGNsZWFubGluZSA9
ICRyYXdsaW5lOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJGNsZWFubGluZSA9
fiBzL15bK1xzXSsvLzsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICRjbGVhbmxpbmUgPX4g
cy9ccj8kLy87Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkY2xlYW5saW5lID1+
IHN7L1wqLio/XCovfXt9ZzsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICRjbGVhbmxpbmUg
PX4gc3svLy4qfXt9ZzsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgkY2xl
YW5saW5lID1+IC8kbG9nX21hY3JvX3BhdHRlcm4vKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG15ICRtYWNyb19jYWxsID0gJDE7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG15ICRtYXliZV9leGNswqAgPSAkMjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbXkgJHN0cmluZ19hcmfCoCA9ICQzOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkc3RyaW5nX2FyZyA9fiBzL1xzKyQvLzsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCRyZWFsZmlsZSA9fiAvXC5ycyQvICYmICRt
YXliZV9leGNsIG5lICchJykgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4g
Kwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoJHN0cmluZ19hcmcgIX4g
L1xcbiQvICYmICRzdHJpbmdfYXJnICF+IC9cbiQvKQo+ID4gewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG15ICRsYW5nID0gKCRyZWFsZmlsZSA9fiAvXC5ycyQv
KSA/ICJSdXN0IiA6Cj4gPiAiQyI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgV0FSTigiJHtsYW5nfV9MT0dfTk9fTkVXTElORSIsCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJVc2FnZSBvZiAkbWFjcm9fY2Fs
bCB3aXRob3V0IGEgdHJhaWxpbmcKPiA+IG5ld2xpbmUuIENvbnNpZGVyIGFkZGluZyAnXFxuJy5c
biIgLgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAkaGVyZWN1cnIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiArwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDC
oCB9Cj4gPiArCj4gPiArCj4gPiDCoCMgY2hlY2sgZm9yIC5MIHByZWZpeCBsb2NhbCBzeW1ib2xz
IGluIC5TIGZpbGVzCj4gPiDCoAkJaWYgKCRyZWFsZmlsZSA9fiAvXC5TJC8gJiYKPiA+IMKgCQnC
oMKgwqAgJGxpbmUgPX4gL15cK1xzKig/OltBLVpdK18pP1NZTV9bQS0KPiA+IFpdK18oPzpTVEFS
VHxFTkQpKD86X1tBLVpfXSspP1xzKlwoXHMqXC5MLykgewo+IAo+IEkgY291bGRuJ3QgYXBwbHkg
dGhpcyB0byBteSB0cmVlICh3aXRoIHJ1c3QtbmV4dCBiYXNlKSwgYnV0IG1hbnVhbGx5Cj4gYWRk
aW5nIHRoZSBjaGFuZ2VzIHRvIHNjcmlwdHMvY2hlY2twYXRjaC5wbCB3b3JrcyBhcyBleHBlY3Rl
ZC4KPiAKPiBBbGJhbiwgY2FuIHlvdSB0cnkgcmVzZXR0aW5nIHlvdXIgdHJlZSB0byBydXN0LW5l
eHQgYW5kIGFwcGx5IHRoaXMKPiBwYXRjaD8gSSBiZWxpZXZlIChub3Qgc3VyZSkgdGhlcmUgYXJl
IHNvbWUgaW5kZW50YXRpb24gaXNzdWVzIHdpdGgKPiB0aGUKPiBjb2RlLgo+IAo+IEMuIE1pdHJv
ZGltYXMKCg==


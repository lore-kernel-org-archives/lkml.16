Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC561547C8;
	Fri,  7 Feb 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919760; cv=none; b=MRcWnAyR00OTTAbqXORq7yDdZU/q+VM5O+/k+RZlWcnP5p7nJC3wtpOhI+hhEOcJ9C68XWvOGsbbMfJcmhPUmuRhZfrHXjfzF5LuBv0udzShtoRc3M8vMSbzV3kt2fLEL+8P5TU8h61ysrr7UL2AnNA8M3R0BkWE7uBtb844wto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919760; c=relaxed/simple;
	bh=FnhuBKnr3UPx3oDD4aZB2Xgx9ZgtLCLsyYkmUWkUX1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2dv4XxBoYPtlqY8tzPSFXNZPw3aRieN0N1OuQa/fpH1NZuwvCqmxANxCsMCel6O7zROvFluhg4pl0mtyO0xYbT5knIOCZB/wdjXOQM4KmY+H44SyASSx/TjNZeB2yOCf265wRI37jETwcN5oYysvmc+45Oy+2kqBjfA3T/q5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=T58RLupV; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="T58RLupV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738919730;
	bh=FnhuBKnr3UPx3oDD4aZB2Xgx9ZgtLCLsyYkmUWkUX1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=T58RLupVTioJH6/ZHokM47ImtHWpMxYzUFMrNZrCn91tNeGlzvJM4NyShHpQFcXmD
	 vo0TfFddXt06JBprDgcWgosVEFt5Bjaz1EGcw5VM47UW/6aoDAJYmMBBqVupbMk5kF
	 u/pK2zEhI+eXabmJexn8ZeE+lHhNKb7afDuA0EiU=
X-QQ-mid: bizesmtpip3t1738919714tejrn72
X-QQ-Originating-IP: QwTkD2YBFi5SRxw8p9iahH0GQ7wR1HvLJWHQR4jQhG8=
Received: from [IPV6:240e:668:120a::253:10f] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 17:15:13 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12361163828868944340
Message-ID: <137902FEE03CCB3B+6130227f-9ddc-4043-9945-da465c28d9d1@uniontech.com>
Date: Fri, 7 Feb 2025 17:15:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb-storage: Bypass certain SCSI commands on disks with
 "use_192_bytes_for_3f" attribute
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, guanwentao@uniontech.com, chenlinxuan@uniontech.com,
 Xinwei Zhou <zhouxinwei@uniontech.com>, Xu Rao <raoxu@uniontech.com>,
 Yujing Ming <mingyujing@uniontech.com>
References: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>
 <80ef917b-3680-4f85-93ba-c92d2b69ebaa@rowland.harvard.edu>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <80ef917b-3680-4f85-93ba-c92d2b69ebaa@rowland.harvard.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wYi0xWPVNlgKOarWw2xg8X0O"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N6q0R5dJw6D8wj24iitX/5VlCG69hTV0dNnZol/banBj3ZDNAz/OZULh
	VZAXXOhrS+VAJEsjHOUFGoR/3og881BJhB2ABiMH0N9kbsRDXHg0VAQJ8Kt9LReZUiUS10G
	VOYBYH2xlsml1loyvVszhYJMfNRRKJwnf7EN1gSylDlO/8jGcgYa/SzAJCSTiFfBB0cVuyW
	o3g172TZzJI5Py+9332EEjw1ZZVqx8q1wYsO3/X2MxjJ33Wzw33h+TXw1WbswRsQKkDo8oL
	lVJr6ZLRad3evmkYzD9DgZOJXwfJWibOgnvuahYBU1/Czhr7kICXhhpw11Q1fht3z7ICXuV
	svv0vPylkZi9OySZm3GQfrfT4D5Xh0WbrcTIoWq++lb/jHQZoDF5WyH59KkygIx4jhZ1nfw
	z6ZpFj3dDbWaTM4D1UDeFaqjMNV9KQPwThmVvIkMBdYP7E3eY9Hs9TZ+kZxCbdJzC4kVXX6
	ZaBxl1VhMz/zQyV/Aw/3BkMGK5Uw+KW6SmFmP0mdmpP7H1RFAwiFcxqBsWnU2D4hGnvsvHX
	48Cufs8MkAhG83Gu4hRlDPwZBVc/hrXK4y4gz+FLztEW3k/uhx4yWPofCUo3nnh9rVYYV8j
	6pITGPSJUcYmCeRn8T9ENXs5Lxb+4lgninZM1RbCVSEb/BN+Au7wd5osyLRsrOXGoLCvf6h
	Czdk77VLWcmJ0PCoMxrrLHI1vFz1YLLi1kQkS63c3BVAyyEmoohvFj9XdZi+Lrfx9DwuVgh
	5zU32JuCEYrNTUqOXonH4iSXUDOuTtfCQkG5m/Fhxq2jf4nReWQhWkFCCq9kXQrTURha77P
	BdfuK16AvWkC7tIHn7FdNvJpcWgWLx8a7I1wqrLskKBo2dlzELUAoL8BIl+Iam034AzLvEO
	6v+ftlSrZetaUfXPT8RWDhtiMiwD9xrabgLpdAboPVl4jWwvRXZalla7QRZo4yg4zuFvfZV
	UAT00D83dCZldXNQRxtkdtEaDZGSUaQhcpWNaJdsVjqC1AjdFkqyatqCHuBHOWr2JQG5q13
	IjepFlkX03TrKqS7GBByYMalFn1grbhOA3u0EyS3wOKZ5M2JslypDxauwf6OSQ1f5BUfoYY
	a2CcN9XBnsaT8djJ78HWTnSlUrt019dUrdFzM9OtF0wWdcHc7g59Sc=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wYi0xWPVNlgKOarWw2xg8X0O
Content-Type: multipart/mixed; boundary="------------00DVJbwb2kF9isK0Tmh6IUcl";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, guanwentao@uniontech.com, chenlinxuan@uniontech.com,
 Xinwei Zhou <zhouxinwei@uniontech.com>, Xu Rao <raoxu@uniontech.com>,
 Yujing Ming <mingyujing@uniontech.com>
Message-ID: <6130227f-9ddc-4043-9945-da465c28d9d1@uniontech.com>
Subject: Re: [PATCH] usb-storage: Bypass certain SCSI commands on disks with
 "use_192_bytes_for_3f" attribute
References: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>
 <80ef917b-3680-4f85-93ba-c92d2b69ebaa@rowland.harvard.edu>
In-Reply-To: <80ef917b-3680-4f85-93ba-c92d2b69ebaa@rowland.harvard.edu>

--------------00DVJbwb2kF9isK0Tmh6IUcl
Content-Type: multipart/mixed; boundary="------------a7R0l3PzP40LN4cwqAJBJShb"

--------------a7R0l3PzP40LN4cwqAJBJShb
Content-Type: multipart/alternative;
 boundary="------------RcICTjQaqUL3ygfZqerEMV2G"

--------------RcICTjQaqUL3ygfZqerEMV2G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI1LzIvNiAyMjo1OCwgQWxhbiBTdGVybiB3cm90ZToNCj4gSXMgdXNiLXN0b3Jh
Z2UgcmVhbGx5IHRoZSByaWdodCBwbGFjZSB0byBwdXQgdGhpcyB0ZXN0PyAgV291bGRuJ3Qg
aXQNCj4gYmUgYmV0dGVyIHRvIHB1dCBpdCBpbiB0aGUgU0NTSSBsYXllciB3aGVyZSB0aGUg
aW9jdGwgaXMgY29udmVydGVkIHRvDQo+IGEgU0NTSSBjb21tYW5kPyAgVGhhdCB3YXkgaXQg
d291bGQgYWZmZWN0IGFsbCBTQ1NJIGRldmljZXMgd2l0aCB0aGUNCj4gdXNlXzE5Ml9ieXRl
c19mb3JfM2YgZmxhZywgbm90IGp1c3QgVVNCIGRldmljZXMuDQpZZXMsIHllcy4uLiANClRo
aXPCoHByb2JsZW3CoG1hecKgb2NjdXLCoG5vdMKgb25secKgaW7CoFVTQsKgZGV2aWNlcy7C
oEl0wqBpc8KgbW9yZcKgYXBwcm9wcmlhdGXCoHRvwqBtb2RpZnnCoGl0wqBhdMKgdGhlwqBT
Q1NJwqBsYXllci7CoEknbGwgDQpzZW5kIHRoZSBwYXRjaCB2MiBzb29uLg0KPg0KPiBBbHNv
LCBpbnN0ZWFkIG9mIG1ha2luZyB0aGUgY29tbWFuZCBmYWlsIGNvbXBsZXRlbHksIHdvdWxk
bid0IGl0IGJlDQo+IGJldHRlciB0byBjaGFuZ2UgdGhlIHRyYW5zZmVyIGxlbmd0aCB0byAx
OTIgaWYgdGhlIG9yaWdpbmFsIHZhbHVlIHdhcw0KPiBsYXJnZXI/DQoNCkJ1dCBJIHBlcnNv
bmFsbHkgdGhpbmsgdGhhdCBpdCBpcyBub3QgYXBwcm9wcmlhdGUgdG8gbW9kaWZ5IGl0IGRp
cmVjdGx5IA0KdG8gMTkyLiBBZnRlciBhbGwsIGl0IGlzIGNhbGxlZCBieSB0aGUgdXNlciB0
aHJvdWdoIGlvY3RsLCBhbmQgdGhlIA0Ka2VybmVsIGl0c2VsZiB3aWxsIG5vdCBjb25zdHJ1
Y3Qgc3VjaCBhIGRhdGEgZnJhbWUuIEFzIHNob3duIGluIHRoZSANCmZvbGxvd2luZyBjb2Rl
Og0KDQpzZF9yZWFkX3dyaXRlX3Byb3RlY3RfZmxhZyhzdHJ1Y3TCoHNjc2lfZGlza8KgKnNk
a3AswqB1bnNpZ25lZMKgY2hhcsKgKmJ1ZmZlcikNCiDCoMKgwqDCoCB7DQogwqDCoCDCoMKg
wqDCoMKgwqDCoMKgIGludMKgcmVzOw0KIMKgwqAgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3TC
oHNjc2lfZGV2aWNlwqAqc2RwwqA9wqBzZGtwLT5kZXZpY2U7DQogwqDCoCDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdMKgc2NzaV9tb2RlX2RhdGHCoGRhdGE7DQogwqDCoCDCoMKgwqDCoMKg
wqDCoMKgIGludMKgb2xkX3dwwqA9wqBzZGtwLT53cml0ZV9wcm90Ow0KDQogwqDCoCDCoMKg
wqDCoMKgwqDCoMKgIHNldF9kaXNrX3JvKHNka3AtPmRpc2sswqAwKTsNCiDCoMKgIMKgwqDC
oMKgwqDCoMKgwqAgaWbCoChzZHAtPnNraXBfbXNfcGFnZV8zZinCoHsNCnNkX2ZpcnN0X3By
aW50ayhLRVJOX05PVElDRSzCoHNka3AswqAiQXNzdW1pbmfCoFdyaXRlwqBFbmFibGVkXG4i
KTsNCiDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCiDC
oMKgIMKgwqDCoMKgwqDCoMKgwqAgfQ0KDQogwqDCoCDCoMKgwqDCoMKgwqDCoMKgIGlmwqAo
c2RwLT51c2VfMTkyX2J5dGVzX2Zvcl8zZinCoHsNCnJlc8KgPcKgc2RfZG9fbW9kZV9zZW5z
ZShzZHAswqAwLMKgMHgzRizCoGJ1ZmZlcizCoDE5MizCoCZkYXRhLMKgTlVMTCk7DQoNCj4N
Ci0tIA0KV2FuZ1l1bGkNCg==
--------------RcICTjQaqUL3ygfZqerEMV2G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCiAgPGhlYWQ+DQogICAgPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPg0K
ICA8L2hlYWQ+DQogIDxib2R5Pg0KICAgIDxwPjxicj4NCiAgICA8L3A+DQogICAgPGRpdiBj
bGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyMDI1LzIvNiAyMjo1OCwgQWxhbiBTdGVybiB3
cm90ZTo8c3Bhbg0KICAgICAgc3R5bGU9IndoaXRlLXNwYWNlOiBwcmUtd3JhcCI+DQo8L3Nw
YW4+PC9kaXY+DQogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSINCmNpdGU9Im1pZDo4MGVm
OTE3Yi0zNjgwLTRmODUtOTNiYS1jOTJkMmI2OWViYWFAcm93bGFuZC5oYXJ2YXJkLmVkdSI+
DQogICAgICA8cHJlIHdyYXA9IiIgY2xhc3M9Im1vei1xdW90ZS1wcmUiPklzIHVzYi1zdG9y
YWdlIHJlYWxseSB0aGUgcmlnaHQgcGxhY2UgdG8gcHV0IHRoaXMgdGVzdD8gIFdvdWxkbid0
IGl0DQpiZSBiZXR0ZXIgdG8gcHV0IGl0IGluIHRoZSBTQ1NJIGxheWVyIHdoZXJlIHRoZSBp
b2N0bCBpcyBjb252ZXJ0ZWQgdG8NCmEgU0NTSSBjb21tYW5kPyAgVGhhdCB3YXkgaXQgd291
bGQgYWZmZWN0IGFsbCBTQ1NJIGRldmljZXMgd2l0aCB0aGUNCnVzZV8xOTJfYnl0ZXNfZm9y
XzNmIGZsYWcsIG5vdCBqdXN0IFVTQiBkZXZpY2VzLjwvcHJlPg0KICAgIDwvYmxvY2txdW90
ZT4NCiAgICBZZXMsIHllcy4uLg0KVGhpc8KgcHJvYmxlbcKgbWF5wqBvY2N1csKgbm90wqBv
bmx5wqBpbsKgVVNCwqBkZXZpY2VzLsKgSXTCoGlzwqBtb3JlwqBhcHByb3ByaWF0ZcKgdG/C
oG1vZGlmecKgaXTCoGF0wqB0aGXCoFNDU0nCoGxheWVyLsKgSSdsbA0KICAgIHNlbmQgdGhl
IHBhdGNoIHYyIHNvb24uPGJyPg0KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiDQpjaXRl
PSJtaWQ6ODBlZjkxN2ItMzY4MC00Zjg1LTkzYmEtYzkyZDJiNjllYmFhQHJvd2xhbmQuaGFy
dmFyZC5lZHUiPg0KICAgICAgPHByZSB3cmFwPSIiIGNsYXNzPSJtb3otcXVvdGUtcHJlIj4N
Cg0KQWxzbywgaW5zdGVhZCBvZiBtYWtpbmcgdGhlIGNvbW1hbmQgZmFpbCBjb21wbGV0ZWx5
LCB3b3VsZG4ndCBpdCBiZQ0KYmV0dGVyIHRvIGNoYW5nZSB0aGUgdHJhbnNmZXIgbGVuZ3Ro
IHRvIDE5MiBpZiB0aGUgb3JpZ2luYWwgdmFsdWUgd2FzDQpsYXJnZXI/DQo8L3ByZT4NCiAg
ICA8L2Jsb2NrcXVvdGU+DQogICAgPHA+QnV0IEkgcGVyc29uYWxseSB0aGluayB0aGF0IGl0
IGlzIG5vdCBhcHByb3ByaWF0ZSB0byBtb2RpZnkgaXQNCiAgICAgIGRpcmVjdGx5IHRvIDE5
Mi4gQWZ0ZXIgYWxsLCBpdCBpcyBjYWxsZWQgYnkgdGhlIHVzZXIgdGhyb3VnaA0KICAgICAg
aW9jdGwsIGFuZCB0aGUga2VybmVsIGl0c2VsZiB3aWxsIG5vdCBjb25zdHJ1Y3Qgc3VjaCBh
IGRhdGEgZnJhbWUuDQogICAgICBBcyBzaG93biBpbiB0aGUgZm9sbG93aW5nIGNvZGU6PC9w
Pg0KICAgIDxwPsKgwqDCoA0Kc2RfcmVhZF93cml0ZV9wcm90ZWN0X2ZsYWcoc3RydWN0wqBz
Y3NpX2Rpc2vCoCpzZGtwLMKgdW5zaWduZWTCoGNoYXLCoCpidWZmZXIpPGJyPg0KICAgICAg
wqDCoMKgwqAgezxicj4NCiAgICAgIMKgwqAgwqDCoMKgwqDCoMKgwqDCoCBpbnTCoHJlczs8
YnI+DQogICAgICDCoMKgIMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0wqBzY3NpX2RldmljZcKg
KnNkcMKgPcKgc2RrcC0mZ3Q7ZGV2aWNlO8KgwqDCoMKgwqDCoMKgPGJyPg0KICAgICAgwqDC
oCDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdMKgc2NzaV9tb2RlX2RhdGHCoGRhdGE7wqDCoMKg
wqDCoMKgwqDCoMKgwqA8YnI+DQogICAgICDCoMKgIMKgwqDCoMKgwqDCoMKgwqAgaW50wqBv
bGRfd3DCoD3CoHNka3AtJmd0O3dyaXRlX3Byb3Q7wqDCoMKgwqDCoMKgwqA8YnI+DQogICAg
ICDCoMKgwqAgPGJyPg0KICAgICAgwqDCoCDCoMKgwqDCoMKgwqDCoMKgIHNldF9kaXNrX3Jv
KHNka3AtJmd0O2Rpc2sswqAwKTvCoMKgwqDCoMKgwqDCoMKgwqDCoDxicj4NCiAgICAgIMKg
wqAgwqDCoMKgwqDCoMKgwqDCoCBpZsKgKHNkcC0mZ3Q7c2tpcF9tc19wYWdlXzNmKcKge8Kg
wqDCoMKgwqDCoMKgwqDCoMKgPGJyPg0KICAgICAgwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoA0KICAgICAgc2RfZmlyc3RfcHJpbnRrKEtFUk5fTk9USUNFLMKgc2Rr
cCzCoCJBc3N1bWluZ8KgV3JpdGXCoEVuYWJsZWRcbiIpOzxicj4NCiAgICAgIMKgwqAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOzxicj4NCiAgICAgIMKgwqAg
wqDCoMKgwqDCoMKgwqDCoCB9PGJyPg0KICAgICAgPGJyPg0KICAgICAgwqDCoCDCoMKgwqDC
oMKgwqDCoMKgIGlmwqAoc2RwLSZndDt1c2VfMTkyX2J5dGVzX2Zvcl8zZinCoHvCoMKgwqDC
oMKgPGJyPg0KICAgICAgwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0K
ICAgICAgcmVzwqA9wqBzZF9kb19tb2RlX3NlbnNlKHNkcCzCoDAswqAweDNGLMKgYnVmZmVy
LMKgMTkyLMKgJmFtcDtkYXRhLMKgTlVMTCk7PC9wPg0KICAgIDxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiDQpjaXRlPSJtaWQ6ODBlZjkxN2ItMzY4MC00Zjg1LTkzYmEtYzkyZDJiNjllYmFh
QHJvd2xhbmQuaGFydmFyZC5lZHUiPg0KICAgICAgPHByZSB3cmFwPSIiIGNsYXNzPSJtb3ot
cXVvdGUtcHJlIj4NCg0KPC9wcmU+DQogICAgPC9ibG9ja3F1b3RlPg0KICAgIDxkaXYgY2xh
c3M9Im1vei1zaWduYXR1cmUiPi0tIDxicj4NCiAgICAgIDxtZXRhIGh0dHAtZXF1aXY9ImNv
bnRlbnQtdHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4NCiAgICAg
IFdhbmdZdWxpPC9kaXY+DQogIDwvYm9keT4NCjwvaHRtbD4NCg==

--------------RcICTjQaqUL3ygfZqerEMV2G--

--------------a7R0l3PzP40LN4cwqAJBJShb
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------a7R0l3PzP40LN4cwqAJBJShb--

--------------00DVJbwb2kF9isK0Tmh6IUcl--

--------------wYi0xWPVNlgKOarWw2xg8X0O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ6XPIAUDAAAAAAAKCRDF2h8wRvQL7iHf
AP47oSDImC+cCEm7asNUy/AYRN3XmrIAKY0gbbjtCNlwRQEAkQ+bhqk2D9IMB/KrI7LEkGxR2ts9
bsbrwzoIY4DudgM=
=19Zz
-----END PGP SIGNATURE-----

--------------wYi0xWPVNlgKOarWw2xg8X0O--

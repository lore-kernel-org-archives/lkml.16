Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B417A2E3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746590873; cv=none; b=JZMhkk8a2+gmCTWzhDcaLDE//+pHfW3sBdmKAMe36vw600Sfj38LX+CPP1jZoY+ceO5bRiZgtOmQQL/71WCKJD7w4/JWBy+yz6clV4N45DTzD0FCF6xFDpjcWUAfkhaY4lyIJu47jI2nWBrGPP18KHJJA2HuKvjCFzjmAj/eU/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746590873; c=relaxed/simple;
	bh=v7CWrLgOhhA1YXWVby2LYLufGZbvHW7fK6nG0SQZY0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOKCuhgMoS0rvHcxTD9U2cChh4z8Q3EnL8cq2OLEGBaKKSvXnG9Vol8wAZ3hGfohuJmPhU/N0EEH6EGTk3mqPPkgc22XsWM19rMqbgj3jfihyJVdc7VwlTqUiuL6U7ba0LCYPLgg+0F92o6VDLEut9aBEXuJ8k/rz0E8IFBT2Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=kn2uieq5; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="kn2uieq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746590783;
	bh=v7CWrLgOhhA1YXWVby2LYLufGZbvHW7fK6nG0SQZY0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kn2uieq5KlOoxMvgODnYE1Ze3GCSTejbEP4l92YPOcKuTfPFJECAxTlQAsgHJcFhE
	 jCpI7QWmz58bAp+mKvJ0fjStUwkiJE2auELNiXf9aDCR2+sQp4la8lkAeCV7pFU3+D
	 V886DjVK6uEG+BLLnN1ba5MO8DFg5lvguy6d56Wg=
X-QQ-mid: zesmtpip3t1746590773t8d90de38
X-QQ-Originating-IP: qe1tC5yuKrxmkRy3+9ANi9RTKdeHxBRqDfNzFcM26Fk=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 12:06:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8513509827744291968
EX-QQ-RecipientCnt: 10
Message-ID: <74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
Date: Wed, 7 May 2025 12:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Matthew Wilcox <willy@infradead.org>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
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
In-Reply-To: <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R7GYHZSpkvpVAZ7b1Tgs0Yq8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M7CiiUsdi0xOFjRdAir+YlPYkRL0+7KMo/mG/wW0gOPDXkZI+ncr259X
	R0Fqg0QbWryKqXDUy3VjfYAvVF4uJsax9QGgkyo4Y+urP8iAAkprZvb73qzz9VXld7My15d
	gqCq0Bqspqo1nxRnaz7fe9DWbxEbvhYzeEt2UiFNkCPMWjlVIJB3v2BfHor+KVVe6cwRQmh
	3QglpElmiEGZeO60MgP0SuVR3aj2Tg6TRc4r3N/Z4j0+HPu//5IgbQ1NxdPQjSjWJCL0C3g
	guoa+9u3cD9ftv4Jx2Bn/L3TqCGEf/DJIOPrqBr+Wxr4u6gJqAeTR30C1+mS9Ouajv7u/Oh
	Renq1BB2HTzXzGM856I/wX+4J03LJmjwPO7kwVSo+jYSINhV7TnfKwyZid+o9zWF5G/aCoK
	wzj966B7/zFlqC6rFEbSpHYYeaQti6nAmgwtFEH+hqdCVf3Rt0DIyTLBY0k09PdZwSaAoVw
	sj5gmCg9pW3gNFsGCju0lUaGQB712yYlBOyBrLxQKMMWVl7zLKyFIRmi/mj8IYVjt9Hp6Cc
	30XCqiKPd9u/HJPE3UxoDjnFNT0CWcFprtio9v5zndy+Ax61IrnL2x5jOfNbxVVgCLLOUBq
	dUEG5fbWvDVs/aZhLfuzILJvCNrZ1+ocs07qvuJHhFVL2Muj+5mQh6+1wJDcg0Jn5exXshd
	ZUqyQpeVF8VlH/kTuDwzLV3o5tW7swIJCv2IOjaRqfciLEy6Oxk7MLl4DmMbikDSnBmmBpH
	7ntnDii3wtACttiMJ3j6zYKctBZ4aEkaw/SN88WFAUUpX7y8uk0d4LK+rJfjvYm1w86umgP
	SCOawQB3mI3B2SAfxn1pF0qDeS+PQzeHUIjFTqR45P0adD6mMBeomrxMGsfcSYlwOsgeI9b
	3doOKBhaQSmqb04fZMsv1sdY5g9coBsscTnvadJRsSAjWz3qYUdnA97pL9RoZ1G1OlH7oG7
	9sKCpvWAC8+le7oQfxIaCmKuLe7IXXPIEgKVnMinf5nuKSTtoOps3zjOZ32vtWGAuHDNn34
	b0DmJjViH5DAFAsfpzX1GFbfRwbeYHRIbD3x8pxRHdinSz2+pBe6pOYujamfsVobMZV/Z2o
	AeXN8e3tw4C
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R7GYHZSpkvpVAZ7b1Tgs0Yq8
Content-Type: multipart/mixed; boundary="------------HwpOHrRNm0B0UR7dlucpu52m";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Matthew Wilcox <willy@infradead.org>
Message-ID: <13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
In-Reply-To: <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>

--------------HwpOHrRNm0B0UR7dlucpu52m
Content-Type: multipart/mixed; boundary="------------1taSdWN0GJnC0PGtrJZM4k9P"

--------------1taSdWN0GJnC0PGtrJZM4k9P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQW5kcmV3IE1vcnRvbiwNCg0KT24gMjAyNS81LzcgMDc6MjQsIEFuZHJldyBNb3J0b24g
d3JvdGU6DQo+IE9uIFdlZCwgIDcgTWF5IDIwMjUgMDA6MDI6MzggKzA4MDAgV2FuZ1l1bGkg
PHdhbmd5dWxpQHVuaW9udGVjaC5jb20+IHdyb3RlOg0KPg0KPiBNYWtlIGB0aWVyJyB1bnNp
Z25lZD8gIEFmdGVyIGFsbCwgbmVnYXRpdmUgdGllciBudW1iZXJzIGFyZSBub25zZW5zaWNh
bC4NCg0KVGhhdCBwb2ludCBpcyB3ZWxsIHRha2VuLg0KDQpIb3dldmVyLCBJJ3ZlIG5vdGlj
ZWQgdGhhdCB2YXJpYWJsZXMgbmFtZWQgInRpZXIiIHNlZW0gdG8gYmUgY29tbW9ubHkgDQpk
ZWZpbmVkIGFzIGludCByYXRoZXIgdGhhbiB1bnNpZ25lZCBpbnQgdGhyb3VnaG91dCB0aGUg
bW0gc3Vic3lzdGVtLCBhbmQgDQpwZXJoYXBzIGV2ZW4gdGhlIHdpZGVyIGtlcm5lbCBjb2Rl
Lg0KDQpJIHdhcyB3b25kZXJpbmcgaWYgY2hhbmdpbmcganVzdCB0aGlzIG9uZSBpbnN0YW5j
ZSBtaWdodCBmZWVsIGEgbGl0dGxlIA0KaW5jb25zaXN0ZW50Pw0KDQpQZXJoYXBzIGEgcG9z
c2libGUgYXBwcm9hY2ggZm9yIG5vdyBjb3VsZCBiZSB0byBjaGFuZ2UgdGhpcyBsaW5lIHRv
IGZvciANCihpID0gdGllciAlIE1BWF9OUl9USUVSUzsgaSA8PSBtaW5fdChpbnQsIHRpZXIs
IE1BWF9OUl9USUVSUyAtIDEpOyBpKyspIA0Keywgd2hpY2ggd291bGQgYWxsb3cgdXMgdG8g
a2VlcCB0aGUgc2lnbmVkIGludCB0eXBlIGZvciB0aGUgdGllciANCnZhcmlhYmxlIGl0c2Vs
Zi4NCg0KUmVnYXJkaW5nIHRoZSBwb3RlbnRpYWwgZm9yIGEgbW9yZSBjb21wcmVoZW5zaXZl
IGNoYW5nZSBpbiB0aGUgZnV0dXJlIHRvIA0KcmVkZWZpbmUgYWxsIHRoZXNlICJ0aWVyIiB2
YXJpYWJsZXMgYW5kIHJlbGF0ZWQgb25lcyBhcyB1bnNpZ25lZCBpbnQsIEkgDQp3b3VsZCBi
ZSB2ZXJ5IGdyYXRlZnVsIGZvciB5b3VyIGd1aWRhbmNlIG9uIHdoZXRoZXIgdGhhdCdzIGEg
ZGlyZWN0aW9uIA0Kd2Ugc2hvdWxkIGNvbnNpZGVyLg0KDQpCdXQgYWN0dWFsbHksIHdoZXRo
ZXIgaXQncyBzaWduZWQgb3Igbm90IGxpa2VseSB3b24ndCBhZmZlY3QgaXRzIG5vcm1hbCAN
Cm9wZXJhdGlvbi4uLg0KDQpUaGFua3MsDQoNCi0tIA0KV2FuZ1l1bGkNCg==
--------------1taSdWN0GJnC0PGtrJZM4k9P
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

--------------1taSdWN0GJnC0PGtrJZM4k9P--

--------------HwpOHrRNm0B0UR7dlucpu52m--

--------------R7GYHZSpkvpVAZ7b1Tgs0Yq8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaBrcMwUDAAAAAAAKCRDF2h8wRvQL7tYE
AP90r4zkEdx7gNllBCpqU5jjKNgKqL3206lyYQvzgWApUQEA2P134Qm89pUkzhzvdUKH8HwsaiTM
4OB5q4peqMtYiwk=
=zzZm
-----END PGP SIGNATURE-----

--------------R7GYHZSpkvpVAZ7b1Tgs0Yq8--

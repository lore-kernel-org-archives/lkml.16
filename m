Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369213DDAE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752434; cv=none; b=DgzMr631TKtqwVXRVIfINZ+pHLHa3R+q/YrIYyU2Qch1UYBaazgaeHpU6DXzZUqxtRQ9cOCnAz4o0cXtYQZb+EsYsvPZkVwJ5iWD73m1r73MwIILthxzxzv32QwWoyc9Mpqgi6Ux35mokbuCMwXyzj12GJDreJCCnXreu8dGM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752434; c=relaxed/simple;
	bh=bxu5vDR5DCGN2+DtjeRla9xSlz1R4XYC3rTPFsFbpkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehjTxfByod3qHsagBLwBjVfCRJxjGqDDdNusna5NWibcSBxRktuKniADkZMkx51FHl9K5lpvKAK23EvDYd8SRsbLwD2TN1ZLnK6UiHyjMq+NuTxo02K9FsY+ZtLlyaKrbSwKgqNPPimJuWNm857U786/EsVc8lyw3yxU9uvnIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A18095R+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A18095R+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso8194035e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752430; x=1744357230; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bxu5vDR5DCGN2+DtjeRla9xSlz1R4XYC3rTPFsFbpkk=;
        b=A18095R+eEqxneDvw8B0sW3Ufu8kh7li8FjD9tHCQdPdgksO71GioFESyW5BsHmXc6
         MKb6/SNtN7dtiU45uqBUF/IarjVxHVYthH5cB30uBH3hjQSZo1kYs+qD/cgJKIuOBnrW
         1ZwmGPNO22YgEE59t+koEz5Eu0oYgF36iG16gf6Cs8Z/fxuDv9ktHxafLFaMde+NMBD+
         PhWQzTWCz80pWxR2xaSXabvbbtTAEIfdndZEQvvvS0+CWroUaoB6uvKA85cL2IVWqjUH
         VQWdoKWzPbawcZT8yb6JlbPy34XpjXPZrCZE5Y5HZ5FEhwEzb52Da5VJTgab0pbWmls+
         yywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752430; x=1744357230;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxu5vDR5DCGN2+DtjeRla9xSlz1R4XYC3rTPFsFbpkk=;
        b=YCBNOs4Mo32Ox22iG3SPCSqDlDvNdYJ3MvOelGbIFvv+f5ZLvkUUnhNMrOZvXcCFR8
         P5vNOh5G9jVSaPkyfDxjvyKePFXij/2OwKLV4B0CEcmKQYYdC8A94R6Q6NcTvl2s+kQL
         XkEaIJD0d7x7yqdtdOUlgTotILjB2dEwdgU0ncbv//IUXNpADBxuWydFuhP7H51N/dHx
         E0Uc1aCKYh7ZoPzth0qjRTHgzOi830UXgByaK5WXju+z81tGfjE5L1jEm5+ntCURdXER
         LFNP+NqNuLve9QfpFcHHzJvorKGXBsLDWn8c8uM58rynSsOV+VPK9GROLM0e0Q0OIMws
         y65w==
X-Gm-Message-State: AOJu0Ywaw0vGoMFQW8Bx+vNrKeTVUal8+IuqfPH3H3iVyRrsjpfCjbuo
	RAbYhZ94ZiLAShTodXwrEmlcE0Q2LVld+iptolf/NR3N/fgYiUJYwqaBl8GNu1/6c5L7LBBg3cI
	70REuSA==
X-Gm-Gg: ASbGncuiveCqwojHbTjuGg8mAiS9rtV0ewvmVoHCR/s1FIO12i87NN+l0YTHdIDjk9s
	UsbNxPXB5Jd5vhK/GhnLuEbfGoQQwIXvRlnWkOf5ch2W90uIH0geDE3M1q5myZoYB6qzhvRLn1W
	NgmJ4a8XGYV6sazMnNS1rbZi3fLQoC+FqPQT86PJjsI+HsR5F+XCriz4kqUXvrl2lNbweH4qJXB
	nVjKEoaHK7b4ZrSlGe7KMlvqdgh53hoE0V3syM/WN74Am7jSRXIsnxiVul+UEhpgXFJIkDM7gn2
	Und+f/b9yWyeSe4cadJqeX9Q4GTrlyBiacjUn3GAmPXj5jk15QdJaU/FdcOx9bVXiAEZqgFwxcE
	pbAwme+2jSxgKGsAibBGeCOzgZGC2+46H7VsDGCF2Pjk4w8SVHYo1UcKgsxYfhhg9qgCLnw==
X-Google-Smtp-Source: AGHT+IGVMy/oHAezM3tjLDprAhT9sAQAtrmb5yFbvYszLMGcoKbyn3xH42rZliWxU2lSfKKb9rurkQ==
X-Received: by 2002:a05:600c:1d9a:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43ecf81bdc5mr22051045e9.3.1743752430227;
        Fri, 04 Apr 2025 00:40:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794e94sm42402775e9.31.2025.04.04.00.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:40:29 -0700 (PDT)
Message-ID: <1dcd1004-e771-4a21-a44a-446f3ed034f8@suse.com>
Date: Fri, 4 Apr 2025 09:40:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Gw3KsRSNj2kCBd1rFiV2THS0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Gw3KsRSNj2kCBd1rFiV2THS0
Content-Type: multipart/mixed; boundary="------------HthyHK7vYpnICjjTchOdkFOx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1dcd1004-e771-4a21-a44a-446f3ed034f8@suse.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
In-Reply-To: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>

--------------HthyHK7vYpnICjjTchOdkFOx
Content-Type: multipart/mixed; boundary="------------HByrJyRTV21U7SR0putHkBIV"

--------------HByrJyRTV21U7SR0putHkBIV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDQuMjUgMjA6NDgsIEpvc2ggUG9pbWJvZXVmIHdyb3RlOg0KPiBUaGUgIUNPTkZJ
R19JQTMyX0VNVUxBVElPTiB2ZXJzaW9uIG9mIHhlbl9lbnRyeV9TWVNDQUxMX2NvbXBhdCgp
IGVuZHMNCj4gd2l0aCBhIFNZU0NBTEwgaW5zdHJ1Y3Rpb24sIHdoaWNoIGluIHJlYWxpdHkg
aXMgYSBoeXBlcnZpc29yIGNhbGwgdG8NCj4gdHJpZ2dlciBhbiBJUkVULg0KPiANCj4gT2Jq
dG9vbCBkb2Vzbid0IGtub3cgdGhhdCwgc28gaXQgZmFsbHMgdGhyb3VnaCB0byB0aGUgbmV4
dCBmdW5jdGlvbiwNCj4gdHJpZ2dlcmluZyBhIGZhbHNlIHBvc2l0aXZlOg0KPiANCj4gICAg
dm1saW51eC5vOiB3YXJuaW5nOiBvYmp0b29sOiB4ZW5fcmVzY2hlZHVsZV9pbnRlcnJ1cHQr
MHgyYTogUkVUIGJlZm9yZSBVTlRSQUlODQo+IA0KPiBGaXggdGhhdCBieSBhZGRpbmcgVUQy
IGFmdGVyIHRoZSBTWVNDQUxMIHRvIGF2b2lkIHRoZSB1bmRlZmluZWQgYmVoYXZpb3INCj4g
YW5kIHByZXZlbnQgdGhlIG9ianRvb2wgZmFsbHRocm91Z2gsIGFuZCB0ZWFjaCB2YWxpZGF0
ZV91bnJldCgpIHRvIHN0b3ANCj4gY29udHJvbCBmbG93IG9uIHRoZSBVRDIgbGlrZSB2YWxp
ZGF0ZV9icmFuY2goKSBhbHJlYWR5IGRvZXMuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRoYXQn
cyBub3QgdGhlIHdob2xlIHN0b3J5LiAgV2hpbGUgdGhhdCB3b3JrcyBmb3INCj4gdmFsaWRh
dGVfdW5yZXQoKSwgaXQgYnJlYWtzIHZhbGlkYXRlX2JyYW5jaCgpIHdoaWNoIHRlcm1pbmF0
ZXMgY29udHJvbA0KPiBmbG93IGFmdGVyIHRoZSBTWVNDQUxMLCB0cmlnZ2VyaW5nIGFuIHVu
cmVhY2hhYmxlIGluc3RydWN0aW9uIHdhcm5pbmcgb24NCj4gdGhlIFVEMi4NCj4gDQo+IFRo
ZSByZWFsIHByb2JsZW0gaGVyZSBpcyB0aGF0IElOU05fQ09OVEVYVF9TV0lUQ0ggaXMgYW1i
aWd1b3VzLiAgSXQgY2FuDQo+IHJlcHJlc2VudCBib3RoIGNhbGwgc2VtYW50aWNzIChTWVND
QUxMLCBTWVNFTlRFUikgYW5kIHJldHVybiBzZW1hbnRpY3MNCj4gKFNZU1JFVCwgSVJFVCwg
UkVUUywgUkVUVSkuICBUaG9zZSBkaWZmZXIgc2lnbmlmaWNhbnRseTogY2FsbHMgcHJlc2Vy
dmUNCj4gY29udHJvbCBmbG93IHdoZXJlYXMgcmV0dXJucyB0ZXJtaW5hdGUgaXQuDQo+IA0K
PiB2YWxpZGF0ZV9icmFuY2goKSB1c2VzIGFuIGFyYml0cmFyeSBydWxlIGZvciBJTlNOX0NP
TlRFWFRfU1dJVENIIHRoYXQNCj4gYWxtb3N0IHdvcmtzIGJ5IGFjY2lkZW50OiBpZiBpbiBh
IGZ1bmN0aW9uLCBrZWVwIGdvaW5nOyBvdGhlcndpc2Ugc3RvcC4NCj4gSXQgc2hvdWxkIGlu
c3RlYWQgYmUgYmFzZWQgb24gdGhlIHNlbWFudGljcyBvZiB0aGUgdW5kZXJseWluZw0KPiBp
bnN0cnVjdGlvbi4NCj4gDQo+IElOU05fQ09OVEVYVF9TV0lUQ0gncyBvcmlnaW5hbCBwdXJw
b3NlIHdhcyB0byBlbmFibGUgdGhlICJ1bnN1cHBvcnRlZA0KPiBpbnN0cnVjdGlvbiBpbiBj
YWxsYWJsZSBmdW5jdGlvbiIgd2FybmluZy4gIEJ1dCB0aGF0IHdhcm5pbmcgcmVhbGx5IGhh
cw0KPiBubyByZWFzb24gdG8gZXhpc3QuICBJdCBoYXMgbmV2ZXIgZm91bmQgYW55IGJ1Z3Ms
IGFuZCB0aG9zZSBpbnN0cnVjdGlvbnMNCj4gYXJlIG9ubHkgaW4gZW50cnkgY29kZSBhbnl3
YXkuICBTbyBqdXN0IGdldCByaWQgb2YgaXQuDQo+IA0KPiBUaGF0IGluIHR1cm4gYWxsb3dz
IG9ianRvb2wgdG8gc3RvcCBjYXJpbmcgYWJvdXQgU1lTQ0FMTCBvciBTWVNFTlRFUi4NCj4g
VGhlaXIgY2FsbCBzZW1hbnRpYyBtZWFucyB0aGV5IHVzdWFsbHkgZG9uJ3QgYWZmZWN0IGNv
bnRyb2wgZmxvdyBpbiB0aGUNCj4gY29udGFpbmluZyBmdW5jdGlvbi9jb2RlLCBhbmQgY2Fu
IGp1c3QgYmUgSU5TTl9PVEhFUi4gIFRoZSBmYXINCj4gcmV0dXJucy9qdW1wcyBjYW4gYWxz
byBiZSBpZ25vcmVkIGFzIHRob3NlIGFyZW4ndCB1c2VkIGFueXdoZXJlLg0KPiANCj4gV2l0
aCBTWVNDQUxMIGFuZCBTWVNFTlRFUiwgSU5TTl9DT05URVhUX1NXSVRDSCBub3cgaGFzIGEg
c2FuZQ0KPiB3ZWxsLWRlZmluZWQgcmV0dXJuIHNlbWFudGljLg0KPiANCj4gRml4ZXM6IGEy
Nzk2ZGZmNjJkNiAoIng4Ni94ZW46IGRvbid0IGRvIFBWIGlyZXQgaHlwZXJjYWxsIHRocm91
Z2ggaHlwZXJjYWxsIHBhZ2UiKQ0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gVGVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb3NoIFBvaW1i
b2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz4NCg0KRm9yIHRoZSB4ZW4gcGFydDoNCg0KUmV2
aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2Vu
DQo=
--------------HByrJyRTV21U7SR0putHkBIV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HByrJyRTV21U7SR0putHkBIV--

--------------HthyHK7vYpnICjjTchOdkFOx--

--------------Gw3KsRSNj2kCBd1rFiV2THS0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfvjO0FAwAAAAAACgkQsN6d1ii/Ey9w
tggAkGITTj+3t/DUC6184E+1I0TaDwGPEy8g4agBFyMyZeWdMSOgJW9icte13ZWZ1c303VkX9j3o
PrcsucZKmJ1gM68kOXaVFJucC5XvIzl07Lp/rZC3ITYjPzxFVYr0IxguzvEN2aAI0T7AEpdROJuF
baI8ujGV1k6EM9cJtdzy8y+1I5zW4dAWxuTx4neDU6rNjRbLzutMWCM6sz52DYpJTw8BYnnlENBy
prXcHXYW2MOQoEHNuVIc4xs/4GJLUVumvaNOwH+s2iSNhlLNCVvuYnZaso4m+w58WNX7oL7lTwYH
uFQ56w97hMzB4p+WO/2IqGFWBcin9pgebuPmqZPObQ==
=jghO
-----END PGP SIGNATURE-----

--------------Gw3KsRSNj2kCBd1rFiV2THS0--

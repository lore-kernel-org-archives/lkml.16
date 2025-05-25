Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757C182D2
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156301; cv=none; b=KH0zjDDCveH8JplLtQZVoqW+ft7ULeTmUk+C0vJSt+bXDfzBe0UnQr+XFN4AMUnw0uoQBHfUXRqUuUmhVizCXIYe54I3YxcTo4mXj9Z5QdWS1ahxoMQnuZLEgHfsMUr/ez/yYpSMEnpNgFYFqKtSjCFDXFrHG+Z/IrPuzweF0f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156301; c=relaxed/simple;
	bh=V7F86M3b1ZqFix2XdHqJ8D+S2+giV48xJKo6XAjZsU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBJ1u7i7YM708NxdBHt7qrwsMJkMxuNNlE4XPA9001uSSd3YRJUCNDQZmmtV//7KhuYPNs2g8gEBq4X5MjrtLdqB9trG0DHdVzIKcOR/2viYmKY7m8t7b9Xy5WBgiZjlmszQWTbn+cTfrAHpRH0VW09eXPfhOg7iOfh6U3YTK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C/sLTW04; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C/sLTW04"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso2441790a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748156297; x=1748761097; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V7F86M3b1ZqFix2XdHqJ8D+S2+giV48xJKo6XAjZsU0=;
        b=C/sLTW04Chp5P74D2Al5GyJYFjexRdBt8xizIFgtqGwVG9uuAZFZQL5JTu4GWMc2Yw
         n/E3vsTBq3zF/gN2jUH9I55bYVVgKgQPPobmN/Nm7xA7DLEQa9kNmuvFrJkIg0z+/d/g
         O6q1hIGzsEKWyQ7qTVxL2hTF32B2ioDI6L3hmT6yXlxKPQ53GpAqJyIEBZnGxJX5PIVR
         cMw3hjYF5duE+5lsrTS64W0Hm7LSVCjEBp6gBEuzBtBku/ZzyVA55XyW2ouDVSWVXbTP
         OtYI4Xsjh4w6Gjc+WATB5jJRVhGo6U7+Sh0p/73/uts+RdKSJExZSGRmR8QgXifDk9n3
         59hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156297; x=1748761097;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7F86M3b1ZqFix2XdHqJ8D+S2+giV48xJKo6XAjZsU0=;
        b=Wai2d8ed2ARlRWSSLIiUwE3NuUDvgpoe1PXOW4tb+fHgz5ZvVpwfWiopJbExQLvDvH
         WUuIyLXVWkSWT4Y/u5TqOzValaNDtE0D3U9qd5eXwbPEVBB1L6yR6zHAYd/8teHHN5JL
         tznCZoymNVxk5hQAPi2lEK+v3WEnCxMN507E5DvKPAGd6Xf01ViMuixMKH/+kY9x1lpB
         gEH9Y2ECvzikgaKOdB2MTf9FndPf6AT3ODw7zsDxvFrQovqdaT3FYdqBMswN8yzzndQQ
         bAaSF2cGVVITh1cpR2y9d4AaC/0bny64OPQA1MOuY3+1XT0DiFwXGieP2ZcDERTLdMvb
         S6zw==
X-Forwarded-Encrypted: i=1; AJvYcCVpCqTlPfYItDNJ57xtE/9Z8YxAr6nOQtIcyQt0F0D8OTTMYz1jez7gbmE9gZkS7emfT2GtnhbS/tTcbEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysjpFGjOkaq0pdARQUe4riKijUC5Tp98OPpAAX4vOUty3uYmIc
	kr/Ijnt7FOQ7r4C/eMCvjUTWul8ylyOiHITNf54mTp6U78ZxWw2d/mZJkADKGx6EUQU=
X-Gm-Gg: ASbGncsp7/J7EpZR81lQ3Uq9st/G9TUnQyWeonFnxqIgUtSt2UzfnaWx7L89ChkAoHT
	fAGEgAOlvZTDaQsYk72vB3MbneJhGTDr6zdgjZcS9OKU5pgzrrIJ0GaP+IwM6T2GqRQLEmIjnan
	wWnqh/gNNl15+nHaB4m53WXiNJZe29vUMIhdRngvHPfhD5NPBZUAOiQlxOzYjK/9Gd4iIrUi7gj
	8Nd/u1l9Egi2nM3Vx4AP9Xg3YjODN9iJE4giWN8CggT8xMHEx0kKS+/IJZyoZ6XaUnBuix6vwwY
	zNG9kjOpf4ykpum3kLdqZA6qJDQTXDhnMIqeOj0G/SVsNEdkiAKIS1D8odABg6fwRDPDrZruDfI
	3zjEp/0sMEn9GFlZyn6cZWt+KZ+q4CIDfowQlTulZlkeR5X0zB6kH99xmvrZAuBHd2b5GgOT2/W
	D9
X-Google-Smtp-Source: AGHT+IF67Q+M2QPwuf4fdr+9DUNrSlT9ldUm2Z98L3traqEMIN4A4djj84OqEoSGKhtqoHRb6yZInA==
X-Received: by 2002:a05:6402:3590:b0:5f8:afab:9e14 with SMTP id 4fb4d7f45d1cf-602daebaee5mr3364143a12.28.1748156296544;
        Sat, 24 May 2025 23:58:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-604594d943esm1077474a12.1.2025.05.24.23.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 23:58:16 -0700 (PDT)
Message-ID: <21456608-aa50-4d70-b201-b51764347804@suse.com>
Date: Sun, 25 May 2025 08:58:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: Xin Li <xin@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com
References: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
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
In-Reply-To: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------atrX2qhYDn1DON6cBIlYiTeP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------atrX2qhYDn1DON6cBIlYiTeP
Content-Type: multipart/mixed; boundary="------------lCHr4s5Shac8PDeX4Cg9m18h";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com
Message-ID: <21456608-aa50-4d70-b201-b51764347804@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
In-Reply-To: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>

--------------lCHr4s5Shac8PDeX4Cg9m18h
Content-Type: multipart/mixed; boundary="------------YFrERfMp9B5sP130kPJp3ieI"

--------------YFrERfMp9B5sP130kPJp3ieI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDUuMjUgMDY6NDIsIFhpbiBMaSB3cm90ZToNCj4gSnVzdCBub3RpY2VkIHZhbmls
bGEgdjYuMTUtcmM3IGZhaWxzIHRvIGJvb3Qgb24gWGVuIDQuMTcgKFVidW50dSBYZW4NCj4g
cGFja2FnZSkgaW4gYSBLVk0gZ3Vlc3QuwqAgU28gSSBkaWQgYSBiaXNlY3QsIGFuZCBpdCBz
YXlzOg0KPiANCj4gODcyZGYzNGQ3YzUxYTc5NTIzODIwZWE2YTE0ODYwMzk4YzYzOWI4NyBp
cyB0aGUgZmlyc3QgYmFkIGNvbW1pdA0KPiBjb21taXQgODcyZGYzNGQ3YzUxYTc5NTIzODIw
ZWE2YTE0ODYwMzk4YzYzOWI4Nw0KPiBBdXRob3I6IFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4NCj4gRGF0ZTrCoMKgIE1vbiBPY3QgMTQgMTA6MDU6NDggMjAyNCAt
MDcwMA0KPiANCj4gIMKgwqDCoCB4ODYvaXRzOiBVc2UgZHluYW1pYyB0aHVua3MgZm9yIGlu
ZGlyZWN0IGJyYW5jaGVzDQo+IA0KPiANCj4gQXR0YWNoZWQgaXMgdGhlIHNlcmlhbCBjb25z
b2xlIGxvZyBhbmQgbXkga2VybmVsIGNvbmZpZy4NCg0KU28geW91IGFyZSBzYXlpbmcgdGhh
dCB0aGUgaG9zdCBrZXJuZWwgaXMgdG8gYmxhbWUsIGdpdmVuIHRoYXQgYWJvdmUNCmNvbW1p
dCBpc24ndCBpbiB0aGUgZG9tMCBrZXJuZWwuDQoNCkNhbiB5b3Ugc3RhcnQgZS5nLiBhIG5v
cm1hbCBMaW51eCBndWVzdCBvbiB0aGF0IGhvc3Q/DQoNCkFueSBob3N0IG1lc3NhZ2VzIHRv
IGJlIHNlZW4gd2hlbiB0aGF0IGhhcHBlbnM/DQoNCg0KSnVlcmdlbg0K
--------------YFrERfMp9B5sP130kPJp3ieI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------YFrERfMp9B5sP130kPJp3ieI--

--------------lCHr4s5Shac8PDeX4Cg9m18h--

--------------atrX2qhYDn1DON6cBIlYiTeP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgyv4cFAwAAAAAACgkQsN6d1ii/Ey8m
Xwf/YPFiWRw00C9BhVw1WpXXgekZg9ICFl0TkrYHNnFunhisOWQ+Zv2rGfANQBP8XE3xvOgm2FjJ
p4O5U21FH31o7XMxyIQnwL+JMP5n2J/a+t/YzxSkr8yWg/ETMhhvM37bjqF/GsdmXYrMFixepZQW
FHITn77XLLm6zxLq55G/T07RnSGoAENtQ039Vw4mZMzF/PtpYKH3U0/4tNJtSw+XC681rafEieZG
1BdileS/fv/6oEE1QQE2UDAmSqRQmixAtYj/wHikwx/4h2efxOHHbidFSKNyAuBwkVrBKbOJQ0+Q
Xrvld4vDP6OO9wFOqvr2UANNUNknKs5jwur1XWVlsg==
=QKog
-----END PGP SIGNATURE-----

--------------atrX2qhYDn1DON6cBIlYiTeP--

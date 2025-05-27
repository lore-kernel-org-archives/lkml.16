Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22531DF980
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370964; cv=none; b=FxFZH0FA9ah4/nYfJQ66Bs3zcjiAADUGWM2MIwQMhCJ6tuSHlIr9gJFXtTNUOTQUNuwFm010SwMBDwj8R5JH/TtSxh79dWVDPvet2DU2tbX4hwI9+Zz30UHZ7mYLaqJwImoGnAhuIjaB5nqJsLzuLe4bRi6JZ1zmNxRzhX5Mjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370964; c=relaxed/simple;
	bh=IUzKe0bi8qiAo/jZ+raCTLtjpE+kCiLkypaX1o9smRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmXVGF9UP4MdipwDYwjJ3cOQsCfnT1+0lQarOFwGejH9h/1qjONRSuSjQUXmhW23mOQ+xfHUPzFhjMQeAaaZMbSA/c6GMVgTx5f5mBNzG/3omGn7ks0W2osY1gp3Cclwz1r04JfASvy7IobW2c94T22Ts38YLWWJo6pRShcwZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H0gk9WcB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H0gk9WcB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso23877705e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748370959; x=1748975759; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IUzKe0bi8qiAo/jZ+raCTLtjpE+kCiLkypaX1o9smRA=;
        b=H0gk9WcB701GBX7r0EG+eR7UbEv0Lfo+tVOUrYuiXfH6nHRrUbEt8EBJ0Wkptw54+5
         DOy+6eVoFLDqkOkkGVNV+i1xjUPkR1ypg0niGPfLWsKnniCX9sj2l4H7xuU5JQ6+M69i
         QWdyE7wGDe17tuA6Pfm3xW+039zDQSt05Vin7RGwpnqAqv8SA09id5vKh8E2H7d22UoE
         2rhQawfIOS3m8Z1fjJt5zTjqLLaDOHDl/9XhGEH18jmy2t7RcWrZhPBJUamRYeQnjwzk
         hpnH+n7FdcPR3yrJHiyMANE3dAA2Wgkew5t6CRW14MG1i3IDG2yH/RT8cgvZZzBCcW73
         WDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748370959; x=1748975759;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUzKe0bi8qiAo/jZ+raCTLtjpE+kCiLkypaX1o9smRA=;
        b=aZhYDwy75gKtgUxEG/wjHWcIha5eo/DvL3uQ6sdBWo9e8bNgjkp6FJausUk+EMp5I1
         u8DIpmag8tscxpH9u8AsNDzGq/ELh/wBG5jwqzXdQlcWqg1YaBGc+riDMs7L6eRmwL5H
         ES+5vs0Q5ArEbZvTk4kx+ipsbu5DSpH+rywEuKOfsi5vwrazzE3kwoE/d2VC/9fibI/R
         XNrjURLvcJ6upCSJ3oNeBVZGk5FSN0ovgy832tEUiuiHkLNAYNV/j519nCVTP3qy2V2r
         E757EiLPsMRI2ij6ITaQHgWvRU7W0sRhcUSkuKsQa9GpVFwMJgd3KFh1V+7QCZmuCJHI
         PEdQ==
X-Gm-Message-State: AOJu0YxN5N4Q/CEWdczbXvPqw37koQnxYX0eAu2/vjxbv7awYhJHmBDp
	j5UC5QOZhgDEXrwYCCuNy6AaUgqPAohVa1T9KxAj8keUW2lvhKWtqC1yViQEZ8eZHMo=
X-Gm-Gg: ASbGnctwI/XbjiyZNjWH7N1Nj8MED/ibhreY87UX97iNBx6PiT/vmtmMcak2ZSaBP1b
	7hnve+09N1Sgy5vLskEeupO06cOoFKTnShwGcCVr3Dh9S1ChXxgSsYpJ7OYOz4/eUVNWDLHmFnk
	MmHRERR8Pi01OG2AZkjHWbZ57imt8ZFATfWMZ05bASea95zmMCM5JICtntldcielIxiwZ4gAB4Z
	GMB66C72oEGh5nNZLhfKKcKxDsVzHZXZ08E5sw3EsZBnEbct4v3fV20kO93BIRWjY8HOSZI5bgl
	QmjDKD1xcEXccPnLqhXHl3TwKyEjBJIH9iM5jIM2OT9GpegUmysta2aqdKvji7SJqFtZfgqbqTs
	r1vm3GqRCyNxGww3qea3NrYPZQAKyynN78LYsNQviGMTcEJZS0ERR/8rlLapm2DKqNsfRaFY1zO
	H0
X-Google-Smtp-Source: AGHT+IH83mey0m8NwhJKnFTrrRiLWkJ19np2j6fQjf/QBxaoyPPCn9iUtjODE8P/Kvi3u5sJ84ochQ==
X-Received: by 2002:a05:600c:3c84:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-44c9301660cmr154119405e9.2.1748370958769;
        Tue, 27 May 2025 11:35:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f381465fsm277582395e9.29.2025.05.27.11.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 11:35:58 -0700 (PDT)
Message-ID: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
Date: Tue, 27 May 2025 20:35:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: Xin Li <xin@zytor.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Zhang, Tao1"
 <tao1.zhang@intel.com>
References: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
 <20250527174612.ml4raiueqdophhxl@desk>
 <86cec0d4-96fa-49dc-aac9-29dcae48b425@zytor.com>
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
In-Reply-To: <86cec0d4-96fa-49dc-aac9-29dcae48b425@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rEOCjh6zyyrDZL1QtdVL929i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rEOCjh6zyyrDZL1QtdVL929i
Content-Type: multipart/mixed; boundary="------------7JRe86SxeUpyLb5sKNEYTnLo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Zhang, Tao1"
 <tao1.zhang@intel.com>
Message-ID: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
 <20250527174612.ml4raiueqdophhxl@desk>
 <86cec0d4-96fa-49dc-aac9-29dcae48b425@zytor.com>
In-Reply-To: <86cec0d4-96fa-49dc-aac9-29dcae48b425@zytor.com>

--------------7JRe86SxeUpyLb5sKNEYTnLo
Content-Type: multipart/mixed; boundary="------------55NLOFMfAos0sLnSdhmXWCLu"

--------------55NLOFMfAos0sLnSdhmXWCLu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDUuMjUgMTk6NTQsIFhpbiBMaSB3cm90ZToNCj4gT24gNS8yNy8yMDI1IDEwOjQ2
IEFNLCBQYXdhbiBHdXB0YSB3cm90ZToNCj4+PiBBdHRhY2hlZCBpcyB0aGUgc2VyaWFsIGNv
bnNvbGUgbG9nIGFuZCBteSBrZXJuZWwgY29uZmlnLg0KPj4gU2VyaWFsIGxvZ3MgYXJlbid0
IHRlbGxpbmcgbXVjaC4gSSBkbyBub3QgaGF2ZSBhIFhlbiBzZXR1cCB0byB0ZXN0LCB3aXRo
b3V0DQo+PiBYZW4gdGhlIGNvbmZpZyB0aGF0IHlvdSBwcm92aWRlZCBpcyBib290aW5nIGEg
S1ZNIGd1ZXN0IGp1c3QgZmluZS4NCj4gDQo+IFllYWgsIGFzIEkgcmVwbGllZCB0byBKdWVy
Z2VuLCB0aGUgc2FtZSBrZXJuZWwgYmluYXJ5IGJvb3RzIGZpbmUgYXMNCj4gIm5hdGl2ZSIu
DQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHdoZW4gYm9vdGluZyBhcyBkb20wIG9uIFhlbiwgaXQg
a2VlcHMgcmVib290aW5nIHcvbw0KPiBoZWxwZnVsIGxvZy4NCg0KV2hhdCBhYm91dCBib290
aW5nIFhlbiBvbiBiYXJlIG1ldGFsLCBpLmUuIG5vIEtWTSBiZWluZyBpbnZvbHZlZD8NCg0K
DQpKdWVyZ2VuDQo=
--------------55NLOFMfAos0sLnSdhmXWCLu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------55NLOFMfAos0sLnSdhmXWCLu--

--------------7JRe86SxeUpyLb5sKNEYTnLo--

--------------rEOCjh6zyyrDZL1QtdVL929i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg2Bg0FAwAAAAAACgkQsN6d1ii/Ey95
Iwf+OL8D8/gQ8L5nGPrEFewVjMR7JYD8PTstfjveUBbo5Wodl3CZ3WU6db7mRsLdHFkwS/Kp0oWR
nm9oPVIfGJcksxK5p/z/VUvjQHgrWZov3eyZpCbeiJYRc0L8R+L6QljbtPLtxsYIem9UsF3er/Yp
43WTavcU4ld43XuwUpd7mda/f3nMTUZEg8jslGWlnASg02viu0k82JfB1u6yfIxtBnywzQRsWJ7P
Tuvu73XN1/xpTNdT4Llo69mLgl/VB3krXCgT2HxduP6Qg+9wm2hk/e3uvgA5FFZ3Rdwq7MY6bCEc
7r3r0NP6xF6waPOSUUiFAL+KUhvNHjxG272bBIzzpw==
=1HGB
-----END PGP SIGNATURE-----

--------------rEOCjh6zyyrDZL1QtdVL929i--

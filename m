Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EAF1E22E9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696092; cv=none; b=p8AzDBzZd0caCimZzZsSUJyO+ZWL0F3icKq4adFPyXpflg7QNXqPLNt9cYW57k7s3ytOfAxG4iSidwB2kLkDSWtZBw/E6o8jRJvy4iLpQmr4ryXI+Jg+v3wSTdt7vgsaunvzP5bbSwW/T0Ql0w9IrsRIXBo3n10WECphmq626vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696092; c=relaxed/simple;
	bh=C/+WqXHgVM6KwPKsuKFOjyXJKo02OXXmWq1gEtx0R6Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=A3PcIxKvCDOiiNUvISUHbsfvgygzR4gVvpZG0FcxjOFBiplhOQiA7tHtdfrBkUPRAbVAdDDqaECIR+UwYFxxeL3G2yO4K8l6wPNqoVP81CQHckdWPpbfM4uETYUhci6gBQ0AXLinE1azdHC+Eo7JwlZ/qOYR9LJpAEgD35z5So8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MR37ofYD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MR37ofYD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acb39c45b4eso115143366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746696088; x=1747300888; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C/+WqXHgVM6KwPKsuKFOjyXJKo02OXXmWq1gEtx0R6Q=;
        b=MR37ofYDBiURe3cBGIdGuiHzOB57kuDkEZkwoJ66AX/m19FS1xG8x+rM/QHIgUlpKl
         WrJHw9CsDufYbWSxKZLNvgQw04C/ATK90Uh50oDhyQ2SlMNuNxwnP4gI+7mho6OR0DD/
         r/zXJHgSTSEOjUQaBYy5pmaqXTL2UNcp/Qw/7viJDE9DsxftMpHZdUUHtlnN3RQYC5FM
         5XL71Dcjbv0R8G2WSaAbnb7mWmuKvbgtRo+3OpXlAP1cr6CBV0GTsMCNB72gwPjJ8Lt1
         vRN4f6/nWxs/fDcJaWmjfLTSVfTckH7cIN8tqqu5sW9lV5JKYWV52YBMBWT5hDRzzhu8
         YhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746696088; x=1747300888;
        h=in-reply-to:autocrypt:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/+WqXHgVM6KwPKsuKFOjyXJKo02OXXmWq1gEtx0R6Q=;
        b=qJbJCBUzqHkuC0l9bqNQ4mzaBAI6mXMvD/zvMXwjmLERaeQeVbsyWNqjGXRmBi6Qgl
         jyme+bvldKEh361CPCBncfFJ4OhBwJ1Y2jvZ8fVBOykkfVqWrqUroXCpEtwAcQIpXI3h
         d5nQJwY/mvwVNS0ycvsP5e0X/oIxJ+RUFaVmAHyb5qMDO9JMLiBxoBLpjWXzqgVIfBpf
         +g0Luk4rVlu1kfNpvY1n1JlsDO0nE/4iD1CUXtobxY8VethnpOyBx/NvhyMIfcX1KdoU
         la3uI/LbjjrPZ0f04G5NCM88Fceq0UoMs+iw5SGqinv1mFdvmEJeE1xoWNhLMbPbUpe6
         v8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXfAtcSen8eRroRW2GyQ8KgvkYbRno0mlh4uSLFTNkso4QvBXQe/QABFV3qNGJKu1k6GSGEJ6BE0HCZk8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF10malUYb/nP3w4wcSdEsGnXSKOpLymfUNYQlh64Icrh/EoaE
	Uj2OxaZquEMQbT6sDI24XWqOcilDQe6PY+aOoxTWoDz35W5bMigYMR+3aR5+aLU=
X-Gm-Gg: ASbGncsY9sYiLQ8w8xsszBos5SxVK6pH4qx/FwmMqB/XJsqeRCXWyZKbCv+k/exAXJ6
	g2FoLzOEUl9VIKUstVvD0q+CJYy4ceh88vCaVETTSKohWhtLPNuGQ2oSr4pYaRinGwKQaAi/mpu
	hUemv0dtHCBfOBhRGvcHu6JVfEUtbLT5dGqF4j3nHlXFp6WBuHs3BF3BBF/QHYUgpt1XVbe90vT
	R36xyzmYNHpSTtLfQvdB9nIkvy/ukro7qN/UEyiC9jI87nhdGRJhmm/Su1kYH2+Cb1meXq3vL2r
	6WWswR5q0bPx1WID+GkGDQhJdYa6F0qdKv+t9V/Kd9eo6KHe/xlsmjv97oSeW6oh/iHqEVQXhNR
	MVf/WrtZeSrSbaK7bl0mrxVd6fNtUwlyLM1HzKiL56M2Wd4XEKDR0n4YNwHXBFvSMvA==
X-Google-Smtp-Source: AGHT+IE/AsaXTe0Exs1vX0VXDYwXrTgSgVyIibno1XFSbRqi4WUc68U6tEFXJuFk3OPwzmw8BUEC2g==
X-Received: by 2002:a17:907:8d87:b0:ad1:e7f2:b94e with SMTP id a640c23a62f3a-ad1e8bcc880mr672979266b.18.1746696088062;
        Thu, 08 May 2025 02:21:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef? (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de. [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895087d1sm1051543966b.128.2025.05.08.02.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 02:21:27 -0700 (PDT)
Message-ID: <26c14b81-5eaa-48c2-9b28-518687fe9ea3@suse.com>
Date: Thu, 8 May 2025 11:21:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and
 Hyper-V
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Elena Reshetova <elena.reshetova@intel.com>, Fei Li <fei1.li@intel.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-10-mingo@kernel.org>
Content-Language: en-US
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
In-Reply-To: <20250506170924.3513161-10-mingo@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Qs4i40xJcJQ7HPvEzZ4Gmfl7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Qs4i40xJcJQ7HPvEzZ4Gmfl7
Content-Type: multipart/mixed; boundary="------------rXkm08oez8CPRRECAV9NprES";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Elena Reshetova <elena.reshetova@intel.com>, Fei Li <fei1.li@intel.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <26c14b81-5eaa-48c2-9b28-518687fe9ea3@suse.com>
Subject: Re: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and
 Hyper-V
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-10-mingo@kernel.org>
In-Reply-To: <20250506170924.3513161-10-mingo@kernel.org>

--------------rXkm08oez8CPRRECAV9NprES
Content-Type: multipart/mixed; boundary="------------gAwN0bH04UieS2bqxp8ft964"

--------------gAwN0bH04UieS2bqxp8ft964
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDUuMjUgMTk6MDksIEluZ28gTW9sbmFyIHdyb3RlOg0KPiBTaW5jZSB0aGUgeDg2
IGRlZmNvbmZpZyBhaW1zIHRvIGJlIGEgZGlzdHJvIGtlcm5lbCB3b3JrLWFsaWtlIHdpdGgN
Cj4gZmV3ZXIgZHJpdmVycyBhbmQgYSBzaG9ydGVyIGJ1aWxkIHRpbWUsIHJlZnJlc2ggYWxs
IHRoZSB2aXJ0dWFsaXphdGlvbg0KPiBndWVzdCBLY29uZmlnIGZlYXR1cmVzLCBlbmFibGlu
ZyBwYXJhdmlydCBzcGlubG9ja3MsIGFuZA0KPiBlbmFibGluZyB0aGUgZ3Vlc3Qgc3VwcG9y
dCBjb2RlIGZvciB0aGUgZm9sbG93aW5nIGd1ZXN0czoNCj4gDQo+ICAgLSBYZW4NCj4gICAt
IFhlbl9QVkgNCg0KV2l0aCB0aG9zZSBpdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBhZGQ6
DQoNCkNPTkZJR19YRU5fQkxLREVWX0ZST05URU5EPW0NCkNPTkZJR19YRU5fTkVUREVWX0ZS
T05URU5EPW0NCkNPTkZJR19IVkNfWEVOPXkNCkNPTkZJR19YRU5fQkFMTE9PTj15DQoNCg0K
SnVlcmdlbg0K
--------------gAwN0bH04UieS2bqxp8ft964
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gAwN0bH04UieS2bqxp8ft964--

--------------rXkm08oez8CPRRECAV9NprES--

--------------Qs4i40xJcJQ7HPvEzZ4Gmfl7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgcd5YFAwAAAAAACgkQsN6d1ii/Ey/+
6wgAm/3CkkOltI7nAcT0wB0HlB5OCGr0D6Pop0Tbr7U2QNs93NrEMZ8dTQqVgPPy90P+v/S9S9Gh
u+POFoCfPb5t81c8HeLd4aIej1beiF604cLrOXEjtVFN7BwnyfEylbF516Bbl5qWtWNDY0v6NCZ5
eCFzAWnrZRtInzQ6dpNVQRQg9rWH2kZIcrE1mvrly0E1tEUR+53t8Wj4UdB4X9Aqw3WDv9BZOdnc
7M/Vixvq1I+tEotS3Fy535AXIJCieoj3wD5aEMPT5TpiUza2x/P1pnHEB1B5AcdMjuHPUNPOSQfI
E1pHeSQa/RjvNfH8VWuovzN502bKij6OprVsBL2p9A==
=NaHm
-----END PGP SIGNATURE-----

--------------Qs4i40xJcJQ7HPvEzZ4Gmfl7--

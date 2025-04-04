Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CEB20A5EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743791202; cv=none; b=K9bIe7YNlTzPM00/0juZRSzPozoOH+zZyYiq0Nybq8O4UEns+ZT6G6EeOngILwR0a7L4mZS3sSzWDxelyWmiiUMwFLVW6hcqtprv1+xg+ajkdkPDZvaKYGq/U5p0Bj6kKMM0UaB26XjCdz0V6IIwf4l53CgJwDg4rscADFT2sCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743791202; c=relaxed/simple;
	bh=EYv98k/kVrWQigraqqHU5Ii71ogDM06xt3AD16sSeaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYxEE+6II+aAl/bfzXTbvMgp3P7b0eu19fBZDMcXaGIfOvqN6S1KQO41mVzo2jYI2tZCJ9SYs6H9EZWIBPx4+G9fh0+wegsieeRvfI/MKEDxRZZdu34WTkCv6Gtex5KHo+GV6lcncUy3HcJns0YRGOWn+hmNpGGIDxYi7Y8yHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=avzZ3A20; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="avzZ3A20"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78e6edb99so339528566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743791199; x=1744395999; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EYv98k/kVrWQigraqqHU5Ii71ogDM06xt3AD16sSeaA=;
        b=avzZ3A20LG1M8ikdciZJ9wUWIPbiRerhCD9kABQ+xuVCWiI5wlpsOHehrKlP97aDyg
         VG8xQwrDr81LRnqsCKoSVtMIzn01AtKN28ojEqsXW2HiYpNeItaGH/syrWsSASSmNkcp
         sSO8/i6mB/r0pZXg5SQ+knHEzL0NA6HExqP6k8oLNn1nVg2r9BoiCCRqFKSzPxBaFmsT
         too4LYfkrPug+ggvvyCifUTaiG8RpGBSD4fOrs87xl82XXecktk2hwI/qqfq5uvLdiww
         iIQsQwOniLIvw21JTIGlcLkKN/LIhzmzwzY0oe18/CmR6QpXgJhgYB1/mpN4WoE7Das7
         PigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743791199; x=1744395999;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYv98k/kVrWQigraqqHU5Ii71ogDM06xt3AD16sSeaA=;
        b=Mdl+ZU5vQzxyCpEmVxxzNTDksCYCm1NbjfPhul7IojkEi8JAph62dcrpd7R8iwadq8
         4k33emd/Jl+wk6L/CDq+utH1r7RuZd5xc1eV9YljQwEwZvne1Sj25vn4+Zpi8ccDJtDo
         OKUEkUPA++FrZ3LstA6qS6Tj6wRUPBAFngyLXNSVWG+zH2Gv9b7drjE3HSxCXD/LtLhC
         63piC3ITQPQmVZ8ZqQtH6Ki0w4iyrLmBNcCeJzuzdFaZ7z6dIhTHY+ZgsFDytFj1BmOr
         T6UqyctwDgA5KTgGCPqMfefwQP+mFxwWCxvTzQActjL+9DmR0zclfDIpuwoeHL7j3vUY
         eh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6PN9JZJRXLQ/jBu7AP32jxybUCb4GFQnw7WhVbmxPdHge0DNWkDWztIvOLCjmFkckxri5npHh0iKUGdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYVEz47JL5fBCnt+y7CPAdsqmxBPZdIZDIWcJOaH1JbI+0+dT
	xOxi+FL0Q/DQIG0sNI+vQ8NSRJA90dkClQDbTV1BqBcIBYGgMjSLE6+2s6GpXFw=
X-Gm-Gg: ASbGncvVbPTK6QF3qDGtD2PhmHmJ7xqegyTJO0otyOxmC7Y8TAf89027mTDIJX1Fxih
	Dk5b4zSbT/atxx27FLIObKzHvyKvAJ5ODjS2NAXo1k2mWOJLTWDLKfuJufFFc58VKQVYXPqt3w1
	lMLy4yhr4dzS11w0xBwCKHVGL2TJ09qex42g64aWKHMlyaTK6s53TS6ZfpQ/Fwd8qevNiZciaHW
	93fWfRbKvOG6BNNTRg9TNE/Jz7yccmcKZjbUSQo2x+2ehwJASBomxmSkv2WD1mLJZITZvODi7sy
	5k1TYuCjPBB00T+YDahLVLn4IU+YY1B9rIJ+ebWQiSGJrtbegbHawpUVn6NId8R+dR+qY6TfQV+
	6ypcLqPauE7f23/5p3qdZGGfxVkZj9xBAX8gfCVrBLZShBEiNob95kJK/KTL/Lh46Uz88og==
X-Google-Smtp-Source: AGHT+IEtRyOMJ7rv9Yu9CmzIEdrjS+IkGOdcluo1mbQaap6BtyC/vpBedaMyW0qLTYyMqsUGAtHvSw==
X-Received: by 2002:a17:907:d8c:b0:ac7:b366:c331 with SMTP id a640c23a62f3a-ac7d6e951e8mr318304766b.53.1743791198824;
        Fri, 04 Apr 2025 11:26:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c21d0sm300949066b.175.2025.04.04.11.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 11:26:38 -0700 (PDT)
Message-ID: <42a55a38-ad95-465b-b557-95c99e12377f@suse.com>
Date: Fri, 4 Apr 2025 20:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
To: Dave Hansen <dave.hansen@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250404133459.16125-1-roger.pau@citrix.com>
 <b0bb167b-fc48-4434-99a1-9b0d2f3e7d38@intel.com>
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
In-Reply-To: <b0bb167b-fc48-4434-99a1-9b0d2f3e7d38@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------az9mjnjMNxtWEQ6g385kjHmp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------az9mjnjMNxtWEQ6g385kjHmp
Content-Type: multipart/mixed; boundary="------------ovw2iLJ40lMBphh3VLp0WxkB";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dave Hansen <dave.hansen@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <42a55a38-ad95-465b-b557-95c99e12377f@suse.com>
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
References: <20250404133459.16125-1-roger.pau@citrix.com>
 <b0bb167b-fc48-4434-99a1-9b0d2f3e7d38@intel.com>
In-Reply-To: <b0bb167b-fc48-4434-99a1-9b0d2f3e7d38@intel.com>

--------------ovw2iLJ40lMBphh3VLp0WxkB
Content-Type: multipart/mixed; boundary="------------bvchYM7fVNyfKc4uShVBrciV"

--------------bvchYM7fVNyfKc4uShVBrciV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDQuMjUgMjA6MjAsIERhdmUgSGFuc2VuIHdyb3RlOg0KPiBPbiA0LzQvMjUgMDY6
MzQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+IE11Y2ggbGlrZSBhNmFhNGViOTk0ZWUs
IHRoZSBjb2RlIGluIHRoaXMgY2hhbmdlc2V0IHNob3VsZCBoYXZlIGJlZW4gcGFydCBvZg0K
Pj4gMzg2MjBmYzRlODkzLg0KPj4NCj4+IEZpeGVzOiBhNmFhNGViOTk0ZWUgKCd4ZW4veDg2
OiBhZGQgZXh0cmEgcGFnZXMgdG8gdW5wb3B1bGF0ZWQtYWxsb2MgaWYgYXZhaWxhYmxlJykN
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiANCj4gSSBkb24ndCBzZWUgYSBjYzpzdGFibGVAIG9uIHRoZXJlLiBXYXMgdGhl
cmUgYSByZWFzb24gZm9yIHRoYXQgb3IgZGlkDQo+IHlvdSBqdXN0IGxlYXZlIGl0IG9mZiBi
eSBhY2NpZGVudD8NCg0KVGhhbmtzIGZvciBub3RpY2luZy4gSSdsbCBhZGQgaXQgd2hlbiBj
b21taXR0aW5nLg0KDQoNCkp1ZXJnZW4NCg==
--------------bvchYM7fVNyfKc4uShVBrciV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bvchYM7fVNyfKc4uShVBrciV--

--------------ovw2iLJ40lMBphh3VLp0WxkB--

--------------az9mjnjMNxtWEQ6g385kjHmp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfwJF0FAwAAAAAACgkQsN6d1ii/Ey//
8wf+L4d6Phkv8b/AXT430FhKk7Ald+mvUh9mivKwcF9bE2VfUXf8iH1jgT0LMK+cZDcOlt/aPcl8
ZdccaAVpwsg6mr5hEPcuOM0QpPFaWKSGnsGaOgvLUVhTduSlM81EWvj2VeZ8662l2EHs+6704uAE
vtQRG6MsPpGrt8yTA9+HUuxD5w8Y4RVMmqJyIDH/Y9pPi/mUQt+EXUOQ3Rmo/AWbAKSg/GyFfiHa
ba8cb7spE3S2m48WkpW1VCDke44RuebRuajl+y5HxxsmI58UanLAd3xB4Q4TCwSq2bxR8RDCkHNg
RM59df0vzUN7HRH1zQvwnybdal1y3TNyIidjJyg16g==
=x/+V
-----END PGP SIGNATURE-----

--------------az9mjnjMNxtWEQ6g385kjHmp--

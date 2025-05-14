Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC227464A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238120; cv=none; b=FKGsJGl16lINGEza4loRfiJB2k4OhSlrKJVF4X3NXtntQ2u0VdV6Cf2o2msxnogchF9JsPFOoME5bnpMpTFdZgFV4eiqLm/qpOJeKjC/xYM19myc0EyRG/bA/DIh2G/yr+rqjm0g9/qOVjPMaCKhKUhHfSlkruy0Ijfa9fmAQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238120; c=relaxed/simple;
	bh=Ryo/5460jXyba+2N6cmiEE74Onl1UW5ECCK42iBOj64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgpGor11Bsg1EY4gwiJTpqH7WdT/QNR1xzuDNRxrvBfHCYOVPM9cbeV0cmuxWBXbR8VRATWem7nJtGU3jtlycgNGc7I3/pGXKoysyoOl3W2N3EgydvblIyTeFlGCLKY636t495dtS7XRlVIONy8As7QlsEkUFZf9UaEisPUUlD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PuizARWW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PuizARWW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad228552355so972597466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747238116; x=1747842916; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryo/5460jXyba+2N6cmiEE74Onl1UW5ECCK42iBOj64=;
        b=PuizARWWvXTtb1pDANtYQrxSsAue65XRK7Zh5raJSOX5uxpNRZiU7mEEIubAfQDSrc
         VedlygoUtuUpRdY9bWkv347JTZAIO46g9RPG0p948eVo5Np1Ppu4PL1nskc0ZBUAU1DE
         KdFe1MUvHVnX3kkFczD4VoUirlAoJp5KyFcsk2dgutqqYF6Ze4zu444JpJbsTxf2z6xX
         dIP+/0xTSTbeWG+Ud4m7QJXbCacx/U3BuB8vNg8dDT8gF3A7swZGJlL79cBtl+k78vUz
         pu17qxVGRycQgiGeUvNZwf8zt23fY1v52gPw6DcLR7PDJ/R67nrQpqPa2oDm5g6OWZW2
         p5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238116; x=1747842916;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ryo/5460jXyba+2N6cmiEE74Onl1UW5ECCK42iBOj64=;
        b=JHblLWrM73if5ZMg373UIsa1atskdaFsciHgibhxCT+K90yWrIx7wQ9hplceYU78+i
         j5lzBI1vpfDTTKd27IVhVdOj4XQgrLhoFfmzooRbam6Oi0Nt9sWsj2oaRE4M7Jp99wlV
         4+8vTpzw9hDONmBUFFgkq9xQUZdgIMV6SNllm0Be7lk55ZbwqwCYQdEo9FVgP5qqPQg0
         jZDSwAiNSmGeHQ1WDzMHOCNkeATLt57H/me2ukIyP1kvXjhNZLHm+Qehabs3EBtUZspR
         7u3YZySYoDQynko92NBQIa9ALF0ZWHeLq+c+F1kCDnLYMeWXEgPreKj1jqd3EGpRtnsB
         4Ntg==
X-Forwarded-Encrypted: i=1; AJvYcCVYACsp3nJiQEMMT+WBK3ARBHQ+/rabgDfwP9wrv+/oBoBnW9XVXci431DIHKxE5dDdlo5GItI4Blj0UBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOG+cGjDdQ2lC8qS+44pxXUsdZo0LSxhhseielmffvM2VxKmFp
	IWHl3ortnC8aeNOB/XTbrcl/GgcjJBgLgzVNafDVB99MwxzSHZKGni+k9mywVcppkobHxnywYtA
	ze4U=
X-Gm-Gg: ASbGncvUqdC5Lsr7xLNUN21cvO0GYh27Pws7VhvuHcWRkPsuRW6+Nz5NyTJK4HuyrIE
	bQEFwXklv/W0JhK3tsH+iWcrEXwb/rYrboj2RHKfaOF//uSDauDrxOa2giDig4PaLleJvw3D0B0
	1ssZYC6nvOg/4TasEWypyJb7hzVYXPLyZNj3YGFEBRIvWaJkWRuwy/gWvHxa9m3W+LREJOaN/n0
	N5DphBwydDV/EvFkPNeQ3kzUMzkfw4+R8PAlu8EDu8Rw849Xgkw8xMTa522G2JgUDFNAf2l+OA0
	Yx1dllp0aWiYADzeTm8cAGo1Rzx4nGyLarHTxlAKG2y+tGKlvTyNmluVaPHqmA5tXy+Jp92mTmR
	PVDtlWu0Yz1d3saAORPqcFTXcZ+9d92VTgXjCbhPDJzJ4QMiABXBWfVnm/2IsIceghDn1PLCZIK
	9n
X-Google-Smtp-Source: AGHT+IHh182S4qNrzpec68cB0pQSx8HaaxuNG0Bm4xeTqtlXZzaRN237QiP3XSyy3bxxeKHYt1bRNA==
X-Received: by 2002:a17:907:168a:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad4f752d0b6mr375090966b.48.1747238116072;
        Wed, 14 May 2025 08:55:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cc449sm950899866b.20.2025.05.14.08.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:55:15 -0700 (PDT)
Message-ID: <203ec9a5-01cc-4d5a-bb47-054d4a7f41a3@suse.com>
Date: Wed, 14 May 2025 17:55:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250514092037.28970-1-roger.pau@citrix.com>
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
In-Reply-To: <20250514092037.28970-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0m6ZejlMWcAxvEGCTIVoj8jX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0m6ZejlMWcAxvEGCTIVoj8jX
Content-Type: multipart/mixed; boundary="------------Xh7Zg4lQ3ytXl0jkpXXQoIrG";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <203ec9a5-01cc-4d5a-bb47-054d4a7f41a3@suse.com>
Subject: Re: [PATCH] xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
References: <20250514092037.28970-1-roger.pau@citrix.com>
In-Reply-To: <20250514092037.28970-1-roger.pau@citrix.com>

--------------Xh7Zg4lQ3ytXl0jkpXXQoIrG
Content-Type: multipart/mixed; boundary="------------rV35Z4Fn70QA3DmRJ7r0OHqR"

--------------rV35Z4Fn70QA3DmRJ7r0OHqR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDUuMjUgMTE6MjAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gUFZIIGRvbTAg
aXMgdXNlbGVzcyB3aXRob3V0IFhFTl9VTlBPUFVMQVRFRF9BTExPQywgYXMgb3RoZXJ3aXNl
IGl0IHdpbGwNCj4gdmVyeSBsaWtlbHkgYmFsbG9vbiBvdXQgYWxsIGRvbTAgbWVtb3J5IHRv
IG1hcCBmb3JlaWduIGFuZCBncmFudCBwYWdlcy4NCj4gDQo+IEVuYWJsZSBpdCBieSBkZWZh
dWx0IGFzIHBhcnQgb2YgeGVuLmNvbmZpZy4gIFRoaXMgYWxzbyByZXF1aXJlcyBlbmFibGlu
Zw0KPiBNRU1PUllfSE9UUkVNT1ZFIGFuZCBaT05FX0RFVklDRS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4N
Cg==
--------------rV35Z4Fn70QA3DmRJ7r0OHqR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rV35Z4Fn70QA3DmRJ7r0OHqR--

--------------Xh7Zg4lQ3ytXl0jkpXXQoIrG--

--------------0m6ZejlMWcAxvEGCTIVoj8jX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgkvOMFAwAAAAAACgkQsN6d1ii/Ey9g
LggAkkh8UL8M1FJdEcLDvHyLfK23UDnyDuZyQXhhAzD1AlK+NrmN7ip8dkQ+Z38nAPa+j3ZrPqfE
hIidDa72iZBdCM/u4o9zdI+CF7U6vlRUjt2Euf1GANxJ1xEvhckKfUDCM8SxmRdm3WcgkcScK+ey
8F/5RiY2S2CREkikeQvIenq8FhOR2i3pGhDsE3I0eyVFVlKthhlA5w8IIJzHkf/70v6YMc/9nINm
JOKLK0Qg2ADNF7aMAA09ZVi+0JApPs6vSI4OZCrxB/q0gz03AmC9xE31MsqiKXYnedHUeGM3djwW
mk7Ce/z4aakxotnZ7REsSe5wtYy3NrOOoLJjbZEGKw==
=376d
-----END PGP SIGNATURE-----

--------------0m6ZejlMWcAxvEGCTIVoj8jX--

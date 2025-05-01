Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBCF1C5F37
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123593; cv=none; b=oMGVevRoetaEyCeZHSV3zGxbLoR/gvRDK3nP084nS4F0yykQyWT/W32D+ihjnEpCqPdMkElvZKMhcFGOwnEMfpK2Xu87v0GJ1qN4b50odSGgWPzfzRhqc2XWhMEa8rKVEnf26A0JBUyPqsUavQYa27F98g2l00sOBVcw/LoJbRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123593; c=relaxed/simple;
	bh=hycH8nOjtWZTLvvT6FLkVd0wbItGhhzZCLbROgjVEtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uqAz3upvmefFt8sdSxgFjIswn86S/l/4u89Fzjg7irsKtTFDCzcA4xZPDe0xMyVYPZLBT4YIM7Yl+sjezwjYZFgt2vviqtHt7+ea3+uUHNRiirmKKTCj+wULuGtD35bqslaTzEo+/qWSLpjRqhT7DgwBuN/+NF90TclVn+w1cnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D6X4nH/N; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D6X4nH/N"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so225214866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746123589; x=1746728389; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hycH8nOjtWZTLvvT6FLkVd0wbItGhhzZCLbROgjVEtw=;
        b=D6X4nH/NoNrZwy3+nPIDoMEkuL0dVqM3Xh+pXOrQscbQL2R2kUETpYZth5iyervfsM
         ZzZasVhCrU/k2zHP+F1y7HSYKu0nN4NSY4fUTAesCaDgCTqMKHt3cJKcZji9UX9Ry32A
         iCju7ie2sYAyHnS9R//VGN8ex6WtDMpPMbdprpgwSTRYkAqrTejGGsIqRrc6o98jLOZj
         BfhHFmjXoNnX90ePSaPGRf59vdFVMCG7ApQckk27q5LpyFVb4Us8zw4xh5wapvSbYYI7
         jq+u/ds2VYlZYDH2iOmNNvoJ57pAopkeRPdjo68loLU5dgiEsXSu2TWc/KZ6DAk5l0aH
         DLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123589; x=1746728389;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hycH8nOjtWZTLvvT6FLkVd0wbItGhhzZCLbROgjVEtw=;
        b=OwySEQVSK+NBYO81DXdA8rGC0WD/zFZLpggtuo9H7G1xpHSRQCCYCDC7XeCxVmxqQc
         vN8st5ruCZ2N+VfuVMIbuOvLg7hHKbrtp7CsFicS/WBsifNADlt9ImeeHlNuH2CqzK/g
         rF4+aIwqEZaLSCDzHMht3dz44o2lgkHM7ekFQTs+S+PmGaul9cF+nOHF/qLPfD+yv7Lb
         WebG8HVdDE72kBE4mYlkXslOcMfKWu1DIBT2ctPtpnNHoNuny4lj0sroqrxzuLqVO+f4
         XzL52aS0INFDkrl7VP2IBBnLO5c3yUs/i1UCmoqk1CJst3PnSWMYgUmMK36RlYpnIGXm
         qB5g==
X-Forwarded-Encrypted: i=1; AJvYcCVZLTv4LAL6Fbd9DTAK4wqKxV9TPbmQxG0zmxMhJQXPbwbjXygVX7+iC1Aq1E3ZWAfZPg8pndh5DRTnyuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHo1p4m/v/0aLfmU56rMo5WSXRKZLBb3zXb5S5uCAJAmu/gOFZ
	sLjfAixCQIrX1kN7BnJCP8I79VkPErJqV/ilEs9b5UAV9jQv8FjkS/I4zYLkUjM=
X-Gm-Gg: ASbGnctHOccBFVswyKAZ4kw7XiM6Et3aWweOyc8cJae42BYhfPd/54/EftTqprj2i4g
	Zhd6ZouDZw66s6aQGC4pr+tnLOrL72BRbA45NgOaY9anbYTNwJ0daNXtAleT4oVSK3xNZYvNDjS
	OEmDs3OlCoVpqfv3BQwqeqw3/1vPTNBN3LXzXAhLM9yFejcEgcqhvBaHpkOFWs6fNnoRwpvLsQb
	xNsJTIxUsYWC72r00OCvc/Rg+ED0Ckdygkcpo+wv0ZisUQz5sF+E2ehOlmOMAz+JT/w4+0SGSq3
	y0hbN5fQspuzKMd+I3JmlPjNnvv4RAy9/sE2xzc7wcZQngKmDFKQqH2jg5pcMYcDC2hDRYx4Ndg
	rXCQsMurQqByHI9Gm0thM2+jH2lfCHldPHYUtIHwsfGvsfr3wqLztCz6+gqw88nP0kQ==
X-Google-Smtp-Source: AGHT+IFT/GGxVj5LsyYhpFH/Jy9txkqGKBcfpkrOsbRqhzFHXZEFsF3GmQd3SL/kucSaPoQZqM2ToQ==
X-Received: by 2002:a17:907:6e8a:b0:ac2:dc00:b34d with SMTP id a640c23a62f3a-ad17b865625mr10280166b.53.1746123588555;
        Thu, 01 May 2025 11:19:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef? (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de. [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da57c2d7sm74928566b.174.2025.05.01.11.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 11:19:48 -0700 (PDT)
Message-ID: <917da057-adfd-4002-ad2b-f2a6ac3a00ee@suse.com>
Date: Thu, 1 May 2025 20:19:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2022-49816: xen/pcpu: fix possible memory leak in
 register_pcpu()
To: cve@kernel.org, linux-kernel@vger.kernel.org
References: <2025050131-CVE-2022-49816-0190@gregkh>
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
In-Reply-To: <2025050131-CVE-2022-49816-0190@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NZuB9CH4O2rWkH59FuiZojXF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NZuB9CH4O2rWkH59FuiZojXF
Content-Type: multipart/mixed; boundary="------------1UjKpuYbZgY0QdwL89Gd7zc6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <917da057-adfd-4002-ad2b-f2a6ac3a00ee@suse.com>
Subject: Re: CVE-2022-49816: xen/pcpu: fix possible memory leak in
 register_pcpu()
References: <2025050131-CVE-2022-49816-0190@gregkh>
In-Reply-To: <2025050131-CVE-2022-49816-0190@gregkh>

--------------1UjKpuYbZgY0QdwL89Gd7zc6
Content-Type: multipart/mixed; boundary="------------0FDn5BLm6pA9PWmFS8GstAl7"

--------------0FDn5BLm6pA9PWmFS8GstAl7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDUuMjUgMTY6MTAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gRnJvbTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAa2VybmVsLm9yZz4NCj4gDQo+IERlc2NyaXB0
aW9uDQo+ID09PT09PT09PT09DQo+IA0KPiBJbiB0aGUgTGludXgga2VybmVsLCB0aGUgZm9s
bG93aW5nIHZ1bG5lcmFiaWxpdHkgaGFzIGJlZW4gcmVzb2x2ZWQ6DQo+IA0KPiB4ZW4vcGNw
dTogZml4IHBvc3NpYmxlIG1lbW9yeSBsZWFrIGluIHJlZ2lzdGVyX3BjcHUoKQ0KPiANCj4g
SW4gZGV2aWNlX2FkZCgpLCBkZXZfc2V0X25hbWUoKSBpcyBjYWxsZWQgdG8gYWxsb2NhdGUg
bmFtZSwgaWYgaXQgcmV0dXJucw0KPiBlcnJvciwgdGhlIG5hbWUgbmVlZCBiZSBmcmVlZC4g
QXMgY29tbWVudCBvZiBkZXZpY2VfcmVnaXN0ZXIoKSBzYXlzLCBpdA0KPiBzaG91bGQgdXNl
IHB1dF9kZXZpY2UoKSB0byBnaXZlIHVwIHRoZSByZWZlcmVuY2UgaW4gdGhlIGVycm9yIHBh
dGguIFNvIGZpeA0KPiB0aGlzIGJ5IGNhbGxpbmcgcHV0X2RldmljZSgpLCB0aGVuIHRoZSBu
YW1lIGNhbiBiZSBmcmVlZCBpbiBrb2JqZWN0X2NsZWFudXAoKS4NCj4gDQo+IFRoZSBMaW51
eCBrZXJuZWwgQ1ZFIHRlYW0gaGFzIGFzc2lnbmVkIENWRS0yMDIyLTQ5ODE2IHRvIHRoaXMg
aXNzdWUuDQoNClBsZWFzZSByZXZva2UgdGhpcyBDVkUuDQoNClRoZSBpc3N1ZSBjYW4gaW4g
bm8gd2F5IGJlIHRyaWdnZXJlZCBieSBhbiB1bnByaXZpbGVnZWQgdXNlci4NCg0KVGhlIG1l
bW9yeSBsZWFrIGNvdWxkIGhhcHBlbiBvbmx5IGVpdGhlciBkdXJpbmcgYm9vdCBvZiBkb20w
LCBvciB3aGVuDQpob3RwbHVnZ2luZyBhIHBoeXNpY2FsIENQVSB0byBhIFhlbiBzZXJ2ZXIu
DQoNCg0KSnVlcmdlbg0K
--------------0FDn5BLm6pA9PWmFS8GstAl7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0FDn5BLm6pA9PWmFS8GstAl7--

--------------1UjKpuYbZgY0QdwL89Gd7zc6--

--------------NZuB9CH4O2rWkH59FuiZojXF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgTu0MFAwAAAAAACgkQsN6d1ii/Ey9W
pQf/YlfUQQZnXmQo1vumeUoNdI8Yi74AoZ3X1fDTdmpYnnmOjk/zxyBoNPC1yH2KjvZbI/+yqC/U
b7qXnKuby9mR5OXemiTFAwuemdBteyTFoGR9aGjPJ+00TUbL7nlTvHitNgviqUSxGulPmXqUoLnd
FAlt107vW3DsAcdqJe+u6WAvr4MMSs3870r0oktpX9UOyAfhrWMLr0ORAW695uOdPTnQOgJWQGZr
TzQFdK0rry1BYp1Rn4inka/i1KXoTVyppgLdzX1v72BXQRP7bHizxvZ+hxMzbjBvWyfzP7AEO1e4
8kwTU4xXyEL/gp/b3Xc9f2zre9dtdv6V8Eru31lr6A==
=L7a8
-----END PGP SIGNATURE-----

--------------NZuB9CH4O2rWkH59FuiZojXF--

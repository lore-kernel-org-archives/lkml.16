Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FAA1D54F7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413014; cv=none; b=Dqkx/DXD49hgemMb5x/otwbN2hHHn4GAkllatXSJFtIWo7peNvWBwfQiAxAJlA6wjfYHYK0IAQk6NiVw+TYwdFkgW+tyyxo62H77crOp5d5svUAogUqyxpBKzmie1RARbO6tcOZtiF5/LGI8JSpexpbc9BKWcfjNB97ggiCwUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413014; c=relaxed/simple;
	bh=Wu2XdBLUTD/JkCBRH0B2g43bjtpoBodRhTuNrAEojDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUmAfYvagZr+cmBzAY30g3JGMeTlM6aBB2Ya27DyjkIBNKnxPBKZZMnzMpytsXpslFoG2WRpa45on+Z4th2cbD03sw+oO/jsGV/iGXKfDAvmmysKJIVWMN1UTsiomORykin8YJQLZSJikyI6XpD4rZst+iLNSwim+/3k4eVcPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NzKNxx93; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NzKNxx93"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad891bb0957so295017366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750413010; x=1751017810; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wu2XdBLUTD/JkCBRH0B2g43bjtpoBodRhTuNrAEojDs=;
        b=NzKNxx933CTWdBaZ9IwC8o5qwEKJsrcM2QAp8JCZ/tN0Zn4AT4OJwYPqjK3CTwDpjr
         KcWDH2I5VnjtB00N06Fe6+pQLo+91YblLpja2p1TZZOrX9LRTB/lOKTr5mDkdxZeIxsg
         LFzh0E2Axsv4+5xCJbQwdyP2x+6A2yEVlf9envE4toXL3cwlGradSJb7szsNhkYrDzcR
         3ihhIbFlVAAVLIb0cFLgDnjN7MnjDHCbHl2g9+6ziK47muQNq1nePhmQPXiSoDGu3BhL
         rYE8Lw3lzMDiSxOjJae4NZtny2bJUxLh6mUlpj9GUxQBdi6U7G78uAXCFeylhFxKbvMO
         UIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413010; x=1751017810;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wu2XdBLUTD/JkCBRH0B2g43bjtpoBodRhTuNrAEojDs=;
        b=WG1yfFuhLQIL55Bj9JIEIcDWvMHCx4rGa9klcRwpRle2EL0uuqYDIF8ceBUGWGVuDW
         +Hf+lEf9LiKCvJ8LVd1FmEOmCLb1jjrSBhkyT/QV0lI3bDaeVcfw1LIev5zqZkbZMob5
         XxYftxevqsAPV1cTNat4VZbAPwehTK5yHRufMochr6veAEhS4238Hwd6gyFcmkiZ8b+D
         3bS5UjpYIjSuMvOX8CWz1Qx8WYH/l9DSfeVcl5quGiT9jMvFbeHGP9pRAGdh/BTyvApD
         mdBtxXTJOpGjqpap+oyurrEKc4l5PFbER0qFLPP672Gs4ZhnyhlK28epEvpBSuguqws7
         YX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMKuOwTyFuHbrbRVTxCaUsJe2eTNwTDRqVk6oGEjU0nNGUlonWf+5ZsrjlP7Lai8ALBGre2/JomlPMY08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7Gdr+9ik/eDWKZgDke2nL4AQIYeYzdlQLIVTyAW8GxREw4II
	vdbfVmmSBmDsP1N4HpCtOU92ZmdZUrBqnFXLjixJR7kFcWyfVnjzKcbMXvRXrS8mt9g=
X-Gm-Gg: ASbGnctIgsc5fR9rnuvLelO5MfHyQwMVebmP3eBwu6IQsDqudbX7LYsaTdr7Uf9E4Tj
	CNs2ZxvzzWYLY97StXPyFO5SEq55IwNKI11IjYazrUMg9jAmuqTpaM6rm5EMp46sfLuTE9TGcMg
	RdNV29tS2+eOsANlK6o/0KqAFBdhPLYUf3FkoX7+FnXoIZONzl7Spm5yn/VrB6M7tN8fpgbwGpv
	AEk0qqFUbOVVzUXjcJTzew3MsrnzM93+eulVIwSJ8I9eIAqWnXSF1MBv47jAl+Idn7pLY1iAeVG
	agYSRTkFJwntZ4czfkfQm7PTg2WRXblAcTIP/2YoVOKZLoRtIIKsQzAeo/NawD051Ic10uwGtTd
	8itcZYL53Gi2YmSuQPPfLZ3lhVgcZlDSe7qJIvOrQVLDRoaGu3MSvlMJ8Ozv8T0PX8v+nvnFCuz
	tgOWjpWZkYTFg=
X-Google-Smtp-Source: AGHT+IE6QNgq8N9m77mGWq1gslHyy5HrK0GB1Ws3zGc0uZ4W4vHoZEm0zIfPwbc6t8mh1lUzVD5LqQ==
X-Received: by 2002:a17:906:6a1a:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-ae057c0d793mr190191466b.47.1750413009954;
        Fri, 20 Jun 2025 02:50:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05420a5fasm134077666b.181.2025.06.20.02.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:50:09 -0700 (PDT)
Message-ID: <62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com>
Date: Fri, 20 Jun 2025 11:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/xenbus: fix W=1 build warning in
 xenbus_va_dev_error function
To: jiang.peng9@zte.com.cn
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
References: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
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
In-Reply-To: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NtA1j85D0sd5rJotB6iLDmbT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NtA1j85D0sd5rJotB6iLDmbT
Content-Type: multipart/mixed; boundary="------------kdp5ScXAbPSzFIR8UvMpL0pR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: jiang.peng9@zte.com.cn
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
Message-ID: <62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com>
Subject: Re: [PATCH v2] xen/xenbus: fix W=1 build warning in
 xenbus_va_dev_error function
References: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
In-Reply-To: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>

--------------kdp5ScXAbPSzFIR8UvMpL0pR
Content-Type: multipart/mixed; boundary="------------c3s8ua8KPaJdFvjCgEcsQum8"

--------------c3s8ua8KPaJdFvjCgEcsQum8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjUgMDI6NDEsIGppYW5nLnBlbmc5QHp0ZS5jb20uY24gd3JvdGU6DQo+IEZy
b206IFBlbmcgSmlhbmcgPGppYW5nLnBlbmc5QHp0ZS5jb20uY24+DQo+IA0KPiBUaGlzIHBh
dGNoIGZpeGVzIGEgVz0xIGZvcm1hdC1zdHJpbmcgd2FybmluZyByZXBvcnRlZCBieSBHQ0Mg
MTIuMy4wDQo+IGJ5IGFubm90YXRpbmcgeGVuYnVzX3N3aXRjaF9mYXRhbCgpIGFuZCB4ZW5i
dXNfdmFfZGV2X2Vycm9yKCkNCj4gd2l0aCB0aGUgX19wcmludGYgYXR0cmlidXRlLiBUaGUg
YXR0cmlidXRlIGVuYWJsZXMgY29tcGlsZS10aW1lDQo+IHZhbGlkYXRpb24gb2YgcHJpbnRm
LXN0eWxlIGZvcm1hdCBzdHJpbmdzIGluIHRoZXNlIGZ1bmN0aW9ucy4NCj4gDQo+IFRoZSBv
cmlnaW5hbCB3YXJuaW5nIHRyYWNlOg0KPiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Ns
aWVudC5jOjMwNDo5OiB3YXJuaW5nOiBmdW5jdGlvbiAneGVuYnVzX3ZhX2Rldl9lcnJvcicg
bWlnaHQgYmUNCj4gYSBjYW5kaWRhdGUgZm9yICdnbnVfcHJpbnRmJyBmb3JtYXQgYXR0cmli
dXRlIFstV3N1Z2dlc3QtYXR0cmlidXRlPWZvcm1hdF0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFBlbmcgSmlhbmcgPGppYW5nLnBlbmc5QHp0ZS5jb20uY24+DQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQpQUzogTmV4
dCB0aW1lIHBsZWFzZSBkb24ndCBzZW5kIGFub3RoZXIgdmVyc2lvbiBvZiBhIHBhdGNoIGFz
IGEgcmVwbHksDQogICAgIGJ1dCBhcyBhIG5ldyBlbWFpbCB0aHJlYWQuDQo=
--------------c3s8ua8KPaJdFvjCgEcsQum8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------c3s8ua8KPaJdFvjCgEcsQum8--

--------------kdp5ScXAbPSzFIR8UvMpL0pR--

--------------NtA1j85D0sd5rJotB6iLDmbT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhVLtAFAwAAAAAACgkQsN6d1ii/Ey+m
Pwf+PgPfDUz9sPAG3hxG59OF6zm7TCAsLq/a2lQ6ShXfeqzPjSH7dZOm51VYCkVQKWGwSLCaVI0t
cXqIRRVob/0zQn+jIu4irFcRuwRTl4UJZwy/EZ2vcVr8GuJimL/DtEXwCDvkVQm/9mA4PhGBApJB
9zIxZ+Efmvz1f2v3EjfFhAXd8b5Hf2ihy05HneYT9yOEhOgyU4d/rBFuxwOKQi3rW1SHnIMaXpYy
VSmKHDBwM1/S4BmO0pdg4XXGj19M0cNAkinONkHcS38vWxUEnmj745ebXGZen0zhWSFutrVeKw3o
IGbHDMye78JRKcp22J+Du2HyDMii+4UKW+AiOW+MGQ==
=KDQS
-----END PGP SIGNATURE-----

--------------NtA1j85D0sd5rJotB6iLDmbT--

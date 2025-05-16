Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF11923D2AC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399443; cv=none; b=VEfaw7Vrqu0C95ThNIopn9E3s4gYFRES6zEtsSHRSdicROKDvmt37nkcDhCDIFCH/4kiFZYCI9RrKrUhpV3wrX3sP5bDzi4Qvhdqmui9n410NChFWJSaIbdV4SKMeoutTOI2n3RSCoGK1lj+ecmDah68iJ0NhU+AKQlFoA8SQMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399443; c=relaxed/simple;
	bh=wHpTo0+tOOdeIjJWi2iz5WOwxz0N86UHcp8BE0mY/9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtOr/47g8bqITT1DfYbW8yK0Vsp/7q/to4g6wYiict56qG6ZKDqtbFAeSJQ/c9RabMh2UFkM9YTbLAo2Da9nwrCHD+UIFH3k3FZm736u3ur6AMm1U8IGBeBIFpxEwrgFUG/IM47vgZ0DGFnh6q7kAcgsoGTSneQykQDxyiQc2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ReYIP5YC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ReYIP5YC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so15826125e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747399439; x=1748004239; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wHpTo0+tOOdeIjJWi2iz5WOwxz0N86UHcp8BE0mY/9M=;
        b=ReYIP5YCP+CjJ9sNSsPbQLAU8WvlVM4pBJmCEWujavm4yV95Q4z4GsVlp8gJIaT9zv
         JhKGOkgucc1Z55D372LU0PuAqIfu9bFVC47WTJwa7X4/rfc5tbSATZGKN6b8kEufSUxK
         lmJz3F+5FGgCBX0PVj6ALfe4bazhhk7DXvjrTraFSYZYq6AZOmiF47FlnqPCgEYJDfh6
         i0VL7mNQqfwNdV6H5Zm/rSFsYNaR3B2YbaoCNzl0dtAqCklP4EzAp26ndC29IGGv3Wdt
         pKDuYbzNd1X+n7ulS6vxyQv/qn3BHoe4/kqaf3ALbru87CnkJGcT09MY1K9mwFVUb8aN
         AmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399439; x=1748004239;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHpTo0+tOOdeIjJWi2iz5WOwxz0N86UHcp8BE0mY/9M=;
        b=DkhZWE8BdPpJ5EY2eq0Za9nyXZwuyonhHsiL4Dd0xKUxriBpGYk14o7ARHhke5mJ4z
         UX3T2qeD+EfX+YTYMmM41ZinmAHxXqN/CIwNd/heF8hUKbnqW6j3lYGO4WzAUSBi0Au/
         Wh04iN6S+3BJfWPPJZH1Bnhwhev9xX9JXJJ/i78aR40qrjzvN2F4a9trDOTEUKwtOu2I
         xXFL1AIITm1lpItOZA6iH/hN6k7nxQ6NEsPrE+Ry2skICresZSN/Si+HD0UB8u1Ym0sX
         cxFKn7c4/uy/KG1J6EeQUsi4917ZtzojQhG3AgqiXBGLQ/RLysadit8hU97DAYHSQaaQ
         Bs6A==
X-Forwarded-Encrypted: i=1; AJvYcCVk2fy0GDrMgFtaGfJmFa9aG5wYrnYdg+x0zMQMD112bdh4/OFfVrWXJDtJqtq2z5SBYGoswE23DXii+ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJ02KRsFBBJY8Q43Vq5kJgQMTyuREmPhiMWpo9zyFBT3aUwQY
	2UpL00T6LPHx7XgcXBvtOCFkGpww1D/gzTazKjVt8hvw6gFIw0QOEf3WC1pGjnJ1jo8=
X-Gm-Gg: ASbGncuf0blCnfXfmh6Z7S9klpSg67aYXBl/x3YHyWCMEoJgmfwO554oHZmvptMdNSt
	6Jqs/uQuvJGzMSDyaLjyDuvM1CqaxsTv2Edzvw5OsmfyOnyJP6c3PYXpROL6Ug4uVLigZAmBe/C
	q+85FwcdUEnQLAXAz37T2RgtLciW1aAgloLR3QxMUw5tiyc4uM6gVGKxYZVCypgb7tfJXzAa8jb
	aztEJctB0e6lwCpN0bcrBJo2QZcDkLP/3GcQsLtZuENuARJ3+ywyxUiW1euTErQMnNWPnXcHlgq
	o4r5tSMlsU4yTPstjJAQ2dKNh3EsiB9p6Pm4aEz87BcEgmDFt42qc6+qBe58Oer89DweFjJk5oU
	5WlhV7N8yOoeLjjuH4AHPpqubdqSLgbDJ4BRC7AuJ/BbC94g9ygUrrKQo63QlrpYSyrLmW+5dPP
	DN
X-Google-Smtp-Source: AGHT+IEMx2rKeXHRSwncbvfN2lmNXuPA3SzyKDAWFZ5mS7vnSOQ0umojgm1MTb4MIyuUTfPB8wY3Gw==
X-Received: by 2002:a05:600c:a014:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-442fd66f08emr33757945e9.24.1747399439134;
        Fri, 16 May 2025 05:43:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdc19sm32694835e9.5.2025.05.16.05.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:43:58 -0700 (PDT)
Message-ID: <b208fa08-a028-4bc8-a455-b37aa016cfb8@suse.com>
Date: Fri, 16 May 2025 14:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 4/4] x86/paravirt: Restrict PARAVIRT_XXL to 64-bit only
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Michael Roth <michael.roth@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Sandipan Das <sandipan.das@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org, linux-mm@kvack.org
References: <20250516123306.3812286-1-kirill.shutemov@linux.intel.com>
 <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>
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
In-Reply-To: <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Te3kJ0f9tyKynZeXJ78zBYfl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Te3kJ0f9tyKynZeXJ78zBYfl
Content-Type: multipart/mixed; boundary="------------UGAGx2sCcO3HYQB1B9io4MeE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Michael Roth <michael.roth@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Sandipan Das <sandipan.das@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org, linux-mm@kvack.org
Message-ID: <b208fa08-a028-4bc8-a455-b37aa016cfb8@suse.com>
Subject: Re: [PATCHv3 4/4] x86/paravirt: Restrict PARAVIRT_XXL to 64-bit only
References: <20250516123306.3812286-1-kirill.shutemov@linux.intel.com>
 <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>

--------------UGAGx2sCcO3HYQB1B9io4MeE
Content-Type: multipart/mixed; boundary="------------dCI97no869vba6acO80MKIME"

--------------dCI97no869vba6acO80MKIME
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDUuMjUgMTQ6MzMsIEtpcmlsbCBBLiBTaHV0ZW1vdiB3cm90ZToNCj4gUEFSQVZJ
UlRfWFhMIGlzIGV4Y2x1c2l2ZWx5IHV0aWxpemVkIGJ5IFhFTl9QViwgd2hpY2ggaXMgb25s
eSBjb21wYXRpYmxlDQo+IHdpdGggNjQtYml0IG1hY2hpbmVzLg0KPiANCj4gQ2xlYXJseSBk
ZXNpZ25hdGUgUEFSQVZJUlRfWFhMIGFzIDY0LWJpdCBvbmx5IGFuZCByZW1vdmUgaWZkZWZz
IHRvDQo+IHN1cHBvcnQgQ09ORklHX1BHVEFCTEVfTEVWRUxTIDwgNS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4Lmlu
dGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------dCI97no869vba6acO80MKIME
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dCI97no869vba6acO80MKIME--

--------------UGAGx2sCcO3HYQB1B9io4MeE--

--------------Te3kJ0f9tyKynZeXJ78zBYfl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgnMw0FAwAAAAAACgkQsN6d1ii/Ey/1
Rgf8Dfw9klieTIfSSxXhZ1fVOqPJSPIKODfsEQ7IKY2hhyk5t1WheTcM8/Nzl7OV4xfjjTJZFgIe
NCqY+CZConnWHRwESBtO+j2N72GxDh4odoF1so9fiMFxUaMBTUBoLUf8h5Zbj4tV5Vk/GEyNldVF
/aNmC136448wQGaxuPMRLf2TcEwBzJK8ak1t/qCWToMv/hUNC3EKgIyWbpDIM82R4SKDv9PO94/F
aBvBZuVQYM/O5kCJlbBneAV5ihh7u5t0gtFBZZFUV1eyZ1h/KdzKK1HVD+Y2jFLggMfsVPastexG
xD6Q8yWfMbMpfefU6ZZdoL0pRHWGJgpqauows+mecw==
=Gnh1
-----END PGP SIGNATURE-----

--------------Te3kJ0f9tyKynZeXJ78zBYfl--

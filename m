Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68223322A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421605; cv=none; b=PjovdYjuKjxS8j5636nJKCf/Iph/2/xiwKKrWDjRwwKSixTNqqSMo+OkRJmA0eNbE8s6IBMLfRWUF9IwqxK8sCusJCJO7qSWHFfqCILWrJzwfiSKxxyTD0SGhAR0tS2jJ5VwtdtuaX/bJo9WG9tMaGsYiiRSAjyujAf3Abf7IYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421605; c=relaxed/simple;
	bh=7wptbdNgKSJJV6qPKilbbkbtlz1dsIL6cphrC3hoX6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMYmMJysaCsrWn8xSdZHDrNS60CfkKLsA5/sOLb+bW8Q7q9WfKjC64eEf7PZopLyUzVfQtBJPSdCBBizJEyk8/muNeHG9ACeQF3fhUcCxNEIgb4rgBJsMoiF5WgLe1Atsi1zjIH+vlPIM7fhfKfw1/W/Q1IN/TpFACFqy2QDj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dBo3rgO1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dBo3rgO1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so54794205e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748421602; x=1749026402; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7wptbdNgKSJJV6qPKilbbkbtlz1dsIL6cphrC3hoX6s=;
        b=dBo3rgO1o5Cqw3zwC2EdHoxN/F9tiGIH5ZTwLnPKvcSTuFebE454tQXvPCVs199uIL
         yBEs3eIFdDiSx5f2F1EK7Pwrh+bMecJjtLvUkKNmjE3HVMwwo4ft5jNO/RZTNCO0U1/w
         3vgOWXTrFs62npuKlDTJx4sTkZnRtepeyipepCZXYrFWjCtS2q8hSk1XQYTNe6/HBtML
         F6gVUzptWsKEAE1Xj10w1/mXGd3wmCSCGKd2tt346qWnPt1xV9Q4juQkRCheF3U/Yy/h
         FOlu95jLy80Kw/0rLFphIrzV7F4yfA7uMV2E16Puxi/FayU32q/lWErkCpmVMbPw3RZg
         wXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748421602; x=1749026402;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7wptbdNgKSJJV6qPKilbbkbtlz1dsIL6cphrC3hoX6s=;
        b=Oj7dw3NsAESgjKEYaTMSvCypKFZtt3OHF2zPn7Y92C4xeDB0dTRhG1e5SomnJLsvIF
         arhi7hkifVALvK1JwU8qfmYKCI1ltmK1RUOVozDMzgyqoaeE/SWQK4ZvTyveJSlzRWAD
         qFJbz9wOzO/QCUlYrZID6JinQ/JNkpwlTL/oYPfCCnETRTCEZi75buicbfAopm9YEtHG
         3oP+8+Cg3WDz/dMhOl/JKFEFPmsQkbq/ae3bF/0YgcP0g7uqY9fG1OhYpJ5pzqsL0it2
         f5xPYXe5WeBePhL/UyO2zWu7M7CV7thu/Y/nqMQrNAcay+Qj93yzp8JwUJR258gExB2Y
         xWTg==
X-Forwarded-Encrypted: i=1; AJvYcCXu9xQ9xrWNt3tj9K+iu2DkjzmyNHKwjzLxgLhDcdtGkftEtiWGppoh7B+OIncHLY7Gc4DAVWdOp/lhYEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywha1FPWJeK+BdNKsWLt0Fd1zIrWl8WnzQ2S+wUFXupNLX0KcI9
	ukwLbcT/mZ5XCuqRVNB10ihHFd56Ni/bkf4puDo4DcFDw2ujc+crWczTc18oW761fDk=
X-Gm-Gg: ASbGncu9MLkk5MNiu45y34JU9FdwxeGNmmncO7BMGLfscI2wW4HgXv+rdN6Mdj4ys8X
	CwsNnBMiv/lAcsLuIq6a7jWxq1lt1NYrww/73y7zv8BhkyyHBiK3+Bfcg59D3+/kie0E3PgX88N
	cL8/YDauHutnm1ikowIP/oqTZkng2dEjaJEhsDQAhhXIxBSV/sgYmKA+fliX4xHFyarIt1C8tzt
	IoLdhaH4TT0lIJJr6aKFUeu9NDnMterAFkQlBV0Qs+Vx0y3SQ/7sFk53CqYQCj6s4JeYLh810VA
	+WUKYXpl9MDtKQtYhHqCBMlxoxHgWWRUXTPGYkbylVWQ7fu7y1WflhOYa0mRtgnnBp7aPAk5Gd5
	6l+HMIf8Ku4pTgZ7r93M39XSxb29b87CjlK8vgZdr52KC68l39hs05chQGX9RcUgwKi5MfhO3U6
	TwysoeideYbZ4=
X-Google-Smtp-Source: AGHT+IG3Kj8Ha4jt75w0EyyPy6wWEW61ufzy8NCxUv1sGhrOVd3vIEo+p9dkq0Vic8uHLEoP1aZhRg==
X-Received: by 2002:a05:6000:3101:b0:3a4:d2b6:3121 with SMTP id ffacd0b85a97d-3a4d2b63319mr10109883f8f.32.1748421601586;
        Wed, 28 May 2025 01:40:01 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eace3260sm844580f8f.90.2025.05.28.01.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 01:40:01 -0700 (PDT)
Message-ID: <d94b8659-3392-478c-b9fa-bc951a687195@suse.com>
Date: Wed, 28 May 2025 10:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: Xin Li <xin@zytor.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Cooper Andrew <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
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
In-Reply-To: <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ESmoc9CzFBHMfOhHmQeouObk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ESmoc9CzFBHMfOhHmQeouObk
Content-Type: multipart/mixed; boundary="------------wBRzd9vtDDIuCNCUCXaQnaoM";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Cooper Andrew <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
Message-ID: <d94b8659-3392-478c-b9fa-bc951a687195@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
In-Reply-To: <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>

--------------wBRzd9vtDDIuCNCUCXaQnaoM
Content-Type: multipart/mixed; boundary="------------e6my0r2mALzHnFJtqxfoVhkn"

--------------e6my0r2mALzHnFJtqxfoVhkn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDUuMjUgMjE6MjEsIFhpbiBMaSB3cm90ZToNCj4gDQo+PiBPbiBNYXkgMjcsIDIw
MjUsIGF0IDExOjM24oCvQU0sIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4g77u/T24gMjcuMDUuMjUgMTk6NTQsIFhpbiBMaSB3cm90ZToNCj4+PiBP
biA1LzI3LzIwMjUgMTA6NDYgQU0sIFBhd2FuIEd1cHRhIHdyb3RlOg0KPj4+Pj4gQXR0YWNo
ZWQgaXMgdGhlIHNlcmlhbCBjb25zb2xlIGxvZyBhbmQgbXkga2VybmVsIGNvbmZpZy4NCj4+
Pj4gU2VyaWFsIGxvZ3MgYXJlbid0IHRlbGxpbmcgbXVjaC4gSSBkbyBub3QgaGF2ZSBhIFhl
biBzZXR1cCB0byB0ZXN0LCB3aXRob3V0DQo+Pj4+IFhlbiB0aGUgY29uZmlnIHRoYXQgeW91
IHByb3ZpZGVkIGlzIGJvb3RpbmcgYSBLVk0gZ3Vlc3QganVzdCBmaW5lLg0KPj4+IFllYWgs
IGFzIEkgcmVwbGllZCB0byBKdWVyZ2VuLCB0aGUgc2FtZSBrZXJuZWwgYmluYXJ5IGJvb3Rz
IGZpbmUgYXMNCj4+PiAibmF0aXZlIi4NCj4+PiBVbmZvcnR1bmF0ZWx5IHdoZW4gYm9vdGlu
ZyBhcyBkb20wIG9uIFhlbiwgaXQga2VlcHMgcmVib290aW5nIHcvbw0KPj4+IGhlbHBmdWwg
bG9nLg0KPj4NCj4+IFdoYXQgYWJvdXQgYm9vdGluZyBYZW4gb24gYmFyZSBtZXRhbCwgaS5l
LiBubyBLVk0gYmVpbmcgaW52b2x2ZWQ/DQo+IA0KPiBUaGUgc2FtZSBleGFjdCBwcm9ibGVt
IGhhcHBlbnMgb24gSW50ZWwgU2ltaWNzLiAgQW5kIEkgZ290IHRvIHNlZSBpdOKAmXMgYSBO
WCBwYWdlIGZhdWx0IGluIGRvbTAga2VybmVsIGR1cmluZyBhcHBseSBhbHRlcm5hdGl2ZXMu
DQoNCkRvIHlvdSBoYXZlIGEgYmFja3RyYWNlPw0KDQpIaXR0aW5nIGEgTlggcGFnZSBmYXVs
dCBkdXJpbmcgYXBwbHlpbmcgYWx0ZXJuYXRpdmVzIHNvdW5kcyBsaWtlIGNhbGxpbmcNCmlu
dG8gYSBqdXN0IGFsbG9jYXRlZCB0aHVuayB3aGljaCBoYXNuJ3QgYmVlbiBzZXQgdG8gUk9Y
IGFnYWluLg0KDQoNCkp1ZXJnZW4NCg==
--------------e6my0r2mALzHnFJtqxfoVhkn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------e6my0r2mALzHnFJtqxfoVhkn--

--------------wBRzd9vtDDIuCNCUCXaQnaoM--

--------------ESmoc9CzFBHMfOhHmQeouObk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg2y+AFAwAAAAAACgkQsN6d1ii/Ey8R
Zwf/WpN9ZZeV2c6qLPPJWztZeaS8FQKMHFdCZSsuHznefSmj3sgzZPcEmadIaw/P7CjaV9mUjLwh
TuH/OCAvX4lctSq6SXG3/5XsvoQe+ifHKuIqP2qfGSIBmkRo1AA9YKFSY9jXRKW9pPSHu1sYrLo7
kAtvw//J7YG4pGCR7ulbunzogBqniWD9q2Mr/PCwewlJJFCQT1NyzHvaNv1j1BNFLZRUlb/qyNgO
PLdF8d9oYdmYo3A4DHpMPNKwtVdbYQRMNiksguxspfKHWXGB8aVf505Y/1vYJymTqruQfOGkDg1o
Uh0iUh0t93sGnFJiJLOaDzZBeAKRyx7/ickFIz/wkg==
=LOUE
-----END PGP SIGNATURE-----

--------------ESmoc9CzFBHMfOhHmQeouObk--

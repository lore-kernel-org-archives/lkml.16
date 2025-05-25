Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385CA1548C
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748210422; cv=none; b=DOJabbHGx6GZMT3Qw+c7c/K1bEhFdgJ2mJbchs1BZ8FQSxhOpbsA5mDg7SfFDaHfopi9sKFckDpr51MhUaDmv4bSauJiAUskehdYKKbwiQo6GiePaUtMfLyXpNChUszXbpInViSbXXJ5L/r0ijYUxOevxOLz6ej9Sa2cm5jkzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748210422; c=relaxed/simple;
	bh=m/3D64u+Y6ojrM8R9pygglNj/ivUDcx/LFnlc4U5D+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enhoTF7v0G7IbVFNBMeZAUGwvEC4K0FwwC62Eyhyc/UAtxf+ehizL0eiqvIzMQjk3j3R8K84gFS+vvMlxqxRnTEVmRfoLOLCHtWOkldJdBmEOYJZkXsWWDgqO8vamooRvdVgkHRAJPUJAgGMa3ewZKE6imvYWBRguVTpFXyuSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=S8vhnmRL; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="S8vhnmRL"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 1DD8C17FF61
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:00:09 +0200 (CEST)
Received: (qmail 14458 invoked by uid 988); 25 May 2025 22:00:08 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 26 May 2025 00:00:07 +0200
Message-ID: <fccf1dc8-de53-4bb0-9adb-61c2c3a5f569@yshyn.com>
Date: Mon, 26 May 2025 00:00:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] scripts/gdb: Use d_shortname instead of d_iname
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250525213709.878287-2-illia@yshyn.com>
 <20250525214159.GV2023217@ZenIV>
Content-Language: en-US, de-DE
From: Illia Ostapyshyn <illia@yshyn.com>
Autocrypt: addr=illia@yshyn.com; keydata=
 xjMEYz1D0hYJKwYBBAHaRw8BAQdAkEJ4MRf4CNKWqtPb0AJAUCRvYAlFUieRCk/qaNH9E3PN
 IklsbGlhIE9zdGFweXNoeW4gPGlsbGlhQHlzaHluLmNvbT7CnAQTFgoARAIbAwUJCWYBgAUL
 CQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBNiFtvEJJXdNrRIjp5VQz7ooL4OuBQJnOKP5
 AhkBAAoJEJVQz7ooL4Ou/W8BAPtqkzabnqFsmISbPIG2WMaQ8bqpqkHOoAgZl1tUPY1tAQDp
 +l8U+jgNZWsFpyn/vqvfxN6F4Wkn5f29JTN5wPOpCs44BGM9Q9ISCisGAQQBl1UBBQEBB0AI
 K/waxSaK4bWN/x7usyXzOO+Ct1yClYvvTKjrSQiCcAMBCAfCfgQYFgoAJhYhBNiFtvEJJXdN
 rRIjp5VQz7ooL4OuBQJjPUPSAhsMBQkJZgGAAAoJEJVQz7ooL4OuPI8BAKnHL9VSlMWe+8Ox
 WY20ccITT692CR1c29irQA9QHiFcAP9m5dFAb0egybbrU0f4syB+Pt7f02NPzUygl5ulmt7O BA==
In-Reply-To: <20250525214159.GV2023217@ZenIV>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ruDRdiOkeJH6SJwpSuYzhkc5"
X-Rspamd-Bar: ----
X-Rspamd-Report: MIME_UNKNOWN(0.1) BAYES_HAM(-2.585724) XM_UA_NO_VERSION(0.01) SIGNED_PGP(-2) MIME_GOOD(-0.2)
X-Rspamd-Score: -4.675724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=m/3D64u+Y6ojrM8R9pygglNj/ivUDcx/LFnlc4U5D+4=;
	b=S8vhnmRLB+oQqjbypDFnTqrcIvfmnIbTnHBZL1NHlm5AbdwYZJAF9mCmA5bl97GE8Xx8kEAmLZ
	wSzZu/2U70tS9hcPescmbGLizQOqJ2sDeGm6FDl86KPt6bd+4RV4tnrz2xDaSgxkl+oti3uqT4kh
	DCBF+iLoRpSqlHh6HFRwQqxAOiPwC7fiiwAPS1C6iHthe/kNs7hnY+hvH2iKIDYKtubwOukLPn8R
	Tk3Vtcm+r37vzE9MVIOwfV/fo5qt/YNF9FEeFZw0CO9/7cP4Y2501VT45NR9vXJbnmNL/Zlk72YY
	s3G/g0lngx3nCz6OXLs6TMUq/r7MMh9BzMGCk/qQ==

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ruDRdiOkeJH6SJwpSuYzhkc5
Content-Type: multipart/mixed; boundary="------------bRPLrS7j0gA1hB5M095q4sFu";
 protected-headers="v1"
From: Illia Ostapyshyn <illia@yshyn.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Message-ID: <fccf1dc8-de53-4bb0-9adb-61c2c3a5f569@yshyn.com>
Subject: Re: [PATCH RESEND] scripts/gdb: Use d_shortname instead of d_iname
References: <20250525213709.878287-2-illia@yshyn.com>
 <20250525214159.GV2023217@ZenIV>
In-Reply-To: <20250525214159.GV2023217@ZenIV>

--------------bRPLrS7j0gA1hB5M095q4sFu
Content-Type: multipart/mixed; boundary="------------QVUVslR0TzW06IB0YwlseMAf"

--------------QVUVslR0TzW06IB0YwlseMAf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/25/25 23:41, Al Viro wrote:
> You do realize that for dentries with names longer than 40 characters
> that field contains garbage, right?

Is d_name.name a better choice here?  It seems to always reference the
full valid name.
--------------QVUVslR0TzW06IB0YwlseMAf
Content-Type: application/pgp-keys; name="OpenPGP_0x9550CFBA282F83AE.asc"
Content-Disposition: attachment; filename="OpenPGP_0x9550CFBA282F83AE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYz1D0hYJKwYBBAHaRw8BAQdAkEJ4MRf4CNKWqtPb0AJAUCRvYAlFUieRCk/q
aNH9E3PNIklsbGlhIE9zdGFweXNoeW4gPGlsbGlhQHlzaHluLmNvbT7CnAQTFgoA
RAIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBNiFtvEJJXdN
rRIjp5VQz7ooL4OuBQJnOKP5AhkBAAoJEJVQz7ooL4Ou/W8BAPtqkzabnqFsmISb
PIG2WMaQ8bqpqkHOoAgZl1tUPY1tAQDp+l8U+jgNZWsFpyn/vqvfxN6F4Wkn5f29
JTN5wPOpCs0xSWxsaWEgT3N0YXB5c2h5biA8b3N0YXB5c2h5bkBzcmEudW5pLWhh
bm5vdmVyLmRlPsKZBBMWCgBBFiEE2IW28Qkld02tEiOnlVDPuigvg64FAmc4o80C
GwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQlVDPuigvg649
VAEA5NvviWtpk08IOOP54JzgbYDjcqaK+UXKSPFZbs2NxRsA/iUf64tBoYt/y5KU
34XtDkElwmQAYrhROVuW1AB1hKUBzjgEYz1D0hIKKwYBBAGXVQEFAQEHQAgr/BrF
JorhtY3/Hu6zJfM474K3XIKVi+9MqOtJCIJwAwEIB8J+BBgWCgAmFiEE2IW28Qkl
d02tEiOnlVDPuigvg64FAmM9Q9ICGwwFCQlmAYAACgkQlVDPuigvg648jwEAqccv
1VKUxZ77w7FZjbRxwhNPr3YJHVzb2KtAD1AeIVwA/2bl0UBvR6DJtutTR/izIH4+
3t/TY0/NTKCXm6Wa3s4E
=3D/atP
-----END PGP PUBLIC KEY BLOCK-----

--------------QVUVslR0TzW06IB0YwlseMAf--

--------------bRPLrS7j0gA1hB5M095q4sFu--

--------------ruDRdiOkeJH6SJwpSuYzhkc5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTYhbbxCSV3Ta0SI6eVUM+6KC+DrgUCaDOS5AUDAAAAAAAKCRCVUM+6KC+Drtp+
AQCJ1M51vtefrrwifHWzpDabiXkdASn3jMSXoxMsn+LW+QD7B5tyL8jNV7YsDaMcZ9pXbboGcrb9
bCASQjhSSmbdfQw=
=ToNp
-----END PGP SIGNATURE-----

--------------ruDRdiOkeJH6SJwpSuYzhkc5--

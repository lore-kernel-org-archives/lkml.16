Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625BC1DF994
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779011; cv=none; b=smrXjnZvq76M9k9nG/KPEg6W6UskfeCwUUgbEpbgn0covvH9TxjYYo1ojR8D4WJbsbiep4nnnMNZecZ+SdElm753MwJExsVskrezjG5L7DgwsrCrvCdOMlg6XZFQwFFwQfcXsnDl04anqTR4nA0E8WK6xGwjfkm1EIe7jvqYjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779011; c=relaxed/simple;
	bh=XB7V2LOJ3IVvgMYeKNc4AAp93XpwimAc6hooP/ZOCKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsBa/HhteqDLI6ZD9yZ20Kqt5g+7t8D959mUN1JJcwOmkaY8B23xswo1Noljw7H/DOfXw/+DuWQHTg7Pu35KecIvMEG5PaPeVWcz4rFdnRQbHcQV/eCwv5NohPq+4taqs2RL47deVwe7J0JRAqi5J7WshvTbGbWUPgyTIfIXTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ap9PX7B5; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ap9PX7B5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ap9PX7B5";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ap9PX7B5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0F9C21184;
	Fri,  4 Apr 2025 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743779007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XB7V2LOJ3IVvgMYeKNc4AAp93XpwimAc6hooP/ZOCKc=;
	b=Ap9PX7B52livTGNfIDGDABlTELj701fiVA/7RH3j/6F3XF4duV/fS+G2XN0xPqeuqSq1JX
	Vk3cai/Xl6xh7L4RaSB66/lw/jHpSQ3O6LWOHcxycQ25uFK1E8d+RdaR7LUofWYamsIrj1
	PhOrt6JPScpmUTja/iVZaVDeXuBo2K8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743779007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XB7V2LOJ3IVvgMYeKNc4AAp93XpwimAc6hooP/ZOCKc=;
	b=Ap9PX7B52livTGNfIDGDABlTELj701fiVA/7RH3j/6F3XF4duV/fS+G2XN0xPqeuqSq1JX
	Vk3cai/Xl6xh7L4RaSB66/lw/jHpSQ3O6LWOHcxycQ25uFK1E8d+RdaR7LUofWYamsIrj1
	PhOrt6JPScpmUTja/iVZaVDeXuBo2K8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AB8813691;
	Fri,  4 Apr 2025 15:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eA6VGL/072eceAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 04 Apr 2025 15:03:27 +0000
Message-ID: <de4fa449-8b33-481f-86f3-190be450541b@suse.com>
Date: Fri, 4 Apr 2025 17:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <20250404104938.GO25239@noisy.programming.kicks-ass.net>
 <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1VNbTKfAnDwVICXVnP29Lkqa"
X-Spam-Score: -5.19
X-Spamd-Result: default: False [-5.19 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.990];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1VNbTKfAnDwVICXVnP29Lkqa
Content-Type: multipart/mixed; boundary="------------kVfzy4vUYOS9lNyn9a1J003A";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <de4fa449-8b33-481f-86f3-190be450541b@suse.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <20250404104938.GO25239@noisy.programming.kicks-ass.net>
 <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>
In-Reply-To: <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>

--------------kVfzy4vUYOS9lNyn9a1J003A
Content-Type: multipart/mixed; boundary="------------Bmp8OgB0fQrpre0VkT3ZJ5Kt"

--------------Bmp8OgB0fQrpre0VkT3ZJ5Kt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDQuMjUgMTY6NDYsIEpvc2ggUG9pbWJvZXVmIHdyb3RlOg0KPiBPbiBGcmksIEFw
ciAwNCwgMjAyNSBhdCAxMjo0OTozOFBNICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4+IE9uIFRodSwgQXByIDAzLCAyMDI1IGF0IDExOjQ4OjEzQU0gLTA3MDAsIEpvc2ggUG9p
bWJvZXVmIHdyb3RlOg0KPj4NCj4+PiBUaGUgcmVhbCBwcm9ibGVtIGhlcmUgaXMgdGhhdCBJ
TlNOX0NPTlRFWFRfU1dJVENIIGlzIGFtYmlndW91cy4gIEl0IGNhbg0KPj4+IHJlcHJlc2Vu
dCBib3RoIGNhbGwgc2VtYW50aWNzIChTWVNDQUxMLCBTWVNFTlRFUikgYW5kIHJldHVybiBz
ZW1hbnRpY3MNCj4+PiAoU1lTUkVULCBJUkVULCBSRVRTLCBSRVRVKS4gIFRob3NlIGRpZmZl
ciBzaWduaWZpY2FudGx5OiBjYWxscyBwcmVzZXJ2ZQ0KPj4+IGNvbnRyb2wgZmxvdyB3aGVy
ZWFzIHJldHVybnMgdGVybWluYXRlIGl0Lg0KPj4NCj4+IERvZXMgdGhhdCBub3QgcmF0aGVy
IHN1Z2dlc3Qgd2Ugc2hvdWxkIHBlcmhhcHMgaGF2ZSBJTlNOX1NZU0NBTEwgLw0KPj4gSU5T
Tl9TWVNSRVQgdG8gcmVwbGFjZSB0aGUgc2luZ2xlIGFtYmlndW91cyB0aGluZz8NCj4gDQo+
IElzIHRoZXJlIGFueSByZWFzb24gdG8gaGF2ZSBJTlNOX1NZU0NBTEwgaW4gdGhlIGZpcnN0
IHBsYWNlPw0KPiANCg0KeGVuX2h5cGVyY2FsbF9wdigpIG5lZWRzIGEgc3lzY2FsbCB3aGlj
aCB3aWxsIHJldHVybiBhZnRlciB0aGUgY2FsbCBvZg0KdGhlIGh5cGVydmlzb3IuDQoNCnhl
bl9pcmV0KCkgaXMgYSBzcGVjaWFsIGNhc2Ugd2hlcmUgdGhlIHN5c2NhbGwgd29uJ3QgcmV0
dXJuLg0KDQpXaGV0aGVyIG9ianRvb2wgaGFzIGEgbmVlZCBmb3Igc3BlY2lhbCBjYXNpbmcg
aXQgaXMgYW5vdGhlciBxdWVzdGlvbiBJDQpkb24ndCBmZWVsIHF1YWxpZmllZCB0byBhbnN3
ZXIuDQoNCg0KSnVlcmdlbg0K
--------------Bmp8OgB0fQrpre0VkT3ZJ5Kt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Bmp8OgB0fQrpre0VkT3ZJ5Kt--

--------------kVfzy4vUYOS9lNyn9a1J003A--

--------------1VNbTKfAnDwVICXVnP29Lkqa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfv9L4FAwAAAAAACgkQsN6d1ii/Ey8T
1ggAjFSdvMtEl68oqMaT8VcgM0khGnhQxaCQPbha8Z7DPrexRM7S2/y4oBdywIfiFIUS6l58pNKo
U82SdE5fILdjTCU8Q/ph+T4ypq4x2x1zCH+3Fazb+LjFcOOF+47Ou2mcaePr79xFcar1cZq+9JNt
VI0I8La3qmjuJ9HiE5rzhJUcPZhmdFFkqcUt9XgqQyN8Xd+tZicCocobDtGUvdLXeo7WPQQuYofa
7VLzXo4S7J/lajaGLtJUHrjVPGI1rgtQaJqhL6PuhIveWBBAoDhozIIWrZoopRQP4TvX/Ckz2rsv
aa+yr3XN5wdGh5E5sD0iUgGOy5diEe3pjxVAmcaJMw==
=nd6a
-----END PGP SIGNATURE-----

--------------1VNbTKfAnDwVICXVnP29Lkqa--

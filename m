Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EEF224F6
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747459624; cv=none; b=V+04xOaG0RvaAaOshhrkaqkUhGUyWWlxxZnKHBnZLC2Zz5rgoOzcqd+b1bZS1NOoUac9/fgoIwaIDcBpiaZGnO3vt9P0+7ULlVngCLmC0+KUZxC7HnijN+yt9R4LO1svgwMWgvDaj1mYwD88C4fLi7ne8yvrg3XpRwOk+tHGcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747459624; c=relaxed/simple;
	bh=XlrdU5adest1fbb4kGDK91lBrBXyBrunBDj7XRHOPBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AmCz1cvrkoUZVblB8s1vG0SqSS7Rc2A9lu2y8aPuLOxPEIxl7xBoAPz+tuvjGaOnVc0sYcTi1mMPWxVay01ZXDSGlHYj2afD9ifTrHiyJ/NElXnKD2E8DcunoAvIVY69le0IFWDmjZfjbyuHafjRNk4kTRnRr6uTV2Z+wJPVbXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ijFS9rb2; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ECBi8H3z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ijFS9rb2";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ECBi8H3z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0EA61FD45;
	Sat, 17 May 2025 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747459620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XlrdU5adest1fbb4kGDK91lBrBXyBrunBDj7XRHOPBk=;
	b=ijFS9rb22nK6DPjmsBMVy1sYsJr65ozXcU0r09UTlK+UtyvzurAk4Ox5NHRPvvO5/IgT/7
	iNj+FwB6uDBUQABH3aPFbSrMyWUB+T0ODON39aZuTm9UJa5n/zoOCH5pbQ08O2AuLO7TZD
	lO2Mx5V0PTVzzE5fgJC0wxc5C6gATdE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747459619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XlrdU5adest1fbb4kGDK91lBrBXyBrunBDj7XRHOPBk=;
	b=ECBi8H3z0OoB3AC6X4ssFY5ZQmS9eLlBSnhPxErb+Te1vN/tIjrTJGNwqC7wdyZXs5VLc1
	CgbO18oBTJA/bZZ/02F7XDuMgMmAUORB7ZckMH5KuHYOxc993Rdf2rCw4Mvls5/KNxExY8
	JZfQ+ktmLr8FQhOtC2twkQxwr048mTA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C79E2137E8;
	Sat, 17 May 2025 05:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dtlsLiMeKGhDZAAAD6G6ig
	(envelope-from <jgross@suse.com>); Sat, 17 May 2025 05:26:59 +0000
Message-ID: <b876424f-3364-4348-a20a-5ff271806452@suse.com>
Date: Sat, 17 May 2025 07:26:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2022-49933: KVM: VMX: Reset eVMCS controls in VP assist page
 during hardware disabling
To: cve@kernel.org, linux-kernel@vger.kernel.org
References: <2025050200-CVE-2022-49933-2147@gregkh>
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
In-Reply-To: <2025050200-CVE-2022-49933-2147@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dCUp0o50Pj6MVqQBnmdN0s02"
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.20
X-Spamd-Result: default: False [-2.20 / 50.00];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_ATTACHMENT(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dCUp0o50Pj6MVqQBnmdN0s02
Content-Type: multipart/mixed; boundary="------------xrUcw3tjBOz7DNXbMttCZA3h";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <b876424f-3364-4348-a20a-5ff271806452@suse.com>
Subject: Re: CVE-2022-49933: KVM: VMX: Reset eVMCS controls in VP assist page
 during hardware disabling
References: <2025050200-CVE-2022-49933-2147@gregkh>
In-Reply-To: <2025050200-CVE-2022-49933-2147@gregkh>

--------------xrUcw3tjBOz7DNXbMttCZA3h
Content-Type: multipart/mixed; boundary="------------IuTpgZhuZFtlE0e1xSHiiE5W"

--------------IuTpgZhuZFtlE0e1xSHiiE5W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjUgMTc6NTQsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gRnJvbTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAa2VybmVsLm9yZz4NCj4gDQo+IERlc2NyaXB0
aW9uDQo+ID09PT09PT09PT09DQo+IA0KPiBJbiB0aGUgTGludXgga2VybmVsLCB0aGUgZm9s
bG93aW5nIHZ1bG5lcmFiaWxpdHkgaGFzIGJlZW4gcmVzb2x2ZWQ6DQo+IA0KPiBLVk06IFZN
WDogUmVzZXQgZVZNQ1MgY29udHJvbHMgaW4gVlAgYXNzaXN0IHBhZ2UgZHVyaW5nIGhhcmR3
YXJlIGRpc2FibGluZw0KPiANCj4gUmVzZXQgdGhlIGVWTUNTIGNvbnRyb2xzIGluIHRoZSBw
ZXItQ1BVIFZQIGFzc2lzdCBwYWdlIGR1cmluZyBoYXJkd2FyZQ0KPiBkaXNhYmxpbmcgaW5z
dGVhZCBvZiB3YWl0aW5nIHVudGlsIGt2bS1pbnRlbCdzIG1vZHVsZSBleGl0LiAgVGhlIGNv
bnRyb2xzDQo+IGFyZSBhY3RpdmF0ZWQgaWYgYW5kIG9ubHkgaWYgS1ZNIGNyZWF0ZXMgYSBW
TSwgaS5lLiBkb24ndCBuZWVkIHRvIGJlDQo+IHJlc2V0IGlmIGhhcmR3YXJlIGlzIG5ldmVy
IGVuYWJsZWQuDQo+IA0KPiBEb2luZyB0aGUgcmVzZXQgZHVyaW5nIGhhcmR3YXJlIGRpc2Fi
bGluZyB3aWxsIG5hdHVyYWxseSBmaXggYSBwb3RlbnRpYWwNCj4gTlVMTCBwb2ludGVyIGRl
cmVmIGJ1ZyBvbmNlIEtWTSBkaXNhYmxlcyBDUFUgaG90cGx1ZyB3aGlsZSBlbmFibGluZyBh
bmQNCj4gZGlzYWJsaW5nIGhhcmR3YXJlICh3aGljaCBpcyBuZWNlc3NhcnkgdG8gZml4IGEg
dmFyaWV0eSBvZiBidWdzKS4gIElmIHRoZQ0KPiBrZXJuZWwgaXMgcnVubmluZyBhcyB0aGUg
cm9vdCBwYXJ0aXRpb24sIHRoZSBWUCBhc3Npc3QgcGFnZSBpcyB1bm1hcHBlZA0KPiBkdXJp
bmcgQ1BVIGhvdCB1bnBsdWcsIGFuZCBzbyBLVk0ncyBjbGVhcmluZyBvZiB0aGUgZVZNQ1Mg
Y29udHJvbHMgbmVlZHMNCj4gdG8gb2NjdXIgd2l0aCBDUFUgaG90KHVuKXBsdWcgZGlzYWJs
ZWQsIG90aGVyd2lzZSBLVk0gY291bGQgYXR0ZW1wdCB0bw0KPiB3cml0ZSB0byBhIENQVSdz
IFZQIGFzc2lzdCBwYWdlIGFmdGVyIGl0J3MgdW5tYXBwZWQuDQo+IA0KPiBUaGUgTGludXgg
a2VybmVsIENWRSB0ZWFtIGhhcyBhc3NpZ25lZCBDVkUtMjAyMi00OTkzMyB0byB0aGlzIGlz
c3VlLg0KDQpJcyB0aGlzIHJlYWxseSBhIHNlY3VyaXR5IGlzc3VlPw0KDQpJIGRvbid0IHNl
ZSBob3cgYW4gdW5wcml2aWxlZ2VkIHVzZXIgY291bGQgdHJpZ2dlciB0aGUgbWVudGlvbmVk
IE5VTEwgZGVyZWYsDQphcyBpdCByZXF1aXJlcyBDUFUgaG90dW5wbHVnIChjYW4ndCBiZSB0
cmlnZ2VyZWQgYnkgdXNlcikgdG8gaGFwcGVuIGluIHBhcmFsbGVsDQp3aXRoIHVubG9hZGlu
ZyB0aGUga3ZtIG1vZHVsZSAoY2FuJ3QgYmUgdHJpZ2dlcmVkIGJ5IHVzZXIgZWl0aGVyKS4N
Cg0KDQpKdWVyZ2VuDQo=
--------------IuTpgZhuZFtlE0e1xSHiiE5W
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IuTpgZhuZFtlE0e1xSHiiE5W--

--------------xrUcw3tjBOz7DNXbMttCZA3h--

--------------dCUp0o50Pj6MVqQBnmdN0s02
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgoHiMFAwAAAAAACgkQsN6d1ii/Ey8B
hAf+Mw8JK1pvd6YMJ56w0nAS4R4FIHWYh8Box7ovm2PY6yRTI51SFjFFRn2eJS6UkpO07HOLcEGv
1M9KvUuNfhCunFVS7ocvDI71e2rzrVC/0703FJK2IdwzZMLfhWAjtOS6JoK4OxKSFQkfM8glpQt1
/cliWrXXYI82Ryyp32oJZLeub+HWYT/O+X0pJR2TnZ0klhX168utkJEiyzMLgSggRY3ghkpivpa5
cJm343KIL2Apom0S639MRzHjWQjszxxRTsUShIzi6mB8Yia0zCXUbdB89bP/YpVj3DHMViKz+4sq
EQ9BxregE1C/CZ1Nh4QJBQZmVdOT5WLMk7GS6gx/Ww==
=I2d0
-----END PGP SIGNATURE-----

--------------dCUp0o50Pj6MVqQBnmdN0s02--

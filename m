Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C020A31
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748414969; cv=none; b=P31rkYKxIo1Rx55dXbbe+w8/m1CtP7up6zYnnwan99Gk+qE5VLWVuSxaFk/XDLMEeaI+wQsIMb+itSkg6Wfnl1MtC7UamVZO8a4zdLdbRU+b5JoKlfmgwRfBlF108cnGGNcsJDxMDy5q2wnD7/j60c8g7spdeOLfUotqzYKBzrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748414969; c=relaxed/simple;
	bh=5FSaT49Y+V4AM0/atZWMCel45h8UoeQhhosS4fpP+h8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rGS3dCw++h0RBDokS3Vw+6FBhHB3LPbqYw97fw7D0r7V3WrpeL9C6SjGoF/DLg2En7jyIMCW4bgRQfwggDwfFF0Aa05QnY+GHB1LDxt3uqFOvXLpG9Lj7LVgtGEOzUeWXs2mW11JFRLNL8AJNoPSpJQGim/gHyqVcQc2l6UszxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=nAd+xuIW; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=nAd+xuIW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="nAd+xuIW";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="nAd+xuIW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E1BF21D19;
	Wed, 28 May 2025 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748414965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5FSaT49Y+V4AM0/atZWMCel45h8UoeQhhosS4fpP+h8=;
	b=nAd+xuIWxSOVrF7tkPXjJTPEVsfnJ7t4sjBR5Y17GlUiJPe4vFs2vdsUC7Yo/SItjj+RXd
	hZxyAfsOdWBhu3UqByeiJWT+y89Gj23Oi3Xkx38MejNRKuEzYwYQmNlC+xw6F9owIqG4C7
	3EoHq0zJYi/OVniVM41XfHBdE+0Rh2o=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nAd+xuIW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748414965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5FSaT49Y+V4AM0/atZWMCel45h8UoeQhhosS4fpP+h8=;
	b=nAd+xuIWxSOVrF7tkPXjJTPEVsfnJ7t4sjBR5Y17GlUiJPe4vFs2vdsUC7Yo/SItjj+RXd
	hZxyAfsOdWBhu3UqByeiJWT+y89Gj23Oi3Xkx38MejNRKuEzYwYQmNlC+xw6F9owIqG4C7
	3EoHq0zJYi/OVniVM41XfHBdE+0Rh2o=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1778C136E0;
	Wed, 28 May 2025 06:49:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fAmYA/WxNmi9OQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 28 May 2025 06:49:25 +0000
Message-ID: <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
Date: Wed, 28 May 2025 08:49:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
From: Juergen Gross <jgross@suse.com>
To: Xin Li <xin@zytor.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
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
In-Reply-To: <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------REMmJXBxmTCPqBhocIbeNDvS"
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 7E1BF21D19
X-Spam-Flag: NO
X-Spam-Score: -6.41
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------REMmJXBxmTCPqBhocIbeNDvS
Content-Type: multipart/mixed; boundary="------------l8A198Pl9NQg6uMFCGh40JWI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Xin Li <xin@zytor.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
Message-ID: <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
In-Reply-To: <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>

--------------l8A198Pl9NQg6uMFCGh40JWI
Content-Type: multipart/mixed; boundary="------------KR5jmzARLRZb4niPg7yeoHiF"

--------------KR5jmzARLRZb4niPg7yeoHiF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDUuMjUgMDc6MTEsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDI3LjA1LjI1
IDIxOjI5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMjcvMDUvMjAyNSA4OjIxIHBt
LCBYaW4gTGkgd3JvdGU6DQo+Pj4+IE9uIE1heSAyNywgMjAyNSwgYXQgMTE6MzbigK9BTSwg
SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4g77u/
T24gMjcuMDUuMjUgMTk6NTQsIFhpbiBMaSB3cm90ZToNCj4+Pj4+IE9uIDUvMjcvMjAyNSAx
MDo0NiBBTSwgUGF3YW4gR3VwdGEgd3JvdGU6DQo+Pj4+Pj4+IEF0dGFjaGVkIGlzIHRoZSBz
ZXJpYWwgY29uc29sZSBsb2cgYW5kIG15IGtlcm5lbCBjb25maWcuDQo+Pj4+Pj4gU2VyaWFs
IGxvZ3MgYXJlbid0IHRlbGxpbmcgbXVjaC4gSSBkbyBub3QgaGF2ZSBhIFhlbiBzZXR1cCB0
byB0ZXN0LCB3aXRob3V0DQo+Pj4+Pj4gWGVuIHRoZSBjb25maWcgdGhhdCB5b3UgcHJvdmlk
ZWQgaXMgYm9vdGluZyBhIEtWTSBndWVzdCBqdXN0IGZpbmUuDQo+Pj4+PiBZZWFoLCBhcyBJ
IHJlcGxpZWQgdG8gSnVlcmdlbiwgdGhlIHNhbWUga2VybmVsIGJpbmFyeSBib290cyBmaW5l
IGFzDQo+Pj4+PiAibmF0aXZlIi4NCj4+Pj4+IFVuZm9ydHVuYXRlbHkgd2hlbiBib290aW5n
IGFzIGRvbTAgb24gWGVuLCBpdCBrZWVwcyByZWJvb3Rpbmcgdy9vDQo+Pj4+PiBoZWxwZnVs
IGxvZy4NCj4+Pj4gV2hhdCBhYm91dCBib290aW5nIFhlbiBvbiBiYXJlIG1ldGFsLCBpLmUu
IG5vIEtWTSBiZWluZyBpbnZvbHZlZD8NCj4+PiBUaGUgc2FtZSBleGFjdCBwcm9ibGVtIGhh
cHBlbnMgb24gSW50ZWwgU2ltaWNzLsKgIEFuZCBJIGdvdCB0byBzZWUgaXTigJlzIGEgTlgg
DQo+Pj4gcGFnZSBmYXVsdCBpbiBkb20wIGtlcm5lbCBkdXJpbmcgYXBwbHkgYWx0ZXJuYXRp
dmVzLg0KPj4NCj4+IEluIHdoaWNoIGNhc2UgaXQncyBsaWtlbHkgdGhhdCB0aGVyZSdzIGFu
IG9wZW5jb2RlZCBQVEUgdXBkYXRlLCByYXRoZXINCj4+IHRoYW4gdXNpbmcgdGhlIGhvb2tz
ICh3aGljaCBhcmUgc3VpdGFibHkgcGFyYXZpcnQnZCkuDQo+IA0KPiBJJ2Qgc3VzcGVjdCBh
IGJ1ZyB3aGVuIE5PVCB1c2luZyAyTSBwYWdlcyBmb3IgZXhlY21lbS4NCj4gDQo+IEknbGwg
aGF2ZSBhIGxvb2suDQoNCkNvdWxkIHlvdSBoYXZlIGEgdHJ5IHVzaW5nICJub2h1Z2V2bWFs
bG9jIiBkb20wIGtlcm5lbCBib290IHBhcmFtZXRlcj8NCg0KDQpKdWVyZ2VuDQo=
--------------KR5jmzARLRZb4niPg7yeoHiF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KR5jmzARLRZb4niPg7yeoHiF--

--------------l8A198Pl9NQg6uMFCGh40JWI--

--------------REMmJXBxmTCPqBhocIbeNDvS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg2sfAFAwAAAAAACgkQsN6d1ii/Ey8e
pwf8CeEza9IZnCTZ0NTY7Kj3yELSjiQ6b1BUz96aHkVXJewKQXEh29FKE8pFVKrSB7R+0tw/W2WG
K9RGlgCbIkUqDNpQmt7mLx4tZx0ALkNHs1nPzXCUEnUXThtHbbZrQm4uhOsCQZ8xlFXBvWDae4E5
7QOT8hoyDZIOhMdX9zxPWl+UQBpBd9+duqzKAZ2FHyodxeeMT4B4fYcuRbN/RWV/59OyAkIBLMR0
f4uWxnPNelugKgR3wzzhHZgwfsVyo/IQyRe9hZhgle7KPy26JJqp5Iezk9mKogJlXbKGo3urZ+m8
BGVey/MbPpodJy2wu2ZYJLwXrQxlSs1LGzqqHtI6UA==
=9Yl5
-----END PGP SIGNATURE-----

--------------REMmJXBxmTCPqBhocIbeNDvS--

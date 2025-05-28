Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA0627586F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423968; cv=none; b=R2sr6hg8LJFnfbxJcpzNcbYGwLoNxS5JdN1eqYP+iX2MHA0OV6aMrc2h0XwSR0XpcnNuZfKwzQRs8V6n33sT/dQw2DwImjXjbVurre3HEQZdm2r/TPomW3NUg0n0fgk0VqcGQ4oo6Klr5tVOpj9d7rDE5pVErtLxG9OXi2t5IbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423968; c=relaxed/simple;
	bh=/bbXwXbMMbqjIGL9TQHrgrD5OA0YP+lJA+Klu5DT5YY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=e2ceo5U+wtHdC21J9cju6Wp4VfbLOcJud91L4w/UXN4GJ/FFJAH5fao1FiqMkH4WNUyK+iFhFiFjb828ozx+wTX8JngXmQugs5++7ALj22yniIA7qM9Pv+0kRRNwsgewGBCBbplVV9/7euKv3f+vTkdy5GCFP5ft/L1piqHD8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RbQzFo7N; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RbQzFo7N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RbQzFo7N";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RbQzFo7N"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7650421BAF;
	Wed, 28 May 2025 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748423964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/bbXwXbMMbqjIGL9TQHrgrD5OA0YP+lJA+Klu5DT5YY=;
	b=RbQzFo7NLL/u9GxubmTPQ1DT5464wPLD0RdQCWQCQxCLcgrqYexFhB4E0Pj3FYHOIasy92
	OY/wNE/+ypOvlLTzOfKKUJYX1cTCQKz30oFBHW2uGbs6Ezm4vxMuh9OS2hSIXI3vusJM4X
	Z6ylzYu0WrRkWHco/wiK+QxsQ8XLrt0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1748423964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/bbXwXbMMbqjIGL9TQHrgrD5OA0YP+lJA+Klu5DT5YY=;
	b=RbQzFo7NLL/u9GxubmTPQ1DT5464wPLD0RdQCWQCQxCLcgrqYexFhB4E0Pj3FYHOIasy92
	OY/wNE/+ypOvlLTzOfKKUJYX1cTCQKz30oFBHW2uGbs6Ezm4vxMuh9OS2hSIXI3vusJM4X
	Z6ylzYu0WrRkWHco/wiK+QxsQ8XLrt0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11900136E3;
	Wed, 28 May 2025 09:19:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8XmRAhzVNmh1aAAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 28 May 2025 09:19:24 +0000
Message-ID: <a71e7aba-759b-47aa-9170-a4045c52239a@suse.com>
Date: Wed, 28 May 2025 11:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
From: Juergen Gross <jgross@suse.com>
To: Xin Li <xin@zytor.com>, Zijlstra Peter <peterz@infradead.org>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
 <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
 <1226c371-5d44-4206-973f-3c10152c4195@zytor.com>
 <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>
 <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
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
In-Reply-To: <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3MNdmTEmocVC00pJoKvINUXt"
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3MNdmTEmocVC00pJoKvINUXt
Content-Type: multipart/mixed; boundary="------------E81FZrA6R5X3ilhdh0soFZC7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Xin Li <xin@zytor.com>, Zijlstra Peter <peterz@infradead.org>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
Message-ID: <a71e7aba-759b-47aa-9170-a4045c52239a@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
 <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
 <1226c371-5d44-4206-973f-3c10152c4195@zytor.com>
 <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>
 <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
In-Reply-To: <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>

--------------E81FZrA6R5X3ilhdh0soFZC7
Content-Type: multipart/mixed; boundary="------------ggWArFCDyOmUVH0CSrX7w4Yk"

--------------ggWArFCDyOmUVH0CSrX7w4Yk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDUuMjUgMTA6NTcsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDI4LjA1LjI1
IDEwOjI2LCBYaW4gTGkgd3JvdGU6DQo+PiBPbiA1LzI4LzIwMjUgMTI6MjcgQU0sIFhpbiBM
aSB3cm90ZToNCj4+PiBPbiA1LzI3LzIwMjUgMTE6NDkgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+IE9uIDI4LjA1LjI1IDA3OjExLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+
Pj4gT24gMjcuMDUuMjUgMjE6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4gT24g
MjcvMDUvMjAyNSA4OjIxIHBtLCBYaW4gTGkgd3JvdGU6DQo+Pj4+Pj4+PiBPbiBNYXkgMjcs
IDIwMjUsIGF0IDExOjM24oCvQU0sIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4g77u/T24gMjcuMDUuMjUgMTk6NTQsIFhpbiBM
aSB3cm90ZToNCj4+Pj4+Pj4+PiBPbiA1LzI3LzIwMjUgMTA6NDYgQU0sIFBhd2FuIEd1cHRh
IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gQXR0YWNoZWQgaXMgdGhlIHNlcmlhbCBjb25zb2xlIGxv
ZyBhbmQgbXkga2VybmVsIGNvbmZpZy4NCj4+Pj4+Pj4+Pj4gU2VyaWFsIGxvZ3MgYXJlbid0
IHRlbGxpbmcgbXVjaC4gSSBkbyBub3QgaGF2ZSBhIFhlbiBzZXR1cCB0byB0ZXN0LCANCj4+
Pj4+Pj4+Pj4gd2l0aG91dA0KPj4+Pj4+Pj4+PiBYZW4gdGhlIGNvbmZpZyB0aGF0IHlvdSBw
cm92aWRlZCBpcyBib290aW5nIGEgS1ZNIGd1ZXN0IGp1c3QgZmluZS4NCj4+Pj4+Pj4+PiBZ
ZWFoLCBhcyBJIHJlcGxpZWQgdG8gSnVlcmdlbiwgdGhlIHNhbWUga2VybmVsIGJpbmFyeSBi
b290cyBmaW5lIGFzDQo+Pj4+Pj4+Pj4gIm5hdGl2ZSIuDQo+Pj4+Pj4+Pj4gVW5mb3J0dW5h
dGVseSB3aGVuIGJvb3RpbmcgYXMgZG9tMCBvbiBYZW4sIGl0IGtlZXBzIHJlYm9vdGluZyB3
L28NCj4+Pj4+Pj4+PiBoZWxwZnVsIGxvZy4NCj4+Pj4+Pj4+IFdoYXQgYWJvdXQgYm9vdGlu
ZyBYZW4gb24gYmFyZSBtZXRhbCwgaS5lLiBubyBLVk0gYmVpbmcgaW52b2x2ZWQ/DQo+Pj4+
Pj4+IFRoZSBzYW1lIGV4YWN0IHByb2JsZW0gaGFwcGVucyBvbiBJbnRlbCBTaW1pY3MuwqAg
QW5kIEkgZ290IHRvIHNlZSBpdOKAmXMgYSANCj4+Pj4+Pj4gTlggcGFnZSBmYXVsdCBpbiBk
b20wIGtlcm5lbCBkdXJpbmcgYXBwbHkgYWx0ZXJuYXRpdmVzLg0KPj4+Pj4+DQo+Pj4+Pj4g
SW4gd2hpY2ggY2FzZSBpdCdzIGxpa2VseSB0aGF0IHRoZXJlJ3MgYW4gb3BlbmNvZGVkIFBU
RSB1cGRhdGUsIHJhdGhlcg0KPj4+Pj4+IHRoYW4gdXNpbmcgdGhlIGhvb2tzICh3aGljaCBh
cmUgc3VpdGFibHkgcGFyYXZpcnQnZCkuDQo+Pj4+Pg0KPj4+Pj4gSSdkIHN1c3BlY3QgYSBi
dWcgd2hlbiBOT1QgdXNpbmcgMk0gcGFnZXMgZm9yIGV4ZWNtZW0uDQo+Pj4+Pg0KPj4+Pj4g
SSdsbCBoYXZlIGEgbG9vay4NCj4+Pj4NCj4+Pj4gQ291bGQgeW91IGhhdmUgYSB0cnkgdXNp
bmcgIm5vaHVnZXZtYWxsb2MiIGRvbTAga2VybmVsIGJvb3QgcGFyYW1ldGVyPw0KPj4+Pg0K
Pj4+DQo+Pj4gVHJpZWQgaW4gYSBLVk0gZ3Vlc3QsIHN0aWxsIHRoZSBzYW1lIHByb2JsZW0s
IGFuZCBub3RoaW5nIG5ldyBpbiB0aGUNCj4+PiBzZXJpYWwgbG9nLg0KPj4NCj4+IEF0dGFj
aGVkIGlzIGEgZG9tMCBsb2cgd2l0aCBzdGFjayB0cmFjZXMuDQo+Pg0KPj4gQnV0IEkgcmVh
bGx5IGRpZCBOT1QgY2hhbmdlIGFueXRoaW5nIHRvIG1ha2UgaXQgaGFwcGVuLi4uDQo+IA0K
PiBUaGFua3MuDQo+IA0KPiBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgcmVsYXRlZCB0byBYZW4g
bm90IGFkdmVydGlzaW5nIFg4Nl9GRUFUVVJFX1BTRS4NCj4gDQo+IFRoaXMgd2lsbCB1c2Ug
UEFHRV9LRVJORUwgcGFnZSBwcm90ZWN0aW9uIGZvciBleGVjbWVtX2FsbG9jKCkgcGFnZSBw
cm90ZWN0aW9uLA0KPiB3aGlsZSB3aXRoIFg4Nl9GRUFUVVJFX1BTRSBQQUdFX0tFUk5FTF9S
T1ggaXMgYmVpbmcgdXNlZC4NCj4gDQo+IEZvciB0aGUga2VybmVsIChzbyBub3QgaW4gYSBt
b2R1bGUpIHRoZXJlIGlzIG5vIGV4ZWNtZW1fcmVzdG9yZV9yb3goKSBjYWxsDQo+IGludm9s
dmVkLCBzbyB0aGUgTlggYml0IHdpbGwgYmUga2VwdCBmb3Iga2VybmVsIHNpZGUgSVRTIHRo
dW5rcy4NCj4gDQo+IFBldGVyLCBjYW4geW91IGNvbmZpcm0gbXkgc3VzcGljaW9uPw0KDQpJ
IGp1c3QgbWFkZSBhIHNtYWxsIHRlc3Qgb24gbXkgKHJhdGhlciBvbGQpIHN5c3RlbToNCg0K
SSB2ZXJpZmllZCB0aGF0IGtlcm5lbCA2LjE1IGlzIGJvb3RpbmcgZmluZSBhcyBYZW4gZG9t
MCAoSVRTIG1pdGlnYXRpb24NCm5vdCBuZWVkZWQgZHVlIHRvIG9sZCBjcHUpLiBUaGVuIEkg
bW9kaWZpZWQgYWx0ZXJuYXRpdmUuYyB0byBhcHBseSB0aGUNCklUUyBtaXRpZ2F0aW9ucyBu
ZXZlcnRoZWxlc3MsIHdoaWNoIG1hZGUgdGhlIGtlcm5lbCBjcmFzaCBhcyBYZW4gZG9tMC4N
Cg0KV2l0aCB0aGUgZm9sbG93aW5nIGFkZGl0aW9uYWwgbW9kaWZpY2F0aW9uIGJvb3Qgd2Fz
IHdvcmtpbmcgYWdhaW46DQoNCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9pbml0LmMgYi9h
cmNoL3g4Ni9tbS9pbml0LmMNCmluZGV4IGJmYTQ0NGE3ZGJiMC4uZmFjNGY5ZDI2MTMyIDEw
MDY0NA0KLS0tIGEvYXJjaC94ODYvbW0vaW5pdC5jDQorKysgYi9hcmNoL3g4Ni9tbS9pbml0
LmMNCkBAIC0xMDkwLDcgKzEwOTAsNyBAQCBzdHJ1Y3QgZXhlY21lbV9pbmZvIF9faW5pdCAq
ZXhlY21lbV9hcmNoX3NldHVwKHZvaWQpDQogICAgICAgICAgICAgICAgIHBncHJvdCA9IFBB
R0VfS0VSTkVMX1JPWDsNCiAgICAgICAgICAgICAgICAgZmxhZ3MgPSBFWEVDTUVNX0tBU0FO
X1NIQURPVyB8IEVYRUNNRU1fUk9YX0NBQ0hFOw0KICAgICAgICAgfSBlbHNlIHsNCi0gICAg
ICAgICAgICAgICBwZ3Byb3QgPSBQQUdFX0tFUk5FTDsNCisgICAgICAgICAgICAgICBwZ3By
b3QgPSBQQUdFX0tFUk5FTF9FWEVDOw0KICAgICAgICAgICAgICAgICBmbGFncyA9IEVYRUNN
RU1fS0FTQU5fU0hBRE9XOw0KICAgICAgICAgfQ0KDQoNCkp1ZXJnZW4NCg==
--------------ggWArFCDyOmUVH0CSrX7w4Yk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ggWArFCDyOmUVH0CSrX7w4Yk--

--------------E81FZrA6R5X3ilhdh0soFZC7--

--------------3MNdmTEmocVC00pJoKvINUXt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg21RcFAwAAAAAACgkQsN6d1ii/Ey9l
+Af/WtMeaVM0A2XJskrLN3rjrX5MiFl3p2UwaewCkMlTbMl/4RozukUZJcy++ppVV63bu2rOPbaY
ZVbg4Ay9U7uSGYuSFpn6Vw/ORSxqY/WIKk9aPOFcshuaON0W0d2+uDuit8A/js0C/zPGNACdfJ7u
6c/MCCixgrpk/8rdAN2d2svvPb8fklnlrOKU39BJckF6NDjyoEXyLmACSxNupDk3XniUG2mARU/9
UhJYFpy1cbdQHF//G6xg6Pt03XElR8ecPSFp4nd/+/WiOWYMwPU/xuqf+TgnQExRUpp/mLXGgJK5
K1Jr0FXX8J5wZsvDA24/cRDFbpYAj8/qnklbkHMoKg==
=naJz
-----END PGP SIGNATURE-----

--------------3MNdmTEmocVC00pJoKvINUXt--

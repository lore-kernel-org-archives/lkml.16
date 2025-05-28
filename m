Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3101EB5B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422685; cv=none; b=P/2EAExwdIesXYGrvzM/ZE3mQAGQ6wFLEqktrFRTafEJiDXdwuuhWyHztj/7Adg2frqPN7imiKKWoSOZdvuip15TTHffcm17o1kSDjFajnF2r0rSp3mL/N/L7+Wc04QRHpqU09gIALNRQOaTSXE2Gh+BJP5uS2rCvBlJ+0Y4y8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422685; c=relaxed/simple;
	bh=BVt9H1UUjB+l/+sScIJvQevcmhMQcgK/+kNZddlxB24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uigiIhbKiQ2LZuMJoN3GQJY3GX2LwVBb59KGRfm4UOsBWxT9eTK7NwYV05nxORKS1q6bl0sfJ+3IV7D+kEk5gWLyqCI5WzM2pEvJP8TS7B/s/fQUlZE1UMYzMtvPzOFe+rA0CVJOpF4ixZtZY8eQBS9STQW/y5ZlrsvbewTVHWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mum0MCFP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mum0MCFP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440685d6afcso51308235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748422681; x=1749027481; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BVt9H1UUjB+l/+sScIJvQevcmhMQcgK/+kNZddlxB24=;
        b=Mum0MCFPjc82KcVQ7NrWxaBR0fGZhUKzJEy/rzphKM4oWVoGjHKpWXvgtyqyKhzkVn
         bFFANrWzPkod6h0kNMMc7RZijetRPjRnLuqa6YNgdl4dIP3cAuJWX8D3Q6XGwPbsjTyj
         3gIlrO6yBzhgvUZKL+rup5U0qfJS9qQDHl6c5ZH9r4DcdkC2nPCUT5d15xim88tm/17J
         2ROx1qEEbymPX5625XA/pbDh90bbWVLFzqSKSIULXcEXhn9/dWqVv3KBPPFzt/24fUTB
         KMTH8tbGf49mzDktt7cbmFnaxjWk3txwWtv4nwaTEDGe2LUnMMRWfV/7H+1Q0Sqo1g59
         +AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422681; x=1749027481;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVt9H1UUjB+l/+sScIJvQevcmhMQcgK/+kNZddlxB24=;
        b=IcjoKIbbqKAsGiZmUgNOP9CtNPWrFwgD414Ur5/HS7AZK0Td7ujo/jvYp6hOPMV4rT
         MdqpwCSr3f/np9yU+/4kHFDDtVzrXKKmsujzbUHqZiSC+YWJxfUmi22Uy+stVIkziI4r
         SswbiVBkctooC2zI8zyFl2jkg4Ezlu5vMFgAW81WFPnmwrBp6KgrdVZ4j1qBbPUGgWnI
         8gRAcRV1Om0J7A3kCS8jSdxw/PbpT52O/PF/ULkQbcYygvOCdtd0+fw6r/ShGhOhYy5a
         CBl8drfaHzK8KuPTXTFNDVJG4o348zic+hdRoRgtAwmLAcUhAd9GQeZPZFncVY/Yxqsc
         +ZBg==
X-Forwarded-Encrypted: i=1; AJvYcCVCngtvjzFVSmO/ntVjU3D62P+6NJaA4IBBcvzAb86YbiD7W+V7eVIplTA1j823AhPFFGH+3Q13Mr+2aDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYxKrI6kZ7HXgnuZafOw7BKFeWcRh0AdtUPmxN5DcnMke5b0d1
	T+LTWzYbNATzs+Vu/GfYlo2xQ/joYDLe8DUFvxlEKsrcbs9nIybA4EzltfBeF8O7ZEc=
X-Gm-Gg: ASbGncu3VoMBjrITrlslFRK9WNwTGGXu51MkHn8JP0Zc07a8/fW30VLcx+vM58qYt9/
	9NcqrVkB7nAO0Zg2T1bYxh5YrrVra+vuR73ITzGhU2JdYLoAmr5SnwEX5F4Ew7mC1YY3TRzeQUx
	sE54tlZ8wnm/nf+vvjXxzcQTEiKtwbqBaoyhlWW48ExnksIui2BIXzYJN/OWDRom3ZTLVAQE26m
	AxfpRNpA4wKhiPu4J3eemL47tbnDTkGKWIdBblcJoOTCm3MQxs3lBWDAmrKB4DjOGG5/tiXr6CN
	fwCbQ4eNSdvWPDr9cxa0aCPlvucH9dJ45G21bQms9r2wG/FUmKQsHVLoPKU8y7+cPFjQn/w2GNX
	bAu4LO+/cd7ezAh78Pt2qLMvB+lB/uTs5SGiVtg/7AITp9eYlrqupyxY7XTr7UQ7RR9yPUBA/Vm
	wyVjnGfsW+mxY=
X-Google-Smtp-Source: AGHT+IEI83jX/lO1SN3rHaQmb3ZvPXsKzuyFrAWXmpTbcyDGWIj1YAoKyTVOh0bpjq2JdOIXTp1z8g==
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr154823185e9.17.1748422680989;
        Wed, 28 May 2025 01:58:00 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006498c83sm14653785e9.5.2025.05.28.01.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 01:58:00 -0700 (PDT)
Message-ID: <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
Date: Wed, 28 May 2025 10:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
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
In-Reply-To: <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OhnbcgBMWkOds7nYdwu8IC3O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OhnbcgBMWkOds7nYdwu8IC3O
Content-Type: multipart/mixed; boundary="------------aufxzz2EZabiFunsrly3IoCP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>, Zijlstra Peter <peterz@infradead.org>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
Message-ID: <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
 <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
 <1226c371-5d44-4206-973f-3c10152c4195@zytor.com>
 <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>
In-Reply-To: <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>

--------------aufxzz2EZabiFunsrly3IoCP
Content-Type: multipart/mixed; boundary="------------gwFI2Ob0S3n1RsdEX0tyCX9W"

--------------gwFI2Ob0S3n1RsdEX0tyCX9W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDUuMjUgMTA6MjYsIFhpbiBMaSB3cm90ZToNCj4gT24gNS8yOC8yMDI1IDEyOjI3
IEFNLCBYaW4gTGkgd3JvdGU6DQo+PiBPbiA1LzI3LzIwMjUgMTE6NDkgUE0sIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjguMDUuMjUgMDc6MTEsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6DQo+Pj4+IE9uIDI3LjA1LjI1IDIxOjI5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gT24gMjcvMDUvMjAyNSA4OjIxIHBtLCBYaW4gTGkgd3JvdGU6DQo+Pj4+Pj4+IE9uIE1h
eSAyNywgMjAyNSwgYXQgMTE6MzbigK9BTSwgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToNCj4+Pj4+Pj4NCj4+Pj4+Pj4g77u/T24gMjcuMDUuMjUgMTk6NTQsIFhp
biBMaSB3cm90ZToNCj4+Pj4+Pj4+IE9uIDUvMjcvMjAyNSAxMDo0NiBBTSwgUGF3YW4gR3Vw
dGEgd3JvdGU6DQo+Pj4+Pj4+Pj4+IEF0dGFjaGVkIGlzIHRoZSBzZXJpYWwgY29uc29sZSBs
b2cgYW5kIG15IGtlcm5lbCBjb25maWcuDQo+Pj4+Pj4+Pj4gU2VyaWFsIGxvZ3MgYXJlbid0
IHRlbGxpbmcgbXVjaC4gSSBkbyBub3QgaGF2ZSBhIFhlbiBzZXR1cCB0byB0ZXN0LCANCj4+
Pj4+Pj4+PiB3aXRob3V0DQo+Pj4+Pj4+Pj4gWGVuIHRoZSBjb25maWcgdGhhdCB5b3UgcHJv
dmlkZWQgaXMgYm9vdGluZyBhIEtWTSBndWVzdCBqdXN0IGZpbmUuDQo+Pj4+Pj4+PiBZZWFo
LCBhcyBJIHJlcGxpZWQgdG8gSnVlcmdlbiwgdGhlIHNhbWUga2VybmVsIGJpbmFyeSBib290
cyBmaW5lIGFzDQo+Pj4+Pj4+PiAibmF0aXZlIi4NCj4+Pj4+Pj4+IFVuZm9ydHVuYXRlbHkg
d2hlbiBib290aW5nIGFzIGRvbTAgb24gWGVuLCBpdCBrZWVwcyByZWJvb3Rpbmcgdy9vDQo+
Pj4+Pj4+PiBoZWxwZnVsIGxvZy4NCj4+Pj4+Pj4gV2hhdCBhYm91dCBib290aW5nIFhlbiBv
biBiYXJlIG1ldGFsLCBpLmUuIG5vIEtWTSBiZWluZyBpbnZvbHZlZD8NCj4+Pj4+PiBUaGUg
c2FtZSBleGFjdCBwcm9ibGVtIGhhcHBlbnMgb24gSW50ZWwgU2ltaWNzLsKgIEFuZCBJIGdv
dCB0byBzZWUgaXTigJlzIGEgDQo+Pj4+Pj4gTlggcGFnZSBmYXVsdCBpbiBkb20wIGtlcm5l
bCBkdXJpbmcgYXBwbHkgYWx0ZXJuYXRpdmVzLg0KPj4+Pj4NCj4+Pj4+IEluIHdoaWNoIGNh
c2UgaXQncyBsaWtlbHkgdGhhdCB0aGVyZSdzIGFuIG9wZW5jb2RlZCBQVEUgdXBkYXRlLCBy
YXRoZXINCj4+Pj4+IHRoYW4gdXNpbmcgdGhlIGhvb2tzICh3aGljaCBhcmUgc3VpdGFibHkg
cGFyYXZpcnQnZCkuDQo+Pj4+DQo+Pj4+IEknZCBzdXNwZWN0IGEgYnVnIHdoZW4gTk9UIHVz
aW5nIDJNIHBhZ2VzIGZvciBleGVjbWVtLg0KPj4+Pg0KPj4+PiBJJ2xsIGhhdmUgYSBsb29r
Lg0KPj4+DQo+Pj4gQ291bGQgeW91IGhhdmUgYSB0cnkgdXNpbmcgIm5vaHVnZXZtYWxsb2Mi
IGRvbTAga2VybmVsIGJvb3QgcGFyYW1ldGVyPw0KPj4+DQo+Pg0KPj4gVHJpZWQgaW4gYSBL
Vk0gZ3Vlc3QsIHN0aWxsIHRoZSBzYW1lIHByb2JsZW0sIGFuZCBub3RoaW5nIG5ldyBpbiB0
aGUNCj4+IHNlcmlhbCBsb2cuDQo+IA0KPiBBdHRhY2hlZCBpcyBhIGRvbTAgbG9nIHdpdGgg
c3RhY2sgdHJhY2VzLg0KPiANCj4gQnV0IEkgcmVhbGx5IGRpZCBOT1QgY2hhbmdlIGFueXRo
aW5nIHRvIG1ha2UgaXQgaGFwcGVuLi4uDQoNClRoYW5rcy4NCg0KSSB0aGluayB0aGlzIG1p
Z2h0IGJlIHJlbGF0ZWQgdG8gWGVuIG5vdCBhZHZlcnRpc2luZyBYODZfRkVBVFVSRV9QU0Uu
DQoNClRoaXMgd2lsbCB1c2UgUEFHRV9LRVJORUwgcGFnZSBwcm90ZWN0aW9uIGZvciBleGVj
bWVtX2FsbG9jKCkgcGFnZSBwcm90ZWN0aW9uLA0Kd2hpbGUgd2l0aCBYODZfRkVBVFVSRV9Q
U0UgUEFHRV9LRVJORUxfUk9YIGlzIGJlaW5nIHVzZWQuDQoNCkZvciB0aGUga2VybmVsIChz
byBub3QgaW4gYSBtb2R1bGUpIHRoZXJlIGlzIG5vIGV4ZWNtZW1fcmVzdG9yZV9yb3goKSBj
YWxsDQppbnZvbHZlZCwgc28gdGhlIE5YIGJpdCB3aWxsIGJlIGtlcHQgZm9yIGtlcm5lbCBz
aWRlIElUUyB0aHVua3MuDQoNClBldGVyLCBjYW4geW91IGNvbmZpcm0gbXkgc3VzcGljaW9u
Pw0KDQoNCkp1ZXJnZW4NCg==
--------------gwFI2Ob0S3n1RsdEX0tyCX9W
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gwFI2Ob0S3n1RsdEX0tyCX9W--

--------------aufxzz2EZabiFunsrly3IoCP--

--------------OhnbcgBMWkOds7nYdwu8IC3O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg20BcFAwAAAAAACgkQsN6d1ii/Ey/r
3wgAn9lJds3ehHv9FTbDPAvIuG1IfNoW5xeCoTDJIwYSmZXBpHyj+hVM+sKwYdbg61kHyuXmg2GV
rXgDpN2zC4PVGFmg16LDZERel73Jt3hJAzbbakacEvHo/x4er41Yr6eQzL4jvKDUxf9TA68MrO/c
pNFkq6aJ3m67ab33ia/28p0sDKWJGSEiWWl/r7kaZtMhlhALxz6W/xeOX4Qc7XA5p46RimmWjLf7
4pgOAy++l20Wkqn5lKroGZR6OP0VvcaAcWPGcUdTncJKaXKnLsqMNLGohbNG0eEbG5sHsOFExVX6
1+3yAha4CkAnjjSfNxUdHJylAdLdS9jLUqJ+TYdzig==
=I3mL
-----END PGP SIGNATURE-----

--------------OhnbcgBMWkOds7nYdwu8IC3O--

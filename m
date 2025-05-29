Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE17253939
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498560; cv=none; b=VSTtLouwQYmr7Wti2yVqoRp//NAtlJ7+4/nt5EPMhwZOc2ILCaYI3rAxiqbStD2B1jAOlNMOz6KcSIoRaAmjbBIyasjs80ElcNIGsobuaBG7wvARbbzqMjdZgSDY9IbB/V+v08xbZG2P470WynlzbQRcYrI0TWmFDiSCSMZTcvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498560; c=relaxed/simple;
	bh=x9D5MvOYU/cGUL+hYqy3rtTA48BE5RGPI4gENqsVgTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+K47yEWKgXSDXBzov2+ltxTRcZQ3kdT1OKqtSdU5sDN+RSS/TyI/wAkfuIJz5EIizuby/eZSfKx2cH8YQiidqhDt0AnAe9e+MIe0K31WkPJjftfUr/rKzmM1JReeESsLLEjkKoWgDzsfnR3RceVu1umpypOL3M5uVyju3FLnQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QF1YpSI/; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QF1YpSI/"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so3620135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748498556; x=1749103356; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x9D5MvOYU/cGUL+hYqy3rtTA48BE5RGPI4gENqsVgTU=;
        b=QF1YpSI/lFN7OuzH1y0yLE1zw+1aSCn1pd1bYwz55YWrSVq1C2TXyifILoRFjwmbnz
         F0zXUreMNvdrqHirewpShhUW+Aj91ONmas3OekqV0NKbyp87gK/nWXcP2HxV+LTl1HJ7
         qvZN6TmZRPDxg3R2++rMW7+8bBTv1N2j2NhFBmREupJN+ac58rUFMtlcTYv9uX/rfgkk
         lfAuWhaakKg9lpqUjf4iKGGmEGR1kZOahnDfcGxjeiykRgRB42HaCJWl/3Iw99wTM1Y7
         XLtT0dl9sWuB5BIN7qKdy94N85ct/IDYslVqxKDmAB+sqtYh6emuqB69UgMJPswvWvhA
         06Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748498556; x=1749103356;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9D5MvOYU/cGUL+hYqy3rtTA48BE5RGPI4gENqsVgTU=;
        b=YI0fyYG2DHZqAZ4IJtAPzzJPKpjc/AJaNpLBvA9kkROux+NJ1jKz/LVIzRUBh8IeX2
         earbFeJbGwYuWhStcSb5RivfoY27HHt4hJpYQzrod9YoSqBNT+EAayCuYPEPbN0qhVap
         crx5S+xG6KVylSl2g8Ip6iXzXHRpk7vlq0U+CnJOkfetpOis+aD3gXYLoq28nQCyj1Z3
         DwsI6yIQC9RL03TUFCIyfO9FlCiIXT4rRV1zEHFXN2FlOG8jvP3B1DKq4f1+yNLXvr+u
         NKPIcprTVy/hRSWoi8gCV4N3h++FXSr+SS80wQINA4XfojXib8RojpBeIE8RSH1WdGF+
         cYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUruAknSGTE7B8PEUmi/NmzbUfcX421AkhKLRpJOy518OAAqLJ7DDZ4US8LuhF7qq4sqj7aauIKYxVYCLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/mVFt9e5EFF6GO4T6HDUyjh1KSZscsHCJvuqDmoC7GUBSco6
	TD1PdfYJGMgNT1AnscC9dtdikxMbrkz9qcAkQ+tDeSScbcSDwmt6XvdJ4diKS3Grk1k=
X-Gm-Gg: ASbGncvNzJOzbLIfF4UXLlsHkSUqrrDevDNmnJEWHrFdoGvGhA6BxF5B2jWSnYYWXwP
	ZiMxXXQVmbM4YJ472w7BiTfTWR9jIO3DzFteTDwhbAnBrIaimgjQkJFhCN3/ETUIt8uqgSqe0cU
	/THOyolAxcpywxg2Y2OawZvrBeUFCPAGZv63CMZP9r0kbNZztdbr70H6wU6hXBMsZTmo4XnecMK
	r33On4PoJxJ1Q/dkv+CQHxcO21l/GFtvSP4gld/C6qT3mdOtolD4Fhtj8TmOUX5rT+GTMct+nmw
	4CB1uvnpNXdpjB+E7XnT8OKoebdKaEbAuFYpqRgSJa9dqiI839MpBBe9FdPd9Fva6W5PEObK0uz
	VopDjho5PKdsls2MyXW4XUkcKHPUvB8CbiiM5AMdjiexcpj3DWNPcFnAgD6Ucg58GkEZre3V3Fe
	43
X-Google-Smtp-Source: AGHT+IHqbUinJ0D9cghSCiKMI3AUEO6v1DdKXCLfccepoXWIlKSEAG9vfO4kWFg0xInbNbweQUd8sw==
X-Received: by 2002:a5d:6304:0:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a4ec23dcd5mr3415845f8f.5.1748498556000;
        Wed, 28 May 2025 23:02:36 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc27c8dsm10113775e9.28.2025.05.28.23.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:02:35 -0700 (PDT)
Message-ID: <49f72564-827b-474d-b548-e035a27f882b@suse.com>
Date: Thu, 29 May 2025 08:02:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>
Cc: Xin Li <xin@zytor.com>, Zijlstra Peter <peterz@infradead.org>,
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
 <a71e7aba-759b-47aa-9170-a4045c52239a@suse.com>
 <20250528215318.6xkflhrrhcigmn3m@desk>
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
In-Reply-To: <20250528215318.6xkflhrrhcigmn3m@desk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6y90fv6F2uqgfk11piYu02zM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6y90fv6F2uqgfk11piYu02zM
Content-Type: multipart/mixed; boundary="------------T0DBToJg2q8iwVcYP0Zn4Fqb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>
Cc: Xin Li <xin@zytor.com>, Zijlstra Peter <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Zhang Tao1 <tao1.zhang@intel.com>
Message-ID: <49f72564-827b-474d-b548-e035a27f882b@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
 <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
 <1226c371-5d44-4206-973f-3c10152c4195@zytor.com>
 <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>
 <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
 <a71e7aba-759b-47aa-9170-a4045c52239a@suse.com>
 <20250528215318.6xkflhrrhcigmn3m@desk>
In-Reply-To: <20250528215318.6xkflhrrhcigmn3m@desk>

--------------T0DBToJg2q8iwVcYP0Zn4Fqb
Content-Type: multipart/mixed; boundary="------------BnTng00fqPAE4v0AXTpZZcBx"

--------------BnTng00fqPAE4v0AXTpZZcBx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDUuMjUgMjM6NTMsIEd1cHRhIFBhd2FuIHdyb3RlOg0KPiBPbiBXZWQsIE1heSAy
OCwgMjAyNSBhdCAxMToxOToxOUFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4g
T24gMjguMDUuMjUgMTA6NTcsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4gT24gMjguMDUu
MjUgMTA6MjYsIFhpbiBMaSB3cm90ZToNCj4+Pj4gT24gNS8yOC8yMDI1IDEyOjI3IEFNLCBY
aW4gTGkgd3JvdGU6DQo+Pj4+PiBPbiA1LzI3LzIwMjUgMTE6NDkgUE0sIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+Pj4gT24gMjguMDUuMjUgMDc6MTEsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6DQo+Pj4+Pj4+IE9uIDI3LjA1LjI1IDIxOjI5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
Pj4+Pj4+Pj4gT24gMjcvMDUvMjAyNSA4OjIxIHBtLCBYaW4gTGkgd3JvdGU6DQo+Pj4+Pj4+
Pj4+IE9uIE1heSAyNywgMjAyNSwgYXQgMTE6MzbigK9BTSwgSsO8cmdlbiBHcm/DnyA8amdy
b3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4g77u/T24gMjcu
MDUuMjUgMTk6NTQsIFhpbiBMaSB3cm90ZToNCj4+Pj4+Pj4+Pj4+IE9uIDUvMjcvMjAyNSAx
MDo0NiBBTSwgUGF3YW4gR3VwdGEgd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4+IEF0dGFjaGVkIGlz
IHRoZSBzZXJpYWwgY29uc29sZSBsb2cgYW5kIG15IGtlcm5lbCBjb25maWcuDQo+Pj4+Pj4+
Pj4+Pj4gU2VyaWFsIGxvZ3MgYXJlbid0IHRlbGxpbmcgbXVjaC4gSQ0KPj4+Pj4+Pj4+Pj4+
IGRvIG5vdCBoYXZlIGEgWGVuIHNldHVwIHRvIHRlc3QsDQo+Pj4+Pj4+Pj4+Pj4gd2l0aG91
dA0KPj4+Pj4+Pj4+Pj4+IFhlbiB0aGUgY29uZmlnIHRoYXQgeW91IHByb3ZpZGVkIGlzIGJv
b3RpbmcgYSBLVk0gZ3Vlc3QganVzdCBmaW5lLg0KPj4+Pj4+Pj4+Pj4gWWVhaCwgYXMgSSBy
ZXBsaWVkIHRvIEp1ZXJnZW4sIHRoZSBzYW1lIGtlcm5lbCBiaW5hcnkgYm9vdHMgZmluZSBh
cw0KPj4+Pj4+Pj4+Pj4gIm5hdGl2ZSIuDQo+Pj4+Pj4+Pj4+PiBVbmZvcnR1bmF0ZWx5IHdo
ZW4gYm9vdGluZyBhcyBkb20wIG9uIFhlbiwgaXQga2VlcHMgcmVib290aW5nIHcvbw0KPj4+
Pj4+Pj4+Pj4gaGVscGZ1bCBsb2cuDQo+Pj4+Pj4+Pj4+IFdoYXQgYWJvdXQgYm9vdGluZyBY
ZW4gb24gYmFyZSBtZXRhbCwgaS5lLiBubyBLVk0gYmVpbmcgaW52b2x2ZWQ/DQo+Pj4+Pj4+
Pj4gVGhlIHNhbWUgZXhhY3QgcHJvYmxlbSBoYXBwZW5zIG9uIEludGVsIFNpbWljcy4NCj4+
Pj4+Pj4+PiBBbmQgSSBnb3QgdG8gc2VlIGl04oCZcyBhIE5YIHBhZ2UgZmF1bHQgaW4gZG9t
MA0KPj4+Pj4+Pj4+IGtlcm5lbCBkdXJpbmcgYXBwbHkgYWx0ZXJuYXRpdmVzLg0KPj4+Pj4+
Pj4NCj4+Pj4+Pj4+IEluIHdoaWNoIGNhc2UgaXQncyBsaWtlbHkgdGhhdCB0aGVyZSdzIGFu
IG9wZW5jb2RlZCBQVEUgdXBkYXRlLCByYXRoZXINCj4+Pj4+Pj4+IHRoYW4gdXNpbmcgdGhl
IGhvb2tzICh3aGljaCBhcmUgc3VpdGFibHkgcGFyYXZpcnQnZCkuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IEknZCBzdXNwZWN0IGEgYnVnIHdoZW4gTk9UIHVzaW5nIDJNIHBhZ2VzIGZvciBleGVj
bWVtLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJJ2xsIGhhdmUgYSBsb29rLg0KPj4+Pj4+DQo+Pj4+
Pj4gQ291bGQgeW91IGhhdmUgYSB0cnkgdXNpbmcgIm5vaHVnZXZtYWxsb2MiIGRvbTAga2Vy
bmVsIGJvb3QgcGFyYW1ldGVyPw0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVHJpZWQgaW4gYSBL
Vk0gZ3Vlc3QsIHN0aWxsIHRoZSBzYW1lIHByb2JsZW0sIGFuZCBub3RoaW5nIG5ldyBpbiB0
aGUNCj4+Pj4+IHNlcmlhbCBsb2cuDQo+Pj4+DQo+Pj4+IEF0dGFjaGVkIGlzIGEgZG9tMCBs
b2cgd2l0aCBzdGFjayB0cmFjZXMuDQo+Pj4+DQo+Pj4+IEJ1dCBJIHJlYWxseSBkaWQgTk9U
IGNoYW5nZSBhbnl0aGluZyB0byBtYWtlIGl0IGhhcHBlbi4uLg0KPj4+DQo+Pj4gVGhhbmtz
Lg0KPj4+DQo+Pj4gSSB0aGluayB0aGlzIG1pZ2h0IGJlIHJlbGF0ZWQgdG8gWGVuIG5vdCBh
ZHZlcnRpc2luZyBYODZfRkVBVFVSRV9QU0UuDQo+Pj4NCj4+PiBUaGlzIHdpbGwgdXNlIFBB
R0VfS0VSTkVMIHBhZ2UgcHJvdGVjdGlvbiBmb3IgZXhlY21lbV9hbGxvYygpIHBhZ2UgcHJv
dGVjdGlvbiwNCj4+PiB3aGlsZSB3aXRoIFg4Nl9GRUFUVVJFX1BTRSBQQUdFX0tFUk5FTF9S
T1ggaXMgYmVpbmcgdXNlZC4NCj4+Pg0KPj4+IEZvciB0aGUga2VybmVsIChzbyBub3QgaW4g
YSBtb2R1bGUpIHRoZXJlIGlzIG5vIGV4ZWNtZW1fcmVzdG9yZV9yb3goKSBjYWxsDQo+Pj4g
aW52b2x2ZWQsIHNvIHRoZSBOWCBiaXQgd2lsbCBiZSBrZXB0IGZvciBrZXJuZWwgc2lkZSBJ
VFMgdGh1bmtzLg0KPj4+DQo+Pj4gUGV0ZXIsIGNhbiB5b3UgY29uZmlybSBteSBzdXNwaWNp
b24/DQo+Pg0KPj4gSSBqdXN0IG1hZGUgYSBzbWFsbCB0ZXN0IG9uIG15IChyYXRoZXIgb2xk
KSBzeXN0ZW06DQo+Pg0KPj4gSSB2ZXJpZmllZCB0aGF0IGtlcm5lbCA2LjE1IGlzIGJvb3Rp
bmcgZmluZSBhcyBYZW4gZG9tMCAoSVRTIG1pdGlnYXRpb24NCj4+IG5vdCBuZWVkZWQgZHVl
IHRvIG9sZCBjcHUpLiBUaGVuIEkgbW9kaWZpZWQgYWx0ZXJuYXRpdmUuYyB0byBhcHBseSB0
aGUNCj4+IElUUyBtaXRpZ2F0aW9ucyBuZXZlcnRoZWxlc3MsIHdoaWNoIG1hZGUgdGhlIGtl
cm5lbCBjcmFzaCBhcyBYZW4gZG9tMC4NCj4+DQo+PiBXaXRoIHRoZSBmb2xsb3dpbmcgYWRk
aXRpb25hbCBtb2RpZmljYXRpb24gYm9vdCB3YXMgd29ya2luZyBhZ2FpbjoNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0vaW5pdC5jIGIvYXJjaC94ODYvbW0vaW5pdC5jDQo+
PiBpbmRleCBiZmE0NDRhN2RiYjAuLmZhYzRmOWQyNjEzMiAxMDA2NDQNCj4+IC0tLSBhL2Fy
Y2gveDg2L21tL2luaXQuYw0KPj4gKysrIGIvYXJjaC94ODYvbW0vaW5pdC5jDQo+PiBAQCAt
MTA5MCw3ICsxMDkwLDcgQEAgc3RydWN0IGV4ZWNtZW1faW5mbyBfX2luaXQgKmV4ZWNtZW1f
YXJjaF9zZXR1cCh2b2lkKQ0KPj4gICAgICAgICAgICAgICAgICBwZ3Byb3QgPSBQQUdFX0tF
Uk5FTF9ST1g7DQo+PiAgICAgICAgICAgICAgICAgIGZsYWdzID0gRVhFQ01FTV9LQVNBTl9T
SEFET1cgfCBFWEVDTUVNX1JPWF9DQUNIRTsNCj4+ICAgICAgICAgIH0gZWxzZSB7DQo+PiAt
ICAgICAgICAgICAgICAgcGdwcm90ID0gUEFHRV9LRVJORUw7DQo+PiArICAgICAgICAgICAg
ICAgcGdwcm90ID0gUEFHRV9LRVJORUxfRVhFQzsNCj4+ICAgICAgICAgICAgICAgICAgZmxh
Z3MgPSBFWEVDTUVNX0tBU0FOX1NIQURPVzsNCj4+ICAgICAgICAgIH0NCj4gDQo+IEkgYW0g
bm90IHN1cmUgaWYgcmV0dXJuaW5nIGEgUldYIHBhZ2UgcG9zdC1ib290IGlzIGEgZ29vZCBp
ZGVhLg0KDQpPVE9IIHVzaW5nIGEgbm9uLWV4ZWN1dGFibGUgcGFnZSBmb3IgY29kZSBpc24n
dCBhIGdvb2QgaWRlYSBlaXRoZXIuIDotKQ0KDQpJIGhhdmUgdHJpZWQgdG8gYWRkcmVzcyB0
aGF0IHdpdGggdGhlIHNlcmllcyB0byBiZSBmb3VuZCB1bmRlcjoNCg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDI1MDUyODEyMzU1Ny4xMjg0Ny0xLWpncm9zc0BzdXNlLmNv
bS8NCg0KDQpKdWVyZ2VuDQo=
--------------BnTng00fqPAE4v0AXTpZZcBx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------BnTng00fqPAE4v0AXTpZZcBx--

--------------T0DBToJg2q8iwVcYP0Zn4Fqb--

--------------6y90fv6F2uqgfk11piYu02zM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg3+HoFAwAAAAAACgkQsN6d1ii/Ey+y
AQgAkW/UWzQB6t2XGPILpjezoMBAng3VXkKBwn4Rpy8YzF8uZeKwCea0bA0OBo41/yfFUxXUyOhb
KGQXsC7lWlrg56yS8JUfXK1zu2KfSb5lSdDtGwaeFlBeAC72CMd0iiBPD1+iD7hv39A4YAX9PRvM
0Hh9uUlWqRjEO1wzSS9wehIAg8wWKo6tjdykOU8U1dJ+vswQ6Uxck5Y2LZsrQR5QDXkc5rnWVRhb
W0fq2cEaQtMR5cTmMREmz4B4VUrb0MwLeRoSp+FalGEQwR3L3qoXyo+6uqVmRvpo+NaouS8PFwiw
4uqVGqxmHmhjwaYXw6Hs5Y9PTyTHzAyO+6b5Ko1HqA==
=JH+0
-----END PGP SIGNATURE-----

--------------6y90fv6F2uqgfk11piYu02zM--

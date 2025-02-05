Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04F22A4E5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750043; cv=none; b=Z27okAqxkcPpIMfTIzQjp6GSvOLshylRmlmtCmYuEOLVEkQGIzV6wXDHm4Y/dwqxCikxmgEzVinRm0qxUTiUFQr1/0XtU7wSkqNJGH+poKZ8FXSMAxyY/3dpFS3ZnUqNwMbueqEaYVSMU2alKEHhjsW9dGMqn+lFhTCdXv1G4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750043; c=relaxed/simple;
	bh=xDqkv78Z4VKlEoX0OV/Gq1LIs7usdjD9zT1QQXDxqgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYesmu/GcxaDAd+UhaDDicwsavZprKCJd2/SG99gExEXTli6JMMoiydJX4N4gY42Gkovh9dJnEvv0rQd5vR9FOr66a9tjxo+wHC+qwyPnkl+ZJum1P6kL5+3nNFT8/HHcoMfoZw0H3TF2jDPtSJ6vi36VvVEU6qIRYzacDdNNN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LRcJ6tbw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LRcJ6tbw"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaeec07b705so1099534566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738750040; x=1739354840; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xDqkv78Z4VKlEoX0OV/Gq1LIs7usdjD9zT1QQXDxqgc=;
        b=LRcJ6tbw/Gfs3uPi+Z4IBJrENFqn8G1pkF4QnY4ImrWuEAOAItS5LEHTvTpHh1uoWV
         Phv25Qvpdf62Bw16lG+25kkLIC5eFDDpVOKdeqpHO6kD/cVdPJ+4jtQcdfyqGkxVlCfp
         2kBHWT6GVKFTfsaDELV7DD3hqVmtcdQpj+o1Ly6RLdSSYKGgwGdnoSNiCQkGy5KZ6g6L
         kfYOMmuVIiZTF8fPqJt++9g5ZckreSZ2Cm/h9Qwe2cHEg/bwbyvbyTRVvOitDRZtMJpn
         t2LKzkxdmaQ5cKASIPGNmAcU85CH08fj0I/V1sG93Y6ygaov/vmqHbHW9tg3uK7JbDDQ
         Xpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750040; x=1739354840;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDqkv78Z4VKlEoX0OV/Gq1LIs7usdjD9zT1QQXDxqgc=;
        b=j2HtfWWfozx9p5Y0MZ7BKb1xGmLQSnBGaNU5gXarV6lvIJ1FanlMdNXFrzspqhqN+3
         0HzLYNv1uTDA10flCb1fx21Dx86t9ZGwpbH1aDGWipEcaThPtGHSwn3KcOMBatEwUJP6
         u3JAy3nYoaQcJOhlDeFPSth/81MNbJKlcTPb6wpK8bcV7veLtC3SmDBeMHh6DnndnXji
         8zV8IJjeHDKHXLR8zN7gzx3O2uJpY/M0DAHp57LngArLp5bUKCHLi3vNEbujHGkHVK9T
         mBRTYWgii2h0jBwFgvRJeSKOxmyBvU+w6mngB8arZgqBMqoU91yojkkkZ6KifnTC+/IU
         FQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXLncPotnwc8NFpsB+jf5xbi7JstS1zrGvaNzLMj70U6gD6U70Ddih0DgZiure6ST2PIBgcc3L3QU6f5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwypfnzezyK5KrrfxILpXez0M8V7pcJRwNWnVIOPe3NzoyoKl4z
	IvoGCjkHV4D8NsP8r7hk+LQDKgxVfSKszOI5kO7SnpIUBvQnHYILfxX9tYi1IBw=
X-Gm-Gg: ASbGncu5Kuo23MtXvwi8rIWsNbUSxxKHc8e2n2knEExrJXCPW988sXNSwDlxocX8O5T
	kGPgKMy7cuFFaVc8R9OoMGqH027CEt7Rb6WLf1UefN4FIl8tLIZCM73VsmvHnofflWvuBQ8wNEo
	V7POLKCAp2uAacw/3Ac8P7mMooBCAhV5hc3Ij7vOvGw9OIeG7Erzz1aniDjqGK0BAP9j7hGX2hi
	bUyDI78/qUPn54KARXvqJSdcjGvBDkeI/1rKWB0VlLak+qwBxIHovByloYmdEPvqV91SJDKBCIj
	33YbTggfIdXjwmnDx0a3SKLNL2ZcQkhSXYkO/MyP10UAKXF43CvyArd73L5lFUwYQfVM7wK+8un
	WOtzUMVTWy+M8yLub+h29ouqQzJqyVl0a9Y1tdA==
X-Google-Smtp-Source: AGHT+IEgbg4/gh5dYIQJjmoAudPWZKM8WAGDorx761jOgtXKUkMAtOVR3jzF6tIE3s9ctNTtKdD46Q==
X-Received: by 2002:a17:906:4092:b0:ab7:6235:594d with SMTP id a640c23a62f3a-ab7623564c0mr135357466b.41.1738750039772;
        Wed, 05 Feb 2025 02:07:19 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef? (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de. [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a81adsm1066406866b.36.2025.02.05.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:07:19 -0800 (PST)
Message-ID: <3eff3975-ace9-4e09-b160-4330b9695e4c@suse.com>
Date: Wed, 5 Feb 2025 11:07:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20250205091056.17796-1-jgross@suse.com>
 <0b094f98-401b-4af6-be41-6cfe1bd91560@suse.com>
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
In-Reply-To: <0b094f98-401b-4af6-be41-6cfe1bd91560@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XxxnyBp1eDAW7yn5i9E9Alz4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XxxnyBp1eDAW7yn5i9E9Alz4
Content-Type: multipart/mixed; boundary="------------VpJX8h6sbYwqajezu80uQj8r";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <3eff3975-ace9-4e09-b160-4330b9695e4c@suse.com>
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
References: <20250205091056.17796-1-jgross@suse.com>
 <0b094f98-401b-4af6-be41-6cfe1bd91560@suse.com>
In-Reply-To: <0b094f98-401b-4af6-be41-6cfe1bd91560@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------VpJX8h6sbYwqajezu80uQj8r
Content-Type: multipart/mixed; boundary="------------imzL8DZzNZb3kqaqoUbDgxfa"

--------------imzL8DZzNZb3kqaqoUbDgxfa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDIuMjUgMTA6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wMi4yMDI1
IDEwOjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4geGVuX2h5cGVyY2FsbF9odm0oKSwg
d2hpY2ggaXMgdXNlZCB3aGVuIHJ1bm5pbmcgYXMgYSBYZW4gUFZIIGd1ZXN0IGF0DQo+PiBt
b3N0IG9ubHkgb25jZSBkdXJpbmcgZWFybHkgYm9vdCwgaXMgY2xvYmJlcmluZyAlcmJ4LiBE
ZXBlbmRpbmcgb24NCj4+IHdoZXRoZXIgdGhlIGNhbGxlciByZWxpZXMgb24gJXJieCB0byBi
ZSBwcmVzZXJ2ZWQgYWNyb3NzIHRoZSBjYWxsIG9yDQo+PiBub3QsIHRoaXMgY2xvYmJlcmlu
ZyBtaWdodCByZXN1bHQgaW4gYW4gZWFybHkgY3Jhc2ggb2YgdGhlIHN5c3RlbS4NCj4+DQo+
PiBUaGlzIGNhbiBiZSBhdm9pZGVkIGJ5IG5vdCBtb2RpZnlpbmcgJXJieCBpbiB4ZW5faHlw
ZXJjYWxsX2h2bSgpLg0KPj4NCj4+IEZpeGVzOiBiNDg0NWJiNjM4MzggKCJ4ODYveGVuOiBh
ZGQgY2VudHJhbCBoeXBlcmNhbGwgZnVuY3Rpb25zIikNCj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICBhcmNoL3g4Ni94
ZW4veGVuLWhlYWQuUyB8IDMgKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVu
L3hlbi1oZWFkLlMgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUw0KPj4gaW5kZXggOTI1MjY1
MmFmZTU5Li40Mzc4YjgxN2VkMzIgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3g4Ni94ZW4veGVu
LWhlYWQuUw0KPj4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMNCj4+IEBAIC0xMTcs
OCArMTE3LDcgQEAgU1lNX0ZVTkNfU1RBUlQoeGVuX2h5cGVyY2FsbF9odm0pDQo+PiAgIAlw
b3AgJWVieA0KPj4gICAJcG9wICVlYXgNCj4+ICAgI2Vsc2UNCj4+IC0JbGVhIHhlbl9oeXBl
cmNhbGxfYW1kKCVyaXApLCAlcmJ4DQo+PiAtCWNtcCAlcmF4LCAlcmJ4DQo+IA0KPiBUaGVy
ZSdzIG5vIG1lbW9yeSBhY2Nlc3MgaGVyZSwgYnV0IC4uLg0KPiANCj4+ICsJY21wIHhlbl9o
eXBlcmNhbGxfYW1kKCVyaXApLCAlcmF4DQo+IA0KPiAuLi4geW91IG5vdyByZWFkIGZyb20g
bWVtb3J5IGhlcmUuIFRoYXQgY2FuJ3QgYmUgcmlnaHQuIEFmYWljdCB0aGUgb3JpZ2luYWwN
Cj4gdXNlIG9mIExFQSBuZWVkcyB0byBzdGF5LCBqdXN0IHdpdGggYSBkaWZmZXJlbnQgc2Ny
YXRjaCByZWdpc3Rlci4NCg0KT2gsIHJpZ2h0LiBUaGFua3MgZm9yIG5vdGljaW5nLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------imzL8DZzNZb3kqaqoUbDgxfa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------imzL8DZzNZb3kqaqoUbDgxfa--

--------------VpJX8h6sbYwqajezu80uQj8r--

--------------XxxnyBp1eDAW7yn5i9E9Alz4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmejOFYFAwAAAAAACgkQsN6d1ii/Ey/o
dQf/SGa2i+YR36p0MBaVh1whjl46nYRUBvGG0a7F6H0QgQRnlVUgOHIX2uENKfysq090s4QbvCPb
q1JRu6n9YXHAbQlTYZ9F88WEq/7d59ZdFOd4CSVEqbfUFS3Js/yNjTXYIetgKZuI59iwwdv93eYQ
7a91fSltyjz6I+65sHMsAr3b9j8tph9TvCMJ/T9enslkLBqs1Rw0Tt7XpKXRQpbQ8Ubl156dXIvM
lRRKhPHAc+/8G6RA67fQI7QA4AfdFch8m41yUrSjtm77nuc8ttCZN79JnyFn/VOmg6HBhuhqFHuv
eHUJ9xyGiYYc3jDqMjroqXGUiTXpcmegYqw6fKb+GQ==
=/5pX
-----END PGP SIGNATURE-----

--------------XxxnyBp1eDAW7yn5i9E9Alz4--

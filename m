Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4B183CCA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088516; cv=none; b=teJ0dEtEgxsbyC3OOe4iJM03LLAEM+tjhhOsIt7kEeUu+7HODeoukPTfDN/v5lah9nNzpg9rOO59ArLA1lwQfPMA4N/ipLLa/OM5yxWhn5adAX/6RUTfkm11AUescMn/7qtp8ZtPKIuH+dd4KXV3I9twSyB7SJBsK/QtegPd6oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088516; c=relaxed/simple;
	bh=GkNJZHek8XfuitHyBly5Gsm9APU+n6nuuPG6ntgzBCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dp3JxbXVl8Mt/7WuVgptijz/3F5EUN4KGC5ihWK7CLpj2QHEI0NKT84+uwEeJ7LqILMUZ/31R3hdVX6W8tOWWoz0/StnkN+2Mtug5zXi1Rgqd9eFtCfRadVHyfSuetloVMsceUz2xsi2nkBzmZfi+tb1ijIzeR/KR71u1SEGBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fbNip6Oa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fbNip6Oa"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbb12bea54so221303466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743088513; x=1743693313; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GkNJZHek8XfuitHyBly5Gsm9APU+n6nuuPG6ntgzBCg=;
        b=fbNip6OauSmrXmi72yvw6JT6jCbE9Zoi+FgeuEYI1uTWxLn6x5L1IhpivHg6VN4o0G
         fcbsOGAGXx+z9Cod93CqvcNhd7HtCN4eaFQHtmtuuH7Epn4cLI55eDo4IyBiTdSXAabq
         EzU3InZoGF2b3XU1lNhBCSux0qUmpVClvCgqkIeQsFVRKDQlpMTVIBl7HzTsv7dk4c7W
         a936K+HJVdWF7UQfYU3dt/6Jodtma8i3SZohiBa++XySSc4LRTNqq3YtvNKkgbQSX7+3
         nmUkrri4JSL6G8r7GzD2ys0RD4ApSbAdaitLQ61hqLL0S1fUFRPR6CGujvNnP0pLXAmn
         SOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088513; x=1743693313;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkNJZHek8XfuitHyBly5Gsm9APU+n6nuuPG6ntgzBCg=;
        b=PY1h7eISyIlFuOqaHzmsHA9tKNGlPjP0+A8WMgAn7GEJc7DpZlV1x5jjS2mSnX6Wyo
         +0rCmkZRp/PVADngdg362A/pCiJ4KXXSIhmy/haH7pd7u7/juDwE1OnQ3mbYEP8cgkMS
         7OlpXTK5C1RFwJ3TuSnqe7MysRdK78T3BndGmwbmOFEup6SjMHxvzJbCGi7Y1gc4hCpD
         0ZyQ5Zrt0SKE+w/4Umon0x/LelyJ/BbaCiHdIF+GUuZVKv+0ebYxsBk0USQaWXIbQRhP
         E46QprVOImKCFucsK5TQCrTBswCItSwhkH+0GKJzUsDUFFF5fURdkWmiMzk/RGdcoAfy
         e/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1kKQgUHPtKkwrcqhh5GGCRStwzA0p8BKfM2fAVnXqh1pNfl/KjvEjv/D8nR3juBP+xGypZu3vOBOYPlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCRFy+3/QYQrL0qNKGzKmrMfLRDH8APDBugsAC9xSlqJ3XHtn
	1IO0DAErk58CzTt8eH+UBGiOS2r9gYtST2KAJzzKLovF8Rz4vjCOkigQUCHZr4g=
X-Gm-Gg: ASbGnctUKY9tf2l2N1fuav1AM790/P1zle1fMazaZ6UdO0EN0weUOoALfdSHz0u0Z3f
	0WOcZlR/03XDWY208bBSN267sme4vJt8pU1XCiIMVKuOP5FevQuq9lStsOngEO1z9AD5Wfn0dVD
	5e5+s5/BdU9gPD1EP6m5uEp2IF7zNfvyWFlCRxP1Ehvmccyqhe+TZZjfYeYDChW2fUVzjNGCnXP
	HmRlH+r3RRRAVP+D2v3LB/Mg6jgoUokypPJ82brWiXtAPYIiWZK6je4C2DW/Wy+ciaBQvaRfH72
	8jWNX+f4vkt+Gc7RzsiJYSIsz4uNTVL/sPuObZ09Co1d9lPLpBBMs4DX5rHVzBAwYS7NOdPTLLm
	lxTyBmJ8/PxklNQqLC+RLVXWFzObqZqaSxXyspvz2+kEBcUcCNMTGXG8JF4UrV3aIw5x1vQ==
X-Google-Smtp-Source: AGHT+IEkApm8yNidspVYstugFwOO9NlyiSTzbGVe3MbYuI7J03VXQZ4Nnik9aaMIefkw4gN+zzpXIw==
X-Received: by 2002:a17:907:6e90:b0:ac2:b1e2:4b85 with SMTP id a640c23a62f3a-ac6fae493e7mr364118266b.3.1743088512943;
        Thu, 27 Mar 2025 08:15:12 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f286sm5560266b.89.2025.03.27.08.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:15:12 -0700 (PDT)
Message-ID: <a8d89245-bcd2-41a7-9543-e517766900ba@suse.com>
Date: Thu, 27 Mar 2025 16:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
To: Borislav Petkov <bp@alien8.de>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
 xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel test robot <lkp@intel.com>,
 x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
 <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
 <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
 <20250327144012.GAZ-VjTB935oZS3RLa@fat_crate.local>
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
In-Reply-To: <20250327144012.GAZ-VjTB935oZS3RLa@fat_crate.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WyB9pPa1dFirzbUVCW9ii3ZB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WyB9pPa1dFirzbUVCW9ii3ZB
Content-Type: multipart/mixed; boundary="------------CJ0lw75FPtPlDZ9wPApckARh";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
 xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel test robot <lkp@intel.com>,
 x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Message-ID: <a8d89245-bcd2-41a7-9543-e517766900ba@suse.com>
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
 <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
 <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
 <20250327144012.GAZ-VjTB935oZS3RLa@fat_crate.local>
In-Reply-To: <20250327144012.GAZ-VjTB935oZS3RLa@fat_crate.local>
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

--------------CJ0lw75FPtPlDZ9wPApckARh
Content-Type: multipart/mixed; boundary="------------aWqa902aUtSH0VQhJrurSVcc"

--------------aWqa902aUtSH0VQhJrurSVcc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDMuMjUgMTU6NDAsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gVGh1LCBN
YXIgMjcsIDIwMjUgYXQgMDM6MjE6NDVQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToN
Cj4+IFdlbGwsIHRoYXQgaXMgd2FzdGluZyBuZWFybHkgM2tCIG9mIHRoZSBkYXRhIHNlY3Rp
b24uDQo+Pg0KPj4gTWF5YmUgbm90IGEgYmlnIGRlYWwsIGJ1dCBzdGlsbC4uLg0KPiANCj4g
V2UgY291bGQgZG8gaXQgdW50aWwgdGhlIHByb3BlciBmaXggaXMgaW4gcGxhY2UsIG5vPw0K
PiANCj4gM0sgaXMgbWVoLCBlc3BlY2lhbGx5IGZvciB0aGUgaHlwZXJ2aXNvciBrZXJuZWws
IEknZCBzYXkuLi4NCj4gDQoNClllYWgsIHRoYXQgd2FzIG15IHRoaW5raW5nLg0KDQpBbm90
aGVyIGFwcHJvYWNoIGNvdWxkIGJlIHRvIGhhdmU6DQoNCi1zdGF0aWMgREVGSU5FX1BFUl9D
UFUoc3RydWN0IG1jX2RlYnVnX2RhdGEgKiwgbWNfZGVidWdfZGF0YSkgPQ0KLQkmbWNfZGVi
dWdfZGF0YV9lYXJseTsNCitzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IG1jX2RlYnVn
X2RhdGEgKiwgbWNfZGVidWdfZGF0YSk7DQoNCmFuZCB0byB1c2UgYW4gaW5saW5lIGFjY2Vz
cyBmdW5jdGlvbiByZXR1cm5pbmcgJm1jX2RlYnVnX2RhdGFfZWFybHkNCmlmIHRoZSBwZXJj
cHUgdmFyaWFibGUgaXMgTlVMTC4gVGhpcyBhY2Nlc3MgZnVuY3Rpb24gY291bGQgYmUgX19y
ZWYuDQoNCkl0IGlzIGEgZGVidWcgZmVhdHVyZSBhZnRlciBhbGwsIHNvIGhhdmluZyBhIGZl
dyBhZGRpdGlvbmFsIGluc3RydWN0aW9ucw0KaXNuJ3QgdGhlIGVuZCBvZiB0aGUgd29ybGQu
DQoNCg0KSnVlcmdlbg0K
--------------aWqa902aUtSH0VQhJrurSVcc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------aWqa902aUtSH0VQhJrurSVcc--

--------------CJ0lw75FPtPlDZ9wPApckARh--

--------------WyB9pPa1dFirzbUVCW9ii3ZB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfla38FAwAAAAAACgkQsN6d1ii/Ey/8
XQf/VuZDki7mxoyRcTTEftF2yQZvJFGeGNCsPhZBVyVnNq7DscBOp09xfEq5yiC/ih+m1seLDvRe
JS+hJrnY2dgS9/JL8v3dAyFLlkHJ90Up6H+u5prm3wk51xgxFdjpMs8OM0+KGcK+UWC6WQQ7HsrX
v/AEeR+RcW1Oc0dAjINOZkoNr10g4uUqNJnfDgIB+9Bo2RifLxGwCZG3XFx2fudd/g3WliJYBWNv
OW2FkJkE+lp84XXYkpzrq766XtjGnnk8PM6vgV/pf09ZZesTki4LenfRM9U3wVm5/4F1ZugNUMVN
BT/P9gWSLjJxHR2pUiiAT0TQxcDAHogdBKBs0cAzDw==
=9ibx
-----END PGP SIGNATURE-----

--------------WyB9pPa1dFirzbUVCW9ii3ZB--

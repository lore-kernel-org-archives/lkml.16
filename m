Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2EE2566CF;
	Thu, 17 Apr 2025 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744915240; cv=none; b=AYjhMoD4WqZhRV35ngAbAGRziAxPbljSDRjCPPit+SO+yp6rKTOycjCGr1H6Hcb4b/5GYOh5mVlTjxsMc1LgR4tMZILgGMyRfwQmdc+3Ka9pQEwUF+g7RjU9/5Vuu9qjF1M/MZvOrhrC1zkb47dCz3RS87Ya2bMjCT3IgOwIFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744915240; c=relaxed/simple;
	bh=phQHYai+8w3V/h695X+78EB/wpe3P53UQdp1xEFlryc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pltbtLpP8VNNTqvzIAzbNmaFGyAkIVuyVE8x+XuGMnrlrfRdMKIOc7P+ZXluRCxZXOnMhxDyqcfunLV1IERJvroeTf/J+OSFlTsWV8/Fmu517hZ9DHTo9EHyAKMSr0PvjwMhT2IgLkp/fvEFP814JuDkg4tTdXPFqv6haHHT9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2FZoojk; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2FZoojk"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a6347494so192738a91.3;
        Thu, 17 Apr 2025 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744915237; x=1745520037; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AJXFv/uh2CkmNYOfLVF+jSs12YduHnlm2R0/XL3XVAc=;
        b=M2FZoojkhpJfJBpKG3DQN3jSgJuh5I7E69rMBo0LPLiO7tqLBGHCwmCibK/sEPe/At
         SnXUO7endYeG01r7s0IkyVNchQsPHT7rParvPY3DBTzwLKR1bJa9Ub8VagiuCYA6ZQdD
         nbWcGIBCptFYgh49JEGy87XUdpNoc7LupWCqWPBLbkfmDwLe6hWv5/P8wORm4wtVrdr0
         oyeoU4JK5nrG55c3couFfP1j2BT2LwM9jH7FTCvCdLJObwQXu9xpA1I3PmaBHunKxD4m
         eVatYC7BHUj1sy6ryqtLaBsv4v6Ct/ZTSyzeIPxs5M+PfSrR6YIpsPnonVnldLOWjQ6R
         vl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744915237; x=1745520037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJXFv/uh2CkmNYOfLVF+jSs12YduHnlm2R0/XL3XVAc=;
        b=VGiOuTMiLtvLH1WGCw9GtX5uVEJfIXiyQR4FrHJOOaXs98OUJ/WvpHFJInvXpLwTTT
         /On1vb5/dDubED7Z8pWbIL/vnR7PDegrTH6lM+77VftIdK7Vrxf+SxfUBzxgNcXPlRBu
         vrRWWdg1i9ehqNrbAc0+HCJrwtxUw8kXWUWVZR6ARofk+O96q5E5Z9xRxQtex0Gx73M8
         NYy0UIXfJECfAfFgJ6CrXYTZU/72Y3Qpsf8t5tTW4oqBzIAZ5/HOaIIzR7ZU3sYIhhlo
         8Wff6zvPFT9ardINrNX4oU/guhawlOALirqyH/osKKUwRrG5sw+Xvz6C2eEx2EeJnkf8
         dcDw==
X-Forwarded-Encrypted: i=1; AJvYcCVSPmQOVlnXM7hA4Vkc7ssc+CI2CZJoqXj8bLIoBk3bvrIhduBaxNo3OFx/CJxOix3rU7j6k5MQEJ2VlXpDg0o=@vger.kernel.org, AJvYcCX3JFNmbM+dGJUj4t2YrdnpdgUzv4yM0PZkIuixVGtpABKVR/qdtkkF+nVy9oJHIeBTHXQo1dN42Ovdww8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLX/UhfhDBbOEcOhXj7Lk4gU+4uePsqXojCchJQZ1L4z4UtI8B
	eCDz/rNHrN8ebgFjWKHiUdghoPEQhneKxvr2+sQDzFFD4yuCGGHnmkSsyxGblXJR1oDX9QKHLkY
	fNdduxnOxQc4g7/cWDNgjEAGiTNk=
X-Gm-Gg: ASbGncuW7Irl2SnTmUUWHP7K87ejQMhzTlSqKsnDhMGCGZfhHlqF+rcklp9oXfJpteA
	bl1xB54PekUKTmKC3MMQ2/wlR0oyJNgkhRBiOyetTupeCmJPVTAA6qJlZmmLIz5NpWsRkGbgsCX
	ikasoCWAziibK8fqxik1FT6w==
X-Google-Smtp-Source: AGHT+IH8aEonqKPoSyA9bIyV8LFkUk4EhzfTy08nmIpoOn6HXaWivtFYQGpywzxjlcRLvwBouWFibvp1JymiFrFtnJY=
X-Received: by 2002:a17:90b:38cc:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-3087bb3f2c3mr34484a91.2.1744915237717; Thu, 17 Apr 2025
 11:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net> <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net>
In-Reply-To: <20250417081818.GJ38216@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Apr 2025 20:40:24 +0200
X-Gm-Features: ATxdqUFjllzBrLR26e1HbjrffvuB-1hcrLPaeoQhX8sCVVDtZwVcoE8SgPj4-eM
Message-ID: <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: multipart/mixed; boundary="000000000000e86c9a0632fdbc8b"

--000000000000e86c9a0632fdbc8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 10:18=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> Urgh, yeah, reading hard :-/
>
> OK, Ack

Thanks Peter (and Kees for clarifying) -- not sure how you/others
prefer to route this patch or if you expect a v2, but I got the
following (attached). I converted your Ack.

Cheers,
Miguel

--000000000000e86c9a0632fdbc8b
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-x86-Kconfig-make-CFI_AUTO_DEFAULT-depend-on-RUST-or-.patch"
Content-Disposition: attachment; 
	filename="0001-x86-Kconfig-make-CFI_AUTO_DEFAULT-depend-on-RUST-or-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m9lpbbt90>
X-Attachment-Id: f_m9lpbbt90

RnJvbSAyYzY2MzZjODJmOGM2YzE4ZTE4YzA4NWZlNjlkMGNkM2RiZTNiOTkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/UGF3ZT1DNT04Mj0yMEFuaWtpZWw/PSA8cGFu
aWtpZWxAZ29vZ2xlLmNvbT4KRGF0ZTogVGh1LCAxMCBBcHIgMjAyNSAxMTo1NDoyMCArMDAwMApT
dWJqZWN0OiBbUEFUQ0hdIHg4Ni9LY29uZmlnOiBtYWtlIENGSV9BVVRPX0RFRkFVTFQgZGVwZW5k
IG9uICFSVVNUIG9yIFJ1c3QgPj0KIDEuODgKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKCkNhbGxpbmcgY29yZTo6Zm10Ojp3cml0ZSgpIGZyb20gcnVzdCBjb2RlIHdoaWxlIEZpbmVJ
QlQgaXMgZW5hYmxlZApyZXN1bHRzIGluIGEga2VybmVsIHBhbmljOgoKWyA0NjE0LjE5OTc3OV0g
a2VybmVsIEJVRyBhdCBhcmNoL3g4Ni9rZXJuZWwvY2V0LmM6MTMyIQpbIDQ2MTQuMjA1MzQzXSBP
b3BzOiBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzFdIFBSRUVNUFQgU01QIE5PUFRJClsgNDYxNC4y
MTE3ODFdIENQVTogMiBVSUQ6IDAgUElEOiA2MDU3IENvbW06IGRtYWJ1Zl9kdW1wIFRhaW50ZWQ6
IEcgICAgIFUgICAgIE8gICAgICAgNi4xMi4xNy1hbmRyb2lkMTYtMC1nNmFiMzhjNTM0YTQzICMx
IDlkYTA0MGYyNzY3M2VjMzk0NWUyM2I5OThhMGY4YmQ2NGM4NDY1OTkKWyA0NjE0LjIyNzgzMl0g
VGFpbnRlZDogW1VdPVVTRVIsIFtPXT1PT1RfTU9EVUxFClsgNDYxNC4yNDEyNDddIFJJUDogMDAx
MDpkb19rZXJuZWxfY3BfZmF1bHQrMHhlYS8weGYwClsgNDYxNC4yNDY2MjFdIENvZGU6IGM2IDE1
IDhkIGFkIGFjIDQ4IDBmIDQ0IGYxIDQ4IDhkIDA0IDgwIDQ4IDhkIDE0IDQ1IGQwIDM3IDQyIGFj
IDQ4IGM3IGM3IDIyIDk5IGJiIGFjIGU4IDlmIDdhIDA1IDAwIDBmIDBiIGViIDlhIDY3IDBmIGI5
IDQwIDEyIDwwZj4gMGIgY2MgY2MgY2MgY2MgNjYgMGYgMWYgMDAgNDEgODEgZWEgMDAgMDAgMDAg
MDAgNzQgMDMgMGYgMGIgOTAKWyA0NjE0LjI2NzYwNl0gUlNQOiAwMDE4OmZmZmZiOTVhY2ZhNGI5
NzggRUZMQUdTOiAwMDAxMDA5NwpbIDQ2MTQuMjczNDY0XSBSQVg6IDAwMDAwMDAwMDAwMDAwNTcg
UkJYOiBmZmZmYjk1YWNmYTRiOWI4IFJDWDogM2ZmMWM4MTNjYjU3NjMwMApbIDQ2MTQuMjgxNDI2
XSBSRFg6IGZmZmY5YTUwYjc5MmI4ZDAgUlNJOiBmZmZmOWE1MGI3OTFkNTQ4IFJESTogZmZmZjlh
NTBiNzkxZDU0OApbIDQ2MTQuMjg5NDA4XSBSQlA6IGZmZmZiOTVhY2ZhNGI5ODAgUjA4OiAwMDAw
MDAwMDAwMDAwZDdjIFIwOTogZmZmZmZmZmZhZDQ1ZDUwMApbIDQ2MTQuMjk3Mzk5XSBSMTA6IDAw
MDAwMDAwMDAwMDI4NzQgUjExOiAwMDAwMDAwMDAwMDAwMDA0IFIxMjogMDAwMDAwMDAwMDAwMDAw
MApbIDQ2MTQuMzA1MzY5XSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiAwMDAwMDAwMDAwMDAw
MDAwIFIxNTogMDAwMDAwMDAwMDAwMDAwMwpbIDQ2MTQuMzEzMzQ1XSBGUzogIDAwMDA3NmZhMTA2
ZGNmZTgoMDAwMCkgR1M6ZmZmZjlhNTBiNzkwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAw
MDAwClsgNDYxNC4zMjIzODZdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAw
MDAwODAwNTAwMzMKWyA0NjE0LjMyODgwNl0gQ1IyOiAwMDAwNzZmOGZjMjA3YmQwIENSMzogMDAw
MDAwMDIyNzI0MjAwMCBDUjQ6IDAwMDAwMDAwMDBmNTJlYjAKWyA0NjE0LjMzNjc3N10gUEtSVTog
NTU1NTU1NTQKWyA0NjE0LjMzOTc4Nl0gQ2FsbCBUcmFjZToKWyA0NjE0LjM0MjUyNF0gIDxUQVNL
PgpbIDQ2MTQuMzQ0ODY3XSAgPyBfX2RpZV9ib2R5KzB4NjkvMHhiMApbIDQ2MTQuMzQ4Nzg2XSAg
PyBkaWUrMHhhOS8weGQwClsgNDYxNC4zNTIwMDBdICA/IGRvX3RyYXArMHg4OS8weDE2MApbIDQ2
MTQuMzU1NzIxXSAgPyBkb19rZXJuZWxfY3BfZmF1bHQrMHhlYS8weGYwClsgNDYxNC4zNjA0MTNd
ICA/IGhhbmRsZV9pbnZhbGlkX29wKzB4NjkvMHg5MApbIDQ2MTQuMzY0OTg1XSAgPyBkb19rZXJu
ZWxfY3BfZmF1bHQrMHhlYS8weGYwClsgNDYxNC4zNjk2NTRdICA/IGV4Y19pbnZhbGlkX29wKzB4
MzYvMHg2MApbIDQ2MTQuMzczOTU5XSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxZi8weDMwClsg
NDYxNC4zNzg2NDNdICA/IGRvX2tlcm5lbF9jcF9mYXVsdCsweGVhLzB4ZjAKWyA0NjE0LjM4MzMz
NV0gID8gZG9fa2VybmVsX2NwX2ZhdWx0KzB4MzEvMHhmMApbIDQ2MTQuMzg4MDA1XSAgZXhjX2Nv
bnRyb2xfcHJvdGVjdGlvbisweDQ5LzB4NzAKWyA0NjE0LjM5Mjg3MV0gIGFzbV9leGNfY29udHJv
bF9wcm90ZWN0aW9uKzB4MmIvMHg2MApbIDQ2MTQuMzk4MTQ0XSBSSVA6IDAwMTA6X1JOdlhzNV9O
dE50TnRDczNvMnRHc3VIeW91XzRjb3JlM2ZtdDNudW0zaW1weU50QjlfN0Rpc3BsYXkzZm10KzB4
MC8weDIwClsgNDYxNC40MDc3OTJdIENvZGU6IDQ4IGY3IGRmIDQ4IDBmIDQ4IGY5IDQ4IDg5IGYy
IDg5IGM2IDVkIGU5IDE4IGZkIGZmIGZmIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGYzIDBmIDFl
IGZhIDQxIDgxIGVhIDE0IDYxIGFmIDJjIDc0IDAzIDBmIDBiIDkwIDw2Nj4gMGYgMWYgMDAgNTUg
NDggODkgZTUgNDggODkgZjIgNDggOGIgM2YgYmUgMDEgMDAgMDAgMDAgNWQgZTkgZTcKWyA0NjE0
LjQyODc3NV0gUlNQOiAwMDE4OmZmZmZiOTVhY2ZhNGJhNjggRUZMQUdTOiAwMDAxMDI0NgpbIDQ2
MTQuNDM0NjA5XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAwMDAwMDAwMDAwMDEwIFJD
WDogMDAwMDAwMDAwMDAwMDAwMApbIDQ2MTQuNDQyNTg3XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDcg
UlNJOiBmZmZmYjk1YWNmYTRiYTcwIFJESTogZmZmZmI5NWFjZmE0YmM4OApbIDQ2MTQuNDUwNTU3
XSBSQlA6IGZmZmZiOTVhY2ZhNGJhZTAgUjA4OiBmZmZmMGEwMGZmZmZmZjA1IFIwOTogMDAwMDAw
MDAwMDAwMDA3MApbIDQ2MTQuNDU4NTI3XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiBmZmZm
ZmZmZmFiNjdlYWYwIFIxMjogZmZmZmI5NWFjZmE0YmNjOApbIDQ2MTQuNDY2NDkzXSBSMTM6IGZm
ZmZmZmZmYWM1ZDUwZjAgUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogMDAwMDAwMDAwMDAwMDAw
MApbIDQ2MTQuNDc0NDczXSAgPyBfX2NmaV9fUk52WHM1X050TnROdENzM28ydEdzdUh5b3VfNGNv
cmUzZm10M251bTNpbXB5TnRCOV83RGlzcGxheTNmbXQrMHgxMC8weDEwClsgNDYxNC40ODQxMThd
ICA/IF9STnZOdENzM28ydEdzdUh5b3VfNGNvcmUzZm10NXdyaXRlKzB4MWQyLzB4MjUwCgpUaGlz
IGhhcHBlbnMgYmVjYXVzZSBjb3JlOjpmbXQ6OndyaXRlKCkgY2FsbHMKY29yZTo6Zm10OjpydDo6
QXJndW1lbnQ6OmZtdCgpLCB3aGljaCBjdXJyZW50bHkgaGFzIENGSSBkaXNhYmxlZDoKCmxpYnJh
cnkvY29yZS9zcmMvZm10L3J0LnJzOgoxNzEgICAgIC8vIEZJWE1FOiBUcmFuc211dGluZyBmb3Jt
YXR0ZXIgaW4gbmV3IGFuZCBpbmRpcmVjdGx5IGJyYW5jaGluZyB0by9jYWxsaW5nCjE3MiAgICAg
Ly8gaXQgaGVyZSBpcyBhbiBleHBsaWNpdCBDRkkgdmlvbGF0aW9uLgoxNzMgICAgICNbYWxsb3co
aW5saW5lX25vX3Nhbml0aXplKV0KMTc0ICAgICAjW25vX3Nhbml0aXplKGNmaSwga2NmaSldCjE3
NSAgICAgI1tpbmxpbmVdCjE3NiAgICAgcHViKHN1cGVyKSB1bnNhZmUgZm4gZm10KCZzZWxmLCBm
OiAmbXV0IEZvcm1hdHRlcjwnXz4pIC0+IFJlc3VsdCB7CgpUaGlzIGNhdXNlcyBhIENvbnRyb2wg
UHJvdGVjdGlvbiBleGNlcHRpb24sIGJlY2F1c2UgRmluZUlCVCBoYXMgc2VhbGVkCm9mZiB0aGUg
b3JpZ2luYWwgZnVuY3Rpb24ncyBlbmRicjY0LgoKVGhpcyBtYWtlcyBydXN0IGN1cnJlbnRseSBp
bmNvbXBhdGlibGUgd2l0aCBGaW5lSUJULiBBZGQgYSBLY29uZmlnCmRlcGVuZGVuY3kgdGhhdCBw
cmV2ZW50cyBGaW5lSUJUIGZyb20gZ2V0dGluZyB0dXJuZWQgb24gYnkgZGVmYXVsdAppZiBydXN0
IGlzIGVuYWJsZWQuCgpbIFJ1c3QgMS44OC4wIChzY2hlZHVsZWQgZm9yIDIwMjUtMDYtMjYpIHNo
b3VsZCBoYXZlIHRoaXMgZml4ZWQgWzFdLAogIGFuZCB0aHVzIHdlIHJlbGF4ZWQgdGhlIGNvbmRp
dGlvbiB3aXRoIFJ1c3QgPj0gMS44OC4KCiAgV2hlbiBgb2JqdG9vbGAgbGFuZHMgY2hlY2tpbmcg
Zm9yIHRoaXMgd2l0aCBlLmcuIFsyXSwgdGhlIHBsYW4gaXMKICB0byBpZGVhbGx5IHJ1biB0aGF0
IGluIHVwc3RyZWFtIFJ1c3QncyBDSSB0byBwcmV2ZW50IHJlZ3Jlc3Npb25zCiAgZWFybHkgWzNd
LCBzaW5jZSB3ZSBkbyBub3QgY29udHJvbCBgY29yZWAncyBzb3VyY2UgY29kZS4KCiAgQWxpY2Ug
dGVzdGVkIHRoZSBSdXN0IFBSIGJhY2twb3J0ZWQgdG8gYW4gb2xkZXIgY29tcGlsZXIuCgogICAg
LSBNaWd1ZWwgXQoKU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbmlraWVsQGdvb2ds
ZS5jb20+ClJldmlld2VkLWJ5OiBBbGljZSBSeWhsIDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4KQWNr
ZWQtYnk6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KTGluazogaHR0cHM6
Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0L3B1bGwvMTM5NjMyIFsxXQpMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI1MDQxMDE1NDU1Ni5HQjkwMDNAbm9p
c3kucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC8gWzJdCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNv
bS9ydXN0LWxhbmcvcnVzdC9wdWxsLzEzOTYzMiNpc3N1ZWNvbW1lbnQtMjgwMTk1MDg3MyBbM10K
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDQxMDExNTQyMC4zNjYzNDktMS1w
YW5pa2llbEBnb29nbGUuY29tClNpZ25lZC1vZmYtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2Vy
bmVsLm9yZz4KLS0tCiBhcmNoL3g4Ni9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYvS2Nv
bmZpZwppbmRleCA0YjlmMzc4ZTA1ZjYuLjU4NzNjOWUzOTkxOSAxMDA2NDQKLS0tIGEvYXJjaC94
ODYvS2NvbmZpZworKysgYi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0yMzY4LDYgKzIzNjgsNyBAQCBj
b25maWcgU1RSSUNUX1NJR0FMVFNUQUNLX1NJWkUKIGNvbmZpZyBDRklfQVVUT19ERUZBVUxUCiAJ
Ym9vbCAiQXR0ZW1wdCB0byB1c2UgRmluZUlCVCBieSBkZWZhdWx0IGF0IGJvb3QgdGltZSIKIAlk
ZXBlbmRzIG9uIEZJTkVJQlQKKwlkZXBlbmRzIG9uICFSVVNUIHx8IFJVU1RDX1ZFUlNJT04gPj0g
MTA4ODAwCiAJZGVmYXVsdCB5CiAJaGVscAogCSAgQXR0ZW1wdCB0byB1c2UgRmluZUlCVCBieSBk
ZWZhdWx0IGF0IGJvb3QgdGltZS4gSWYgZW5hYmxlZCwKCmJhc2UtY29tbWl0OiBjMWI0MDcxZWMz
YTZhNTk0ZGY2YzQ5YmY4ZjA0YTYwYTg4MDcyNTI1Ci0tIAoyLjQ5LjAKCg==
--000000000000e86c9a0632fdbc8b--

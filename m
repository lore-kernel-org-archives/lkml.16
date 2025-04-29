Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D31E282D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963635; cv=none; b=QHsi8n1BGf01XptG4IxVCMl4oRAi3tAeqpgzkxIdc98sjuBfChRh98XUy+sZfW/oqwvUg6GDpOISECOizEDISYAfYbVPgypQPcUsYPWog8v7zFkgtD4Sba75XRPGIBRZHv1ZjlQnmXtKbPEFcy2yP15i9yU0TzdIr2HsY+ChN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963635; c=relaxed/simple;
	bh=/EPSfS/yzVzodrBlE7GRdKVG6ETR5h3Z3Rc6oJDCI9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BH1ZdnpDXRZJBDCuC3TeS8PvVoOMzf8K70xZFyJGQMxY3FsFS0jD2t/ZvFVFdXD7hJgetAme7Ruw8S3/1cDJTj5BPOkTR+9kMngb6cRleNykHr9I/9lpaNGykFELs8yGB6IcHeSleQyJvqYarfoCZyvDPolj4Qwn/Mm6ok58yLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XCLHK01F; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XCLHK01F"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac7bd86f637so54276666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745963632; x=1746568432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqNEBXZSbJGWmL1W/E0BdQ0WH7FE/Nb9rr17rLaU2hw=;
        b=XCLHK01FLgdx3kybYGqUUWXufsNdTpqIwbeMTCOfp1IW16M26D7lwcsbRv6tzdvhag
         PS9TUu9jGuuwBkd7qKk2fL86asbxZGXhyJPsurUl2vSnil/QFduMaA1kGtsKVsVwyEpi
         7d6K63nQGBl88OyUz4hbKCrA+sUvnD236W3G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963632; x=1746568432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqNEBXZSbJGWmL1W/E0BdQ0WH7FE/Nb9rr17rLaU2hw=;
        b=gMLFmDYouuu18VwRAYimszsCUboAzeSRKsUQu43v5PLUr4Xc5g8g8CwA3/H3djax0g
         ypkOfvHR/zWNky7Otu0tD77bgGvZhVFuUYtN1QKF0arnrqjdApWrkJcfz8TqK7TnZ3Dq
         AXIrr2XzXn9AUvCHU96Q7UTpvZV7JPUx5GUC28P/XRREyUgZMwTkAGoUyfjdgAYRSHIh
         +uv4OLT0N1x/JfJN9o/tMMqtthRYZowWF4reirrZduYThfGEjlYCOgmjWxp3aVp4JJfL
         X7Y/ZzwD0yOuMbo1Pbrio/4FtN1WIruLRrHiJTk6Pofy2zrI7sp1l9Rf421zXS0yn+gK
         aJGg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBo4K8gs4kKmmpszAki625mC6qNL3WDdWFK+jXZ4TbU7i2PP57BLak5K96884+WbU5n/E2IOq05ItVcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WADb71FLththc020prUL3TyOPP6ts56vuhqt4dgeGA5qtZRT
	2iSfueGWnSiGH4Da7c727GhcKZ+afTqOVkvY+z74/hB6Me4u6fhFA7LaY2+iqwAcd5wZede7ORp
	7w6UYRA==
X-Gm-Gg: ASbGncsURaOEvs9PDQp4r3mr4NCmxEVwG7WytyuUFvJTOocuD2mt+hIP33LfigaPKlN
	DPctVDrCJd7zGP7ujdouMeqDsKrPi6xBHSEEl2M3qkHvnb+Jn1K/Mq500Qrb5HsFV6NagrYGFqo
	9O6s2qv9e0Ht3KQEYrQIWoDTkraYz0QiwGn3gxPOjsB25s5Jk6PcGLKuErma43hWHtTlw0cOlvO
	xnhhKkeLqMAxVhgOwkeNhC/eq0z7F6KP38lNd4rug19ANEHYqquJUjuOqsk7430oOCNRcOFjoAj
	XB4ehvTO3tBCpyjp5/jOvPnY7+1LTzUbxay9CKiH0V7sSFMGKCS1sNOIK4IZnKcQX8MMzESNYm5
	ULv9VyeRi4zJtQOw=
X-Google-Smtp-Source: AGHT+IEkllhZqL93N7e21xMsm5WCT4f5XAIlO2ziOPkXadWERRPBGIDjMRX96JWHqXCt3QZjwLIm7A==
X-Received: by 2002:a17:906:6a1e:b0:ace:8176:9870 with SMTP id a640c23a62f3a-acedf68d357mr37653866b.9.1745963631748;
        Tue, 29 Apr 2025 14:53:51 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acecf906c33sm133830566b.59.2025.04.29.14.53.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:53:48 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so584971a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW895J5whnRt8JLvAsC1Xn1EXNkvpb9tIiyOG0nf8Lr7kq0TtHhcwH48d8j+eyChiAOVXflafj5sP94q+I=@vger.kernel.org
X-Received: by 2002:a05:6402:90e:b0:5f8:3a9f:fdca with SMTP id
 4fb4d7f45d1cf-5f89f7689ddmr371432a12.9.1745963628390; Tue, 29 Apr 2025
 14:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com>
In-Reply-To: <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 14:53:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
X-Gm-Features: ATxdqUF2WEWyDNEqWzlgzyXTf4abegFsgsXzBlk2KHwHm9gaQxxnui60dOXB01E
Message-ID: <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ingo Molnar <mingo@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000dcb6610633f1d539"

--000000000000dcb6610633f1d539
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 14:24, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Could you file a gcc bug? Gcc shouldn't generate worse code than inline asm ...

Honestly, I've given up on that idea.

That's basically what the bug report I reported about clts was - gcc
generating worse code than inline asm.

But why would we use gcc builtins at all if we have inline asm that is
better than what som eversions of gcc generates? The inline asm works
for all versions.

Anyway, attached is a test file that seems to generate basically
"optimal" code. It's not a kernel patch, but a standalone C file for
testing with a couple of stupid test-cases to make sure that it gets
the constant argument case right, and that it optimizes the "I know
it's not zero" case.

That is why it also uses that "#if __SIZEOF_LONG__ == 4" instead of
something like CONFIG_64BIT.

So it's a proof-of-concept thing, and it does seem to be fairly simple.

The "important" parts are just the

  #define variable_ffs(x) \
        (statically_true((x)!=0) ? __ffs(x)+1 : do_variable_ffs(x))
  #define constant_ffs(x) __builtin_ffs(x)
  #define ffs(x) \
        (__builtin_constant_p(x) ? constant_ffs(x) : variable_ffs(x))

lines which end up picking the right choice. The rest is either the
"reimplement the kernel infrastructure for testing" or the trivial
do_variable_ffs() thing.

I just did

    gcc -m32 -O2 -S -fomit-frame-pointer t.c

(with, and without that -m32) and looked at the result to see that it
looks sane. No *actual* testing.


                Linus

--000000000000dcb6610633f1d539
Content-Type: text/x-csrc; charset="US-ASCII"; name="t.c"
Content-Disposition: attachment; filename="t.c"
Content-Transfer-Encoding: base64
Content-ID: <f_ma31mmgj0>
X-Attachment-Id: f_ma31mmgj0

c3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgX19mZnModW5zaWduZWQgaW50IHgpCnsKCXVuc2ln
bmVkIGludCByZXQ7Cglhc20oInJlcCBic2ZsICUxLCUwIgoJCToiPXIiIChyZXQpCgkJOiJybSIg
KHgpKTsKCXJldHVybiByZXQ7Cn0KI2RlZmluZSBzdGF0aWNhbGx5X3RydWUoeCkgKF9fYnVpbHRp
bl9jb25zdGFudF9wKHgpICYmICh4KSkKCnN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGRvX3Zh
cmlhYmxlX2Zmcyh1bnNpZ25lZCBpbnQgeCkKewojaWYgX19TSVpFT0ZfTE9OR19fID09IDQKCXJl
dHVybiBfX2J1aWx0aW5fZmZzKHgpOwojZWxzZQoJdW5zaWduZWQgaW50IHJldDsKCWFzbSgicmVw
IGJzZmwgJTEsJTAiCgkJOiI9ciIgKHJldCkKCQk6InJtIiAoeCksICIwIiAoLTEpKTsKCXJldHVy
biByZXQrMTsKI2VuZGlmCn0KCiNkZWZpbmUgdmFyaWFibGVfZmZzKHgpIChzdGF0aWNhbGx5X3Ry
dWUoKHgpIT0wKSA/IF9fZmZzKHgpKzEgOiBkb192YXJpYWJsZV9mZnMoeCkpCiNkZWZpbmUgY29u
c3RhbnRfZmZzKHgpIF9fYnVpbHRpbl9mZnMoeCkKCiNkZWZpbmUgZmZzKHgpIChfX2J1aWx0aW5f
Y29uc3RhbnRfcCh4KSA/IGNvbnN0YW50X2Zmcyh4KSA6IHZhcmlhYmxlX2Zmcyh4KSkKCnVuc2ln
bmVkIGludCBteWZmcyh1bnNpZ25lZCBpbnQgeCkgeyByZXR1cm4gZmZzKHgpOyB9CnVuc2lnbmVk
IGludCBmZnM1KHZvaWQpIHsgcmV0dXJuIGZmcyg1KTsgfQp1bnNpZ25lZCBpbnQgYWRkZmZzKGlu
dCB4KQp7Cgl1bnNpZ25lZCBpbnQgc3VtID0gMDsKCXdoaWxlICh4KSB7CgkJc3VtICs9IGZmcyh4
KTsKCQl4LS07Cgl9CglyZXR1cm4gc3VtOwp9Cg==
--000000000000dcb6610633f1d539--

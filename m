Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A8828CF69
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745346044; cv=none; b=BuBUyjXmv0LkN+uOhbtLdEKWUbz5xOczhXmv7MfuuQ1t/78gCm7rbzBwsaTG8sUaWw5qtnjjvrwOt90bM/0DhFuzp5vODpHT22VM5sEwtOqeu9lsFy4X1nbWxUfQ36MtPxNzHVqMG/BqBUIfY6gtt0fXlxqyOng5C2jnFsZeG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745346044; c=relaxed/simple;
	bh=BaWFNfK9JaS31xncN4Yvj0mois+6Yk53lz8aI9LBKmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ML2f5MPjy2fyGnVDuGcVyI1mqMeHQBxkxmsyadynKAwOEe5ifQwHDVs1GfBv8xLc9+fQyARG3gmn5CWC547C2JcwJAVUEl1oN22SQi1D6kQ+lLvDPX44MUrj0ybh84zA6u5A1TZ1ZjlfcC4T15S7YN9sJWiMAxzmTYtBPsRA23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MS70XE4y; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MS70XE4y"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac339f53df9so939544266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745346039; x=1745950839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqMSy+hzkSQ4GceWRw6Rn1V3+cta8Qyj2+74Vj1fBmg=;
        b=MS70XE4y2nWBbTghNNind9kZDcA2m++YRM5JzVGC10Zx+7vR+XIVGPYy1loTQ0K9Wb
         bZ6X6+ie02qcRsf/iNeVff9mOnUD4VwT3BYxPFVPVJMN6DQ3pX4aumfBu9zJU6wfOzXN
         qNqPkPUchawvt7dUqC9wl7+XebpUKMOGEwAw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745346039; x=1745950839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqMSy+hzkSQ4GceWRw6Rn1V3+cta8Qyj2+74Vj1fBmg=;
        b=bDrCpTda5F6AfZf92lsxXpNnyorFKkerfCUk9Qz1QGkKXBBYWPjMi4tuom6kUfD7FK
         VomOeVU7t6F7amRNqLXEnG4iBPP6S69zEhtWZ/JZgaeL61fvIxP62KfW9aYDMXfoF/zW
         ZnUD9nUQ66T95H97op4M5g3NZe7JYm6o5XOIkLV+hWvdG2MoJ+uknjZ+euZGpVd+MldA
         AiQMBH9A9fsDVQXSPYK3Vxc1N5cUuyOXSaA+ba+rs/WJ/VsgIhZpPUWFg6OQQN5z02xO
         fF9E7RBeRPTVPPHLXYNvWqX9o8f8nDPhknubjMK8qIzKqSiGYpYy0OYnHsoqavvl33ey
         pqwg==
X-Forwarded-Encrypted: i=1; AJvYcCX1feN9Fj5qEG/YhmqCniTsF2GZTzIHU3dh0SC9Z7z8yAiskvb9JGKWxDehyg+bNkVlUdukc/iG3Fem0gY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywopk5q/xUv82dO0eo8FNagC1S3Sjgs54mbgVTVYUAIcxK+h+2W
	rce282uDY4OyyFoAJEY3FYOQMEFPbhXldLLPR3Mux6HvAhpNxcK/GUZMobhSBXHsjZZOK/MEWAs
	7RD8=
X-Gm-Gg: ASbGncuYGVT4JrHGXh6Jb7mIm7N0MD3sWKIP7GM+ZPJOHk4NlNXvJBQwdTTiEbT4Err
	4cTKllLn2SAyx4QbynjTAH3c5l2YxBGA9m5IrfHw6wSA1jJYFUQZPBQ79q2NmE36FnVkThS+KDZ
	i8mIkG/2MhcmZuAW/uhLXanSnkyXBLsH0zvcy2Zd56JQjH8+AiEHdOp0yUrNVRWGe+3IWRLyua+
	j/wzn45uUer0IYiRFeubdJcDC4HqdD7Posb0OBUtwlG9iW2cgpBB1S09HxrMtQpWyV36j1qiXRK
	5FaMg+KOtK9ej8N/GRn8rvGUY5m9R1opNfVuJn/iFNXGDGJMH4CYX3sH3pG9LA0W8LqcpMGC2K3
	dq0LsTZVLErHtu1c=
X-Google-Smtp-Source: AGHT+IEns3SCIkPYQK0Pg/Tp4YYz7xudl1/U2ppl+2i4AG1eXwTxZDljdFiOJPWLEcrSxpwZv/n2IQ==
X-Received: by 2002:a17:907:9404:b0:aca:95c1:876 with SMTP id a640c23a62f3a-acb74b364admr1432552166b.20.1745346039278;
        Tue, 22 Apr 2025 11:20:39 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47e97sm678652666b.156.2025.04.22.11.20.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 11:20:38 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3b12e8518so906685366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXv5Dwy8QyzSV3C7VrP/m6/VD6Rkm7X55LMWLlZ0k+XZ1HlGtdZc2G8smaj5zEXoEPtskWBgLkkWMR5BVA=@vger.kernel.org
X-Received: by 2002:a17:907:7f91:b0:ac3:97f4:9c08 with SMTP id
 a640c23a62f3a-acb74b86ee5mr1613347666b.31.1745346038163; Tue, 22 Apr 2025
 11:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422204718.0b4e3f81@canb.auug.org.au> <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
 <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de>
In-Reply-To: <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 11:20:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
X-Gm-Features: ATxdqUE5qwkIreKOuPAeMRSToikdNG5WRtxP2ghs369oZCVZDwu-5kmjTIixvTo
Message-ID: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ Adding Masahiro explicitly in case we can just fix cc-option. See below. =
]

On Tue, 22 Apr 2025 at 10:51, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
>
> To disable warnings there is a dedicated macro.
>
> $(call cc-disable-warning, unterminated-string-initialization)

Heh. We have several other cases of that "disable warning" pattern
that does *not* use that cc-disable-warning thing.

In fact, right next to the new unterminated-string-initialization case
(just a couple of lines above it), we have a

   $(call cc-option, -Wno-stringop-overflow)

thing, along with several cases in loongarch and riscv.

So they are presumably _also_ broken, but perhaps just happened to
silently work due to compiler versions (and that stringop-overflow
case is gated by a config option that might also have hidden it from
people).

And as you say:

> Note the "earlier diagnostics" wording. And indeed the real reported
> issue is "warning: #warning syscall clone3 not implemented [-Wcpp]"

so apparently it *also* requires other warnings to actually trigger
problems, which is presumably why Stephen only sees this issue on
sparc* targets.

And which is probably the main reason why the problems with other
cases of this same issue haven't been noted.

Now, the obvious fix is to just convert all these cases to
'cc-disable-warning', and I'll do that.

But exactly because we have at least nine cases of this, maybe we
could make cc-option actually work for this by forcing that "earlier
diagnostics" case in the cc-option test?

Right now cc-option uses -Werror to turn all the warnings into errors,
and thus causes a "unrecognized compiler option" warning to be fatal.

But what if we were to add an intentional warning to the cc-options
test-case, and use -Wno-error-XYZ to make just *that* warning be
harmless, and then 'cc-option' would work for the unrecognized
command-line options for the -Wno-xyz case too?

Because even after I fix all the nine cases we've now accumulated, I
bet we'll have more in the future - just because 'cc-option' is so
much more common (a quick grep shows 429 vs 40 occurrences).

               Linus

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C019CC39
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698893; cv=none; b=VobXEuWS+TD/kBXiqD5033asJ0w/YYxRBRV6hfJBld8Ov3Wql5sEU0R9RKoQapFeU5YSBXillGMrufpucOUenCg8x4hY4J/pYSVYARgQZ24NwKt6zqGa09fjcPgUU78A2I/cfH9Rbu3+mGs5PMdNEusjTqYb5d7hjswmmysE8Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698893; c=relaxed/simple;
	bh=tOhPfAjNck/fuEMBPjbaUAakEcHx5aW4W6Mm4+qEg6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jC6zsR3Pvlrc+2n5ymfLyovUzArWfLpGxdyxn85NLW7oFmjON/uAz04Sd8vEC7SkBKTI1I8C51Nkj2y8wkdNHElENF4z+DtlrAS/+T6XpzoUVdhk8Lv3X/LC61IWvwQDW+svohdaWRFrChaQk1Qp5wvQ+LDG70Sde/zZvcRdVP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B2QY69jc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B2QY69jc"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abec8b750ebso182273366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743698890; x=1744303690; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5IeBQ5EurNMkDT+fQ3nS/eQb46kO76MprunhtwmK6a4=;
        b=B2QY69jciSslWGGIl5tSiU2zq7lhABiHbYUXup0NlogFaNrgwMz6jXR4NDoPRwyUQd
         KGAkQa3l//maVeWHxghTr9f43zkVpDnaBY4MXfFP443p+tSl9rucCfIEA5YqJo0Ux1Dg
         oLX32nf9h+4ejZ392+WqZkQ1RQIt7GD29FhF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743698890; x=1744303690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IeBQ5EurNMkDT+fQ3nS/eQb46kO76MprunhtwmK6a4=;
        b=Gl/fFPkQZ9H5T20qa+nEtCXNAAVArFdE2x26N8Z8tdfF6B3bKkJuef/txbHRWVVeik
         W1+Iq2lS8V0W0qEwywf8qMHt4+h+DKrSX0hS3GBkpA49NSA9W7BDmE+hp7hky1w/w1rd
         pKvHNl7TB+K7L2Eb6aux3V9rBLEcijeB0yJpfcl9PDJ4Sc/S9hvGlwlH1uP0PhrMjmeV
         2U77WsS0oPxmJR7QpvXTXusBWiMrnl63TXrdrar69o3/hIA0B7yRGU1MWJmm05XxkhJw
         aAonZ1W1J8dQNZkbDmQt7HIFf7AI9214PaIXWSvmZfSuQtEhjcvTrZZzI8IhZ//0bvyx
         IYxw==
X-Forwarded-Encrypted: i=1; AJvYcCVow1ZTVaKXJovQ+vcM0de0LYiUJtYeBRDlZsr6QHYAxCDKMftQHKcsarFU+kySRYcvh52ML6IT5L1EBp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83FLvo1mmI3zzosY9pZdXy8WM7ApLrR6QU5Kvui+aJsEMJmYe
	RRs0MaDZISg4soCbmNiSEseM4Y52uLpeDZpAsBAKhUHZ+e1sEUWMjunrDt4LZ+mNdFZOwo/OzX5
	adxY=
X-Gm-Gg: ASbGncsj7sEsF9ILg/nir5U5bnBuafDrbAMrpS9SUFaJCzGWCqaR7ftl8Qy17cdAyCc
	KJaMNNyXXq5ASmOW2ERSKd1qcOxZ4I0fymoEIX3np8+76xtzqjZIdW4BZYbgTwimzwj5n/8Vdzq
	ZnsGu5T3RY7oUTnAFECozB2yaSVpKkoHbWCBnUa56/Xelt6xTfpO0vxMAaZySw4eWMWrrG0FjMz
	Duc+05GmWBx8kL9+iOJPdk5xRQBzB0IOtVK3xMyy0odWN5B79/SInZkVNB0S6J0W2rQv+ZGMxwS
	QDCTr01D3D53spiiA0nTRPbCoKP9xefF7S957/eFyER/HGSkSe1I5mnTu/XnuoQBRWa2dVAb0fB
	GEuz8+S41VPXLk5EadVo=
X-Google-Smtp-Source: AGHT+IEKJyd6de0YPCoan1HREXgL49jXgCs+wTNOU/QJ19r8aGqKYa7yHkS4eKLzj2gqPboG3Iwx7w==
X-Received: by 2002:a17:906:f5a9:b0:ac7:b363:862f with SMTP id a640c23a62f3a-ac7d1918b56mr24704466b.28.1743698889576;
        Thu, 03 Apr 2025 09:48:09 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0185f84sm120101366b.140.2025.04.03.09.48.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 09:48:09 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abec8b750ebso182270766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:48:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGJAeI1dTnh0PEy+raE4RO9nARb+EgLtZ/tjWfRzYbn81L3ggVSmnbR1wp85P0h8ylqrxCzdyekPZOoXk=@vger.kernel.org
X-Received: by 2002:a17:907:3da3:b0:ac2:7a97:87fb with SMTP id
 a640c23a62f3a-ac7d199c916mr29245166b.33.1743698888537; Thu, 03 Apr 2025
 09:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wg0wQb+CbUk2GY0CeVuTQvq67-oYR0nL8wGgySia3ce7g@mail.gmail.com>
 <Z-4jzImykAbHK2Gz@gondor.apana.org.au>
In-Reply-To: <Z-4jzImykAbHK2Gz@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 09:47:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whch6fMKH8FadOigqm_xrXfgWJyn=jz32GM6tUuM=nqvg@mail.gmail.com>
X-Gm-Features: ATxdqUEfHA6tq4tIjCHeUdY_kmVbwhB0XtABIt9Eygs4AQmADpeBZZvH_WAQpHA
Message-ID: <CAHk-=whch6fMKH8FadOigqm_xrXfgWJyn=jz32GM6tUuM=nqvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, 
	vdonnefort@google.com, vbabka@suse.cz, rppt@kernel.org, kees@kernel.org, 
	tony.luck@intel.com, gpiccoli@igalia.com, linux-hardening@vger.kernel.org, 
	willy@infradead.org, Eric Biggers <ebiggers@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 23:00, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> There is no fallback implementation of flush_dcache_range for the
> architectures that don't need it.

Yeah, that literally looks like an oversight.

Probably because nobody needed it - or people didn't realize it was an
option and did the "loop over each page by hand" as in your example.

So yeah, I think it would be good to just expose flush_dcache_range()
as a dummy empty function in <asm-generic/cacheflush.h>, with the
usual "if the architecture defines this, that will override it" rule.

However, part of the problem is likely just unclear semantics. Because
the existing flush_cache_range() is about pure virtual caches and how
they need to be flushed before the TLB is flushed.

Also about D$ aliasing, but there isn't necessarily any TLB issues.

Honestly, I'd personally be perfectly fine saying "nobody sane cares,
and if your D$ isn't coherent, your perf mmap won't work".

                Linus

Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAE15B0EC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743967931; cv=none; b=p2ltgGHPUwfSZVt+SARDcNSrjKoA+cX9RnzkC0GCds8X+fhB9IurPlAxsf/aEOtfALbRQbC+uXMpVWfy4Ne7/KVCkAszHblNCqOJpdWOiRVZamgFCuTfsVqZdMd8P9aBugm0y5F6D1DtE1bGidml2C5FafoQd+Lnu3saiziLACI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743967931; c=relaxed/simple;
	bh=SnfA4AVX3p4bc8lGUpaXwk1FmeUn/qnNUjvdyAS6lvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g40oUi2k7AKQ90qY9BQnaBtLeVhn8Pa3LvpOaAoIfXz065fvk1psKlTYk7KPzmcSSkoyEpERQfcUZ8uc2GrQm92a+SrkZSy+pPQCuAX+/0OAPBduPjSY82d+io4ZKgMDF2sTy4lm3JI0gr2ibK7YMCt9mtDVtJJFk2TbORn95Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K8X+r5nT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K8X+r5nT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso697805666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743967927; x=1744572727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HXc0QZV1tE7bS3mghgxMBPEGkzKyJZ5Nakgd1J5HNh4=;
        b=K8X+r5nTTzEuKP35NpVA/M25Zw7hxJka7q2ZmWB9ic02/nMzQSP8WRi3hIqpIYCsMG
         BFtzIhhsn3CAdDZHNT7RjmwsqVNP9eTj4j4A+Tf1OzXS42YjbYWOvyu4/79PKead3Vv3
         U/n1RASlgguAMt2h3NgKouiPgKnFrhlZlhpsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743967927; x=1744572727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXc0QZV1tE7bS3mghgxMBPEGkzKyJZ5Nakgd1J5HNh4=;
        b=u3Guluj1H1dDotpDwe0hHN9OVJHNmn6h2jfxIdIyRTmHBYz92CCkGxq1ty3SqlRr3p
         jlpwjnXDGmL63MuIfW3Tmqx+eNgrOC1O8nvhTSiJgppGqD6nOPcYcm9qwbJHRm+v0v5J
         BsyMMOkdTKlHzfzB8rgvN+jnAhwmc7V3leqWhdiZXSUTekshjg3h927OttRfIYy6GHNB
         qlG4BDqbnOHhJzm3SN+KtfMFgfCSVCh3lXxbGOD5cWV3YDeXrflBgY4/ygXpfipjba8L
         8lwqvw51DE8d8q7Llip6nL4V5rdvdcw7EOGd1h2EtWA/nEYpOs5HaFemYi1SQxS6qvwT
         8gxg==
X-Gm-Message-State: AOJu0YyBgRpTZfIRecEAU9fHcXhM7E7lGtTe429JKduVP1JT9cpiDK7x
	dt7jmNylae+BCkax/FNZKCNriF05L44KU3nltOCwXdrpmkCOwV/GUYa0EVIs4V2cvoBHMTWRde3
	MyE8=
X-Gm-Gg: ASbGncvhRUJG3PsKLS+OdWqyyWSdINXoNA+J+bqqBYZoZKpHwAM9GaGCxuHtFy+5qho
	3OwZO943jo1oxqxvNt+CiavU/9cpn456vjvnHyFpgG1Q/JP29D+cLp4sznLT7/ebIOgzkdFlb6P
	43FJcr7ge+eb1ddPbuL3Q+PoNrLxgpWy9AW6kybLK59w35F1NwoIH6daYuur+t+1eONCaBu+DX1
	P1VLwZCsDtZ1D54h+9Qc7OpqeFICLkjydYDh0NTf7mEPlK3TVJVYCs11rpQ6aRRpn7ehjN3DUri
	ZxbKW1Fi48U/P6Krs2LxglVlhUmoMBs97dqiJq7WiFJtU/UYz2xWG43T4sGIhYkH6/a+Z9YKIQH
	3cqq2dgoNThnbpsxm+0M=
X-Google-Smtp-Source: AGHT+IEz8qJJGBbX+GZmtkU61DWqdFgZpNYNsvTABs+EOveIh8JRFDM7z8k4PPtlkIbdEvSiUJ7CYA==
X-Received: by 2002:a17:907:a05:b0:ac7:3916:327e with SMTP id a640c23a62f3a-ac7d6f22f77mr830044866b.61.1743967927405;
        Sun, 06 Apr 2025 12:32:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013eb27sm618558166b.121.2025.04.06.12.32.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 12:32:06 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso6676488a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:32:06 -0700 (PDT)
X-Received: by 2002:a17:907:a05:b0:ac7:3916:327e with SMTP id
 a640c23a62f3a-ac7d6f22f77mr830042366b.61.1743967926185; Sun, 06 Apr 2025
 12:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
In-Reply-To: <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Apr 2025 12:31:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrP0CLrx_7-A_3bZgyS4ihVYiuh817Vk-3xa6jG3sVLA@mail.gmail.com>
X-Gm-Features: ATxdqUH_pJYVj-8ouA718OAlUUl8Jg9550P8_geCIbtJw0QorlqJPLFSM9dMY04
Message-ID: <CAHk-=whrP0CLrx_7-A_3bZgyS4ihVYiuh817Vk-3xa6jG3sVLA@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Apr 2025 at 12:04, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> When the function implementation is the stupid version, there is *no*
> advantage to a function call.

Side note: the reason we don't do -freestanding is that some functions
we really *really* want the compiler to optimize away the function
entirely.

Things like regular 'strlen()' are commonly used on compile-time fixed
strings. It needs to be dealt with by the compiler.

Same goes for the basic memcpy and memset functions.

So what the kernel really wants is basically "-freestanding" but with
a very targeted set of functions still dealt with by the compiler -
not ever because they should be turned into function calls, but
because they can be simplified to some entirely different form at
compile time.

(There are a _couple_ of other cases, but not many: we end up having
things like "constant prefix matching" patterns, where we want the
compiler to not only notice that 'strlen()' on a constant string is
just a compile-time constant value, but then also want to simplify
'strncmp()' or 'memcmp()' with a small constant size to basically be a
much simpler thing)

But we do not want the compiler to create out-of-line function calls
for code that wasn't a function call to begin with.  That's pretty
much the exact *opposite* of what we actually want.

We did try "-freestanding" at some point, because it's the obvious way
to avoid the compiler messing this very basic thing up, but those
"just deal with simple cases directly" are really really important.

I wish there was a version of -freestanding that did that "only
simplify calls" version, not the "recognize patterns and turn them
into calls that didn't exist".

            Linus

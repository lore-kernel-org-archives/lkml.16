Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53117BB21
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105099; cv=none; b=KmTPfi2Uv8M10UcTAk82frdI2QU77Muhk4TrqkINborjiYBHN+11GQapLLQp/dgzsTUYkF6ndkDwKIqcSr0uhSLmOrlY/f4DLtYwSDZ/zse7UBYWRBBbmX/FVigKnsf8CUdokzOFYaty6L+jgCopEwablChnAHP6yL8HtZ34S4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105099; c=relaxed/simple;
	bh=Tq1/cEY8ShIsxcJyAI4tVwmzrkLP4E85CmBG2dlLMVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cngEFwDOSlqY2tFQdra2Gs6kwUOzFWnY+h9Oh7b3lRK+9RPmDndTHdTXNzIkjkAEvXfM6wsMFysXiXWXmCX3XFhrvtfHIridXmSO1ylA1679mx1x5Fo8VjpAoIBk94IUlGedO4KRmAQmrWxBPfBy/fLrdJmF0KKkFb8E6FrS+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dEbyuk8P; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dEbyuk8P"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so213195666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743105095; x=1743709895; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Cp7nHYOueUQMptFhXWQIk/iraWU46+xV5MSj1gwlQ=;
        b=dEbyuk8POLs6qvahc8Jyfi1n8KOnoR/qgbiVt83PjkSo6vctl5C3TuDI+qR8yABnbk
         q8LLgRaK6YWAVYCEniR7i7h/mgRiQy9blNIMCKPk7Myzpj46O8w0sVjWe/fVRF+2146z
         ACLGOIP9+lBKEZzaeTu0IBBQd8bt02rBYkTKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743105095; x=1743709895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9Cp7nHYOueUQMptFhXWQIk/iraWU46+xV5MSj1gwlQ=;
        b=FLYITwSH/AqBUQJr9NtQ9l0UM6F59Dt/InXrUl4GL/geFkWJ2qMaXjHL6aHYsBqYc/
         d1B72FixDMOBlqvZqhvKZjRP5FgHreCXY8Ptz8aUs1ZpS/nBBh2hdhJ2atUw9XmAp9U2
         alI8OUJse2ffAZ+1rbyMNGslpMV0gCqh3jnDzestCXuXOuGn2sEFx0aEzlztBMNFajZj
         GrtAga3wDhUbNsXomBd/FdEGf0WlqfhacY0YfxEVsf9A9ZbW0FsB55gUbACkkUd7uqd7
         pYpOvp4n1QEyygXmIvyiOxUQasAlCLgvBYGpC2JOHdOFEBfMhVkUPnGpYOBMqLJLWxpP
         pHSg==
X-Forwarded-Encrypted: i=1; AJvYcCW4xxOMKroNTb5sG+XkAl1NYmeEzFyZMrXDHCnelAiByQqCRBydCq3NtlR8bpzs+83QV0f46+mLfCijxOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlNVcCUzVQe0zS3Fs5iniFfMipwZTBQ/GlEx1WK5N+PZqpi3K
	i3q0fS8Nwa2wG1gSlOKf9RP9a7gfiNPqmhCFI0gbq0pVDKm8+NQHc86K1O82uOrWTVU/3WHgbz7
	3oKE=
X-Gm-Gg: ASbGncsfe37GPMh/z5pmXussNWmEj/btA93g6UkpAwVhNNX5TSxNUXyfeDfaWWzz73o
	0u1ZiBon2GzyfQjokDjaeCFKDFSiPpDBK/ulmk50zM7SpKoqCwD0AEnC+c7eZf81lUlqoK6E+wP
	jRetFwL/wHtib8mcUjsmq7QrakuFaJFcKJ+/wKFPsKzABaoZ2drQnIe89x8PbWyMVLtmiEreqHa
	LRcBhf75QaGD98USCo9i3brV7zz4rUF0bc0CjlI0fdY7BPMHGI62UUfZCS10ey8zIMlkNnemIg/
	QHQUTW5YU5wlbByKyhdXnjQt34GWIqRs4qP+mD6DdslWltm3sFWd/P6EhkL0PK5R9TLdA1BsGZ0
	7YRGVGXEGCKGlu1y//Kw=
X-Google-Smtp-Source: AGHT+IG+4L5+RgxgNHq+3pvLVGH8RoIFAC4YqPJMXnzox0LluPPRVO6W7Y4aYruKPuKGxOhLpuvpIg==
X-Received: by 2002:a17:906:f5a4:b0:ac2:a089:f47c with SMTP id a640c23a62f3a-ac6fb14f400mr545581866b.55.1743105095262;
        Thu, 27 Mar 2025 12:51:35 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192f0adasm42538666b.79.2025.03.27.12.51.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 12:51:34 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac29af3382dso219537166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC+joS5lX7HAHEyxnlxwehvlP0FK4AZkxefAfRHNf3+6n5U1CPUKASom0GHpFB9JUrbxi4jZrHm2zxnoA=@vger.kernel.org
X-Received: by 2002:a17:906:7952:b0:ac3:bf36:80e2 with SMTP id
 a640c23a62f3a-ac6faeb2408mr397130966b.20.1743105093834; Thu, 27 Mar 2025
 12:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326084751.2260634-1-mingo@kernel.org> <20250326084751.2260634-5-mingo@kernel.org>
 <20250326085343.GB25239@noisy.programming.kicks-ass.net> <Z-UcIJAQsNXoxMXG@gmail.com>
In-Reply-To: <Z-UcIJAQsNXoxMXG@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 12:51:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN1d6ZuzwwLOKreyGuE6Q-yHG5kCkA2xVxbWXxORoXSw@mail.gmail.com>
X-Gm-Features: AQ5f1Jribw8Yzdlk7EJSC5yUVWYg9jKEP0ciqIKyzTGKwB4C9E58yp3DXLaIwaE
Message-ID: <CAHk-=wiN1d6ZuzwwLOKreyGuE6Q-yHG5kCkA2xVxbWXxORoXSw@mail.gmail.com>
Subject: Re: [PATCH 4/5] bugs/x86: Augment warnings output by concatenating
 'cond_str' with the regular __FILE__ string in _BUG_FLAGS()
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 02:36, Ingo Molnar <mingo@kernel.org> wrote:
>
> BTW., any reason why we go all the trouble with the bug_entry::line u16
> number, instead of storing it in the bug_entry::file string with a
> :__LINE__ postfix or so?

The compiler will happily share the same storage for identical
strings, so that was an issue: re-using the same memory for the same
filename being repeated multiple times.

That obviously doesn't work anyway once you add the warning string to
it, so that makes that whole argument go away.

              Linus

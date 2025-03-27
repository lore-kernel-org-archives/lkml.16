Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDFD74BE1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743103470; cv=none; b=dkFwWU2A90gJRCabkGWYflWofc5hW8Q2uw7GR6b0KtNwcRo+dnCdh2JN7KaiTfUpXgl8dn2Zb7CrHyrWW7M9koa9QXZuKtq+dMp7sPtNulq/9maRpjE2wldomq+A5cKB0Z4V6fRlidwQATgeEvqnosyJMnv99xm3+VgKqwj+9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743103470; c=relaxed/simple;
	bh=EsU3H4aCybFj3CLx43rBcKbIVPlgG7MXqQJVjEO3KuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggMcYOWij4CO6SgZ6LgLT++aCpuNxFbezuVnt+Ab4pTFxb/9Yn8SjuJxz9qJi7r8QFgSb5YVSGIn7xrBP4l1OFD2fHE+ldw80mwD+uokwlf8Lnoyi4avz9VP71hz3lMxJqBTcKXua/HgiMZWudsfo/HlgtimaDzohYEk51cItak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vL/RMjfl; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vL/RMjfl"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso2709a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743103467; x=1743708267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsU3H4aCybFj3CLx43rBcKbIVPlgG7MXqQJVjEO3KuQ=;
        b=vL/RMjflV8cRT7eJ7K963GasLqW/4UcGH31b0L7iZEzDzWou0EhSEagEAyWiKtRJ0w
         M7qsMhnscqwIuBbNtaMRZnV2xToj2UXF4ntc2mU3tpKtODpE2iHpz6AQwe7qGVC/ZTwq
         Pvcu6RxdMKsohmVHhbh2l7AcogyCD/tXv7amLrwd9oepAXQRR9b5vdG4JM/S/0bslDUD
         dC92ya3QYJnMOO/KGgqypkn1NaawsQZecoHlSzNyRwvWhMy+mPVUEzbl1DWZHZM7z3SM
         8XcAWiXgvKsaTTUuYFCL/rv2V5bHrsnd2CsdfEHa/J0PY1rLqrSTPI5nMg9Uy/k4m+Vh
         dIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743103467; x=1743708267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsU3H4aCybFj3CLx43rBcKbIVPlgG7MXqQJVjEO3KuQ=;
        b=UqJuXogxnGXBaqlsDF1cNpoPxKxyXEDXpg9wHm5nXjJIfl8BpBj0yw10SjxCE/7EEf
         WFampy1QEZyf0Worj1bS/1SpTa5ZJNju5LSqrERE9z+wApkvIRDrIDtvmNL0s0gT74F1
         sRDmE1juHSgtlT4qnBmrrKdlqXBh8vUs97H2N/w1f/7CmqCUmSX2uGXl37IGGc7gZC5T
         g1ZXpFw4DLaIZl0l744KWlCgB3CFEqXkJ1rZaX7VXJdC09hItcRfygl/ZAv26L4zh06P
         a+rPGVEpqnUi476DoLABshTMpld/VKWnSvJ2NSklcy/JOA7vvcwmmouB6cHS00uPsMVj
         ydRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMhwTlNrjVi7sNH8BnxuMyNUp0fvDJjyRJ1Sx6i2LqiXOYITB8WlMkNoPf+gQDvBVqU+R/EZLNXdYRW44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxc3HvvinBK6fu5r6VO9BPZk+3+WJ0BtZo0jmzA+7+ZQWZpiPD
	ZgedWSIl+0UcTc6QPOsiRolPSOAoFn6x2lA1o2HaA+Zwgvp9NUstaixfLKk6A05+TNMeM1z57It
	5wmX+iUp+IXNMlnxiTcyzuptdzT8u1q3Adkmm
X-Gm-Gg: ASbGnct3BJK9u/t+ScdVZC4MTbxLHoYOPrL2lTjyVSm9BS2PdlfKY/eCY/oM4GWN/c2
	XwawUisb/EZ4adTzsOuBTO4b+umHbpV4QVlOxgewTJGLqODxnAhP1Dclu1kQs5/3LQUH2f1UCH5
	4IyMJnsCC9uoh4s2e6hR0u76j9+1bcGbVrToI1BLA1s9ZsZXkCgb7UiQ==
X-Google-Smtp-Source: AGHT+IGz2ptWnJMKCpVZRXSHC1BHv/EVsDD4zvp/wvpIFLl5pTpvPZXT6zLp1OS7qFkNx/ZO9sL+QD6VpMJEETNWsBc=
X-Received: by 2002:aa7:c7c3:0:b0:5e5:c024:ec29 with SMTP id
 4fb4d7f45d1cf-5edc24175a0mr19555a12.0.1743103466604; Thu, 27 Mar 2025
 12:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321202620.work.175-kees@kernel.org> <20250321204105.1898507-4-kees@kernel.org>
 <CAG48ez2-stu91bgZawx_AaypEuMnc5=nJQUiDzUCb+CbsJS6kw@mail.gmail.com> <202503220003.FABF5E82D1@keescook>
In-Reply-To: <202503220003.FABF5E82D1@keescook>
From: Jann Horn <jannh@google.com>
Date: Thu, 27 Mar 2025 20:23:50 +0100
X-Gm-Features: AQ5f1JoZQZxm97U6uQ_soQO_EMulXCDu3MvlZ-E2JGUgvp9Lprl8N4F8RaVkeC0
Message-ID: <CAG48ez04KBTTqPF9JMQu2uBde3SxUo-_=mwsxqr6B6+Fjyd57w@mail.gmail.com>
Subject: Re: [PATCH 4/5] slab: Set freed variables to NULL by default
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Marco Elver <elver@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 8:18=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On Sat, Mar 22, 2025 at 02:50:15AM +0100, Jann Horn wrote:
> > On Fri, Mar 21, 2025 at 9:41=E2=80=AFPM Kees Cook <kees@kernel.org> wro=
te:
> > > To defang a subset of "dangling pointer" use-after-free flaws[1], tak=
e the
> > > address of any lvalues passed to kfree() and set them to NULL after
> > > freeing.
> > >
> > > To do this manually, kfree_and_null() (and the "sensitive" variant)
> > > are introduced.
> >
> > Unless callers of kfree() are allowed to rely on this behavior, we
> > might want to have an option to use a poison value instead of NULL for
> > this in debug builds.
>
> Sure -- we have many to choose from. Is there a specific one you think
> would be good?

Forgot to reply to this, sorry. No, I don't have a particular one in mind.

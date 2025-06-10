Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F4424677C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576488; cv=none; b=nlO2rIFz/OokbWvFL6PP3PhEvDO0AMmKa587HIpWQYMEOslIbGteK97wQDD/+9JcnHOB7qWKKkMHQqETpCb0Fx+6PbViGk1K+JSpfiyYEZVIE9zRPeZnEssa4VjZp+Qy6+dix4QDQw07volltpIlbcgL7D4kZV2M8IMSFmNJQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576488; c=relaxed/simple;
	bh=PVZyBqjGIVhV1fw7dIcdJqjMZ05mClHZkbxF2OooV18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDtEi4cTvxudHqq/oltLzw4DLz9Gj16EfPqcbL4I9ESmLxtfzsp9ePR6Iu0agmEUi0UM7IYYQC2EUQnjAXDXZD/tygYZc/JfRXR6lXcUMvmoAXS/OIjherqA16AaVslsccw4jgu/+cLxcCVWfRmkaqXYHRueqhsN8ZKq2ppMs9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FNV2fJsm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FNV2fJsm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso8662148a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749576484; x=1750181284; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ggkXFJJM4tmqklVbhKHNnaysMh0I0jQ20WCMlBH6Csw=;
        b=FNV2fJsmtE9kRlIfsqwRRA+0lXQVAw8X6FbLRBEXpGwAL9fr5X1iiCLuZSrg7pBtHU
         qgt929zbYGx0MiMCFWljo09FmYBfm5iGHSvgSP9UEIHnc1TKzg01wv7TI91ZeS5gVpaw
         LEMhttdfBt4QkZe/bBrjGcZS5riIPYodp8r8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576484; x=1750181284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggkXFJJM4tmqklVbhKHNnaysMh0I0jQ20WCMlBH6Csw=;
        b=BxtXM46AxW6Yz3I17iEDspKoJdRE8vWi7ZoNCNqx/Nn0ERg5F716VadNnumwqbiHHX
         2mazB1e2iamY9HVQIy54OWOzDrKxvbwDjkNS7ymxfcVgUfR1cFaOQ++lvW2j5SaWjNSp
         Qg/RYkn1/MNXd0ALGx58iSDO1WyEebhPVVIldE5FB//6XogFEiG/4aCF42AA0GR+YSKJ
         C/HrWbkB32YhVSCFoQ9/xZehIUaK7rzAqIBJoSk4yexnCs8WNHeyXmv8Bu/Py+GsTJ4R
         nD+8B+Ewzi8Zh3gMii5wvpa9llrwND7WSiRg5ez2KPUT9vDVwj5kv7YYj9jJkcKmCJ3g
         uocA==
X-Forwarded-Encrypted: i=1; AJvYcCUFRbZE1p0Xil22E+18D1SkTarhNhx+QQ34/99RymU/5bae/ni7P19zyAd4Ba4QzwJ+h0zpv9kCJ/KyVJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Nl1M9neCSn65sY8JrjY4+RgLObc3sxHaE80Nz3N6kYs1JVrT
	M/OtDHM+XpEx/HZnexG+xzuGEnDOmTmz71Y+ixpBt4d+T2r0RJgAcw8bED3RCAT3mX+ssL/xaVe
	gLxeDhIM=
X-Gm-Gg: ASbGncvsK4svjUh1AJJgf7KKy6W7X8o/kgbwvSyDaUHbyKC0BWRzT7Uo8a1Byb7DEZh
	QqO05I9/n2COFAH/8FWlcyAa8ie4saD6Vc5FWTFzeN8Vcbk+cQWDvfV9SMjjEwFZ3fLZsHFnfQn
	Fmr44NAiXVweapCAYo5VcNun4+msmGz1hVcOYy0HQRS7yZwDxsLDKm2wkumnv7Hn78Ves85b0FF
	FOe2QNX44jfyyPyevTd/4aXHhDYrTYJdE+SKq/Dh2DDuoJ8UkBlzxjyd0HZQVJA4vTiskRHM4bM
	cuYeygAe+xFAlhK4yUnBvm0Km+hnLrQfkwQ6sgDIuE4llxp98srhPQv92stC39g5YZCMK8lCNMz
	rEw5DtPQwjTYnmfD9UArCgHylDUjKz2ZDttqW1/c9L1le1Nk=
X-Google-Smtp-Source: AGHT+IGc/iS8QHD73lPcznP0iLUbXtvD+lwLY5Ge24x2UDmCq33kNBsEz5wWgTiqkUeRvVJzOWEliQ==
X-Received: by 2002:a17:907:3d02:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ade898a7133mr21547966b.54.1749576483917;
        Tue, 10 Jun 2025 10:28:03 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55f3dsm757828666b.60.2025.06.10.10.28.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 10:28:03 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso7619112a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:28:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzI8CqG9ULO2XBC0CxjiEg0FsVeJ29tfbv58M0mefMJAHb5kt9WkWCFiWb7e0ope1ErKplgUHCRMAaL+k=@vger.kernel.org
X-Received: by 2002:a17:907:7f07:b0:ade:f72:435 with SMTP id
 a640c23a62f3a-ade897cf7fbmr24618766b.36.1749576482668; Tue, 10 Jun 2025
 10:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601151222.60ead71e7d8492a18c711a05@linux-foundation.org>
 <CAMuHMdU1NdNjx3f1V9j2FACWwC5faPKCXChtW6Z=i2JyXquFuA@mail.gmail.com>
 <20250610085416.062b4bc386dde2ea475369f5@linux-foundation.org> <CAMuHMdXyJhaFUbKX2Hhoa2y4hVK+0NhvL4hNL_8RnVOxaCkq=g@mail.gmail.com>
In-Reply-To: <CAMuHMdXyJhaFUbKX2Hhoa2y4hVK+0NhvL4hNL_8RnVOxaCkq=g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 10 Jun 2025 10:27:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXTJo5G7e1cQxetFLbqbTUfP7Nfzt7-C89FjUHo1J9cA@mail.gmail.com>
X-Gm-Features: AX0GCFuSBnImfaPnnRPaw-kRRNGK3RROtak9Ct6XSRJ9KKoJNMvO8fbVvKrYfaM
Message-ID: <CAHk-=wgXTJo5G7e1cQxetFLbqbTUfP7Nfzt7-C89FjUHo1J9cA@mail.gmail.com>
Subject: Re: [GIT PULL] Additional MM updates for 6.16-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, SeongJae Park <sj@kernel.org>, 
	Honggyu Kim <honggyu.kim@sk.com>, linux-mm@kvack.org, mm-commits@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 09:41, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Just revert the commit?

Yes. We don't do "default y" for random features.

EVERY SINGLE DEVELOPER thinks that *their* feature is so important
that everybody else should enable it.

And if that feature wasn't enabled before, they are completely wrong
99% of the time.

There is a very real reason why 'default' defaults to 'n'.

So we do *not* use "default y" for features that aren't universal.

The only time we should use 'default y' is if some old feature that
used to be unconditional gets split up into a new Kconfig variable and
not using 'default y' means that people *lose* functionality.

Or if the feature is some critical security thing, or is some hardware
thing that has become so universal that you find it on basically every
single machine.

Or if that feature cures cancer or brings world peace.

Then you can enable it by default.

I have reverted that 'default y' thing, because I see no reason to
believe that DAEMON cures cancer.

               Linus

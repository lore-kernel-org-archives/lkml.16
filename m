Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA401C27;
	Sun,  6 Apr 2025 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743939772; cv=none; b=Rq7ziq61fqlXoOH4NYLpt9kVZPS3QfIR1N95KnkR0rb18rX/STMLCSYy/J6pOr0SrtX+QeWnwzVkeqegC7IWCdD9ok439vhs2ANnUeZ8mrjMDU8yjb5vOa7JwdLSAsw6rAu127G/9djvhY2VMRUsa6rW9pDd9kZynpoyvnVHGZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743939772; c=relaxed/simple;
	bh=obzEVyCvowXtHk1jUxYd1vnwIcYOWBlko+ODBM5lKc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+PuTHcTd13XQe3JHIkszz/YEOqm09sL5MVZoCJd0JIqvp0puUmulWIn8aA+qqYGciheUno5bGiKjWjLlTOIrtgCABqWBKx+wOcTmJKlO3EvR30rDhAhRACvCWXbQhvoTTQi9GzdPSrlWA2YdCRk/8FAlZUsQua883dOyfZ+Tdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mk0fAykA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mk0fAykA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so1027135a91.1;
        Sun, 06 Apr 2025 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743939770; x=1744544570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CQcHyKdo7NqukG4kbe23C6EitoDV0EvE3RGNL0StOg=;
        b=Mk0fAykAw/tishi7MgzCznmPYVHq0zh4QJVKVLaNAAisiDw65NScD0YGDJIw2FGq1o
         GFtDgbnd5fFOO9ASnpIO05ZtePR3RnnH6pFOJM4SX8QI1ZIljFQJIpW3gTC9ZzHmzuwo
         0EyhXP4zqHeg+doXvZK9kMjpRe+XMlV5WsH7eniydDc2sqCaUHnh5GnxiyGcR+u3x5ex
         cx0YV7t8jnnaxdQ6JhITP1pa8a0ETmu+3msPeBeaofDtJygjk8dumPkn+lzwl1ujA+qd
         i6LEX/qi8guo1X2qGYr63QVFY0rgS/swsq+9gLXkeliNHqU8VjaKr16JfWnjulfDb1ms
         addg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743939770; x=1744544570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CQcHyKdo7NqukG4kbe23C6EitoDV0EvE3RGNL0StOg=;
        b=oMVO4Iov2qYf2lS5AyaAD+5d1xBAGe659yEsOgMy98TsIsqNZeygFlKSR09LvtYM1V
         xnokkFDF7gqCS0BSn5I+6wOHYnDD6hzG192DHIrZmGf66loabCkMO4KBRBxukaTQf3yQ
         7bLOwxCtxWA5hHcLlDHlQK4n5AercbqkUSbZq3MkqOa3yUgXGorpMRmJuDRzjWWGKnL6
         monnDkQQxDc4wZPkR2HWQ+xG52cdNOtRFlbUt+PkK3OvLABjoU+axtOUBV8uCFmKngBG
         yFMHMddNsH+tak2sbrK6LqTooWbi7n3ABPz3M/mHIARorrkFQqpWWqQ8TUMBkAvOX9aC
         3AKg==
X-Forwarded-Encrypted: i=1; AJvYcCVQexS1mFW+5TGXH44tTwCPRwhy1cia4kSVaI168SFtrCNZgk4b2qjLfRUjkbpo6cfrQjVAtnruZlF3+tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTRX3gws/oIbgu/WNgnfDaagefIBuCJhQ/xNvjgDjGFRz7xFb
	oZLtn9KKb+VYi2YvKPPwR2aqVPCblZ1g098XUCV7OTM/K//gCRVsgZTSZrFvX5VTmEChi9d0M4+
	5Z5vS4Bg4wsbijreGgmAbVNRMQ9A=
X-Gm-Gg: ASbGncttdDguUbvdkb3oW2OL33XTfjnwqznFxvCqjL+Cwwbh17u5s7q02dAt31OddEp
	ENwVkISck8LZHj5vg7EBPE14CHeyOeYgHC/azugtFZnCND8I10gb16vcYHqm5KWWndVmO9BaHbm
	RULg5Q5Dba+7la2n2Cz69Ss9rELg==
X-Google-Smtp-Source: AGHT+IGbusvYvppjE3d+kCJR6enaryQVigrFFBAk1qzQdMM8bxxcfglN8lkQjYwuZxIZt1MxaP0O1xq7sRdthGXnR1E=
X-Received: by 2002:a17:903:2f07:b0:223:397e:a55b with SMTP id
 d9443c01a7336-22a8a065747mr48250385ad.4.1743939770057; Sun, 06 Apr 2025
 04:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
 <CANiq72m55Fi-XyFz=h7_3QNj+mA0N+E9Vo2_anLFyN1sr-FXMA@mail.gmail.com> <tencent_3DAE6B923FC67B543D90D970@qq.com>
In-Reply-To: <tencent_3DAE6B923FC67B543D90D970@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 13:42:38 +0200
X-Gm-Features: ATxdqUESt_7N6TJlvXmHSe3qN_0X-vLxHhE7nI9ofDpu1e-RxfsBzSBjAPXH5EY
Message-ID: <CANiq72=c7yzLM4C-zctYFpUnFbQ2o4i5Uhp73xc4Td3-H_yDeQ@mail.gmail.com>
Subject: Re: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
To: =?UTF-8?B?5bC554aZ5ZaG?= <xizheyin@smail.nju.edu.cn>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 1:13=E2=80=AFPM =E5=B0=B9=E7=86=99=E5=96=86 <xizheyi=
n@smail.nju.edu.cn> wrote:
>
> Thank you very much for the reminder, I will resend a new patch as reques=
ted.
> But it seems to me that this patch makes sense to a certain extent for th=
e improvement of the raw links in the doc, which might make the document lo=
ok better.
> Do you think it's necessary to keep it, or do you have a better suggestio=
n? :)

(Please do not send HTML -- it will not reach the mailing list)

You're welcome!

Personally, I think it depends on the URL and the context -- let me
give clarify below.

The `[...](...)` notation is "heavier", i.e. makes it harder to read
in plain-text form, which many people use in the kernel, i.e. they
will not read the rendered form. That is why we typically move the
links below and just use `[...]` instead if we really want to use a
"title" rather than the raw URL.

Moreover, if a raw URL already says what it is itself, then there is
less reason to use a title. So, for instance, a URL like:

    https://rust-for-linux.com/contributing

already says everything it needs to say. However, a URL that uses e.g.
opaque IDs into a database may not give you any information until you
click on them.

So, for both reasons, I think the following is not an improvement, in
both plain-text and rendered forms:

    -//! Reference: <https://docs.kernel.org/core-api/rbtree.html>
    +//! Reference: [kernel documentation:
Rbtree](https://docs.kernel.org/core-api/rbtree.html)

By the way, the last changes, i.e.

    -//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
    +//! see [rust-lang/rust/blob/master/COPYRIGHT].

wouldn't work anyway, or am I missing something? (Even if it did, we
should avoid changing vendored files, by the way).

Cheers,
Miguel

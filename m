Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAC83C0C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614496; cv=none; b=KmYFjPYEStvkhsMeDzpzkF8P8wJl9STqsaINK5FH42AVR42chi3UsNOwnETLf8W1h7oklSFNq+mYwu5Uds4mJwPcTcMAri6wAO4CgZvLlUvrIUsO7WRJZ74dL7jAGh8tKZvOloU6YXvbEKlH8g6+G5Ukx5/wkR3JQa0VHLHeUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614496; c=relaxed/simple;
	bh=Vu/cjXBuEzCHpIce+L0jRe+1E1hqsjb10YN0nM4h560=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F44eyaU2dFwFJzaIcsegvsKm5AlsaBJsavgU/XPsHvqI3LfWZWqlm/JSqobxSfomjCAxi/osyahcYj9OvYg9oBT3pn24Zdcr32sjTHN2tlDdv71eH7Qd4TtusQqgPpc7N8jVo3rSyyUvTra2Ns/b9cVvqXfZZA4FTCjS3xbRPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SwQpx9qS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SwQpx9qS"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad883afdf0cso704442166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750614492; x=1751219292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg9hmyFycp3ZDNw8sLAPP4qprGRUQKA22JNcWYg14/Y=;
        b=SwQpx9qSEe0O7ZBjAneeLC2oDS+f6nvRO6jwr2wHQODvsPCZKOYRLIifHMDju5Luxo
         h4++BoyUtgzDyNUE2YwteRcwZEZ9XbhluvGHrdIzltvDHOdJre096rw432WcC6yNzFeH
         cLlIu1Zb5GqNU8RzuuRrEe6d8Mifx1NmTbdH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750614492; x=1751219292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg9hmyFycp3ZDNw8sLAPP4qprGRUQKA22JNcWYg14/Y=;
        b=kZrvhrRClBwJE6rflw9incKn4tHDBvfXxa6IKDBUyGId7pts1zGU+HJVfN8D7iTZit
         /S2wa/LSJpx/p8cJibG6uG6mDR4TTV0XsQq9WSRSzKwdj2rlJKlsvuGHM8LqZmvM7wXP
         lpE+y2kWhg5WnCMeLQsaV2tbjVwbBxTOQywrwwITb0vtho3Vc3b8qKJDkJhm2U9BDqZu
         BkTvJJeTtMjbMM0neQVw1/ICXk6i8GO7DI7bd9tu2fP0HX7+vitEISCkIE2IAB+xu2Pq
         PJNRESeHNC+NKtDxH9dUy5xyIlhoAMhVgJ8V0xUdVAd+wkL3XolDxgwhr8XJfDvh0E5s
         HbQw==
X-Forwarded-Encrypted: i=1; AJvYcCUGaHie8Zejw+3dC62aCak/mozioR43FXBF6MWXK+SVFdCFVcB1p8cmMQjNkBzWP6paXN2BpeFHpda5Y3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwOmW7hmjclPKhCIjHDQIC3V6QsMAEcHGJhq4DzxJgj/GdTifs
	IIzzptP/73MrHWYMb+hm/fvIEB9o50OaGSY4SFG9nJu++RnaiRXJwFiq3Y+QKZazUFAoSUC5fld
	QukRzFyo=
X-Gm-Gg: ASbGncvVljpz2g7bgKshNQ8bdXbTq0TKWl9ZTVE9taV7h4TGr4gx359N0tn146Hyg7Q
	wHr1E/75Q16ZUoRN45U/oDCay/gnpcFCr4DR29PmByp8dedj58FuDt7zZGtrnFwc56TqmeNzH23
	wkx0cGs0eQsQj/M59oDuVnkJ/Tr++KedCa9qF+mIMMtdmFPHVh+LIc/vfXV74pl69QaKxYRwTyc
	tiWylnSq1OuiSCvdqVsdwravym2/dUOCX3szYva1Ak7WaLgYB/D76nxs6UTrTdN6zfi9Xc9EM3b
	hZiDtk/7yKrd2kcItA1XyUZ76OZofmh8+zGeIzmBuHNGLh6vTE5i4UJKEe6eUw2sFGt6X6cVpJQ
	C7PQd09owZDgB3ofnfj1VtDFK9jPJF61+JS2osaMYRCpISzw=
X-Google-Smtp-Source: AGHT+IHe1QKN9nZk6kyweJpNtVf9w1JPX3nSidu/gDQx5HhTDpVLF0+WO8gnJFoxaZeihU24EvfS/w==
X-Received: by 2002:a17:906:6a19:b0:ad8:9466:3344 with SMTP id a640c23a62f3a-ae057b98feamr944882866b.43.1750614492418;
        Sun, 22 Jun 2025 10:48:12 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbf36sm574290066b.53.2025.06.22.10.48.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 10:48:12 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-addda47ebeaso730909066b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 10:48:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrv3vvJ+yC0sxwXbd1tfRRADF6THUYdRwOzB3FcB8LS97JCfgEPZB3xvHyistvBzjaWQ0aBdSbrmyXfOw=@vger.kernel.org
X-Received: by 2002:a05:6402:13cb:b0:600:1167:7333 with SMTP id
 4fb4d7f45d1cf-60a1ccb4175mr8817971a12.10.1750614017461; Sun, 22 Jun 2025
 10:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622181351.08141b50@pumpkin>
In-Reply-To: <20250622181351.08141b50@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 10:40:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgvyNdkYHWfL5NxK=k1DCdtyuHCMFZsbQ5FyP3KNvDNPw@mail.gmail.com>
X-Gm-Features: AX0GCFvQX_rPJUp_TeA-MaZrJuZOHr7f0zzM4dAjSAouwLFkdoxMjL44_Wohcms
Message-ID: <CAHk-=wgvyNdkYHWfL5NxK=k1DCdtyuHCMFZsbQ5FyP3KNvDNPw@mail.gmail.com>
Subject: Re: [PATCH 5/5] powerpc: Implement masked user access
To: David Laight <david.laight.linux@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Andre Almeida <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Jun 2025 at 10:13, David Laight <david.laight.linux@gmail.com> wrote:
>
> Not checking the size is slightly orthogonal.
> It really just depends on the accesses being 'reasonably sequential'.
> That is probably always true since access_ok() covers a single copy.

It is probably true in practice, but yeah, it's worth thinking about.
Particularly for various user level structure accesses, we do end up
often accessing the members individually and thus potentially out of
order, but as you say "reasonable sequential" is still true: the
accesses are within a reasonably small offset of each other.

And when we have potentially very big accesses with large offsets from
the beginning (ie things like read/write() calls), we do them
sequentially.

There *might* be odd ioctls and such that get offsets from user space,
though. So any conversion to using 'masked_user_access_begin()' needs
to have at least *some* thought and not be just a mindless conversion
from access_ok().

We have this same issue in access_ok() itself, and on x86-64 that does

  static inline bool __access_ok(const void __user *ptr, unsigned long size)
  {
        if (__builtin_constant_p(size <= PAGE_SIZE) && size <= PAGE_SIZE) {
                return valid_user_address(ptr);
        .. do the more careful one that actually uses the 'size' ...

so it turns access_ok() itself into just a simple single-ended
comparison with the starting address for small sizes, because we know
it's ok to overflow by a bit (because of how valid_user_address()
works on x86).

           Linus

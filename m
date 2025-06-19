Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CF634
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303895; cv=none; b=V6QTokadLKGOLeWszp9jhUY8oajPq3trhOeMVNPeVLvEJ3zIVkJKlaPNu9bYg37wyKrjkbK+mXFBom4i+Mbo4FpvC43Hhnvn6K8gsUaSJ9GIui8ZkNatj4w4KSWSid15sVCxDAHUR/BwDgBicrVDRxgiKgWQD2XjeT1bdne04vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303895; c=relaxed/simple;
	bh=wnYVcJND+0YSCps8gYqBnTTQaKrROg9oLByp7UEfSs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uokFz6qb6d7yGRHSKMEmL/WEayvOuF/8RXjlfMghxti92egIl/Ur0ZzzBjOWMBoIbX2edmd0T4cF59+7KYzz3YIQbt/Q+KDIGpzd2E+9XxZGn8mMKGZUYWERIX2q2Q8HWacp7iArAuDm57h55sNn7h9+qq3D2XHhaV3bZx3GefQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loxufJEN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loxufJEN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso525755a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750303891; x=1750908691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IHCHN6bJnFw7jY2chWCLyrVEGLjzHZwAQev0cq6K6+8=;
        b=loxufJENy5SbINpXfFmESoNuRc2gjXS+kfeaJjqnlHDUINmZcQRAqugE8QoCRxuuYT
         NK3fFN2T1ptvrtmWjA0HwgcIJA6EDUzm51Sp1rlekbhJcibDHhBbIhW5dcJaSQ4dbMhl
         irF2qDemHy8CE1Nx4zdDujuOc9K5l6xgxC5Jmt01ls+2DGx5+k6pmT69uppz6eVdcvh1
         LUbbC2Gr1rxSPahEtAhaFJv/KaIEkruwPZyfcJW8SyjT2te80IXD9LN3i/qSH8/vkhI4
         FA5kc1ztw5+yiuzJrD24IIVV+vDtAKWoSE6fZQzHiXyZbdOu/Q+j3nmso8aV54Y/Nvr1
         YzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750303891; x=1750908691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHCHN6bJnFw7jY2chWCLyrVEGLjzHZwAQev0cq6K6+8=;
        b=PjWHl1pvonDZGwgBxSBlC/To1HOso9uDfMc0TUh3Ns7Zs5z+AxWgvBFAwNG0ajpcul
         1WtFNU4z4zetA4ahx/MNu4I4zsIa0XUhw3KZrrtLnC6q5p9VdQxhZ49JdVqphP4DxHQ+
         nl6TI/v5IJyHRwwV0zmu07WdruGjXXPgy/fCqNAvw/4tW8+/5pvykPjPhNZjj/Ok55KT
         psySWdIWsNTBva7aoEjNzwKg7MTg5xPh8LI0RUF3uxYrh4/5RipzKnx6owoZPCMY1psK
         UJYzfELMuSCpEgdHpFZRxaP9SEmvABbkZ8KiThh/r6iD0Mv4w+cfbqAWp4G0K5eCaISY
         MjgQ==
X-Gm-Message-State: AOJu0YxKsHFUqFbg7dv9PELetNl5cqlIGXOhRPoSAwS3WkCcjjjnspbU
	GIESQCFfa84vprK3qaVqlNBuFLt4jEReBtedwS00ytiZKDNGO76WKXZuqWaM7veBkTeMUC4QhGI
	Y+rc0tFsSM6T3l6OtrnX7KeyliNaN6PQ=
X-Gm-Gg: ASbGncvnxaUIvuWak3PgSifj0efktQ8lwYXPNgPiGW4CxoB7Z/G3yo2s6lqbb9a0RfB
	4JC3Md8NlPXN0Yaheb/JXwX45izWNgkWfeJ3/Wls9q780Dnx1dwjQeFyGZS9evt9N1K+BBC2DIe
	hO/CMCK0bANIPJ8ehiUz9yGdBUfY1GFu7BvZn7Rnv1Yw==
X-Google-Smtp-Source: AGHT+IGq/RFNkxWvH/Iw6aIBLsbVQoViyWrzEFxUBA3wVPHUIyrIMnrFenzZ03J9nZo0lUZcU2nGvcGqAoGQrJt/XEU=
X-Received: by 2002:a17:906:4fca:b0:ad8:a41a:3cdc with SMTP id
 a640c23a62f3a-adfad3734admr1981716466b.2.1750303891263; Wed, 18 Jun 2025
 20:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9ty750Ex93+9d6DJ1hFJE8XuhXOf7Q7dgXryvhGYLwHbdg@mail.gmail.com>
 <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
In-Reply-To: <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Jun 2025 13:31:19 +1000
X-Gm-Features: Ac12FXzvd5uZdb0LN8dEQjXUFHn5iwQeqYRDelo8B64Oeek5ZcnA7epM1xSFucU
Message-ID: <CAPM=9tyG7+6ZQuBQY=nwiPxywWgVtOHus7cH-KjKMgn+0ADv8Q@mail.gmail.com>
Subject: Re: double free in alternatives/retpoline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, nik.borisov@suse.com, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 12:33, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Adding Mike Rapoport ]
>
> On Wed, 18 Jun 2025 at 19:08, Dave Airlie <airlied@gmail.com> wrote:
> >
> > I've just tried to boot Linux master with KASAN enabled on a laptop here, and it showing a slab UAF for apply_retpolines.
> >
> > I haven't had a chance to bisect yet, and unfortunately I only have a photo of the oops.
>
> Hmm.
>
> I think it's due to commit a82b26451de1 ("x86/its: explicitly manage
> permissions for ITS pages").
>
> Maybe I'm mis-reading it entirely, but I think that "its_fini_core()"
> thing is entirely bogus. It does that
>
>         kfree(its_pages.pages);
>
> but as far as I can tell, that thing is happily used later by module
> initialization.
>
> Freeing the pages that have been used and marked ROX sounds like it
> should be fine, but I think it should also do
>
>         its_pages.pages = NULL;
>         its_pages->num = 0;
>
> so that any subsequent user that comes along due to modules or
> whatever and does __its_alloc() will DTRT wrt the realloc().
>
> But I might be completely barking up the wrong tree and mis-reading
> things entirely. PeterZ? Mike?

I wonder if the module code also needs the same treatment,

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 6455f7f751b3..4653881a4ab3 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -182,6 +182,7 @@ static void its_fini_core(void)
     if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
         its_pages_protect(&its_pages);
     kfree(its_pages.pages);
+    its_pages.pages = NULL;
 }

 #ifdef CONFIG_MODULES
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,p,?]? y
@@ -220,6 +221,8 @@ void its_free_mod(struct module *mod)
         execmem_free(page);
     }
     kfree(mod->arch.its_pages.pages);
+    mod->arch.its_pages.pages = NULL;
+    mod->arch.its_pages.num = 0;
 }
 #endif /* CONFIG_MODULES */

boots for me, but I've no idea what is required or sufficient.

Dave.
>
>              Linus

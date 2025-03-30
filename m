Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638A3C3C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368201; cv=none; b=RzcDDILZMjo/PhhVu5pDXMg/YiyeMTwKeuI3nUIi4Ko52tlxv+ZsfdrNR6rGLeuBmoex+EmFdbTOciQ8UPbnXfogELtpHUgrcpzyD46ytxxSFLb6bVgYUkV4p1cO4NqZfY+ETIg9I9UfDAEuNfHWsMnDRpJBozvokbrNlvPC0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368201; c=relaxed/simple;
	bh=2NQf+mO6qVdzH6Wz1CSg+U7Kj2HvJtwz9HN9tyJTQYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdSRLKi2EVv+J8W3IcllBHVsp2khznnGLRdcLSKBcvD+fdxGb1rYd6nvtRpBqgEIosmQgZLzJvtGgXCjGWbMjMStpsU+iUQquNwookD7Pf1ECe5IoVjsAlClWtp0krHFx5spUjvVf/nomay/JSP5eSdhvFdzbaJIDcsNYCm0pqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MTp2KdKa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MTp2KdKa"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso746546466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743368198; x=1743972998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSOLpfQDj26hqGlCIT72Nb/pIYj7VgJoNsTI8j/3oiA=;
        b=MTp2KdKaPxraQqIb4BqNFSL4wUIeeQ/J9hnsBLNhXej0yCn6rxPyn0gDqaQX1ir2dU
         x7M3eUpP/eS64eV9ImmKdSt0gsTuO8V+6VtfBnvZMctc4F0OU7RI1OPbytJUEEPEi1rD
         4eu9VKN0bo3J8nuW2lOxNuL07WkFkMzTq+3GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368198; x=1743972998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSOLpfQDj26hqGlCIT72Nb/pIYj7VgJoNsTI8j/3oiA=;
        b=atX/KXZpZv10bcAMsxgU0HdOlvN+KH/GUmlPIv5L6oWGFkNccF/ktux2owuzlAItOw
         kq414hmTBHVM2BVrCl2wNtYoL3IaHE4ZqDkdT5XGxhWfMMjJzPjgbirazg62hHT5hCOf
         ET4w15kA6hJQqksqEXbiTw3TY6A+h8kRJiDuPwOwpRL4WBqavRkSzS65scIgMG2+N+LR
         JGLR/SrYX3iBX5TGsflEXAVVHMXsq540rkXCAkGT2DsQ5NqTSGgUUPdUI3uTNCayBYe9
         myKv0IkGmIAhogNGUWCDNCMzuue3C5rC46y560rVW9zSfG9YYKu7h68vCXUleSm8BPpY
         rq7w==
X-Forwarded-Encrypted: i=1; AJvYcCUDum5d4TPx3Nwz7zEni2jMeXRLf7TYWg6qyAQR8lvQmdeEmBcIYOjzMROul0HdGu/+825YH8FeYH8E9as=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBaJbED8BygDHWkCRn8KtIRW9h3cb1KyOjlM+ugvBMOJt+M+Yl
	/Y4y4cArsw9GHFZ0631Ph6BXI9XpImbyCkD8LreSrAQFpW7wpJQlJrevp6jJoOZKoYo4naLY1W9
	eOiQ=
X-Gm-Gg: ASbGncucvVS2gR+z4PezkPQc4p7n8zl0B10Fl5GI7tH709Ikohw7iaw8q5tOE+iY6zl
	+t2M5skLEi3zMpHXo496BAQxANjlDaIyYXnGbEDuKYY5zkfxOq8YXgpL/htVoL/KmbuTImUI/O6
	JY5CDAKL6SneNYSKYDw+DFiKH2zkoZfWToz+0oAoJ0wLBAFGkwwSuDEVXmt/4o0ZQCvPyuVsuan
	p7Pt+zM5RNhicN1/2EVI439KDGxr9WWBVUR5mGB4vosxKbXF8mKvYaI8Xa5eQico5+IiszojChT
	b0EIc2dlr7n7g4c51wxWsgqB3PxSjL1COs17FgZx9kSI3u/WRz2R44Xx76VgpydM5ao00MNX87S
	15fqC9FrystSnGbXpb4k=
X-Google-Smtp-Source: AGHT+IF8/ejfkQagjdNknnjsoxbz8PnhOEnkhGj/t3V40P8neFlQxzSKFYl88zbEumiRLyad21pllQ==
X-Received: by 2002:a17:906:c148:b0:ac6:eaea:c0e3 with SMTP id a640c23a62f3a-ac738c6f017mr551500266b.49.1743368197817;
        Sun, 30 Mar 2025 13:56:37 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b150sm525228566b.46.2025.03.30.13.56.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 13:56:36 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso746543466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:56:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIO7fpw54j3S0vVwn4q8nbgCgEmO8KjrMjCjaf6ypaFU48syVO3dOP92z4r5rS0OWWAg0I9cz4qrYRmuU=@vger.kernel.org
X-Received: by 2002:a17:907:7e82:b0:ac3:8896:416f with SMTP id
 a640c23a62f3a-ac738a64ef5mr780959366b.15.1743368195497; Sun, 30 Mar 2025
 13:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327145159.99799-1-alexei.starovoitov@gmail.com> <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com>
In-Reply-To: <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 13:56:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVcfPyL3PhmSoQyRQZpYUDaKTFA+MOR9w8HCXDdQX8Uw@mail.gmail.com>
X-Gm-Features: AQ5f1JpJ7geT4BoReQk_MXUrgZ8jgWTwt7ona-UlzJd5cAmwkXVKsuAn2yvli_0
Message-ID: <CAHk-=whVcfPyL3PhmSoQyRQZpYUDaKTFA+MOR9w8HCXDdQX8Uw@mail.gmail.com>
Subject: Re: [GIT PULL] Introduce try_alloc_pages for 6.15
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@kernel.org, akpm@linux-foundation.org, peterz@infradead.org, 
	vbabka@suse.cz, bigeasy@linutronix.de, rostedt@goodmis.org, mhocko@suse.com, 
	shakeel.butt@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 13:42, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The one reaction I had is that when you basically change

Oh, actually, two reactions now that I fixed up the merge build issue
which forced me to look at the function naming.

That 'localtry_lock_irqsave()' naming is horrendous.

The "try" part in it makes me think it's a trylock. But no, the
"localtry" just comes from the lock naming, and the trylock version is
localtry_trylock_irqsave.

That's horrible.

I missed that on the first read-though, and I'm not unpulling it
because the code generally makes sense.

But I do think that the lock name needs fixing.

"localtry_lock_t" is not a good name, and spreading that odd
"localtry" into the actual (non-try) locking functions makes the
naming actively insane.

If the *only* operation you could do on the lock was "trylock", then
"localtry" would be fine. Then the lock literally is a "only try"
thing. But as it is, the naming now ends up actively broken.

Honestly, the lock name should probably reflect the fact that it can
be used from any context (with a "trylock"), not about the trylock
part itself.

So maybe "nmisafe_local_lock_t" or something in that vein?

Please fix this up, There aren't *that* many users of
"localtry_xyzzy", let's get this fixed before there are more of them.

             Linus

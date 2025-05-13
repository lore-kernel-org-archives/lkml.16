Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719E1E4110
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171739; cv=none; b=EoppCzslQSw6RDXjCnDRm4JF4GnG7J9iUPQGOXlVwwaldHmkl6vgJ+NKDbv478BX0egOSdEosed/mBf/IwAH4/V+T70uDy1EQ/KXHwRCtQj4S/nyyxb6mO6ymv0707bgjzgwKifMcW3BU17JlXAgxNIHhY5vHigSME3FDHuVyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171739; c=relaxed/simple;
	bh=NSJjQMIRSnOvZBpyORIbUAChQbC3DbC6C0Ad51hK2ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUA58LwUzFRCrnKBGMyDF44jEQ1GuEqwOf5V6wB2TwLZN1kpLJpJDfsijNKcyTsfk9vYjVCUNFS+1q6493jGBFnRYABY2kh1SrYM/oHdvFBq804aQrZtdR6zCgzedBu1YqkEFUzHyVmr+/voLihxlbex9Qs0faz+d0XRqiVW5mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T77EPV2y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T77EPV2y"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad2414a412dso536404166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747171735; x=1747776535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYrAiybKeQWYqnpByyv+yVpzVPacOJZaRoHX37wevjs=;
        b=T77EPV2y+Xi4DMXaSFEADVSj4tCxMVoxCNP5kvoQjiCHc90tSbltATT7bymrE1vDnu
         WoARxjE6XzRWhVXU/Wl5tyC49mPmIVP2nB82qixR1L+YXw5B1iisYvtuzGGeNdVGUO52
         EI6aMnskG43AY4MVc9NE2d/IerTq0jejSHdck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171735; x=1747776535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYrAiybKeQWYqnpByyv+yVpzVPacOJZaRoHX37wevjs=;
        b=DmkNEy64EgaMWOvG2Sf5S9o3feHuMt8OMAI21E8G5VfCtCHrgxEpvfaG63qmO4xJ59
         3Uh80pFrX5LvEFG/S1PmGsUJqKqDK0WTauA5VQJuGDUAAxqDh/2LDyr+tsqWsON7GdL2
         7FB2O7qxdIXPS7WXhHaG5jFANzj4pcHeTMNlRvPGUxKACkGlA3SyrOR5SeU1lklJ9DbD
         m3K1ff9eqokxm937qRrHi8BK/9wWmm9e51AnzKmURE/QBeisi5setlIHIzcz97I7zwps
         0NuxgXmcBn72OLRu98mztVE5qhF7Nsn+4xPe/IABgAj/7vapc0fS6Pw1LWEyrbEo+RuP
         MayQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrWclRc87YMFiiYQkv04ojt7KlvMc9wFBrxlr6IyySVTkOPPd6pt9JxewkM7SAfubCDKZcvaUDsGS+sBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnsgvxvZNzi3zu0Vs0S+poGxzaXtPuAnEBoGWaIrxvphdfKt2
	XeoegxYUSpYOpcK81KBx5XmuQXQJmBkG4vWtlzkXDxatCqryGGaUQ+lNXAPGWzu2mvncQqkld18
	k53g=
X-Gm-Gg: ASbGncuPJR7+0ItaU9WzLQnXIaXkVqIZbdsDlfVFPu/RoL3y2wZYRQDudG77pZ7QTOZ
	zEopnF3CcCG9s9odE4pZqufaP7WIk/+Lr7T3tdj6svHJZArmZO9b85h78Ex7/zZ/omm8/yJ1/Fh
	BqPk2z9WWYgavQ/A/mcLHpUoYKBr9HMTo5HmF4VxCfHKQWAGxPTEfqU3JayDTzaUTgyu2A/qT2k
	NGYYvnlvuJMY29+j6kCqbv8yCcU8FUDSUA6pAfXBF+LyCSyk+TZYjIpFn+vcOtYJWjxEt8CFcDC
	Ah3MGGcg034mNYMaG29W/CRDej4zx0vKO6cXioF/naw178L9kCG87lmqH8L8WI73cwYsFZX+3JH
	NiFkQv7m9zxrVj+US0ry1Q5igyA==
X-Google-Smtp-Source: AGHT+IHwZLGmT9UGhBRLCgc17O6LhwNW7b7QGLxI/egvpB5QB0mBUpEHBYrEquuSZwKpNQDWLCpdXw==
X-Received: by 2002:a17:906:9c87:b0:ad4:cc66:1524 with SMTP id a640c23a62f3a-ad4f74d49d5mr109540366b.54.1747171735149;
        Tue, 13 May 2025 14:28:55 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2437641e7sm540501766b.79.2025.05.13.14.28.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 14:28:54 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso1167197a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCJ6l670XnbGVkyKLoem7J0P3FiT0bPETI8YX51wlqzH1YuhW8xL3iAw+anyJZERlzDeEEGFBf1Typxig=@vger.kernel.org
X-Received: by 2002:a05:6402:90a:b0:5fc:8d89:c609 with SMTP id
 4fb4d7f45d1cf-5ff988ddefdmr517798a12.34.1747171733723; Tue, 13 May 2025
 14:28:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509104028.GL4439@noisy.programming.kicks-ass.net>
 <681ea7d5ea04b_2a2bb100cf@dwillia2-mobl4.notmuch> <20250512105026.GP4439@noisy.programming.kicks-ass.net>
 <20250512182559.GB25891@noisy.programming.kicks-ass.net> <20250512185817.GA1808@noisy.programming.kicks-ass.net>
 <CAHk-=whxPoFnZ4cLKh4X3m4qVcaak__G8+0iG-aOGO7YkS3LdA@mail.gmail.com>
 <20250513070918.GB25763@noisy.programming.kicks-ass.net> <20250513085001.GC25891@noisy.programming.kicks-ass.net>
 <CAHk-=wjBiAqaWnXG_44ajMCqU3nNQOC1RQ6SUmKYC03Y1G=r1g@mail.gmail.com>
 <20250513200619.GJ2023217@ZenIV> <20250513203114.GK2023217@ZenIV>
In-Reply-To: <20250513203114.GK2023217@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 May 2025 14:28:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjxtRUPLhMXvj7Y_RpMVyVEMSiLd8ZeoroQ+_A8M=BQqg@mail.gmail.com>
X-Gm-Features: AX0GCFsFUlt-KTN7f0kQDU5bvlyW_ORsH5CwhUntK7fdocojlj5lB3fiAx74y2o
Message-ID: <CAHk-=wjxtRUPLhMXvj7Y_RpMVyVEMSiLd8ZeoroQ+_A8M=BQqg@mail.gmail.com>
Subject: Re: [PATCH 1/7] cleanup: Introduce DEFINE_ACQUIRE() a CLASS() for
 conditional locking
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Peter Zijlstra <peterz@infradead.org>, dan.j.williams@intel.com, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Ingo Molnar <mingo@kernel.org>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 13:31, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Nevermind - should've read back through the thread for context.

Well, your comment did make me test what I can make gcc generate..

I still can't get gcc to do

       cmpq $-4095,%rdi
        jns     .L189

for IS_ERR_OR_NULL() however hard I try.

The best I *can* get both gcc and clang to at least do

        movq    %rdi, %rcx
        addq    $4095, %rcx
        jns     .L189

which I suspect it much better than the "lea+cmpq", because a pure
register move is handled by the renaming and has no cost aside from
the front end (ie decoding).

So

  #define IS_ERR_OR_NULL(ptr) (MAX_ERRNO + (long)(ptr) >= 0)

does seem to be potentially something we could use, and maybe we could
push the compiler people to realize that their current code generation
is bad.

Of course, it doesn't actually *really* work for IS_ERR_OR_NULL(),
because it gets the wrong results for user pointers, and while the
*common* case for the kernel is to test various kernel pointers, the
user pointer case does happen (ie mmap() and friends).

IOW, it's not actually correct in that form, I just wanted to see what
we could do for some limited form of this common pattern.

Anyway, I am surprised that neither gcc nor clang seem to have
realized that you can turn an "add" that just checks the condition
codes for sign or equality into a "cmp" of the negative value.

It seems such a trivial and obvious thing to do. But maybe I'm
confused and am missing something.

            Linus

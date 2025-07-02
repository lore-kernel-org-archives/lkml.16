Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E719A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480516; cv=none; b=U7n+6QZgBFYnN27s5jpjds7f2STXqnFiwf5KYw3BCxxo3ZDAJVefdXDkSsHHOUFnusVNXIBwJonMhRel+F1KXKoBtYx5qEiNs1+mpeVMW75YTlUWhCIA0pICwAte7zmMn0alVrntl0MMPkgn0i/VIW5cfR36s1N9A+3fOj3hfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480516; c=relaxed/simple;
	bh=8dPL6cewj+QXiDVpMgLbkUYfzccaNgbPuZ9A+ZlbtD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfY+YNiX4e+7IxC/rniXcvVdeG4175+DAFmK6gRiUc5Wv6MVw131qP4hpp9CPO/obAeNLL0oBeYK7sbfkfQbN+32itnVY9fc9BaKPBouvG+mpkfCvXGCgfqVrFGNelu6WLhuv7NXjg9JDvuLNJ0LV/AHFu7pqI2FvrtCy8smz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ft/YCqpO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ft/YCqpO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so1083450566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751480513; x=1752085313; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAzEH7Ab5cAtbqr3Xp/qBBT6LGjJFnrqCTGw1ULOX9I=;
        b=ft/YCqpO0FXHmQ+DZb14BXdPk+Yx/t5+rI0YwNA3RvujJAVMwTfI6u+5MQ1o1cX6VT
         YbpeQ3Dg+XauhGKR1IdzsknmbPBMoCYt20eYyUiVvnupxPFy8hA4hVyHILp0AsPMlJng
         rhiIFIowUh5zVWZyuMtJ8DSCYa+vTvFhUlNXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480513; x=1752085313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAzEH7Ab5cAtbqr3Xp/qBBT6LGjJFnrqCTGw1ULOX9I=;
        b=FwskNONVtt7R+gWvqZmZ9CmciUs0dR3KVpmI4rCxeyAXyyNMxZG6qzztVc3GLAGtsS
         Dy0TTNSPNtxGTrKRe1a8gUgYDSyLEQP2774BXwMPSdYfFq+1plQWJGHYJ4G9Nrw5J/Vg
         a49xdQjoKzjStmOvSPZ9rcoeBVeCkiSkZ6Hq9vEgIgJoGoTrO367FI5iuEgJQtaE5Zlr
         asJEcj2HH3olZMYII+EoaVpfsefy/PA9MGkKTOV6PFg1MLLtUZx3AG9PCRjt3Ju6QdIj
         dQ3vSexd7xwVTCa2sTs9ABfISZ3UBWjsOzqPh71h8gjAqBroooQNTBFVZGUW+tHawIBt
         QTFg==
X-Forwarded-Encrypted: i=1; AJvYcCXGlszUxc0R4/6uq+siO2RtCn8URlGebvC3emW1+dw+LE6Qzi5xC/HKxlynO9ZEzVOPqCLkazj29/ClTKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU/2oqKtlyqDWaHvMlQ4FUjMZemwubUTBoxeQKWftee6kbtHsU
	X2LzVdfxgEZb5mgEITP2dEX+rP0tQThqaqxaLw/Sd1aoZbw6hX6urDNjd9um9QhvV8K6buno/Ph
	edCkVik3Iwg==
X-Gm-Gg: ASbGncvZZhVX7FzO1Nxg9TglvEuIPRoK7/L0vjs7vPxBkRJI3JXjWxVxJ8BlClWkjJG
	3RdrWTDzWFupuH3zDHkPrwTEAVq3i/o5e++oMdvev9h9vWGEykUdufoglsA0vCjucIqqNn34AT8
	L8ySZ3yXc3uRWy0QnbmWThZKGGxNCaYOquzniovWTL8iFhj0LdniTDfu86Nx6keTAHVWEZG2M2e
	/Ofht/j0YfbggH/PN7H4uP1Wc5AU+3wd0w2paEKN/KB/8Qt+XBWcyPQoxjCf212PM3lBs5NVEui
	Y6rMklyPxTj/G9ZWnYVOegQ1WXWH2CDvANqeqhgpocxeCOzy1Ix/dxHBHpfLFcv2Kg3BlWOqk3E
	UWFCFMwkVAVVb6/8dHHRZozFIklHe2qpR2B45
X-Google-Smtp-Source: AGHT+IF4eVKbChoFs/jpegvAPatF2hTUX6RyFZmozOBlecpckEhHOFaRQ+hQMcf3nbV5KPCaYxwLng==
X-Received: by 2002:a17:907:2da9:b0:ae3:a78d:a08a with SMTP id a640c23a62f3a-ae3c2b12a5amr371083666b.6.1751480512639;
        Wed, 02 Jul 2025 11:21:52 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bda4sm1127662566b.141.2025.07.02.11.21.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 11:21:52 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso11945102a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYAV7tCakmVI0WNYIXcbX45rB5JC4SPUO0fc79TBxR2UvTiXLwHa2uiM2HSt0wHcrk5hJVgyAsqoUtlF0=@vger.kernel.org
X-Received: by 2002:a05:6402:270d:b0:60c:5268:5587 with SMTP id
 4fb4d7f45d1cf-60e5362ef3emr2951767a12.29.1751480511414; Wed, 02 Jul 2025
 11:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701005321.942306427@goodmis.org> <20250701005451.571473750@goodmis.org>
 <20250702163609.GR1613200@noisy.programming.kicks-ass.net>
 <20250702124216.4668826a@batman.local.home> <CAHk-=wiXjrvif6ZdunRV3OT0YTrY=5Oiw1xU_F1L93iGLGUdhQ@mail.gmail.com>
 <20250702132605.6c79c1ec@batman.local.home> <20250702134850.254cec76@batman.local.home>
In-Reply-To: <20250702134850.254cec76@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Jul 2025 11:21:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiU6aox6-QqrUY1AaBq87EsFuFa6q2w40PJkhKMEX213w@mail.gmail.com>
X-Gm-Features: Ac12FXxdVtdafV1DjZUKNDDMmbhEtpMMqjKmEMhutyb6_ij-Rv8l7HBE6kdoJJ4
Message-ID: <CAHk-=wiU6aox6-QqrUY1AaBq87EsFuFa6q2w40PJkhKMEX213w@mail.gmail.com>
Subject: Re: [PATCH v12 06/14] unwind_user/deferred: Add deferred unwinding interface
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, x86@kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Jens Remus <jremus@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>, Florian Weimer <fweimer@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 10:49, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> To still be able to use a 32 bit cmpxchg (for racing with an NMI), we
> could break this number up into two 32 bit words. One with the CPU that
> it was created on, and one with the per_cpu counter:

Do you actually even need a cpu number at all?

If this is per-thread, maybe just a per-thread counter would be good?
And you already *have* that per-thread thing, in
'current->unwind_info'.

And the work is using task_work, so the worker callback is also per-thread.

Also, is racing with NMI even a thing for the sequence number? I would
expect that the only thing that NMI would race with is the 'pending'
field, not the sequence number.

IOW, I think the logic could be

 - check 'pending' non-atomically, just because it's cheap

 - do a try_cmpxchg() on pending to actually deal with nmi races

Actually, there are no SMP issues, just instruction atomicity - so a
'local_try_cmpxchg() would be sufficient, but that's a 'long' not a
'u32' ;^(

 - now you are exclusive for that thread, you're done, no more need
for any atomic counter or percpu things

And then the next step is to just say "pending is the low bit of the
id word" and having a separate 31-bit counter that gets incremented by
"get_cookie()".

So then you end up with something like

  // New name for 'get_timestamp()'
  get_current_cookie() { return current->unwind_info.cookie; }
  // New name for 'get_cookie()':
  // 31-bit counter by just leaving bit #0 alone
  get_new_cookie() { current->unwind_info.cookie += 2; }

and then unwind_deferred_request() would do something like

  unwind_deferred_request()
  {
        int old, new;

        if (current->unwind_info.id)
                return 1;

        guard(irqsave)();
        // For NMI, if we race with 'get_new_cookie()'
        // we don't care if we get the old or the new one
        old = 0; new = get_current_cookie() | 1;
        if (!try_cmpxchg(&current->unwind_info.id, &old, new))
                return 1;
        .. now schedule the thing with that cookie set.

Hmm?

But I didn't actually look at the users, so maybe I'm missing some
reason why you want to have a separate per-cpu value.

Or maybe I missed something else entirely, and the above is complete
garbage and the ramblings of a insane mind.

It happens.

Off to get more coffee.

             Linus

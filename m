Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6725E29898B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041417; cv=none; b=ETCPGHfzidlsGgiBJ0Y51ZMEXPrGbuL3KNnKZgCxPIgSWjSh1Xb53+t3iIUXkq7rXYUBCJT5SiyjGJbFOOu3tO75iRg0pdWQt3QnOK7fLQ3BrnSvvR5CoFNko2fnseATwNavZWiKXZ8uQLE0vkIePvzqd3mLhMwEkJtcFg5gCig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041417; c=relaxed/simple;
	bh=1Z5FIvgVxVgOK1v1qVEDoeCNDa+RgVIxtitLI+LQd5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aj8Yml2KJsPJaH6rbZDscc4GCFAmmKoyHCqmNsJdyfWK6u3+FVAQyQ6LyCCYTsGq+pbW9gcnfTXAEH3Ubx4A8ChNofoOgXx8wTUpAN03j+4/Rx3CQQMcJMo6DFuTO3EDoQ0OXmJC16I/fFmsTpetjXthS3KCCwuCWK5gddZ4EuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cLPPdqLP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cLPPdqLP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so411654966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751041413; x=1751646213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIBFa7vtiai1aZdrnHbI17B2HX5VyBn+7Wdc06Hzja4=;
        b=cLPPdqLPQYN8RS9I1KedhQG1aLAmACgMOn3gKqm2gdliZyLTHlndVfPd8rezxu6Ta8
         qsNsM8g1YI1Tf96e7tWkSQPJKHfwMHXAc2/lOAHuyVBXDRtBAyUvhyHY7CsWM5iu7uaf
         h7x7F4zt71hXu2a8xHpYK2Qf5O93tBqKQdHA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041413; x=1751646213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIBFa7vtiai1aZdrnHbI17B2HX5VyBn+7Wdc06Hzja4=;
        b=BrmrK/UJ2NcD+fAS+CQFkKmmgH/UT7jlUQSC6rFCGAaz/LpsiXBsyISZUD/AmEPAn3
         0D2mWMUNCNETkS+S3fAtiPCMz2xhTjAn7aybjxCdOFOiLsU6G+69mG6vQcj4lhcvaONs
         SPyI1IOGnVp/qUczfAYAqWyCVxZbLleCeJeIkq9cKVhaX06Q/HWZ/+2zFSeYVpllMl4t
         R5ChWPjE5A636ZbHKEjX9Mxldfi2Q8Ou0p7jQ/HkvYaV2NkB9m5UDKvqc2F4zT6aq+s+
         YX3e0m83kqmSQ2ROrLfQ3MQRjbuxbN5QUzkKybSYv5dui2LccQoNAySbwneidPXvj6qf
         tmDg==
X-Forwarded-Encrypted: i=1; AJvYcCVRa9xyHEkcVfZa3t5pM3pHT1UT4oka5XKAaRHOOWmGgc2So14hvailDK5hAFIFX8p4n1N8UXbPI+ixqVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw74VGHnxtGCvMbrXA1J4dhMCq1rl7ny/bLxXr6S+u8JHCX8tey
	3jN7qQDggWr4r7MRa9fFqEJ6cFvnHgJPUFa/B/Cu9apUzCE0M6u/j1g07DEnsAx3NhWZaQHdLpb
	AumiyblI=
X-Gm-Gg: ASbGncs0hrnPlQneu5DgdepRdpwFC9EaTi2QhtTXhe7DSfQLLuRuZQDPgQMmMmDTtbc
	6YBikUdcJdHeT+QaMrrK5ODndpVBW5aHo2a8XRk46LtcaDQrNkwGORdYp6P+3VXkHFXvHnKB/PR
	Wg5J0c6cg1OI3pXLy6X/yBp8Nl4UTc/AB/wAnue0WiBtxfcKAi8sJV0SnVF3HUcgeohPgEG8bvC
	6ll0qqASR9S5PspelljybpAQP9LptW+4L6kOjKrFNH6+sujMGx/WmBOuoheS/FYWYVV/8iM/sHV
	ClQBp+fBD3pWupA61Tm19VKiqkii966K3KTJw/r2KMRL92QXe6CTTjmL3A5312EknB0DfPOn2pX
	dxNz7lQG33ByNQT9Tyt01TCGM9/0uWpFg2bTM
X-Google-Smtp-Source: AGHT+IGF5bng2yqQ+infvmffRkBuDpoDOmpfFU3xOd+9LIS7WkVOEM0QrvY73DmoCRCTUZb0CHQM0Q==
X-Received: by 2002:a17:907:988:b0:ad5:e18:2141 with SMTP id a640c23a62f3a-ae35016de22mr373658466b.53.1751041413457;
        Fri, 27 Jun 2025 09:23:33 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca2bdasm151646666b.171.2025.06.27.09.23.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:23:31 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso19653a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiEdLlKFoC7B7UGLVaQ+zUODh4S78WL89OTs20rkU0pBibW6tk0lNvAYr2OjSPWGu3ZCJzodzeA5cD4R8=@vger.kernel.org
X-Received: by 2002:a05:6402:34c6:b0:5ff:ef06:1c52 with SMTP id
 4fb4d7f45d1cf-60c88d65540mr3554120a12.3.1751041411199; Fri, 27 Jun 2025
 09:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625225600.555017347@goodmis.org> <20250625225717.187191105@goodmis.org>
 <aF0FwYq1ECJV5Fdi@gmail.com> <20250626081220.71ac3ab6@gandalf.local.home> <20250627100113.7f9ee77b@gandalf.local.home>
In-Reply-To: <20250627100113.7f9ee77b@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Jun 2025 09:23:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiXsMA3OJ0tnSWFDwqH=H8OAsUwF2hqCuQ6uHaLmpQubg@mail.gmail.com>
X-Gm-Features: Ac12FXwXn1CGZ5TDseyf0yMPbEJKzZlOp6kLfp771zfoaf5rHgLNIhEIXduSSPA
Message-ID: <CAHk-=wiXsMA3OJ0tnSWFDwqH=H8OAsUwF2hqCuQ6uHaLmpQubg@mail.gmail.com>
Subject: Re: [PATCH v11 14/14] unwind_user/x86: Enable compat mode frame
 pointer unwinding on x86
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, x86@kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Jens Remus <jremus@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 07:01, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> That's not a function. It's just setting a macro named arch_unwind_user_next to
> be arch_unwind_user_next. I think adding "()" to the end of that will be
> confusing.

Yeah, we use the pattern

   #define abc abc

just to show "I have my own architecture-specific implementation for
this" without having to make up a *new* name for it.

[ We used to have things like "#define __arch_has_abc" instead, which
is just annoying particularly when people didn't even always agree on
the exact prefix. We still do, but we used to too. These days that
"this arch has" pattern is _mostly_ confined to config variables, I
think. ]

Adding parenthesis not only makes that much more complicated - now you
need to match argument numbers etc - but can actually end up causing
real issues where you now can't use that 'abc' as a function pointer
any more.

That said, parenthesis can also actually help catch mis-uses (ie maybe
you *cannot* use the function as a function pointer, exactly because
some architectures _only_ implement it as a macro), so it's not like
parentheses are necessarily always wrong, but in general, I think that

  #define abc abc

pattern is the simplest and best way for an architecture header file
to say "I have an implementation for this".

And obviously the reason we have to use macros for this is because C
doesn't have a way to test for symbols existing. Other languages do
have things like that (various levels of "reflection"), but in C
you're basically limited to the pre-processor.

             Linus

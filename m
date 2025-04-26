Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F92628D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689384; cv=none; b=WhTNQFjvXExgA3Lboo9L2CmwxG0aoC2CYN9nLo69hM8goJWc+B6VNmNsjEoNPf5vPScL81HUYfAO1BpDs7nkRSZVUpG1sAjYktUw4QNPaYQDxb7NgbjumUb1OzhxiFN8VunzbEgy7YwH5m6ULsHYxJzH0ZRqZRqOVY6hSGzXnJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689384; c=relaxed/simple;
	bh=fW+pvd0Ylzz49EXNC4nHMsZvzlR1ClyAzRR7WMnje6c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sh4zeHph9qPUTrsadd2eVt2/87c8CFM+/UWWguui1RVE1iB1AruNVPmpkX5wzAlM9PpPmXrOUaW/lbP2j9VFW4Klg873c8OQnGkKpIarHY9D629v8D/MK0/fjwMi6YHy5q41kV3ecGaHl4niFjPUtDiCxH+zQaJLHS8fMPOMwdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LNevhdV1; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LNevhdV1"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso5572082a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745689379; x=1746294179; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p5ZuHweNuEVBE3Fej2LIynmyJBbRTA/TM1UDo0+mKg0=;
        b=LNevhdV1Qhut5j2TTiqxt2tjzGEwBbSlxADu8HdN6jl2Kl065WjQCUGZK7QxwaxnzI
         JqFpuSrjZUIpoR3+fPypMwGxLIJUEGxk6868OsCF1WQqjgemv420qzaGK0KNiZMO8WB5
         XbewvqDfPHh8/suE/TAwIkI6LKcABHD62uGvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745689379; x=1746294179;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5ZuHweNuEVBE3Fej2LIynmyJBbRTA/TM1UDo0+mKg0=;
        b=hj2ovjcpnJSLX5gWQLkuxnkTJM/0HuxG47+4g/hgql4PVnU5498nlQ5vr1L6pg/RJQ
         EhVV33FRsFjLLBHkVTQ8a/DazFSguGmdm+rUehkAfRIyS+SfWMAYmqok+tc3NcVqlO05
         /YWIMKIu5ZpWgpHe09T91RAHbjrbhS0gVf9xImsVcOH5UIGZD4NioVNqh54G1CLCq48k
         TzxyMrtzkWxH1YT+NsW1Hr/S+ZfIc9KpLsECb7qjxGHhZhzzPQ8XTDk5vkKKbouQSMDB
         baT3EgQYFwB8uerAL7nsCNlFIB1SCh9rkbDQTIwIKm8Z5wp3bIWAGIy0P0QV5gGA5Wl4
         yT2g==
X-Forwarded-Encrypted: i=1; AJvYcCUY/JGI1mExQfcpiQNsnhiiRCJsAAv49++z2P06WaUE2Ugww7MPxRJrPmzr5af1TC3yR7ljN88iEkYXajU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMJDtnFjJWR5valOHUs6i5rTqK6oiuqc3tXVtX/fu2IqqGh1J
	9oqlGKXy2cGVYMF7n2jWbnfFGoZ567dR5Q1EfBXDQds7tykvvVPkwHcCmrneBQnwxG9p/8Iq2NX
	S5vY=
X-Gm-Gg: ASbGncuNWeVYnX/Q2Z1NHQvtXp600lGSZDlKaHkf9nWXZZLe9U94cKytT4sEaY2BdhX
	s/1STg+7MijHU/anqES3FDjcTV4DqvFSIuYtuRmJlAvUvmpSenBFXmkuPe7YekJA0Bbhyrz/m7t
	xiPb377ZNNzVqxl1aLcy22VzAYgc2cUcsejurWxuI8m+H0W1gNX/4v+lmxNnlch2mTFZvfZcnkA
	a0sHxZUQ95KZYGWLz5MqsqjH5gNf2jnJJmLixCf4a5H4AclJq1tJENpkDKEHjnY4kvsq9MYQTbp
	vNOHSoNArSIQPsGMywnZEJR748XY2fG1/lnw9VXg0q6KZxqEFg4iArKNA0LtGSgNzDDv8K+Cspy
	NU99te2mJYC9lU8Q=
X-Google-Smtp-Source: AGHT+IHunIBSf7+jX3mLsOfwspyngpFwYCylSAHQILTFPiopUjgoSNhYin+BoXYjK06ozjblm14/gg==
X-Received: by 2002:a17:907:6ea2:b0:ac3:eb24:ab26 with SMTP id a640c23a62f3a-ace713fb7dcmr635227966b.51.1745689378339;
        Sat, 26 Apr 2025 10:42:58 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa375sm316687366b.121.2025.04.26.10.42.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 10:42:57 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso5396546a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDokFMT588fjrZ6K/ez55B8A/uqmZIom5q3sffW1+VZfdfuFi0qBezAfbj0e8Va5sYCfVf7qUiV370FOo=@vger.kernel.org
X-Received: by 2002:a17:906:9fc7:b0:aca:cde4:fac1 with SMTP id
 a640c23a62f3a-ace71131c2dmr658231266b.31.1745689377007; Sat, 26 Apr 2025
 10:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 10:42:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
X-Gm-Features: ATxdqUF66SgVPO-TQX09fkvhV4kdjdHCzpMk_g01lv5yN5C2c15Un2Rowbof3YY
Message-ID: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
Subject: clang and drm issue: objtool warnings from clang build
To: Josh Poimboeuf <jpoimboe@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

So with clang, I get these drm build warnings

  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o:
     warning: objtool: dc_fixpt_recip() falls through to next function
dc_fixpt_sinc()

  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/spl_fixpt31_32.o:
     warning: objtool: spl_fixpt_recip() falls through to next
function spl_fixpt_sinc()

and the warnings seem real. I ignored them because it wasn't entirely
obvious what was going on and I was looking at other things, but today
I looked at why these happen.

What is going on is that the *_fixpt_recip() function has a

        SPL_ASSERT(arg.value);

which results in basically a test for 'arg.value' being zero and a WARN_ON()

Then - through inlining - we get from *_fixpt_recip() to

  spl_fixpt_from_fraction ->
    spl_complete_integer_division_u64()

here we have *another* check for the divisor not being zero:

        SPL_ASSERT(divisor);

and then it goes on to inline the code:

      spl_div64_u64_rem() ->
        div64_u64_rem()

which does

        *remainder = dividend % divisor;
        return dividend / divisor;

so now what has happened is that clang sees that when it inlines those
things, it basically has a path with two warnings, following a divide
by a value known to be the constant zero.

And that makes clang just stop generating any code at all, and the asm
looks like this:

spl_fixpt_recip:                        # @spl_fixpt_recip
# %bb.0:
        callq   __fentry__
        testq   %rdi, %rdi
        je      .LBB3_10
  ...
.LBB3_10:
        #APP
     .. disgusting unreadable for WARN_ON() on line 199 ..
        #NO_APP
        #APP
     .. disgusting unreadable for WARN_ON() on line 32 ..
        #NO_APP
.Lfunc_end3:

because clang has decided - correctly - that this path now divides by
zero. Notice how it just falls off at .Lfunc_end3 with no actual
divide, and no other sign of "you have failed at life".

However, this is actually problematic for the kernel: yes, the warning
hopefully helps show what is wrong, but because clang has now
generated code that basically jumps to random code, you get random
security issues if the warnign ever triggers (and there are
configurations where the warning is just disabled).

So there are two problems here:

 - the drm code should not "assert" crap. Do proper error handling, or
don't. But don't have a random "this is a known bad value" and then
fall back to using that value anyway.

We had something similar some time ago, where there was a drm
assertion without error handling, which caused the compiler to see
that there was a static path where the invalid value was used, and
then caused other problems. I forget the details, and gmail search
isn't helping me

But I *really* think that clang silently just generating known bad
code for invalida operations like this is very very dangerous, and is
a bug in clang.

So I'm cc'ing drm and clang people (and x86 people) in the hope that
we can fix both of these things.

Can we *please* get a flag for clang that it doesn't just stop
generating code because it has decided some path is unreachable or
undefined? Add a TRAP instruction, for Chrissake! PLEASE!

 Maybe such a flag already exists, and the kernel just doesn't know
about it. This whole "do random things for undefined behavior" is a
bug, dammit.

And yes, the drm code shouldn't be doing this. Adding warnings for
things that will oops is actually counter-productive. It generates
extra code, but this is an example of it actually causing *more*
problems. We'd have been better off with a nice clean divide-by-zero
oops than with a warning followed by random behavior.

               Linus
